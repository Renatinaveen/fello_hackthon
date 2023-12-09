import 'package:fello_hackthon/model/my_plans.dart';
import 'package:fello_hackthon/resources/color_themes.dart';
import 'package:fello_hackthon/resources/fonts_class.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyPlansPage extends StatefulWidget {
  final Plans plans;
  const MyPlansPage({Key? key, required this.plans}) : super(key: key);

  @override
  State<MyPlansPage> createState() => _MyPlansPageState();
}

class _MyPlansPageState extends State<MyPlansPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorThemes.white),
        title: Text(widget.plans.name!,
            style: const TextStyle(color: ColorThemes.white)),
        backgroundColor: ColorThemes.background,
      ),
      backgroundColor: ColorThemes.background,
      body: Stack(
        children: [
          widget.plans.status == 'completed'
              ? Lottie.asset('assets/animations/confitteLottie.json')
              : const SizedBox(),
          Column(
            children: [
              Lottie.network(widget.plans.lottieFile!),
              const SizedBox(height: 10),
              const Text("Status",
                  style: TextStyle(
                      color: ColorThemes.white,
                      fontWeight: FontsClass.medium,
                      fontSize: 16)),
              const SizedBox(height: 10),
              Text(widget.plans.status!,
                  style: const TextStyle(
                      color: ColorThemes.white,
                      fontWeight: FontsClass.medium,
                      fontSize: 24)),
              const SizedBox(height: 10),
              const Text("Amount",
                  style: TextStyle(
                      color: ColorThemes.white,
                      fontWeight: FontsClass.medium,
                      fontSize: 16)),
              const SizedBox(height: 10),
              Text(widget.plans.amount.toString(),
                  style: const TextStyle(
                      color: ColorThemes.white,
                      fontWeight: FontsClass.medium,
                      fontSize: 24)),
              const SizedBox(height: 10),
              const Text("Reward",
                  style: TextStyle(
                      color: ColorThemes.white,
                      fontWeight: FontsClass.medium,
                      fontSize: 16)),
              const SizedBox(height: 10),
              RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      color: ColorThemes.white,
                      fontWeight: FontsClass.medium,
                      fontSize: FontsClass.fontSize16,
                    ),
                    children: [
                      TextSpan(
                        text: 'Congrats! You won voucher from ',
                        style: TextStyle(
                          color: ColorThemes.white,
                          fontWeight: FontsClass.medium,
                          fontSize: FontsClass.fontSize16,
                        ),
                      ),
                      TextSpan(
                        text: 'IKEA',
                        style: TextStyle(
                          fontWeight: FontsClass.bold,
                          fontSize: FontsClass.fontSize24,
                        ),
                      ),
                      TextSpan(
                        text: ' for ',
                        style: TextStyle(
                          color: ColorThemes.white,
                          fontWeight: FontsClass.medium,
                          fontSize: FontsClass.fontSize16,
                        ),
                      ),
                      TextSpan(
                        text: " 10000 rs",
                        style: TextStyle(
                          fontWeight: FontsClass.bold,
                          fontSize: FontsClass.fontSize24,
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
