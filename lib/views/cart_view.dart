import 'package:cc2_flutter_fin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/homepage_controller.dart';

class CartView extends StatelessWidget {
  CartView({Key? key}) : super(key: key);
  final HomePageController controller = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    // Calculate the subtotal
    for (final item in controller.cartItems) {
      controller.subtotal.value += item.total!;
    }
    return Scaffold(
      body: Obx(
            () => controller.cartItems.isEmpty
            ? const Center(child: Text("Seems like you have not shopped yet!"))
            : Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.cartItems.value.length,
                itemBuilder: (context, int index) {
                  final item = controller.cartItems.value[index];
                  RxInt itemCount =
                      controller.itemCountMap[item.id.toString()] ?? 1.obs;
                  return Dismissible(
                    key: Key(item.id.toString()), // Ensure the key is a string
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      controller.onRemoveAllFromCart(item);
                    },
                    background: Container(
                      color: Colors.red.shade900,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      child: Card(
                        color: Colors.white,
                        child: ListTile(
                          title: Text(
                            '${item.name}',
                            style: const TextStyle(color: Colors.black87,fontFamily: 'MyCustomFont',fontWeight: FontWeight.w500,fontSize: 16),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Price: \$${item.price.toStringAsFixed(2)}',
                                style: const TextStyle(color: Colors.black87,fontFamily: 'MyCustomFont',fontWeight: FontWeight.w500,fontSize: 14),
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed: () {
                                          if (itemCount.value > 1) {
                                            itemCount--;
                                            item.quantity--;
                                            item.total = item.price * item.quantity;
                                            controller.cartCount--;
                                          }
                                        },
                                      ),
                                      Text(
                                        item.quantity.toString(),
                                        style: const TextStyle(color: Colors.black87),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () {
                                          itemCount++;
                                          item.quantity++;
                                          item.total = item.price * item.quantity;
                                          controller.cartCount++;controller.cartItems.refresh();
                                        },
                                      ),
                                    ],
                                  ),
                                  const Expanded(child: SizedBox()),
                                  Row(
                                    children: [
                                      Text(
                                        'Total: \$${item.total}',
                                        style: const TextStyle(color: Colors.black87,fontFamily:'MyCustomFont',fontWeight: FontWeight.w500,fontSize: 14)
                                  ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'SUBTOTAL: \$${controller.subtotal.value.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600,fontFamily: 'MyCustomFont'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: customButton(
                      title: " Continue ",
                      onTap: (){
                        controller.onContinueonCart();
                  }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
