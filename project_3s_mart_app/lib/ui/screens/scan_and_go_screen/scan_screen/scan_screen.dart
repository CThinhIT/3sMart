import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/ui_models/product_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iproduct_viewmodel.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iscan_viewmodel.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/circle_progress_widget.dart';
import 'package:project_3s_mart_app/ui/common_widgets/product/product_item.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';
import 'package:project_3s_mart_app/ui/utils/add_cart_anim_utils.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'widgets/scanner_bottom_bar.dart';

part 'widgets/enter_code_manually_suggest.dart';
part 'widgets/scanned_product_item_loader.dart';
part 'widgets/scanned_product_item.dart';
part 'widgets/scanner_anim_widget.dart';
part 'widgets/scanner_app_bar.dart';
part 'widgets/scanner_buttons.dart';
part 'widgets/scanner_instruction.dart';
part 'widgets/scanner_overlay_painter.dart';
part 'widgets/scanner_overlay.dart';
part 'widgets/scanner.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      key: AddCartAnimUtils.scanScreenKey,
      onWillPop: () async {
        await context.read<IScanViewModel>().stopScan();
        return true;
      },
      child: Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/bg_scan.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _ScannerAppBar(),
                    const _ScannerInstruction(),
                    _Scanner(),
                    Selector<IScanViewModel, String?>(
                      selector: (_, vm) => vm.scannedProductId,
                      builder: (_, scannedProductId, __) =>
                          scannedProductId != null
                              ? _ScannedProductItemLoader(scannedProductId)
                              : const _EnterCodeManuallySuggestion(),
                    ),
                    SizedBox(height: 128.h),
                  ],
                ),
              ),
              const Positioned(
                child: ScannerBottomBar(value: NavigationScanBar.scan,),
                bottom: 0,
                left: 0,
                right: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
