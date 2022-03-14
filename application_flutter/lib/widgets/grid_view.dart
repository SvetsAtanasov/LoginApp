import 'package:flutter/material.dart';

class DummyData extends StatelessWidget {
  List<String> _dummyData = [];

  List<String> get dummyData => _dummyData;

  DummyData(this._dummyData);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1 / 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: _dummyData.length,
        itemBuilder: (context, index) => Center(
          child: Text(
            _dummyData[index],
          ),
        ),
      ),
    );
  }
}
