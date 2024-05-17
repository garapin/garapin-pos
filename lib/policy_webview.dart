import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/routes/routes.dart';
import 'package:pos/themes/themes.dart';
import 'package:pos/widgets/widgets.dart';

class PolicyWebview extends StatefulWidget {
  const PolicyWebview({Key? key}) : super(key: key);

  @override
  _PolicyWebviewState createState() => _PolicyWebviewState();
}

class _PolicyWebviewState extends State<PolicyWebview> {
  InAppWebViewController? _webViewController;
  bool _showApproveButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Refund Policy"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                InAppWebView(
                  initialUrlRequest: URLRequest(
                      url: WebUri.uri(Uri.parse(
                          "https://bagibagipos.com/refund-policy-and-paymet/"))),
                  onWebViewCreated: (controller) {
                    _webViewController = controller;
                  },
                  onLoadStop: (controller, url) {
                    setState(() async {
                      var i = await controller.getScrollY();
                      _webViewController!.scrollTo(x: 0, y: i!);
                    });
                  },
                  onScrollChanged: (controller, x, y) {
                    // Jika web view mencapai akhirnya, tampilkan tombol "Setujui"
                    setState(() async {
                      var i = await controller.getContentHeight();
                      _showApproveButton = y >= i! - 100;
                    });
                    setState(() async {});
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                    child: FloatingActionButton.extended(
                      onPressed: () async {
                        final data = await ApiService.updatePolicy(context);
                        if (data.isSuccess) {
                          ShowNotify.success(context,
                              msg: "Kebijakan disetujui");
                          context.pushNamed(RouteNames.dashboard);
                        } else {
                          ShowNotify.error(context, msg: "Terjadi kesalahan");
                        }
                      },
                      label: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Setuju",
                          style: AppFont.whiteLarge(context),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
