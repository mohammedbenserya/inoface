import 'package:equatable/equatable.dart';

class Categories extends Equatable {

  final String title;
  final String image;


  const Categories({required this.title, required this.image});

  @override
  List<Object> get props => [title, image];
}