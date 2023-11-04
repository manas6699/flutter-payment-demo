import 'package:flutter/material.dart';
import 'package:flutter_pay/flutter_pay.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterPay flutterPay = FlutterPay();

  String result = "Result will be shown here";

  @override
  void initState() {
    super.initState();
  }

  void makePayment() async {
    List<PaymentItem> items = [
      PaymentItem(name: "T-Shirt", price: 2.98),
    ];

    flutterPay.setEnvironment(environment: PaymentEnvironment.Test);

    flutterPay.requestPayment(
      googleParameters: GoogleParameters(
        gatewayName: "example",
        gatewayMerchantId: "example_id",
      ),
      appleParameters:
          AppleParameters(merchantIdentifier: "merchant.flutterpay.example"),
      currencyCode: "INR",
      countryCode: "IN",
      paymentItems: items,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                this.result,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    bool result = await flutterPay.canMakePayments();
                    setState(() {
                      this.result = "Can make payments: $result";
                    });
                  } catch (e) {
                    setState(() {
                      this.result = "$e";
                    });
                  }
                },
                child: Text("Can make payments?"),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    bool result =
                        await flutterPay.canMakePaymentsWithActiveCard(
                      allowedPaymentNetworks: [
                        PaymentNetwork.visa,
                        PaymentNetwork.masterCard,
                      ],
                    );
                    setState(() {
                      this.result = "$result";
                    });
                  } catch (e) {
                    setState(() {
                      this.result = "Error: $e";
                    });
                  }
                },
                child: Text("Can make payments with verified card: $result"),
              ),
              ElevatedButton(
                onPressed: () {
                  makePayment();
                },
                child: Text("Try to pay?"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
