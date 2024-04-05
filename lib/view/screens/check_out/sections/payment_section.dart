// import 'package:flutter/material.dart';
// import 'package:graduation_project/view_model/uitils/Colors.dart';
// import 'package:graduation_project/view_model/uitils/Text_custom.dart';
// import 'package:graduation_project/view_model/uitils/icons.dart';
//
// class PaymentScreen extends StatelessWidget {
//   const PaymentScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.deepGreen,
//       appBar: AppBar(
//         backgroundColor: AppColors.deepGreen,
//         centerTitle: true,
//         title: TextCustom(
//           text: "payment ",
//           color: AppColors.Orange,
//           fontWeight: FontWeight.bold,
//           fontSize: 20,
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
//             child: AppIcons.payment,
//           ),],
//       ),
//       body:
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});
  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}
class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "PayPal Checkout",
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
      body: Center(
        child: TextButton(
          onPressed: () async {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => PaypalCheckout(
                sandboxMode: true,
                clientId: "AZa73Yt9Hu-Z-EGkUpcCNMzRuOKH1A1tN8oHZV9TnLAMaypPN0_ALNv0ZXID1rvgDOANxvY1BqsJMRh_",
                secretKey: "EBlHPWjXxQnEqaerR6IHGc3L9f4aOryNSTOIgIn0BahTSw6OtHAuYOOfwLfRvnSLeV2CIlZPyRKBe9ms",
                returnURL: "success.snippetcoder.com",
                cancelURL: "cancel.snippetcoder.com",
                transactions: const [
                  {
                    "amount": {
                      "total": '70',
                      "currency": "USD",
                      "details": {
                        "subtotal": '70',
                        "shipping": '0',
                        "shipping_discount": 0
                      }
                    },
                    "description": "The payment transaction description.",
                    // "payment_options": {
                    //   "allowed_payment_method":
                    //       "INSTANT_FUNDING_SOURCE"
                    // },
                    "item_list": {
                      "items": [
                        {
                          "name": "Apple",
                          "quantity": 4,
                          "price": '5',
                          "currency": "USD"
                        },
                        {
                          "name": "Pineapple",
                          "quantity": 5,
                          "price": '10',
                          "currency": "USD"
                        }
                      ],

                      // shipping address is not required though
                      //   "shipping_address": {
                      //     "recipient_name": "Raman Singh",
                      //     "line1": "Delhi",
                      //     "line2": "",
                      //     "city": "Delhi",
                      //     "country_code": "IN",
                      //     "postal_code": "11001",
                      //     "phone": "+00000000",
                      //     "state": "Texas"
                      //  },
                    }
                  }
                ],
                note: "Contact us for any questions on your order.",
                onSuccess: (Map params) async {
                  print("onSuccess: $params");
                },
                onError: (error) {
                  print("onError: $error");
                  Navigator.pop(context);
                },
                onCancel: () {
                  print('cancelled:');
                },
              ),
            ));
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            shape:  BeveledRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(1.r),
              ),
            ),
          ),
          child: const Text('Checkout'),
        ),
      ),
    );
  }
}