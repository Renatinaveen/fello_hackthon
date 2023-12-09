import 'dart:convert';

import 'package:fello_hackthon/model/my_plans.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/savings_plans_model.dart';
import '../resources/events/plans_events.dart';
import '../resources/repository/plans_repo.dart';
import '../resources/states/plans_states.dart';

class PlansBloc extends Bloc<PlansEvents, PlansStates> {
  final PlansRepo plansRepository;

  PlansBloc()
      : plansRepository = PlansRepo(),
        super(PlansUninitialized()) {
    on<FetchPlans>(_fetchPlans);
    on<FetchExisitingPlans>(_fetchExistingPlans);
  }

  _fetchPlans(FetchPlans event, Emitter<PlansStates> emit) async {
    try {
      emit(FetchingPlans());
      var response = await plansRepository.fetchPlans();

      AllPlans savingsPlansModel = AllPlans.fromJson(response.data);
      var savingsPlans = savingsPlansModel.savingsPlans
          ?.where((element) => element.ageGroup == event.ageGroup)
          .toList();
      emit(FetchedPlans(
        plans: savingsPlans![0].plans!,
      ));
    } catch (e) {
      if (kDebugMode) {
        print('error: $e');
      }
      emit(FailedToFetchPlans());
    }
  }

  _fetchExistingPlans(
      FetchExisitingPlans event, Emitter<PlansStates> emit) async {
    try {
      emit(FetchingPlans());
      var response = await plansRepository.fetchExistingPlans();
      MyPlansModel myPlans = MyPlansModel.fromJson(response);
      emit(FetchedExistingPlans(
        myPlans: myPlans,
      ));
    } catch (e) {
      if (kDebugMode) {
        print('error: $e');
      }
      emit(FailedToFetchPlans());
    }
  }
}
