import 'package:fello_hackthon/bloc/plans_bloc.dart';
import 'package:fello_hackthon/resources/color_themes.dart';
import 'package:fello_hackthon/resources/events/plans_events.dart';
import 'package:fello_hackthon/ui/pages/plan_details_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../resources/states/plans_states.dart';

class PlansPage extends StatefulWidget {
  final String ageGroup;
  const PlansPage({Key? key, required this.ageGroup}) : super(key: key);

  @override
  State<PlansPage> createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  late PlansBloc _plansBloc;

  @override
  void initState() {
    super.initState();
    _plansBloc = PlansBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: ColorThemes.white),
          title:
              const Text("Plans", style: TextStyle(color: ColorThemes.white)),
          backgroundColor: ColorThemes.background,
        ),
        backgroundColor: ColorThemes.background,
        body: BlocProvider<PlansBloc>(
            create: (context) =>
                _plansBloc..add(FetchPlans(ageGroup: widget.ageGroup)),
            child: BlocListener<PlansBloc, PlansStates>(
                listener: (context, state) {
              if (state is FetchedPlans) {
                if (kDebugMode) {
                  print(state.plans);
                }
              }
            }, child: BlocBuilder<PlansBloc, PlansStates>(
              builder: (context, state) {
                if (state is FetchingPlans) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FetchedPlans) {
                  return ListView.builder(
                      itemCount: state.plans.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Material(
                            color: ColorThemes.cement,
                            borderRadius: BorderRadius.circular(10),
                            elevation: 2,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PlanDetailsPage(
                                            plan: state.plans[index])));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Visibility(
                                      visible: index.isEven,
                                      child: Lottie.network(
                                        state.plans[index].lottieFile!,
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(state.plans[index].name!,
                                            style: const TextStyle(
                                                color: ColorThemes.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        const SizedBox(height: 10),
                                        Text(
                                            "Monthly EMI: ₹ ${state.plans[index].monthlyContribution!}",
                                            style: const TextStyle(
                                                color: ColorThemes.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                        const SizedBox(height: 10),
                                        Text(
                                            "Total: ₹ ${state.plans[index].totalAmountNeeded!}",
                                            style: const TextStyle(
                                                color: ColorThemes.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Visibility(
                                      visible: index.isOdd,
                                      child: Lottie.network(
                                        state.plans[index].lottieFile!,
                                        height: 100,
                                        width: 100,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                } else if (state is FailedToFetchPlans) {
                  return const Center(child: Text("Failed to fetch plans"));
                }
                return const CircularProgressIndicator();
              },
            ))));
  }
}
