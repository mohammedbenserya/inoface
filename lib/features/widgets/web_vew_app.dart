import 'package:inoface/widget_helper/responsive_safe_area.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../../core/util/generateMaterialColor.dart';
import '../../core/util/url_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class WebVewApp extends StatefulWidget {
  final String url;
  final bool isHtml;
  final bool showAppBar;
  const WebVewApp({Key? key,
    required this.url,
    this.isHtml = false,
    this.showAppBar = true,
  }) : super(key: key);

  @override
  _WebVewAppState createState() => _WebVewAppState();
}

class _WebVewAppState extends State<WebVewApp> {

  late InAppWebViewController _webViewController;
  // late WebViewController _controller;
  late String contentBase64;
  bool isLoading = true;


  @override
  void initState() {
    // if (Platform.isAndroid) WebView.platform = AndroidWebView();

    /*
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    WebViewController controller = WebViewController.fromPlatformCreationParams(params);

    if (widget.isHtml) {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        // ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              // Update loading bar.
            },
            onPageStarted: (String url) {},
            onPageFinished: (String url) {
              logger.v(url);
              setState(() {
                isLoading = false;
              });
            },
            onWebResourceError: (WebResourceError error) {
              logger.e(error);
            },
            onNavigationRequest: (navigation) {
              if (navigation.url != widget.url) {
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          ),
        )..loadHtmlString(widget.url);
    } else {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        // ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              // Update loading bar.
            },
            onPageStarted: (String url) {},
            onPageFinished: (String url) {
              logger.v(url);
              setState(() {
                isLoading = false;
              });
            },
            onWebResourceError: (WebResourceError error) {
              logger.e(error);
            },
            onNavigationRequest: (navigation) {
              if (navigation.url != widget.url) {
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          ),
        )..loadRequest(Uri.parse(widget.url));
    }

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    _controller = controller;
    */
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      builder: (_) => Scaffold(
        backgroundColor: backgroundColor,
        appBar: widget.showAppBar ?
        AppBar(
          leading: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () async {
              if (await _webViewController.canGoBack()) {
                await _webViewController.goBack();
              } else {
                Get.back();
              }
            },
          ),
        ) : null,
        body: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: widget.isHtml ? null : URLRequest(url: WebUri(UrlService.rewriteInoserUri(widget.url))),
              initialData: widget.isHtml ? InAppWebViewInitialData(data: widget.url) : null,
              initialSettings: InAppWebViewSettings(),
              onWebViewCreated: (InAppWebViewController controller) {
                _webViewController = controller;
              },
              onLoadStop: (InAppWebViewController controller, WebUri? url) async {
                setState(() {
                  isLoading = false;
                });
              },
            ),

            // WebViewWidget(
            //   controller: _controller,
            //   key: UniqueKey(),
            // ),

            // WebView(
            //   key: _key,
            //   initialUrl: widget.url,
            //   javascriptMode: JavascriptMode.unrestricted,
            //   onWebViewCreated: (controller) => _controller = controller,
            //   onPageFinished: (String val) {
            //     setState(() {
            //       isLoading = false;
            //     });
            //   },
            // ),
            isLoading ? Container(
                color: backgroundColor,
                child: const Center(child: CircularProgressIndicator())) : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
