import 'package:fello_hackthon/bloc/banners_bloc.dart';
import 'package:fello_hackthon/bloc/plans_bloc.dart';
import 'package:fello_hackthon/resources/color_themes.dart';
import 'package:fello_hackthon/resources/events/plans_events.dart';
import 'package:fello_hackthon/resources/fonts_class.dart';
import 'package:fello_hackthon/resources/states/banner_states.dart';
import 'package:fello_hackthon/resources/states/plans_states.dart';
import 'package:fello_hackthon/ui/components/banner_with_images.dart';
import 'package:fello_hackthon/ui/pages/my_plans_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../resources/events/banner_events.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BannersBloc _bannersBloc = BannersBloc();
  final PlansBloc _plansBloc = PlansBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorThemes.background,
      body: BlocProvider(
          create: (context) => _bannersBloc..add(FetchBanners()),
          child:
              BlocBuilder<BannersBloc, BannerStates>(builder: (context, state) {
            if (state is FetchingBanners) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FetchedBanners) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      existingPlans(context),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(state.banners.title!,
                                style: const TextStyle(
                                    color: ColorThemes.white,
                                    fontWeight: FontsClass.bold,
                                    fontSize: FontsClass.fontSize24)),
                            const SizedBox(height: 10),
                            BannerWithImages(banners: state.banners),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                  child: Text('Something went wrong',
                      style: TextStyle(
                          color: ColorThemes.green,
                          fontWeight: FontsClass.medium,
                          fontSize: FontsClass.fontSize24)));
            }
          })),
    );
  }

  existingPlans(BuildContext context) {
    return BlocProvider<PlansBloc>(
      create: (context) =>
          _plansBloc..add(const FetchExisitingPlans(ageGroup: '18-25')),
      child: BlocBuilder<PlansBloc, PlansStates>(
        builder: (BuildContext context, PlansStates state) {
          if (state is FetchedExistingPlans) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('My Plans',
                    style: TextStyle(
                        color: ColorThemes.white,
                        fontWeight: FontsClass.bold,
                        fontSize: FontsClass.fontSize24)),
                const SizedBox(height: 10),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.myPlans.plans!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyPlansPage(
                                      plans: state.myPlans.plans![index])));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorThemes.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Lottie.network(
                                state.myPlans.plans![index].lottieFile!,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
