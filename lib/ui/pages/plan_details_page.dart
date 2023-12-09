import 'package:fello_hackthon/model/savings_plans_model.dart';
import 'package:fello_hackthon/resources/color_themes.dart';
import 'package:fello_hackthon/resources/fonts_class.dart';
import 'package:fello_hackthon/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PlanDetailsPage extends StatefulWidget {
  final PlansModel plan;
  const PlanDetailsPage({Key? key, required this.plan}) : super(key: key);

  @override
  State<PlanDetailsPage> createState() => _PlanDetailsPageState();
}

class _PlanDetailsPageState extends State<PlanDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: ColorThemes.white),
          title: Text(widget.plan.name!,
              style: const TextStyle(color: ColorThemes.white)),
          backgroundColor: ColorThemes.background,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.help_outline,
                  color: ColorThemes.white,
                ))
          ],
        ),
        backgroundColor: ColorThemes.background,
        body: Stack(
          children: [
            SingleChildScrollView(
                child: Column(
              children: [
                Lottie.network(widget.plan.lottieFile!),
                const SizedBox(
                  height: 20,
                ),
                planDetails(),
                const SizedBox(
                  height: 20,
                ),
                savingsDetails(),
              ],
            )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Terms and Conditions',
                        style: TextStyle(
                            color: ColorThemes.gold,
                            fontWeight: FontsClass.medium,
                            fontSize: FontsClass.fontSize16)),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorThemes.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                              (route) => false);
                        },
                        child: const Text('Start Saving',
                            style: TextStyle(
                                color: ColorThemes.white,
                                fontSize: FontsClass.fontSize24)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget planDetails() {
    return Column(
      children: [
        const Text('Duration',
            style: TextStyle(
                color: ColorThemes.white,
                fontWeight: FontsClass.regular,
                fontSize: FontsClass.fontSize16)),
        Text(widget.plan.duration!,
            style: const TextStyle(
                color: ColorThemes.white,
                fontWeight: FontsClass.bold,
                fontSize: FontsClass.fontSize24)),
        const Text('Amount',
            style: TextStyle(
                color: ColorThemes.white,
                fontWeight: FontsClass.regular,
                fontSize: FontsClass.fontSize16)),
        Text('${widget.plan.totalAmountNeeded!}',
            style: const TextStyle(
                color: ColorThemes.white,
                fontWeight: FontsClass.bold,
                fontSize: FontsClass.fontSize24)),
        const Text('Interest Rate',
            style: TextStyle(
                color: ColorThemes.white,
                fontWeight: FontsClass.medium,
                fontSize: FontsClass.fontSize16)),
        const Text('13 %',
            style: TextStyle(
                color: ColorThemes.white,
                fontWeight: FontsClass.bold,
                fontSize: FontsClass.fontSize24)),
      ],
    );
  }

  Widget savingsDetails() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(
          color: ColorThemes.white,
          fontWeight: FontsClass.medium,
          fontSize: FontsClass.fontSize16,
        ),
        children: [
          const TextSpan(
            text: 'Monthly Savings of ',
            style: TextStyle(
              color: ColorThemes.white,
              fontWeight: FontsClass.medium,
              fontSize: FontsClass.fontSize16,
            ),
          ),
          TextSpan(
            text: '${widget.plan.monthlyContribution!}',
            style: const TextStyle(
              fontWeight: FontsClass.bold,
              fontSize: FontsClass.fontSize24,
            ),
          ),
          const TextSpan(
            text: ' for ',
            style: TextStyle(
              color: ColorThemes.white,
              fontWeight: FontsClass.medium,
              fontSize: FontsClass.fontSize16,
            ),
          ),
          TextSpan(
            text: widget.plan.duration!,
            style: const TextStyle(
              fontWeight: FontsClass.bold,
              fontSize: FontsClass.fontSize24,
            ),
          ),
          const TextSpan(
            text: ' will yield ',
            style: TextStyle(
              color: ColorThemes.white,
              fontWeight: FontsClass.medium,
              fontSize: FontsClass.fontSize16,
            ),
          ),
          TextSpan(
            text: calculateInterest(),
            style: const TextStyle(
              color: ColorThemes.gold,
              fontWeight: FontsClass.bold,
              fontSize: FontsClass.fontSize24,
            ),
          ),
        ],
      ),
    );
  }

  String calculateInterest() {
    double approxAccumulatedAmount =
        double.parse(widget.plan.totalAmountNeeded!.toString()) +
            (double.parse(widget.plan.totalAmountNeeded!.toString()) * 0.13);
    return approxAccumulatedAmount.toStringAsFixed(2);
  }
}
