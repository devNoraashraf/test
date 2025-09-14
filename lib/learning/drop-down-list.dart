import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class DropdownExample extends StatefulWidget {
  const DropdownExample({super.key});

  @override
  State<DropdownExample> createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  final TextEditingController _cityController = TextEditingController();

  final List<SelectedListItem<String>> _cities = [
    SelectedListItem(data: 'Cairo'),
    SelectedListItem(data: 'Dubai'),
    SelectedListItem(data: 'London'),
    SelectedListItem(data: 'Tokyo'),
  ];

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  void _openCityDropdown() {
    DropDownState<String>(
      dropDown: DropDown<String>(
        bottomSheetTitle: const Text(
          'Choose a City',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        data: _cities,
        submitButtonText: 'Save',
        clearButtonText: 'Clear',
        enableMultipleSelection: false,
        onSelected: (selectedItems) {
          if (selectedItems.isNotEmpty) {
            _cityController.text = selectedItems.first.data;
          }
        },
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dropdown Clean UI')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'City',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _cityController,
              readOnly: true,
              onTap: _openCityDropdown,
              decoration: InputDecoration(
                hintText: 'Select a city',
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}