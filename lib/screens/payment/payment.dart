import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentPage extends StatefulWidget {
  static String routeName = "/payment";
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late Razorpay _razorpay;

  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  var options = {
    'key': 'rzp_live_CfBr3ZbILgzN1o',
    // amount should we in multiple of hundred
    'amount': 1500, //in the smallest currency sub-unit.
    'name': 'Rahul Gupta',
    'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
    'description': 'Masala Tea',
    'timeout': 300, // in seconds
    'prefill': {'contact': '9123456789', 'email': 'gaurav.kumar@example.com'}
  };

  @override
  void dispose() {
    _razorpay.clear();
    // Removes all listeners
    super.dispose();
  }

// try {
//   _razorpay.open(options);
// } catch (e) {
//   debugPrint(e);
// }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Razorpay Sample"),
        ),
      ),
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {}
  void _handlePaymentError(PaymentFailureResponse response) {}
  void _handleExternalWallet(ExternalWalletResponse response) {}
}
