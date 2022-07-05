import 'package:practice_app/constant/constant_color.dart';
import 'package:flutter/material.dart';

class NewAdress extends StatefulWidget {
  final Function addAdress;
  NewAdress(this.addAdress);

  @override
  _NewAdressState createState() => _NewAdressState();
}

class _NewAdressState extends State<NewAdress> {
  final _titleController = TextEditingController();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();

  void _submitAdress() {
    if (_titleController.text.isEmpty) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredName = _nameController.text;
    final enterdAddress = _addressController.text;

    if (enteredTitle.isEmpty || enteredName.isEmpty || enterdAddress.isEmpty) {
      return;
    }

    widget.addAdress(
      enteredTitle,
      enteredName,
      enterdAddress,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        color: primary_background_four,
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  style: TextStyle(
                    color: primary_text_one,
                  ),
                  controller: _titleController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primary_background_one,
                        width: 0.0,
                      ),
                    ),
                    labelStyle: TextStyle(color: primary_text_one),
                    labelText: 'Title',
                    errorStyle: TextStyle(
                      color: primary_text_one,
                    ),
                  ),
                  onSubmitted: (_) => _submitAdress(),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  style: TextStyle(
                    color: primary_text_one,
                  ),
                  controller: _nameController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primary_background_one,
                        width: 0.0,
                      ),
                    ),
                    labelStyle: TextStyle(color: primary_text_one),
                    labelText: 'Name',
                    errorStyle: TextStyle(
                      color: primary_text_one,
                    ),
                  ),
                  onSubmitted: (_) => _submitAdress(),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  style: TextStyle(
                    color: primary_text_one,
                  ),
                  controller: _addressController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primary_background_one,
                        width: 0.0,
                      ),
                    ),
                    labelStyle: TextStyle(color: primary_text_one),
                    labelText: 'Adress',
                    errorStyle: TextStyle(
                      color: primary_text_one,
                    ),
                  ),
                  onSubmitted: (_) => _submitAdress(),
                ),
              ),
              RaisedButton(
                child: Text('Add Adress'),
                color: primary_button_color,
                textColor: primary_text_one,
                onPressed: _submitAdress,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
