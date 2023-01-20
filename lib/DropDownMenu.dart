import 'package:flutter/material.dart';
class DropDownMenu extends StatefulWidget {
 DropDownMenu({required this.lableText,required this.ListValue,required this.DropDownValue});
 String lableText, DropDownValue;
  List<String>ListValue;

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: widget.lableText,
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
        filled: true,
        hintStyle: TextStyle(color: Colors.grey[800]),
      ),



      icon: const Icon(Icons.arrow_downward),
      hint: Text("Select Option"),
      elevation: 16,
      isExpanded: true,
      style: const TextStyle(color: Colors.blueAccent),

      onChanged: (String? value) {
        widget.DropDownValue=value!;
        // This is called when the user selects an item.
        setState(() {
          widget.DropDownValue;
        });
      },
      value: widget.DropDownValue,


      items: widget.ListValue.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
