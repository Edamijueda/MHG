import 'package:flutter/material.dart';
import 'package:mhg/ui/screens/saved_items/saved_items_view_model.dart';
import 'package:stacked/stacked.dart';

class SavedItemsView extends StatefulWidget {
  const SavedItemsView({Key? key}) : super(key: key);

  @override
  _SavedItemsViewState createState() => _SavedItemsViewState();
}

class _SavedItemsViewState extends State<SavedItemsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SavedItemsViewModel>.reactive(
      viewModelBuilder: () => SavedItemsViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Center(
            child: Text('All items saved for later will be accessed here')),
      ),
    );
  }
}
