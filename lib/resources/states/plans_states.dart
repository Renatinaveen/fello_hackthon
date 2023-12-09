import 'package:equatable/equatable.dart';
import 'package:fello_hackthon/model/my_plans.dart';

import '../../model/savings_plans_model.dart';

abstract class PlansStates extends Equatable {
  const PlansStates();

  @override
  List<Object> get props => [];
}

class PlansUninitialized extends PlansStates {}

class FetchingPlans extends PlansStates {}

class FetchedPlans extends PlansStates {
  final List<PlansModel> plans;

  const FetchedPlans({required this.plans});

  @override
  List<Object> get props => [plans];
}

class FailedToFetchPlans extends PlansStates {}

class FetchingExistingPlans extends PlansStates {}

class FetchedExistingPlans extends PlansStates {
  final MyPlansModel myPlans;

  const FetchedExistingPlans({required this.myPlans});

  @override
  List<Object> get props => [myPlans];
}

class FailedToFetchExistingPlans extends PlansStates {}
