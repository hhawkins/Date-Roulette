import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
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
        backgroundColor: kButtonPrimaryColor,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(LineAwesomeIcons.chevron_circle_left),
              iconSize: 40,
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: 'back to menu',
            );
          },
        ),
        actions: [
          IconButton(
              icon: Icon(LineAwesomeIcons.save),
              iconSize: 30,
              tooltip: 'back to menu',
              onPressed: () {
                Navigator.pop(context);
              }),
          // CircleBorder(side: BorderSide(color: Colors.transparent)),
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
                itemsTextStyle: TextStyle(
                  color: kColorBlack,
                ),
                title: Text("Select"),
                selectedItemsTextStyle: TextStyle(
                  color: kColorBlack,
                ),
                selectedColor:
                    kButtonPrimaryColor, //check box fill and CANCEL and OK
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(
                    color: kButtonPrimaryColor,
                    width: 2,
                  ),
                ),
                buttonIcon: Icon(
                  LineAwesomeIcons.eye,
                  size: ScreenUtil().setSp(kSpacingUnit.w * 2),
                ),
                buttonText: Text(
                  "I'm Looking For...",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'MerriweatherBold',
                  ),
                ),
                listType: MultiSelectListType.LIST,
                onConfirm: (value) {
                  _dateCategory = value;
                },
                chipDisplay: MultiSelectChipDisplay(
                  chipColor: kButtonPrimaryColor.withOpacity(0.3),
                  textStyle: TextStyle(
                    color: kColorBlack,
                  ),
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
                icon: const Icon(LineAwesomeIcons.angle_down),
                isExpanded: true,
                iconSize: 20,
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
              ///////////////////////////////////DateRangePicker Child Inserted
              SfDateRangePicker(
                view: DateRangePickerView.year,
                onSelectionChanged: _onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.range,
              ),
              buildNotificationOptionRow("Add Events to Calendar", true),
              SizedBox(
                height: 40.0,
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
                icon: const Icon(LineAwesomeIcons.angle_down),
                iconSize: 20,
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

  //////////////////////////////////////////////////////////////Toggle method
  buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.0,
            fontFamily: 'MerriweatherBold',
          ),
        ),
        Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
            value: isActive,
            onChanged: (bool val) {},
          ),
        ),
      ],
    );
  }
}
