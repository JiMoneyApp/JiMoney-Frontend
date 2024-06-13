import 'package:flutter/material.dart';

class FloatingActionButtonExample extends StatefulWidget {
  @override
  _FloatingActionButtonExampleState createState() =>
      _FloatingActionButtonExampleState();
}

class _FloatingActionButtonExampleState
    extends State<FloatingActionButtonExample> {
  final _formKey = GlobalKey<FormState>();
  String? _inputText;
  final List<String> expenses = [
    '飲食',
    '日用',
    '娛樂',
    '交通',
    '服飾',
    '醫療',
    '教育',
    '其他'
  ];

  final List<String> incomes = ['薪水', '投資', '其他'];

  String? selectedType;
  String? selectedCategory;

  List<String> getCategories(String? type) {
    return type == '支出' ? expenses : incomes;
  }


  void _showInputForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: 450,
          width: 450,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 20,
              left: 20,
              right: 20,
              top: 20,
            ),
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Data Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _inputText = value;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Price'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the price';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _inputText = value;
                      },
                    ),
                    DropdownButton<String>(
                      isExpanded: true,
                      hint: Text('Select Type'),
                      value: selectedType,
                      items: ['支出', '收入'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedType = newValue;
                          selectedCategory = null;
                        });
                      },
                    ),
                    //SizedBox(height: 20),
                    if (selectedType != null)
                      DropdownButton<String>(
                        isExpanded: true,
                        hint: Text('Select Category'),
                        value: selectedCategory,
                        items: getCategories(selectedType).map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedCategory = newValue;
                          });
                        },
                      ),
                    if (selectedType != null && selectedCategory != null)
                      Text(
                        'Selected Type: $selectedType, Selected Category: $selectedCategory',
                        style: TextStyle(fontSize: 12),
                      ),
                    ElevatedButton(
                      child: Text('Submit'),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Input submitted: $_inputText')),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _showInputForm(context),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Color(0XFFFF6868),
        ),
      ),
    );
  }
}
