import 'package:cana_cabana/components/dialogs/dialog.dart';
import 'package:cana_cabana/core/controllers/home_wrapper_controller.dart';
import 'package:cana_cabana/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MonerisCheckoutPage extends StatefulWidget {
  @override
  _MonerisCheckoutPageState createState() => _MonerisCheckoutPageState();
}

class _MonerisCheckoutPageState extends State<MonerisCheckoutPage> {
  InAppWebViewController? webView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moneris Checkout'),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri.uri(Uri.parse("about:blank")),
        ),
        onWebViewCreated: (controller) {
          webView = controller;
          _loadCustomHtmlContent();
        },
        onJsAlert: (controller, jsAlertRequest) async {
          print(jsAlertRequest.message);
        },
        onLoadStop: (controller, url) async {
          // Set up JavaScript callbacks to call Dart methods

          // Execute Moneris Checkout initialization code after page load
          await _initializeMonerisCheckout();
          setupJavascriptCallbacks(controller);
        },
      ),
    );
  }

  // JavaScript callback functions
  void setupJavascriptCallbacks(InAppWebViewController controller) {
    controller.addJavaScriptHandler(
      handlerName: 'page_loaded',
      callback: (args) {
        myPageLoad(args);
      },
    );

    controller.addJavaScriptHandler(
      handlerName: 'cancel_transaction',
      callback: (args) {
        myCancelTransaction(args);
      },
    );

    controller.addJavaScriptHandler(
      handlerName: 'error_event',
      callback: (args) {
        myErrorEvent(args);
      },
    );

    controller.addJavaScriptHandler(
      handlerName: 'payment_receipt',
      callback: (args) {
        myPaymentReceipt(args);
      },
    );

    controller.addJavaScriptHandler(
      handlerName: 'payment_complete',
      callback: (args) {
        myPaymentComplete(args);
      },
    );
  }

  // Dart callback functions
  void myPageLoad(List<dynamic> args) {
    print('page_loaded callback: $args');
  }

  void myCancelTransaction(List<dynamic> args) {
    print('cancel_transaction callback: $args');
  }

  void myErrorEvent(List<dynamic> args) {
    print('error_event callback: $args');
  }

  void myPaymentReceipt(List<dynamic> args) {
    print('payment_receipt callback: $args');
    Get.back();
    Get.find<HomeWrapperController>()
        .pageController
        .animateToPage(0, duration: Duration.zero, curve: Curves.bounceIn);
    Get.find<HomeWrapperController>().bottomBarIndex.value = 0;
    showCustomDialog("Checkout completed successfully");
  }

  void myPaymentComplete(List<dynamic> args) {
    print('payment_complete callback: $args');
  }

  void _loadCustomHtmlContent() async {
    if (webView != null) {
      String htmlContent = '''
        <html>
          <head>
            <script src="https://gatewayt.moneris.com/chktv2/js/chkt_v2.00.js"></script>
          </head>
          <body>
            <div id="monerisCheckout"></div>
          </body>
        </html>
      ''';

      await webView!.loadData(
        data: htmlContent,
        mimeType: 'text/html',
        baseUrl: WebUri.uri(Uri.parse("about:blank")),
      );
    }
  }

  Future<void> _initializeMonerisCheckout() async {
    final result = await apiService.getTicket();
    if (webView != null) {
      await webView!.evaluateJavascript(source: '''
        var myCheckout = new monerisCheckout();
        myCheckout.setMode("qa");
        myCheckout.setCheckoutDiv("monerisCheckout");
         function handlePaymentComplete() {
        window.flutter_inappwebview.callHandler('payment_complete');
      }
        function myPageLoad() {
        window.flutter_inappwebview.callHandler('page_loaded');
      }
       function myCancelTransaction() {
        window.flutter_inappwebview.callHandler('cancel_transaction');
      }
      function myErrorEvent() {
        window.flutter_inappwebview.callHandler('error_event');
      }
       function myPaymentReceipt() {
        window.flutter_inappwebview.callHandler('payment_receipt');
      }
      myCheckout.setCallback("page_loaded", myPageLoad);
      myCheckout.setCallback("cancel_transaction", myCancelTransaction);
      myCheckout.setCallback("error_event", myErrorEvent);
      myCheckout.setCallback("payment_receipt", myPaymentReceipt);
      myCheckout.setCallback("payment_complete", handlePaymentComplete);
        myCheckout.startCheckout("$result");
      ''');
    }
  }
}
