import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import '../../../constants.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


class PreferenceScreen extends StatefulWidget {
  PreferenceScreen({Key key, this.title}) : super(key: key);
  final String title;
  static const String id = 'preference_screen';

  @override
  _PreferenceScreenState createState() => _PreferenceScreenState();
}

class DateCategory {
  final String name;
  final int id;
  DateCategory(
    this.id,
    this.name,
  );
} //addition 1

class _PreferenceScreenState extends State<PreferenceScreen> {
  String dropdownValue = 'Select';
  static List<DateCategory> _dateCategory = [
    DateCategory(1, 'Drinks'),
    DateCategory(2, 'Brunch'),
    DateCategory(3, 'Lunch'),
    DateCategory(4, 'Dinner'),
    DateCategory(5, 'Fine Dining'),
    DateCategory(6, 'Performance'),
    DateCategory(7, 'Travel & Outdoor'),
    DateCategory(8, 'Educational'),
  ];
  final _items = _dateCategory
      .map((date) => MultiSelectItem<DateCategory>(date, date.name))
      .toList();

  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range =
            DateFormat('dd/MM/yyyy').format(args.value.startDate).toString() +
                ' - ' +
                DateFormat('dd/MM/yyyy')
                    .format(args.value.endDate ?? args.value.startDate)
                    .toString();
      } else if (args.value is DateTime) {
        _selectedDate = args.value;
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferences'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(primary: Colors.white),
            //textColor: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Save'),
            //style: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              MultiSelectDialogField(
                items: _items,
                title: Text("Select"),
                selectedColor: kButtonPrimaryColor,
                decoration: BoxDecoration(
                  //color: kButtonPrimaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: kButtonPrimaryColor,
                    width: 2,
                  ),
                ),
                buttonIcon:
                Icon(
                  Icons.expand_more,
                  size: 20,
                ),
                buttonText: Text(
                  "I'm Looking For...",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'MerriweatherBold',
                  ),
                ),
                listType: MultiSelectListType.LIST,
                onConfirm: (value) {
                   _dateCategory = value;
                },
                chipDisplay: MultiSelectChipDisplay(
                  onTap: (value) {
                    setState(() {
                      _dateCategory.remove(value); //= value;
                    });
                  },
                ),
              ),
              //SizedBox(height: 40),
              SizedBox(
                height: 30.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                // child: Container
                child: Text(
                  "Location",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'MerriweatherBold',
                  ),
                ),
              ),
              DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.expand_more),
                isExpanded: true,
                iconSize: 40,
                elevation: 16,
                style: const TextStyle(color: kButtonPrimaryColor),
                underline: Container(
                  height: 2,
                  color: kButtonPrimaryColor,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    newValue = dropdownValue;
                  });
                },
                items: <String>['Select', 'My Current Location']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 30.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                // child: Container
                child: Text(
                  "Date",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'MerriweatherBold',
                  ),
                ),
              ),
              //Date Child Inserted
              SfDateRangePicker(
                view: DateRangePickerView.year,
                onSelectionChanged: _onSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.range,
              ),
              SizedBox(
                height: 20.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                //heightFactor: 0.125,
                // child: Container
                child: Text(
                  "Price Range",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'MerriweatherBold',
                  ),
                ),
              ),
              DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.expand_more),
                iconSize: 40,
                isExpanded: true,
                elevation: 16,
                style: const TextStyle(color: kButtonPrimaryColor),
                underline: Container(
                  height: 2,
                  color: kButtonPrimaryColor,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    newValue = dropdownValue; //dropdownValue = newValue;
                  });
                },
                items: <String>['Select', 'Keep it Cheap', 'Moderate', 'Pricey']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 60.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
