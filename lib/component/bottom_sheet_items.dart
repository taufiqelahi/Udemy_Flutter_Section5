import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BottomSheetItems extends StatefulWidget {
  final void Function(Expense expense) getExpanse;
  const BottomSheetItems({super.key, required this.getExpanse});

  @override
  State<BottomSheetItems> createState() => _BottomSheetItemsState();
}

class _BottomSheetItemsState extends State<BottomSheetItems> {
  Categories categories = Categories.work;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime? selectedDate;
  void datePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final date = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      selectedDate = date;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 20,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                      prefixText: '\$',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(selectedDate == null
                          ? 'No Date Chosen'
                          : DateFormat('dd/MM/yyyy').format(selectedDate!)),
                      const SizedBox(
                        width: 6,
                      ),
                      IconButton(
                          onPressed: datePicker,
                          icon: const Icon(Icons.calendar_today)),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                DropdownButton(
                    value: categories,
                    items: Categories.values
                        .map((e) =>
                            DropdownMenuItem(value: e, child: Text(e.name)))
                        .toList(),
                    onChanged: (v) {
                      setState(() {
                        categories = v!;
                      });
                    }),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel')),
                ElevatedButton(
                    onPressed: () {
                      final enterAmount = double.tryParse(_amountController.text);
                      final invalidAmaout =
                          enterAmount == null || enterAmount <= 0;
                      if (_titleController.text.trim().isEmpty ||
                          invalidAmaout ||
                          selectedDate == null) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('invalid Input'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Okay'),
                                )
                              ],
                            );
                          },
                        );
                        return;
                      } else {
                        widget.getExpanse(Expense(
                            title: _titleController.text,
                            category: categories,
                            amount: enterAmount,
                            date: selectedDate!));
                      }
                      Navigator.pop(context);
                    },
                    child: const Text('Save'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
