import 'package:flutter/material.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';

class MyCustomSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const MyCustomSlider({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        // Update the slider value based on drag position
        double newValue =
            (details.localPosition.dx / context.size!.width).clamp(0.0, 1.0);
        onChanged(newValue);
      },
      child: Container(
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
            Container(
              width: 92,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.cyan(1),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    width: 92,
                    height: 36,
                    child: Text(
                      '전체 보기',
                      textAlign: TextAlign.center,
                      style: AppFonts.greyTitle(
                        size: 16,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => {},
                  child: SizedBox(
                    width: 92,
                    height: 36,
                    child: Text(
                      '계획 보기',
                      textAlign: TextAlign.center,
                      style: AppFonts.greyTitle(
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ViewSlider extends StatelessWidget {
  final double value;
  final int initialIndex;

  const ViewSlider({
    super.key,
    required this.value,
    this.initialIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      min: 0,
      max: 1,
      divisions: 2,
      onChanged: (newValue) {},
    );
  }
}
