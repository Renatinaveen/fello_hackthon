import 'package:equatable/equatable.dart';

abstract class PlansEvents extends Equatable {
  const PlansEvents();

  @override
  List<Object> get props => [];
}

class FetchPlans extends PlansEvents {
  final String ageGroup;

  const FetchPlans({required this.ageGroup});

  @override
  List<Object> get props => [ageGroup];
}

class FetchExisitingPlans extends PlansEvents {
  final String ageGroup;

  const FetchExisitingPlans({required this.ageGroup});

  @override
  List<Object> get props => [ageGroup];
}
