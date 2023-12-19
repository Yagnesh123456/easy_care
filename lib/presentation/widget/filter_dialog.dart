import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_easy_care/presentation/translations/language_constant.dart';
import 'package:go_easy_care/presentation/widget/text_button.dart';

import '../translations/language_constant.dart';

class FilterDialog extends StatefulWidget {
  FilterDialog({
    this.options,
    this.selectedOptions,
    this.onSelectedOptionsListChanged,
  });

  final List<String>? options;
  final List<String>? selectedOptions;
  final ValueChanged<List<String>>? onSelectedOptionsListChanged;

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  List<String> _tempSelectedCities = [];

  @override
  void initState() {
    _tempSelectedCities = widget.selectedOptions ?? [];
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(
            height: 16.0,
          ),
          RichText(
              text: TextSpan(
                  text:  LANG_CONST.FILTER.toString().tr,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Theme
                      .of(context)
                      .colorScheme
                      .primary)),
              textScaleFactor: MediaQuery
                  .of(context)
                  .textScaleFactor),
          const SizedBox(
            height: 16.0,
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.options?.length,
                itemBuilder: (BuildContext context, int index) {
                  final cityName = widget.options![index];
                  return CheckboxListTile(
                      title: RichText(
                          text: TextSpan(
                              text: cityName,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                  color: Theme
                                      .of(context)
                                      .colorScheme
                                      .primary)),
                          textScaleFactor:
                          MediaQuery
                              .of(context)
                              .textScaleFactor),
                      value: _tempSelectedCities.contains(cityName),
                      onChanged: (bool? value) {
                        if (value!) {
                          if (!_tempSelectedCities.contains(cityName)) {
                            setState(() {
                              _tempSelectedCities.add(cityName);
                            });
                          }
                        } else {
                          if (_tempSelectedCities.contains(cityName)) {
                            setState(() {
                              _tempSelectedCities.removeWhere(
                                      (String city) => city == cityName);
                            });
                          }
                        }
                        widget
                            .onSelectedOptionsListChanged!(
                            _tempSelectedCities);
                      });
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButtonView(
                    text: 'No',
                    onPress: () {
                      Get.back();
                    }),
                TextButtonView(
                    text: 'Yes',
                    onPress: () {
                      Get.back();
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}