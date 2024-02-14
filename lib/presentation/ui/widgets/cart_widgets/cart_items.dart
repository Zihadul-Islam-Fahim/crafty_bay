import 'package:crafty_bay/data/models/cart_item.dart';
import 'package:crafty_bay/presentation/state_holders/cart_list_controller.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class CartProductItem extends StatefulWidget {
  const CartProductItem({super.key, required this.cartItem});

  final CartItem cartItem;

  @override
  State<CartProductItem> createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem> {
  late ValueNotifier<int> noOfCartItem =
      ValueNotifier(widget.cartItem.quantity);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: AspectRatio(
              aspectRatio: 11 / 10,
              child: Image.network(
                widget.cartItem.product?.image.toString() ?? '',
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.cartItem.product?.title ?? '',
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                              overflow: TextOverflow.ellipsis,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Color : ${widget.cartItem.color ?? ''}',
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    overflow: TextOverflow.ellipsis),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Size : ${widget.cartItem.size ?? ''}',
                                style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 13,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.defaultDialog(
                            textConfirm: 'Delete',
                            textCancel: 'Cancel',
                            title: 'Delete',
                            middleText: 'Are you want to delete?',
                            confirmTextColor: Colors.white,
                            onConfirm: () async {
                              Get.back();
                              final response =
                                  await Get.find<CartListController>()
                                      .deleteFromCart(
                                          widget.cartItem.product!.id!.toInt());
                              if (response) {
                                Get.find<CartListController>().getCartList();
                              } else {
                                Get.snackbar('Delete Failed',
                                    'Unable to delete cart item');
                              }
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.delete_forever,
                          color: Colors.grey,
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '৳ ${widget.cartItem.product?.price}' ?? '0',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: noOfCartItem,
                      builder: (context, value, _) {
                        return ItemCount(
                          initialValue: value,
                          minValue: 1,
                          maxValue: 10,
                          step: 1,
                          color: AppColors.primaryColor,
                          buttonSizeHeight: 30,
                          buttonSizeWidth: 40,
                          textStyle: const TextStyle(
                            fontFamily: 'Poppins',
                          ),
                          onChanged: (v) {
                            noOfCartItem.value = v.toInt();
                            Get.find<CartListController>().updateQuantity(
                                widget.cartItem.id!, noOfCartItem.value);
                          },
                          decimalPlaces: 0,
                        );
                      },
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
