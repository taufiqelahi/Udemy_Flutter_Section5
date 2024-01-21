import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetItems extends StatefulWidget {
  const BottomSheetItems({super.key});

  @override
  State<BottomSheetItems> createState() => _BottomSheetItemsState();
}

class _BottomSheetItemsState extends State<BottomSheetItems> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            maxLength: 20,
            decoration: InputDecoration(
              labelText: 'Title',

            ),
          ),
        ],
      ),
    );
  }
}
