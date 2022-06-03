import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'order_history_view_model.dart';

class OrderHistoryView extends StatefulWidget {
  const OrderHistoryView({Key? key}) : super(key: key);

  @override
  _OrderHistoryViewState createState() => _OrderHistoryViewState();
}

class _OrderHistoryViewState extends State<OrderHistoryView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrderHistoryViewModel>.reactive(
      viewModelBuilder: () => OrderHistoryViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Center(
            child:
                Text('This screen will hold history of all our user\'s order')),
      ),
    );
  }
}
