part of '../scan_screen.dart';

class _EnterCodeManuallySuggestion extends StatelessWidget {
  const _EnterCodeManuallySuggestion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
        child: Column(
          children: [
            Text(
              Strings.havingScanningTrouble.tr,
              style: TextStyleUtils.bodyStrong.copyWith(color: Colors.white),
            ),
            SizedBox(height: 4.h),
            TextButton(
              onPressed: () {},
              child: Text(
                Strings.enterProductCodeToAdd.tr,
                style: TextStyleUtils.button,
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              ),
            )
          ],
        ));
  }
}
