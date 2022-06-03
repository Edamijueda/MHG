import 'package:flutter/material.dart';
import 'package:mhg/ui/screens/cart/cart_view_model.dart';
import 'package:stacked/stacked.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
      viewModelBuilder: () => CartViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Center(child: Text('All artwork, products added for purchase')),
      ),
    );
  }
}
