import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/providers/slider_provider.dart';

class MyCustomSlider extends ConsumerStatefulWidget {
  const MyCustomSlider({super.key});

  @override
  MyCustomSliderState createState() => MyCustomSliderState();
}

class MyCustomSliderState extends ConsumerState<MyCustomSlider> {
  @override
  Widget build(BuildContext context) {
    bool isPagePlan = ref.watch(sliderProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      width: 199,
      height: 44,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: AppColors.grey(7),
            width: 1,
          )),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 70),
            curve: Curves.easeInOut,
            left: isPagePlan ? 96 : 0,
            child: Container(
              width: 92,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.cyan(1),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  ref.read(sliderProvider.notifier).toggleSlider();
                },
                child: SizedBox(
                  width: 92,
                  height: 36,
                  child: Text(
                    '전체 보기',
                    textAlign: TextAlign.center,
                    style: isPagePlan
                        ? AppFonts.greyTitle(
                            null,
                            bold: FontWeight.w500,
                            size: 16,
                          )
                        : AppFonts.whiteTitle(
                            size: 16,
                          ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  ref.read(sliderProvider.notifier).toggleSlider();
                },
                child: SizedBox(
                  width: 92,
                  height: 36,
                  child: Text(
                    '계획 보기',
                    textAlign: TextAlign.center,
                    style: isPagePlan
                        ? AppFonts.whiteTitle(
                            size: 16,
                          )
                        : AppFonts.greyTitle(
                            null,
                            bold: FontWeight.w500,
                            size: 16,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
