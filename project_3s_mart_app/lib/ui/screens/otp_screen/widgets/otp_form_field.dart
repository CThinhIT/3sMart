part of '../otp_screen.dart';

class _OTPFormField extends StatelessWidget {
  const _OTPFormField({
    Key? key,
    required AnimationController animationController,
    required Animation rotationAnimation,
    required this.onCompleted,
  })  : _animationController = animationController,
        _rotationAnimation = rotationAnimation,
        super(key: key);

  final AnimationController _animationController;
  final Animation _rotationAnimation;
  final ValueChanged<String> onCompleted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: <InlineSpan>[
              TextSpan(
                text: Strings.otp.tr,
                style: TextStyleUtils.body,
              ),
              TextSpan(
                text: '*',
                style: TextStyleUtils.body.copyWith(
                  color: ColorUtils.primaryRedColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 160.w,
              child: PinCodeTextField(
                appContext: context,
                length: 4,
                textStyle: TextStyle(
                    color: const Color(0xFFEA2027),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
                pinTheme: PinTheme(
                  fieldHeight: 50,
                  fieldWidth: 30,
                  activeFillColor: Colors.white,
                  activeColor: Colors.red,
                ),
                animationType: AnimationType.fade,
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
                onCompleted: onCompleted,
                onChanged: (value) {},
              ),
            ),
            const Spacer(),
            AnimatedBuilder(
              animation: _animationController,
              builder: (_, child) => _rotationAnimation.value != 0.0
                  ? Row(
                      children: [
                        Text(
                          '${(_rotationAnimation.value * 0.6).toStringAsFixed(2)}',
                          style: TextStyleUtils.body.copyWith(
                            color: ColorUtils.primaryRedColor,
                          ),
                        ),
                        SizedBox(
                          width: 7.sp,
                        ),
                        SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(
                            value: _rotationAnimation.value,
                            strokeWidth: 3,
                            color: const Color(0xFFEA2027),
                          ),
                        ),
                      ],
                    )
                  : InkWell(
                      onTap: () {
                        _animationController.forward(from: 0.0);
                      },
                      child: Text(
                        Strings.resend.tr,
                        style: TextStyleUtils.body.copyWith(
                          color: ColorUtils.primaryRedColor,
                        ),
                      ),
                    ),
            ),
            SizedBox(width: 5.w),
          ],
        ),
      ],
    );
  }
}
