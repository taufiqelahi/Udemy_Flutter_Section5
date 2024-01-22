import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetItems extends StatefulWidget {
  const BottomSheetItems({super.key});

  @override
  State<BottomSheetItems> createState() => _BottomSheetItemsState();
}

class _BottomSheetItemsState extends State<BottomSheetItems> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 20,
            decoration: const InputDecoration(
              labelText: 'Title',

            ),
          ),
          TextField(
            controller: _amountController,
           keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Amount',
              prefixText: '\$',


            ),
          ),
          Row(
            children: [
              TextButton(onPressed: (){}, child: const Text('Cancel')),
              ElevatedButton(onPressed: (){}, child: const Text('Save'))
            ],
          )
        ],
      ),
    );
  }
}
