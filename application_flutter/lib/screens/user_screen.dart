import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../widgets/grid_view.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);
    var dummyData = provider.list;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Display Name'),
        ),
        body: Column(
          children: [
            DummyData(dummyData),
            ElevatedButton(
              onPressed: () => {provider.getItems()},
              child: const Text('Get Items'),
            )
          ],
        ));
  }
}
