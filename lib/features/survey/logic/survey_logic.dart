import 'package:inoface/features/survey/presentation/widgets/details_survey.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:inoface/features/survey/models/input_survey.dart';
import 'package:inoface/core/util/generateMaterialColor.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:inoface/core/usecases/enums.dart';
import '../presentation/widgets/multiple_choix.dart';
import '../presentation/widgets/comment_choix.dart';
import '../presentation/widgets/single_choix.dart';
import '../../../core/database/app_database.dart';
import '../../../core/usecases/constants.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/util/url_service.dart';
import '../../login/models/input_login.dart';
import '../../../core/error/failures.dart';
import '../models/state_survey_model.dart';
import '../../../core/util/app_image.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../core/util/keys.dart';
import '../models/survey_model.dart';
import '../models/save_survey.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import '../../../main.dart';
import 'survey_state.dart';
import 'dart:developer';
import 'dart:convert';



class SurveyLogic extends GetxController {
  static SurveyLogic instance = Get.find();
  final state = SurveyState();


  InputSurvey? getInputSurvey({required int idPersonne}) {
    InputLogin? inputLogin = authLogic.getCashLogin();
    if (inputLogin != null) {
      return InputSurvey(
        identifiant: inputLogin.identifiant,
        motdepasse: inputLogin.motdepasse,
        tokenmobile: inputLogin.tokenmobile,
        id_personne: idPersonne,
      );
    } else {
      return null;
    }
  }

  Future<Either<Failure, SurveyModel>> getSurvey(InputSurvey input) async {
    if (networkState.isConnected) {
      try {
        state.sondages.clear();
        SurveyModel model = await getConcreteSurveyModel(input);
        await cacheSurvey(model);
        return Right(model);
      } on ServerException catch (failure) {
        return Left(ServerFailure(
          message: failure.message,
          state: failure.state,
        ));
      }
    } else {
      try {
        SurveyModel model = await getLastSurveyResponse();
        return Right(model);
      } on CacheException catch (failure) {
        return Left(CacheFailure(
          message: failure.message,
          state: failure.state,
        ));
      }
    }
  }

  Future<SurveyModel> getConcreteSurveyModel(InputSurvey input) async {
    try {

      final response = await utilsLogic.retryPost(
        url: utilsLogic.getUrl(UrlService.sondagesWs),
        body: input.toBodyModel(),
      );

      log('getConcreteSurveyModel:\n${response.body}');

      if (response.statusCode == 200) {
        await prefs.setString(Keys.cachedGetSurvey, response.body);
      }
      return surveyModelFromJson(response.body);
    } catch (e) {
      throw ServerException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<void> cacheSurvey(SurveyModel model) async {
    try {
      final data = surveyModelToJson(model);
      await prefs.setString(Keys.cachedGetSurvey, data);
      state.sondages = model.sondages;
      update();
    } catch(e) {
      throw CacheException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<SurveyModel> getLastSurveyResponse() {
    final jsonString = prefs.getString(Keys.cachedGetSurvey);
    if (jsonString != null) {
      logger.i(jsonString);
      return Future.value(surveyModelFromJson(jsonString));
    } else {
      throw CacheException(
        state: RequestState.error,
        message: 'no_data_failure'.tr,
      );
    }
  }

  Future<void> saveSingleChoice({
    required Choix choix,
    required int idSondage,
  }) async {
    try {
      if (networkState.isConnected) {
        InputLogin? inputLogin = authLogic.getCashLogin();
        if (inputLogin != null) {
          final model = SaveSurvey(
            identifiant: inputLogin.identifiant,
            motdepasse: inputLogin.motdepasse,
            tokenmobile: inputLogin.tokenmobile,
            idSondageQuestion: choix.idSondageQuestion,
            choices: '[${choix.idSondageChoice}]',
          );

          log('saveSingleChoice parameter:\n${model.toBodyModel()}\n${utilsLogic.getUrl(UrlService.sondageSaveChoicesWs)}\n');
          final response = await http.post(
            Uri.parse(utilsLogic.getUrl(UrlService.sondageSaveChoicesWs)),
            body: model.toBodyModel(),
          );

          log('saveSondageChoices:\n${response.body}\n');
          final stateModel = stateSurveyModelFromJson(response.body);
          if (response.statusCode == 200 && !stateModel.erreur) {
            utilsLogic.showSnack(
              type: SnackBarType.success,
              message: stateModel.message,
            );
            await getSurveyById(idSondage, choix.idSondageQuestion);
          } else {
            utilsLogic.showSnack(
              type: SnackBarType.error,
              message: stateModel.message,
            );
          }
        }
      } else {
        utilsLogic.showSnack(type: SnackBarType.unconnected);
      }
    } catch (e) {
      utilsLogic.showSnack(
        type: SnackBarType.success,
        message: '$e',
      );
    }
  }

  Future<void> saveComment({
    required int idSondageQuestion,
    required String comment,
    required int idSondage,
  }) async {
    try {
      if (networkState.isConnected) {
        InputLogin? inputLogin = authLogic.getCashLogin();
        if (inputLogin != null) {
          final model = SaveSurvey(
            identifiant: inputLogin.identifiant,
            motdepasse: inputLogin.motdepasse,
            tokenmobile: inputLogin.tokenmobile,
            idSondageQuestion: idSondageQuestion,
            commentaire: comment,
          );

          log('saveComment parameter:\n${model.toBodyModel()}\n${utilsLogic.getUrl(UrlService.sondageSaveChoicesWs)}\n');
          final response = await http.post(
            Uri.parse(utilsLogic.getUrl(UrlService.sondageSaveCommentaire)),
            body: model.toBodyModel(),
          );

          log('saveComment:\n${response.body}\n');
          final stateModel = stateSurveyModelFromJson(response.body);
          if (response.statusCode == 200 && !stateModel.erreur) {
            utilsLogic.showSnack(
              type: SnackBarType.success,
              message: stateModel.message,
            );
            await getSurveyById(idSondage, idSondageQuestion);
          } else {
            utilsLogic.showSnack(
              type: SnackBarType.error,
              message: stateModel.message,
            );
          }
        }
      } else {
        utilsLogic.showSnack(type: SnackBarType.unconnected);
      }
    } catch (e) {
      utilsLogic.showSnack(
        type: SnackBarType.success,
        message: '$e',
      );
    }
  }

  Future<void> saveMultipleChoice({
    required List<Choix> choixs,
    required int idSondageQuestion,
    required int idSondage,
  }) async {
    try {
      if (networkState.isConnected) {
        InputLogin? inputLogin = authLogic.getCashLogin();
        if (inputLogin != null) {
          List<int> list = choixs.map((e) => e.idSondageChoice).toList();
          final model = SaveSurvey(
            identifiant: inputLogin.identifiant,
            motdepasse: inputLogin.motdepasse,
            tokenmobile: inputLogin.tokenmobile,
            idSondageQuestion: idSondageQuestion,
            choices: '$list',
          );

          log('saveMultipleChoice parameter:\n${model.toBodyModel()}\n${utilsLogic.getUrl(UrlService.sondageSaveChoicesWs)}\n');
          final response = await http.post(
            Uri.parse(utilsLogic.getUrl(UrlService.sondageSaveChoicesWs)),
            body: model.toBodyModel(),
          );

          log('saveMultipleChoice:\n${response.body}\n');
          final stateModel = stateSurveyModelFromJson(response.body);
          if (response.statusCode == 200 && !stateModel.erreur) {
            utilsLogic.showSnack(
              type: SnackBarType.success,
              message: stateModel.message,
            );
            await getSurveyById(idSondage, idSondageQuestion);
          } else {
            utilsLogic.showSnack(
              type: SnackBarType.error,
              message: stateModel.message,
            );
          }
        }
      } else {
        utilsLogic.showSnack(type: SnackBarType.unconnected);
      }
    } catch (e) {
      utilsLogic.showSnack(
        type: SnackBarType.success,
        message: '$e',
      );
    }
  }

  Future<void> setStatueSurvey(Sondage sondage, int idStatut) async {
    try {
      /*
       idStatut: -1 Ignored    1 if clicked to answer   2 if finish
       */
      if (networkState.isConnected) {
        InputLogin? inputLogin = authLogic.getCashLogin();
        if (inputLogin != null) {
          final model = InputSurvey(
            identifiant: inputLogin.identifiant,
            motdepasse: inputLogin.motdepasse,
            tokenmobile: inputLogin.tokenmobile,
            idSondage: sondage.idSondage,
            idStatut: idStatut ,
          );
          log('setStatueSurvey parameter:\n${model.toBodyModel()}\n'
              '\n${utilsLogic.getUrl(UrlService.sondageSetStatut_ws)}');
          final response = await http.post(
            Uri.parse(utilsLogic.getUrl(UrlService.sondageSetStatut_ws)),
            body: model.toBodyModel(),
          );

          log('setStatueSurvey:\n${response.body}\n');
          final stateModel = stateSurveyModelFromJson(response.body);
          if (response.statusCode == 200 && !stateModel.erreur) {
            await getSurveyById(sondage.idSondage, null);
          }
        }
      } else {
        utilsLogic.showSnack(type: SnackBarType.unconnected);
      }
    } catch(e) {
      logger.e(e);
    }
  }

  Future<void> getSurveyById(int idSondage, int? idSondageQuestion) async {
    try {
      if (networkState.isConnected) {
        InputLogin? inputLogin = authLogic.getCashLogin();
        final enfant = utilsState.enfant!;
        if (inputLogin != null) {
          final model = InputSurvey(
            identifiant: inputLogin.identifiant,
            motdepasse: inputLogin.motdepasse,
            tokenmobile: inputLogin.tokenmobile,
            id_personne: enfant.id_personne,
            idSondage: idSondage,
          );
          log('getSurveyById parameter:\n${model.toBodyModel()}\n${utilsLogic.getUrl(UrlService.sondageByID_ws)}\n');
          final response = await http.post(
            Uri.parse(utilsLogic.getUrl(UrlService.sondageByID_ws)),
            body: model.toBodyModel(),
          );

          log('getSurveyById:\n${response.body}\n');
          final stateModel = stateSurveyModelFromJson(response.body);
          if (response.statusCode == 200 && !stateModel.erreur) {
            final map = json.decode(response.body);
            final sondage = Sondage.fromJson(map['Sondage']);
            updateSondages(sondage);
            if (idSondageQuestion != null) {
              updateTabWidget(sondage, idSondageQuestion);
            }
          }
        }
      } else {
        utilsLogic.showSnack(type: SnackBarType.unconnected);
      }
    } catch(e) {
      logger.e(e);
    }
  }

  Future<Sondage?> fetchSurveyById(int idSondage) async {
    try {
      if (networkState.isConnected) {
        InputLogin? inputLogin = authLogic.getCashLogin();
        final enfant = utilsState.enfant!;
        if (inputLogin != null) {
          final model = InputSurvey(
            identifiant: inputLogin.identifiant,
            motdepasse: inputLogin.motdepasse,
            tokenmobile: inputLogin.tokenmobile,
            id_personne: enfant.id_personne,
            idSondage: idSondage,
          );

          final response = await utilsLogic.retryPost(
            url: utilsLogic.getUrl(UrlService.sondageByID_ws),
            body: model.toBodyModel(),
          );

          // final response = await http.post(
          //   Uri.parse(utilsLogic.getUrl(UrlService.sondageByID_ws)),
          //   body: model.toBodyModel(),
          // );

          log('getSurveyById:\n${response.body}\n');
          final stateModel = stateSurveyModelFromJson(response.body);
          if (response.statusCode == 200 && !stateModel.erreur) {
            final map = json.decode(response.body);
            return Sondage.fromJson(map['Sondage']);
          }

        }
      } else {
        utilsLogic.showSnack(type: SnackBarType.unconnected);
      }
    } catch(e) {
      logger.e(e);
    }
    return null;
  }

  void updateSondages(Sondage sondage) {
    int index = state.sondages.indexWhere((element) => element.idSondage == sondage.idSondage);
    if (index != -1) {
      state.sondages.removeAt(index);
      state.sondages.insert(index, sondage);
      update();
      log('==== Sondage Updated ====');
    } else {
      log('==== Sondage Not Update ====');
    }
  }

  void initTabWidget(Question question, Sondage sondage) {
    //! Multiple Choix
    if (question.choix.isNotEmpty && question.choixMultiple) {
      final key = Key('${question.idSondageQuestion}');
      int index = state.widgets.indexWhere((element) => element.key == key);
      if (index == -1) {
        state.widgets.add(MultipleChoix(
          sondage: sondage,
          question: question,
          key: key,
        ));
      } else {
        state.widgets.removeAt(index);
        state.widgets.insert(index, MultipleChoix(
          sondage: sondage,
          question: question,
          key: key,
        ));
      }
    } else if (question.choix.isNotEmpty && !question.choixMultiple) {
      //! Single Choix
      final key = Key('${question.idSondageQuestion}');
      int index = state.widgets.indexWhere((element) => element.key == key);
      if (index == -1) {
        state.widgets.add(SingleChoix(
          question: question,
          sondage: sondage,
          key: key,
        ));
      } else {
        state.widgets.removeAt(index);
        state.widgets.insert(index, SingleChoix(
          sondage: sondage,
          question: question,
          key: key,
        ));
      }
    } else if (question.choix.isEmpty) {
      //! CommentChoix Choix
      final key = Key('${question.idSondageQuestion}');
      int index = state.widgets.indexWhere((element) => element.key == key);
      if (index == -1) {
        state.widgets.add(CommentChoix(
          sondage: sondage,
          question: question,
          key: key,
        ));
      } else {
        state.widgets.removeAt(index);
        state.widgets.insert(index, CommentChoix(
          sondage: sondage,
          question: question,
          key: key,
        ));
      }
    }
  }

  void updateTabWidget(Sondage sondage, int idSondageQuestion) {
    // final idSondage = sondage.idSondage;
    if (sondage.questions.isNotEmpty) {
      final question = sondage.questions.firstWhere((element) => element.idSondageQuestion == idSondageQuestion);
      if (question.choix.isNotEmpty && question.choixMultiple) {
        final key = Key('${question.idSondageQuestion}');
        int index = state.widgets.indexWhere((element) => element.key == key);
        if (index == -1) {
          state.widgets.add(MultipleChoix(
            question: question,
            sondage: sondage,
            key: key,
          ));
        } else {
          state.widgets.removeAt(index);
          state.widgets.insert(index, MultipleChoix(
            question: question,
            sondage: sondage,
            key: key,
          ));
        }

      } else if (question.choix.isNotEmpty && !question.choixMultiple) {
        //! Single Choix
        final key = Key('${question.idSondageQuestion}');
        int index = state.widgets.indexWhere((element) => element.key == key);
        if (index == -1) {
          state.widgets.add(SingleChoix(
            question: question,
            sondage: sondage,
            key: key,
          ));
        } else {
          state.widgets.removeAt(index);
          state.widgets.insert(index, SingleChoix(
            question: question,
            sondage: sondage,
            key: key,
          ));
        }
      } else if (question.choix.isEmpty) {
        //! CommentChoix Choix
        final key = Key('${question.idSondageQuestion}');
        int index = state.widgets.indexWhere((element) => element.key == key);
        if (index == -1) {
          state.widgets.add(CommentChoix(
            question: question,
            sondage: sondage,
            key: key,
          ));
        } else {
          state.widgets.removeAt(index);
          state.widgets.insert(index, CommentChoix(
            question: question,
            sondage: sondage,
            key: key,
          ));
        }
      }
    }
  }

  void onPageChanged(int index) {
    state.currentIndex.value = index;
  }

  void checkState(Sondage sondage) async {
    try {
      bool stateChoix = true;
      Sondage? model = state.sondages.firstWhereOrNull((element) => element.idSondage == sondage.idSondage);
      if (model != null) {
        for (Question qu in model.questions) {
          if (qu.choix.isNotEmpty) {
            Choix? choix = qu.choix.firstWhereOrNull((item) => item.selected == true);
            if (choix == null) {
              stateChoix = false;
              break;
            }
          } else {
            stateChoix = (qu.commentaire != null);
          }
        }
        if (stateChoix) {
          await setStatueSurvey(model, 2);
          update();
        }
      }
    } catch(e) {
      logger.e(e);
    }
  }

  Future<void> viewSondageById({required int idPer, required int idEven}) async {
    try {
      final count = CountSondage(id_personne: idPer, idSondage: idEven);
      await appDatabase.countSondagesDao.insertCountSondage(count);
    } catch (e) {
      logger.e('e');
    }
  }

  Future<void> initSurveyByIdPersonne({
    required BuildContext context,
    required int idPersonne,
  }) async {
    try {
      if (networkState.isConnected) {
        InputSurvey? input = getInputSurvey(idPersonne: idPersonne);
        if (input != null) {
          final model = await getConcreteSurveyModel(input);
          await cacheSurvey(model);
          for (Sondage sondage in state.sondages) {
            if (sondage.statut == null && context.mounted) {
             showSondageDialog(
               context: context,
               sondage: sondage,
             );
             break;
            }
          }
        }
      }
    } catch(e) {
      logger.e(e);
    }
  }

  Future<void> checkSurveyStatue(BuildContext context) async {
    try {
      if (networkState.isConnected) {
        for (Sondage sondage in state.sondages) {
          if (sondage.statut == null) {
            showSondageDialog(
              context: context,
              sondage: sondage,
            );
            break;
          }
        }
      }
    } catch(e) {
      logger.e(e);
    }
  }

  Future<void> showSondageDialog({
    required BuildContext context,
    required Sondage sondage,
  }) async {
    final ctx = Get.overlayContext ?? context;
    return await showDialog(context: ctx, builder: (ctx) {
      return AlertDialog(
        titlePadding: EdgeInsets.zero,
        contentPadding: const EdgeInsets.symmetric(horizontal: 6),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        title: Container(
          height: 120,
          padding: EdgeInsets.zero,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: (sondage.piecesjointes.isNotEmpty) ?
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: CachedNetworkImage(
              width: Get.width,
              fit: BoxFit.fill,
              imageUrl: UrlService.rewriteInoserUri(sondage.piecesjointes.first.lienPieceJointe),
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Center(
                child: Image.asset(AppImage.logo),
              ),
            ),
          ) : ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: Image.asset(AppImage.logo),
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.title,
                  color: primaryColor,
                ),
                title: Text(sondage.titre),
              ),
              HtmlWidget(sondage.description),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: Text('ignore'.tr),
            onPressed: () {
              setStatueSurvey(sondage, -1);
              Navigator.pop(ctx);
            },
          ),

          TextButton(
            child: Text('answer'.tr),
            onPressed: () {
              Navigator.pop(ctx);
              Get.to(() => DetailsSurvey(sondage: sondage));
            },
          ),
        ],
      );
    });
  }
}