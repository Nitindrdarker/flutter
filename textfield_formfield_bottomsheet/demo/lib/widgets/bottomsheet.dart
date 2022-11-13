import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class BottomSheetWidgetModel {
  bool istagVisible = false;
  List<String> tags = [];
}

class bottomsheetwidget extends StatefulWidget {
  const bottomsheetwidget({super.key});

  @override
  State<bottomsheetwidget> createState() => _bottomsheetwidgetState();
}

class _bottomsheetwidgetState extends State<bottomsheetwidget> {
  TextEditingController first = TextEditingController();
  TextEditingController second = TextEditingController();
  BottomSheetWidgetModel tags = BottomSheetWidgetModel();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (context) {
              return StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Container(
                      height: 500,
                      child: Column(
                        children: [
                          Flexible(
                            child: TextFormField(
                              controller: first,
                              decoration:
                                  InputDecoration(hintText: "enter value"),
                              onFieldSubmitted: (value) {
                                setState(() {
                                  tags.istagVisible = true;
                                  tags.tags.add(value);
                                  first.clear();
                                });
                              },
                            ),
                          ),
                          Text("text"),
                          tags.istagVisible && tags.tags.isNotEmpty
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: List<Widget>.generate(
                                      tags.tags.length, (int index) {
                                    return Chip(
                                      label: Text(tags.tags[index]),
                                      onDeleted: () {
                                        tags.tags
                                            .remove(tags.tags.removeAt(index));
                                        setState(() {
                                          print(tags.tags);
                                        });
                                      },
                                    );
                                  }))
                              : Text(""),
                        ],
                      ));
                },
              );
            },
          );
        },
      ),
    );
  }
}
