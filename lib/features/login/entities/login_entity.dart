import 'package:inoface/core/database/app_database.dart';
import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final bool erreur;
  final String message;
  final String? motdepasse;
  final Personne? personne;
  final String? ecolename;

  const LoginEntity({
    this.erreur = true,
    this.message = '',
    required this.motdepasse,
    this.personne,
    required this.ecolename,
  });

  @override
  List<Object?> get props => [erreur, message, motdepasse, personne, ecolename];
}
