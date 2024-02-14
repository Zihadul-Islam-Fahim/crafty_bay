import 'package:crafty_bay/data/models/payment_method_wraper_model.dart';
import 'package:crafty_bay/presentation/state_holders/create_invoice_controller.dart';
import 'package:crafty_bay/presentation/ui/screen/payment_webview_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<CreateInvoiceController>().createInvoice();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        leadingWidth: 20,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
        ),
      ),
      body: GetBuilder<CreateInvoiceController>(builder: (controller) {
        if (controller.inProgress == true) {
          return const CenterCircularProgressIndicator();
        }
        final PaymentMethodWrapper paymentMethodWrapper =
            controller.paymentMethodListModel.data!.first;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '   Total  : ${paymentMethodWrapper.total ?? 0}',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2),
                ),                Text(
                  'VAT   : ${paymentMethodWrapper.vat ?? 0}',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2),
                ),
                Text(
                  'Payable : ${paymentMethodWrapper.payable ?? 0}',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2),
                ),

                ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: AspectRatio(
                          aspectRatio: 11 / 10,
                          child: Image.network(
                              paymentMethodWrapper.paymentMethod![index].logo ??
                                  ''),
                        ),
                        trailing: const Icon(Icons.arrow_forward),
                        title: Text(
                            paymentMethodWrapper.paymentMethod![index].name ??
                                ''),
                        onTap: () {
                          Get.to(
                            () => PaymentWebViewScreen(
                              url: paymentMethodWrapper.paymentMethod![index]
                                      .redirectGatewayURL ??
                                  '',
                            ),
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: paymentMethodWrapper.paymentMethod?.length ?? 0)
              ],
            ),
          ),
        );
      }),
    );
  }
}
