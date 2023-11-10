import 'package:flutter/material.dart';
import 'package:flutter_popup_menu_button/custom_popup_menu_button.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewApp extends StatefulWidget {

  final String urlPath;

  WebViewApp({super.key, required this.urlPath});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  var loadingPercentage = 0;
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(widget.urlPath),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        actions: [
          FlutterPopupMenuButton(
              direction: MenuDirection.right,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white
              ),
              popupMenuSize: const Size(160,200),
              child: FlutterPopupMenuIcon(
                key: GlobalKey(),
                child: Icon(Icons.more_vert),
              ),
              children: [
                FlutterPopupMenuItem(
                    closeOnItemClick: false,
                    child: ListTile(
                      title: const Text('List 1'),
                      leading: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.redAccent.withOpacity(0.3),
                            shape: BoxShape.circle
                        ),
                      ),
                    )),
                FlutterPopupMenuItem(
                    closeOnItemClick: false,
                    child: ListTile(
                      title: const Text('List 2'),
                      leading: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.3),
                            shape: BoxShape.circle
                        ),
                      ),
                    )),
                FlutterPopupMenuItem(
                    child: ListTile(
                      title: const Text('List 3'),
                      leading: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.3),
                            shape: BoxShape.circle
                        ),
                      ),
                    )),
                FlutterPopupMenuItem(
                    child: ListTile(
                      title: const Text('List 4'),
                      leading: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.cyanAccent.withOpacity(0.3),
                            shape: BoxShape.circle
                        ),
                      ),
                    ))
              ],
            ),
        ],
      ),
      body: Stack(
      children: [
        WebViewWidget(
          controller: controller,
        ),
        ],
      )
    );
  }
}
