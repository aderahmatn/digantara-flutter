import 'package:digantara/utils/constant.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropdownInputCustom extends StatelessWidget {
  final String hint;
  final List<String> items;
  DropdownInputCustom({
    required this.hint,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.amber,
          textTheme: TextTheme(
            // subtitle1: TextStyle(color: Colors.black),
            subtitle2: TextStyle(color: Colors.amber),
          ),
        ),
        child: DropdownSearch<String>(
          mode: Mode.BOTTOM_SHEET,
          showSelectedItems: true,
          showSearchBox: true,
          items: items,
          popupItemDisabled: (String s) => s.startsWith('I'),
          onChanged: print,
          dropdownSearchDecoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: dPrimaryColorForm,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
