import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_tester_reborn/pages/settings/settings_page.dart';
import 'package:ui_tester_reborn/pages/whiteTheme.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

  const Home({Key? key}) : super(key: key);
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  //------------- HOME
  TextEditingController customControllerAppBackgroundColor =
      TextEditingController();
  TextEditingController customControllerAppTopBarColor =
      TextEditingController();
  TextEditingController customControllerAppBottomBarColor =
      TextEditingController();
  TextEditingController customControllerAccentColor = TextEditingController();
  Color backgroundColor = const Color(0xFF202022);
  Color topBarColor = const Color(0xFF202022);
  Color bottomBarColor = const Color(0xFF151515);
  Color accentColor = const Color(0xFF449EBC);
  double fieldNameFontSize = 14.0;
  EdgeInsets listItemsPaddings = const EdgeInsets.fromLTRB(30, 16, 30, 16);

  void changeColorPicker(Color color) => setState(() => {
        accentColor = color,
        customControllerAccentColor.text =
            accentColor.toString().substring(10, 16).toUpperCase(),
      });

  void changeAccentColor(String colorCode) {
    try {
      setState(() {
        accentColor = Color(int.parse('0xFF' + colorCode));
      });
    } catch (exception) {
      Fluttertoast.showToast(
        msg: "Invalid Color Value",
      );
    }
  }

  void changeBackgroundColor(String colorCode) {
    try {
      setState(() {
        backgroundColor = Color(int.parse('0xFF' + colorCode));
      });
    } catch (exception) {
      Fluttertoast.showToast(
        msg: "Invalid Color Value",
      );
    }
  }

  void changeAppTopBarColor(String colorCode) {
    try {
      setState(() {
        topBarColor = Color(int.parse('0xFF' + colorCode));
      });
    } catch (exception) {
      Fluttertoast.showToast(
        msg: "Invalid Color Value",
      );
    }
  }

  void changeAppBottomBarColor(String colorCode) {
    try {
      setState(() {
        bottomBarColor = Color(int.parse('0xFF' + colorCode));
      });
    } catch (exception) {
      Fluttertoast.showToast(
        msg: "Invalid Color Value",
      );
    }
  }

  //------------- CARD
  TextEditingController customControllerCardColor = TextEditingController();

  Color cardColor = const Color(0xFF303032);

  void changeCardColor(String colorCode) {
    try {
      setState(() {
        cardColor = Color(int.parse('0xFF' + colorCode));
      });
    } catch (exception) {
      Fluttertoast.showToast(
        msg: "Invalid Color Value",
      );
    }
  }

  void populateTextFieldsWithDefaultValues() {
    setState(() {});
    //CARD
    customControllerCardColor.text = '303032';

    //APP
    customControllerAppBackgroundColor.text = '202022';
    customControllerAppTopBarColor.text = '202022';
    customControllerAppBottomBarColor.text = '151515';
    customControllerAccentColor.text = '449EBC';
  }

  void refreshUI() {
    //restore defaults
    changeCardColor('303032');
    changeAccentColor('449EBC');
    changeBackgroundColor('202022');
    changeAppTopBarColor('202022');
    changeAppBottomBarColor('151515');
  }

  @override
  void initState() {
    populateTextFieldsWithDefaultValues();
    super.initState();
  }

  void loseFocus() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {

    final Brightness iconBrightness = Theme.of(context).primaryColorBrightness;

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarIconBrightness: iconBrightness,
          systemNavigationBarColor: bottomBarColor,
          statusBarColor: topBarColor,
          systemStatusBarContrastEnforced: false,
          systemNavigationBarIconBrightness: iconBrightness,
        ),
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            loseFocus();
          },
          child: Scaffold(
              backgroundColor: backgroundColor,
              appBar: AppBar(
                backgroundColor: topBarColor,
                elevation: 0,
                title: const Text('UI Tester Fschmatz'),
                actions: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: IconButton(
                        icon: const Icon(
                          Icons.brightness_high_outlined,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                const WhiteTheme(),
                                fullscreenDialog: true,
                              ));
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: IconButton(
                      icon: const Icon(Icons.restore_outlined),
                      tooltip: 'Reset to Defaults',
                      onPressed: () {
                        refreshUI();
                        populateTextFieldsWithDefaultValues();
                      },
                    ),
                  ),
                  IconButton(
                      icon: const Icon(
                        Icons.settings_outlined,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const SettingsPage(),
                              fullscreenDialog: true,
                            ));
                      }),
                ],
              ),
              body: ListView(children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Card(
                    color: cardColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      onTap: () {},
                      child: SizedBox(
                        height: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor: accentColor,
                              radius: 25,
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 40,
                                ),
                                const Text("Ha! Ha! Ha! What A Story Mark!",
                                    style: TextStyle(fontSize: 16)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "You're Tearing Me Apart, Lisa!",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context).hintColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: listItemsPaddings,
                  child: Row(children: [
                    Expanded(
                        child: Text(
                      "Card Color\nDef: 303032",
                      style: TextStyle(
                          fontSize: fieldNameFontSize,
                          color: Theme.of(context).hintColor),
                    )),
                    const SizedBox(
                      width: 70,
                    ),
                    Flexible(
                      child: txtFieldFuncString(
                          customControllerCardColor, changeCardColor),
                    ),
                  ]),
                ),
                Padding(
                  padding: listItemsPaddings,
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "Background\nDef: 202022",
                        style: TextStyle(
                            fontSize: fieldNameFontSize,
                            color: Theme.of(context).hintColor),
                      )),
                      const SizedBox(
                        width: 70,
                      ),
                      Flexible(
                        child: txtFieldFuncString(
                            customControllerAppBackgroundColor,
                            changeBackgroundColor),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: listItemsPaddings,
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "TopBar\nDef: 202022",
                        style: TextStyle(
                            fontSize: fieldNameFontSize,
                            color: Theme.of(context).hintColor),
                      )),
                      const SizedBox(
                        width: 70,
                      ),
                      Flexible(
                        child: txtFieldFuncString(
                            customControllerAppTopBarColor, changeAppTopBarColor),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: listItemsPaddings,
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "BottomBar\nDef: 151515",
                        style: TextStyle(
                            fontSize: fieldNameFontSize,
                            color: Theme.of(context).hintColor),
                      )),
                      const SizedBox(
                        width: 70,
                      ),
                      Expanded(
                        child: txtFieldFuncString(customControllerAppBottomBarColor,
                            changeAppBottomBarColor),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: listItemsPaddings,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: Text(
                        "Accent\nDef: 449EBC",
                        style: TextStyle(
                            fontSize: fieldNameFontSize,
                            color: Theme.of(context).hintColor),
                      )),
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[800]!, width: 1.5),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    titlePadding: const EdgeInsets.all(0.0),
                                    contentPadding: const EdgeInsets.all(0.0),
                                    content: SingleChildScrollView(
                                      child: ColorPicker(
                                        pickerColor: accentColor,
                                        onColorChanged: changeColorPicker,
                                        colorPickerWidth: 300.0,
                                        pickerAreaHeightPercent: 1.0,
                                        enableAlpha: false,
                                        displayThumbColor: true,
                                        showLabel: true,
                                        paletteType: PaletteType.hsv,
                                        pickerAreaBorderRadius:
                                            const BorderRadius.only(
                                          topLeft: Radius.circular(2.0),
                                          topRight: Radius.circular(2.0),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.colorize_outlined,size: 20,)),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Flexible(
                        child: TextField(
                          textAlign: TextAlign.center,
                          maxLength: 6,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          controller: customControllerAccentColor,
                          textCapitalization: TextCapitalization.characters,
                          onSubmitted: (String s) =>
                              changeAccentColor(s.toString()),
                          decoration: InputDecoration(
                              counterText: "",
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 5.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1.5,
                                  color: accentColor,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.5,
                                    color: Colors.grey[800]!,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.5,
                                    color: Colors.grey[800]!,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0))),
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ]),

              //BOTTOMBAR
              bottomNavigationBar: Theme(
                data: ThemeData(
                 navigationBarTheme: NavigationBarThemeData(
                     backgroundColor: bottomBarColor,
                     indicatorColor: accentColor,
                     iconTheme: MaterialStateProperty.all(const IconThemeData(
                       color: Color(0xFFCACACA),
                     )),
                     labelTextStyle: MaterialStateProperty.all(const TextStyle(
                         color: Color(0xFFCACACA), fontWeight: FontWeight.w500))
                 )
                ),
                child: NavigationBar(
                  labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
                  selectedIndex: 0,
                  onDestinationSelected: (index) {
                    setState(() {});
                  },
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(
                        Icons.home,
                        color: Colors.black87,
                      ),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.fact_check_outlined),
                      selectedIcon: Icon(
                        Icons.fact_check,
                        color: Colors.black87,
                      ),
                      label: 'Buttons',
                    ),
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }

  Widget txtFieldFuncString(
      TextEditingController controller, Function onSubmitFunc) {
    return TextField(
      textAlign: TextAlign.center,
      maxLength: 6,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      textCapitalization: TextCapitalization.characters,
      controller: controller,
      onSubmitted: (String s) => onSubmitFunc(s.toString()),
      decoration: InputDecoration(
          counterText: "",
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: accentColor,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5,
                color: Colors.grey[800]!,
              ),
              borderRadius: BorderRadius.circular(10.0)),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5,
                color: Colors.grey[800]!,
              ),
              borderRadius: BorderRadius.circular(10.0))),
      style: const TextStyle(
        fontSize: 17,
      ),
    );
  }
}
