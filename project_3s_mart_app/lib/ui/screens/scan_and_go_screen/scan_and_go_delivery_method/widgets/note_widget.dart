part of '../scan_and_go_delivery_method.dart';

class _NoteWidget extends StatelessWidget {
  const _NoteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewmodel = context.read<IOrderInfoViewModel>();
    TextEditingController controller =
        TextEditingController(text: viewmodel.note);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          Strings.addDeliveryNotes.tr,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: ColorUtils.black,
          ),
          onPressed: () => Get.back(),
        ),
        titleTextStyle: TextStyleUtils.heading3.copyWith(
          color: ColorUtils.black,
        ),
        toolbarHeight: 48.h,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: Strings.exNote.tr,
            hintStyle: TextStyleUtils.subHeading,
          ),
          style: TextStyleUtils.subHeading,
          controller: controller,
          maxLines: 10,
          textInputAction: TextInputAction.done,
        ),
      ),
      bottomNavigationBar: ButtonBottom(
        onPressed: () {
          viewmodel.note = controller.text.trim();
          Get.back();
        },
        title: Strings.confirm.tr,
      ),
    );
  }
}
