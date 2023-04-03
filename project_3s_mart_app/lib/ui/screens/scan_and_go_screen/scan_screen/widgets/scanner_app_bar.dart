part of '../scan_screen.dart';

class _ScannerAppBar extends PreferredSize {
  _ScannerAppBar({Key? key})
      : super(
          key: key,
          child: _buildAppBar(),
          preferredSize: Size.fromHeight(48.h),
        );

  static Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(Strings.scan.tr, style: TextStyleUtils.heading3),
      elevation: 0,
      centerTitle: true,
      toolbarHeight: 48.h,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset('assets/images/ic_question.svg'),
          onPressed: () {},
        )
      ],
    );
  }
}
