part of '../scan_screen.dart';

class _Scanner extends StatelessWidget {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final horizontalPadding = 24.w;
  late final IScanViewModel _viewmodel;

  _Scanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _viewmodel = context.read<IScanViewModel>();
    _viewmodel.ensureCameraPermission();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            QRView(
              key: qrKey,
              onQRViewCreated: _viewmodel.onQRViewCreated,
              onPermissionSet: (ctrl, isPermissionGranted) => _onPermissionSet(
                context,
                ctrl,
                isPermissionGranted,
              ),
            ),
            _ScannerOverlay(
              scannerSize: 1.sw - 2 * horizontalPadding,
            ),
          ],
        ),
      ),
    );
  }

  void _onPermissionSet(
    BuildContext context,
    QRViewController controller,
    bool isPermissionGranted,
  ) {
    if (!isPermissionGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please accept permissions to scan')),
      );
      // TODO: request permission again
    }
  }
}
