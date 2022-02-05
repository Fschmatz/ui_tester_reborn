import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class SeedColorM3 extends StatefulWidget {
  String pageTheme;
  Color homeAccent;

  SeedColorM3({Key? key, required this.pageTheme, required this.homeAccent}) : super(key: key);

  @override
  _SeedColorM3State createState() => _SeedColorM3State();
}

class _SeedColorM3State extends State<SeedColorM3> {
  Color accentColor = const Color(0xFF449EBC);

  @override
  void initState() {
    accentColor = widget.homeAccent;
    super.initState();
  }

  Widget cardColor(Color c, String name) {
    return ListTile(
      leading: SizedBox(
        height: 60,
        width: 60,
        child: Card(
          color: c,
        ),
      ),
      title: Text(
          formatColorName(c.toString()),
        style: TextStyle(
            fontSize: 16,
            color: widget.pageTheme == 'light' ? Colors.black : Colors.white ,
            fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        name,
        style: TextStyle(
            fontSize: 12,
            color: widget.pageTheme == 'light' ? Colors.black : Colors.white ,
            fontWeight: FontWeight.w700),
      ),
    );
  }

  String formatColorName(String colorName) {
    return colorName
        .replaceAll('Color(0xff', '')
        .replaceAll(')', '')
        .toUpperCase();
  }

  void changeColorPicker(Color color) => setState(() => {
        accentColor = color,
      });

  @override
  Widget build(BuildContext context) {
    final lightScheme = ColorScheme.fromSeed(seedColor: accentColor);
    final darkScheme = ColorScheme.fromSeed(
        seedColor: accentColor, brightness: Brightness.dark);

    ColorScheme pageScheme =
        widget.pageTheme == 'light' ? lightScheme : darkScheme;

    return Theme(
        data: ThemeData(
            appBarTheme: AppBarTheme(
                color: pageScheme.background,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: widget.pageTheme == 'light' ? Colors.black : Colors.white ,
                ),
                titleTextStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    ))
        ),

        child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              statusBarIconBrightness:  widget.pageTheme == 'light' ? Brightness.dark : Brightness.light,
              systemNavigationBarColor: pageScheme.background,
              statusBarColor:  pageScheme.background,
              systemStatusBarContrastEnforced: false,
              systemNavigationBarIconBrightness: widget.pageTheme == 'light' ? Brightness.dark : Brightness.light,
            ),
            child: SafeArea(
              child: Scaffold(
                backgroundColor: pageScheme.background,
                appBar: AppBar(
                  title:  Text(
                    widget.pageTheme == 'light'
                        ? "Light Theme"
                        : "Dark Theme",
                    style: TextStyle(
                        color: widget.pageTheme == 'light' ? Colors.black : Colors.white ,
                        fontSize: 20, fontWeight: FontWeight.w700),
                  )
                ),
                body: ListView(
                  children: [
                    GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        childAspectRatio: 3,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          cardColor(pageScheme.primary, 'Primary'),
                          cardColor(pageScheme.onPrimary, 'onPrimary'),
                          cardColor(
                              pageScheme.primaryContainer, 'Primary Container'),
                          cardColor(pageScheme.onPrimaryContainer,
                              'onPrimary Container'),
                          cardColor(pageScheme.secondary, 'Secondary'),
                          cardColor(pageScheme.onSecondary, 'onSecondary'),
                          cardColor(pageScheme.secondaryContainer,
                              'Secondary Container'),
                          cardColor(pageScheme.onSecondaryContainer,
                              'onSecondary Container'),
                          cardColor(pageScheme.tertiary, 'Tertiary'),
                          cardColor(pageScheme.onTertiary, 'onTertiary'),
                          cardColor(pageScheme.tertiaryContainer,
                              'Tertiary Container'),
                          cardColor(pageScheme.onTertiaryContainer,
                              'onTertiary Container'),
                          cardColor(pageScheme.error, 'Error'),
                          cardColor(pageScheme.onError, 'onError'),
                          cardColor(
                              pageScheme.errorContainer, 'Error Container'),
                          cardColor(
                              pageScheme.onErrorContainer, 'onError Container'),
                          cardColor(pageScheme.background, 'Background'),
                          cardColor(pageScheme.onBackground, 'onBackground'),
                          cardColor(pageScheme.surface, 'Surface'),
                          cardColor(pageScheme.onSurface, 'onSurface'),
                          cardColor(
                              pageScheme.surfaceVariant, 'Surface Variant'),
                          cardColor(
                              pageScheme.onSurfaceVariant, 'onSurface Variant'),
                          cardColor(pageScheme.outline, 'Outline'),
                          cardColor(
                              pageScheme.inverseSurface, 'Inverse Surface'),
                          cardColor(
                              pageScheme.onInverseSurface, 'onInverse Surface'),
                          cardColor(
                              pageScheme.inversePrimary, 'Inverse Primary'),
                        ]),
                    const SizedBox(
                      height: 120,
                    ),
                  ],
                ),
                floatingActionButton: FloatingActionButton(
                    child: Icon(
                      Icons.colorize_outlined,
                      color: pageScheme.onPrimary,
                    ),
                    backgroundColor: pageScheme.primary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    onPressed: () => showDialog(
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
                        )),
              ),
            )));
  }
}
