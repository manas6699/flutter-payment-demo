# shop

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Testing Credentials
The gatewayMerchantId and gatewayName are parameters used for configuring the Google Pay payment method. They are required when setting up your app to accept Google Pay payments. Here's what each of these parameters means:

gatewayMerchantId:

The gatewayMerchantId is a unique identifier for your payment gateway or payment processor.
You obtain this value from your payment processor or gateway provider. It's typically provided to you when you set up your account with the payment processor or gateway.
This ID is essential for Google Pay to route payments through the correct payment processor or gateway.
gatewayName:

The gatewayName is the name of the payment gateway or payment processor that your app is using.
It's also provided by your payment processor or gateway provider. It should match the name associated with your payment processing service.
The gatewayName helps Google Pay identify the payment processor to use for processing transactions.
