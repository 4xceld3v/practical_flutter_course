import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../core/store.dart';
import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item? catalog;
  const AddToCart({
    super.key,
    this.catalog,
  });
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel cart = (VxState.store as MyStore).cart!;
    bool isInCart = cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog!);
        }
      },
      child: isInCart
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
