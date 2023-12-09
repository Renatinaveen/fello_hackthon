import 'package:fello_hackthon/model/banners_model.dart';
import 'package:fello_hackthon/ui/pages/plans_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

import '../../resources/color_themes.dart';
import '../../resources/custom_network_image.dart';
import '../../resources/fonts_class.dart';

class BannerWithImages extends StatelessWidget {
  final SipBannerModel banners;
  const BannerWithImages({Key? key, required this.banners}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showAgeGroupBottomSheet(context);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: ColorThemes.cement),
        height: MediaQuery.of(context).size.height * 0.2,
        child: Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: FlutterCarousel.builder(
                itemCount: banners.images!.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        CustomNetworkImage(
                  imageUrl: banners.images![itemIndex],
                ),
                options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1,
                  enableInfiniteScroll: true,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(banners.header!,
                        style: const TextStyle(
                            color: ColorThemes.white,
                            fontWeight: FontsClass.medium,
                            fontSize: FontsClass.fontSize24)),
                    Text(banners.description!,
                        style: const TextStyle(
                            color: ColorThemes.white,
                            fontWeight: FontsClass.regular,
                            fontSize: FontsClass.fontSize16)),
                    Text(banners.actionTitle!,
                        style: const TextStyle(
                            color: ColorThemes.white,
                            fontWeight: FontsClass.medium,
                            fontSize: FontsClass.fontSize24)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAgeGroupBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Select your age group',
              style: TextStyle(
                  color: ColorThemes.cement,
                  fontWeight: FontsClass.medium,
                  fontSize: FontsClass.fontSize24),
            ),
            ListTile(
              title: const Text('18-25'),
              onTap: () {
                _handleAgeGroupSelection(context, '18-25');
              },
            ),
            ListTile(
              title: const Text('25-35'),
              onTap: () {
                _handleAgeGroupSelection(context, '25-35');
              },
            ),
            ListTile(
              title: const Text('35+'),
              onTap: () {
                _handleAgeGroupSelection(context, '35+');
              },
            ),
          ],
        );
      },
    );
  }

  void _handleAgeGroupSelection(BuildContext context, String selectedAgeGroup) {
    Navigator.pop(context); // Close the bottom sheet
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlansPage(ageGroup: selectedAgeGroup),
      ),
    );
  }
}
