import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ui_tester_reborn/pages/dark_theme.dart';
import 'package:ui_tester_reborn/pages/seed_color_m3.dart';
import 'package:ui_tester_reborn/util/info_dialog.dart';

class LightTheme extends StatefulWidget {
  @override
  _LightThemeState createState() => _LightThemeState();

  const LightTheme({Key? key}) : super(key: key);
}

class _LightThemeState extends State<LightTheme> with TickerProviderStateMixin {
  //------------- HOME
  TextEditingController customControllerAppBackgroundColor =
      TextEditingController();
  TextEditingController customControllerAppTopBarColor =
      TextEditingController();
  TextEditingController customControllerAppBottomBarColor =
      TextEditingController();
  TextEditingController customControllerAccentColor = TextEditingController();
  Color backgroundColor = const Color(0xFFFFFFFF);
  Color topBarColor = const Color(0xFFFFFFFF);
  Color bottomBarColor = const Color(0xFFEAEAEA);
  Color accentColor = const Color(0xFF0795C2);
  double fieldNameFontSize = 14.0;
  EdgeInsets listItemsPaddings = const EdgeInsets.fromLTRB(25, 10, 25, 10);
  bool cardElevation = true;
  bool showFab = false;
  bool monet = false;
  late ColorScheme _colorScheme;

  void changeColorPicker(Color color) => setState(() => {
    accentColor = color,
    customControllerAccentColor.text =
        accentColor.toString().substring(10, 16).toUpperCase(),
    _colorScheme = ColorScheme.fromSeed(
        seedColor: accentColor),
    if(monet){activateMonet()},
  });

  void changeAccentColor(String colorCode) {
    try {
      setState(() {
        accentColor = Color(int.parse('0xFF' + colorCode));
        _colorScheme = ColorScheme.fromSeed(
            seedColor: accentColor);
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

  Color cardColor = const Color(0xFFF0F0F0);

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
    customControllerCardColor.text = 'F0F0F0';

    //APP
    customControllerAppBackgroundColor.text = 'FFFFFF';
    customControllerAppTopBarColor.text = 'FFFFFF';
    customControllerAppBottomBarColor.text = 'EAEAEA';
    customControllerAccentColor.text = '0795C2';
  }

  void refreshUI() {
    //restore defaults
    monet = false;
    cardElevation = true;
    _colorScheme = ColorScheme.fromSeed(
        seedColor: accentColor);
    changeCardColor('F0F0F0');
    changeAccentColor('0795C2');
    changeBackgroundColor('FFFFFF');
    changeAppTopBarColor('FFFFFF');
    changeAppBottomBarColor('EAEAEA');
  }

  @override
  void initState() {
    populateTextFieldsWithDefaultValues();
    super.initState();
    _colorScheme = ColorScheme.fromSeed(seedColor: accentColor);
  }

  void loseFocus() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void activateMonet() {
    //Accent
    changeAccentColor(_colorScheme.primary
        .toString()
        .replaceAll('Color(0xff', '')
        .replaceAll(')', ''));
    customControllerAccentColor.text = _colorScheme.primary
        .toString()
        .replaceAll('Color(0xff', '')
        .replaceAll(')', '');
    //Background
    changeBackgroundColor(_colorScheme.background
        .toString()
        .replaceAll('Color(0xff', '')
        .replaceAll(')', ''));
    customControllerAppBackgroundColor.text = _colorScheme.background
        .toString()
        .replaceAll('Color(0xff', '')
        .replaceAll(')', '');
    //BottomBar
    changeAppBottomBarColor(_colorScheme.background
        .toString()
        .replaceAll('Color(0xff', '')
        .replaceAll(')', ''));
    customControllerAppBottomBarColor.text = _colorScheme.background
        .toString()
        .replaceAll('Color(0xff', '')
        .replaceAll(')', '');
    //TopBar
    changeAppTopBarColor(_colorScheme.background
        .toString()
        .replaceAll('Color(0xff', '')
        .replaceAll(')', ''));
    customControllerAppTopBarColor.text = _colorScheme.background
        .toString()
        .replaceAll('Color(0xff', '')
        .replaceAll(')', '');
    //Card
    changeCardColor(_colorScheme.surfaceVariant
        .toString()
        .replaceAll('Color(0xff', '')
        .replaceAll(')', ''));
    customControllerCardColor.text = _colorScheme.surfaceVariant
        .toString()
        .replaceAll('Color(0xff', '')
        .replaceAll(')', '');
  }

  @override
  Widget build(BuildContext context) {
    const Brightness iconBrightness = Brightness.dark;

    return Theme(
      data: ThemeData(
          cardTheme: CardTheme(
            color: cardColor,
          ),
          brightness: Brightness.light,
          appBarTheme: const AppBarTheme(
              color: Color(0xFFFFFFFF),
              elevation: 0,
              iconTheme: IconThemeData(color: Color(0xFF050505)),
              titleTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF000000))),
          navigationBarTheme: NavigationBarThemeData(
              backgroundColor: bottomBarColor,
              indicatorColor: accentColor,
              iconTheme: MaterialStateProperty.all(const IconThemeData(
                color: Color(0xFF050505),
              )),
              labelTextStyle: MaterialStateProperty.all(const TextStyle(
                  color: Color(0xFF050505), fontWeight: FontWeight.w500)))),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
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
                    IconButton(
                        icon: const Icon(
                          Icons.color_lens_outlined,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => SeedColorM3(
                                  pageTheme: 'light',
                                  homeAccent: accentColor,
                                ),
                                fullscreenDialog: true,
                              ));
                        }),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
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
                          Icons.info_outline_rounded,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const InfoDialog();
                            },
                          );
                        }),
                  ],
                ),
                body: ListView(children: [

                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Card(
                      elevation: cardElevation ? 1 : 0,
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
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                backgroundColor: accentColor,
                                radius: 23,
                              ),
                              Column(
                                children: const [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text("Ha! Ha! Ha! What A Story Mark!",
                                      style: TextStyle(fontSize: 16)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "You're Tearing Me Apart, Lisa!",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SwitchListTile(
                      contentPadding: const EdgeInsets.fromLTRB(25, 0, 15, 10),
                      title: const Text(
                        "Monet",
                      ),
                      activeColor: accentColor,
                      value: monet,
                      onChanged: (value) {
                        setState(() {
                          monet = value;
                        });
                        if (monet) {
                          activateMonet();
                        } else {
                          refreshUI();
                          populateTextFieldsWithDefaultValues();
                        }
                      }),
                  Padding(
                    padding: listItemsPaddings,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: Text(
                              "Accent\nDef: 0795C2",
                              style: TextStyle(fontSize: fieldNameFontSize),
                            )),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey[300]!, width: 1.5),
                            shape: BoxShape.rectangle,
                            borderRadius:  const BorderRadius.all(Radius.circular(12)),
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
                              icon: const Icon(
                                Icons.colorize_outlined,
                                size: 20,
                              )),
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
                            onSubmitted: (String s) => {
                              changeAccentColor(s.toString()),
                              if(monet){
                                activateMonet()
                              },
                              setState(() => {})
                            },
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
                                      color: Colors.grey[300]!,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1.5,
                                      color: Colors.grey[300]!,
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
                  Padding(
                    padding: listItemsPaddings,
                    child: Row(
                      children: const [
                        Text(
                          "CARD",
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: Divider(
                            indent: 15,
                            thickness: 1,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: listItemsPaddings,
                    child: Row(children: [
                      Expanded(
                          child: Text(
                        "Card Background\nDef: F0F0F0",
                        style: TextStyle(fontSize: fieldNameFontSize),
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
                  SwitchListTile(
                      contentPadding: const EdgeInsets.fromLTRB(25, 10, 15, 10),
                      title: Text(
                        "Card Elevation\nDef: 1",
                        style: TextStyle(fontSize: fieldNameFontSize),
                      ),
                      activeColor: accentColor,
                      value: cardElevation,
                      onChanged: (value) {
                        setState(() {
                          cardElevation = value;
                        });
                      }),
                  Padding(
                    padding: listItemsPaddings,
                    child: Row(
                      children: const [
                        Text(
                          "APP",
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: Divider(
                            indent: 15,
                            thickness: 1,
                            height: 1,
                          ),
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
                          "Background\nDef: FFFFFF",
                          style: TextStyle(fontSize: fieldNameFontSize),
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
                          "TopBar\nDef: FFFFFF",
                          style: TextStyle(fontSize: fieldNameFontSize),
                        )),
                        const SizedBox(
                          width: 70,
                        ),
                        Flexible(
                          child: txtFieldFuncString(
                              customControllerAppTopBarColor,
                              changeAppTopBarColor),
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
                          "BottomBar\nDef: EAEAEA",
                          style: TextStyle(fontSize: fieldNameFontSize),
                        )),
                        const SizedBox(
                          width: 70,
                        ),
                        Expanded(
                          child: txtFieldFuncString(
                              customControllerAppBottomBarColor,
                              changeAppBottomBarColor),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: listItemsPaddings,
                    child: Row(
                      children: const [
                        Text(
                          "EXAMPLES",
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: Divider(
                            indent: 15,
                            thickness: 1,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: 60,
                          height: 60,
                          child: Card(
                            color:  monet
                                ? _colorScheme.primary
                                : accentColor,
                            elevation: 6,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                            ),
                            child: const Center(
                              child: Center(
                                child: Icon(
                                  Icons.add_outlined,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          )),
                      SizedBox(
                          width: 60,
                          height: 60,
                          child: Card(
                            color:  monet
                                ? _colorScheme.primaryContainer
                                : accentColor,
                            elevation: 6,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Center(
                              child: Center(
                                child: Icon(
                                  Icons.add_outlined,
                                  color: monet ? _colorScheme.onPrimaryContainer : Colors.white,
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.fromLTRB(45, 25, 45, 0),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.report_problem_outlined,
                          size: 30,
                          color: accentColor,
                        ),
                        Icon(
                          Icons.person_outline,
                          size: 30,
                          color: accentColor,
                        ),
                        Icon(
                          Icons.print_outlined,
                          size: 30,
                          color: accentColor,
                        ),
                      ],
                    ),
                    trailing: Icon(Icons.note,
                      size: 30,
                      color: accentColor,
                    ),
                    leading:  Icon(Icons.store_mall_directory,
                      size: 30,
                      color: accentColor,
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                    title: Text("Example Text - Size 16",
                        style: TextStyle(
                          fontSize: 16,
                          color: accentColor,
                        )),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    title: Text("Example Text - Size 14 w500",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: accentColor,
                        )),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    title: Text("EXAMPLE TEXT BOLD - size 12 w500".toUpperCase(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: accentColor,
                        )),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ]),


                //BOTTOMBAR
                bottomNavigationBar: NavigationBar(
                  selectedIndex: 1,
                  onDestinationSelected: (index) {
                    if (index == 0) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DarkTheme()),
                        (Route<dynamic> route) => false,
                      );
                    }
                  },
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.dark_mode_outlined),
                      selectedIcon: Icon(
                        Icons.dark_mode,
                        color: Colors.black87,
                      ),
                      label: 'Dark Theme',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.light_mode_outlined),
                      selectedIcon: Icon(
                        Icons.light_mode,
                        color: Colors.black87,
                      ),
                      label: 'Light Theme',
                    ),
                  ],
                )),
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
            color: Colors.grey[300]!,
              ),
              borderRadius: BorderRadius.circular(10.0)),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5,
            color: Colors.grey[300]!,
              ),
              borderRadius: BorderRadius.circular(10.0))),
      style: const TextStyle(
        fontSize: 17,
      ),
    );
  }
}
