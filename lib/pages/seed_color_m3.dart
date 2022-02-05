import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class SeedColorM3 extends StatefulWidget {
  const SeedColorM3({Key? key}) : super(key: key);

  @override
  _SeedColorM3State createState() => _SeedColorM3State();
}

class _SeedColorM3State extends State<SeedColorM3> {
  Color accentColor = const Color(0xFF449EBC);

  Widget cardColor(Color c, String name) {
    return ListTile(
      leading:SizedBox(
        height: 60,
        width: 60,
        child: Card(
          color: c,
        ),
      ),
      title: Text(formatColorName(c.toString())),
      subtitle:Text(
        name,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Material 3 Colors'),
      ),
      body: ListView(
        children: [

          const ListTile(
              title: Text(
            "Light",
           // textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          )),
          const SizedBox(height: 10,),
          GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              childAspectRatio: 3,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                cardColor(lightScheme.primary, 'Primary'),
                cardColor(lightScheme.onPrimary, 'onPrimary'),
                cardColor(lightScheme.primaryContainer, 'Primary Container'),
                cardColor(
                    lightScheme.onPrimaryContainer, 'onPrimary Container'),
                cardColor(lightScheme.secondary, 'Secondary'),
                cardColor(lightScheme.onSecondary, 'onSecondary'),
                cardColor(
                    lightScheme.secondaryContainer, 'Secondary Container'),
                cardColor(
                    lightScheme.onSecondaryContainer, 'onSecondary Container'),
                cardColor(lightScheme.tertiary, 'Tertiary'),
                cardColor(lightScheme.onTertiary, 'onTertiary'),
                cardColor(lightScheme.tertiaryContainer, 'Tertiary Container'),
                cardColor(
                    lightScheme.onTertiaryContainer, 'onTertiary Container'),
                cardColor(lightScheme.error, 'Error'),
                cardColor(lightScheme.onError, 'onError'),
                cardColor(lightScheme.errorContainer, 'Error Container'),
                cardColor(lightScheme.onErrorContainer, 'onError Container'),
                cardColor(lightScheme.background, 'Background'),
                cardColor(lightScheme.onBackground, 'onBackground'),
                cardColor(lightScheme.surface, 'Surface'),
                cardColor(lightScheme.onSurface, 'onSurface'),
                cardColor(lightScheme.surfaceVariant, 'Surface Variant'),
                cardColor(lightScheme.onSurfaceVariant, 'onSurface Variant'),
                cardColor(lightScheme.outline, 'Outline'),
                cardColor(lightScheme.inverseSurface, 'Inverse Surface'),
                cardColor(lightScheme.onInverseSurface, 'onInverse Surface'),
                cardColor(lightScheme.inversePrimary, 'Inverse Primary'),
              ]),
          /*  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Wrap(
              //alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: <Widget>[
                cardColor(lightScheme.primary, 'Primary'),
                cardColor(lightScheme.onPrimary, 'onPrimary'),
                cardColor(lightScheme.primaryContainer, 'Primary Container'),
                cardColor(lightScheme.onPrimaryContainer, 'onPrimary Container'),
                cardColor(lightScheme.secondary, 'Secondary'),
                cardColor(lightScheme.onSecondary, 'onSecondary'),
                cardColor(lightScheme.secondaryContainer, 'Secondary Container'),
                cardColor(lightScheme.onSecondaryContainer, 'onSecondary Container'),
                cardColor(lightScheme.tertiary, 'Tertiary'),
                cardColor(lightScheme.onTertiary, 'onTertiary'),
                cardColor(lightScheme.tertiaryContainer, 'Tertiary Container'),
                cardColor(lightScheme.onTertiaryContainer, 'onTertiary Container'),
                cardColor(lightScheme.error, 'Error'),
                cardColor(lightScheme.onError, 'onError'),
                cardColor(lightScheme.errorContainer, 'Error Container'),
                cardColor(lightScheme.onErrorContainer, 'onError Container'),
                cardColor(lightScheme.background, 'Background'),
                cardColor(lightScheme.onBackground, 'onBackground'),
                cardColor(lightScheme.surface, 'Surface'),
                cardColor(lightScheme.onSurface, 'onSurface'),
                cardColor(lightScheme.surfaceVariant, 'Surface Variant'),
                cardColor(lightScheme.onSurfaceVariant, 'onSurface Variant'),
                cardColor(lightScheme.outline, 'Outline'),
                cardColor(lightScheme.inverseSurface, 'Inverse Surface'),
                cardColor(lightScheme.onInverseSurface, 'onInverse Surface'),
                cardColor(lightScheme.inversePrimary, 'Inverse Primary'),
              ],
            ),
          ),*/
          const SizedBox(
            height: 20,
          ),
          const ListTile(
              title: Text(
                "Dark",
                //textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              )),
          const SizedBox(height: 10,),
          GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              childAspectRatio: 3,
              children: [
                cardColor(darkScheme.primary, 'Primary'),
                cardColor(darkScheme.onPrimary, 'onPrimary'),
                cardColor(darkScheme.primaryContainer, 'Primary Container'),
                cardColor(darkScheme.onPrimaryContainer, 'onPrimary Container'),
                cardColor(darkScheme.secondary, 'Secondary'),
                cardColor(darkScheme.onSecondary, 'onSecondary'),
                cardColor(darkScheme.secondaryContainer, 'Secondary Container'),
                cardColor(
                    darkScheme.onSecondaryContainer, 'onSecondary Container'),
                cardColor(darkScheme.tertiary, 'Tertiary'),
                cardColor(darkScheme.onTertiary, 'onTertiary'),
                cardColor(darkScheme.tertiaryContainer, 'Tertiary Container'),
                cardColor(
                    darkScheme.onTertiaryContainer, 'onTertiary Container'),
                cardColor(darkScheme.error, 'Error'),
                cardColor(darkScheme.onError, 'onError'),
                cardColor(darkScheme.errorContainer, 'Error Container'),
                cardColor(darkScheme.onErrorContainer, 'onError Container'),
                cardColor(darkScheme.background, 'Background'),
                cardColor(darkScheme.onBackground, 'onBackground'),
                cardColor(darkScheme.surface, 'Surface'),
                cardColor(darkScheme.onSurface, 'onSurface'),
                cardColor(darkScheme.surfaceVariant, 'Surface Variant'),
                cardColor(darkScheme.onSurfaceVariant, 'onSurface Variant'),
                cardColor(darkScheme.outline, 'Outline'),
                cardColor(darkScheme.inverseSurface, 'Inverse Surface'),
                cardColor(darkScheme.onInverseSurface, 'onInverse Surface'),
                cardColor(darkScheme.inversePrimary, 'Inverse Primary'),
              ]),

          /*Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Wrap(
              //alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: <Widget>[
                cardColor(darkScheme.primary, 'Primary'),
                cardColor(darkScheme.onPrimary, 'onPrimary'),
                cardColor(darkScheme.primaryContainer, 'Primary Container'),
                cardColor(darkScheme.onPrimaryContainer, 'onPrimary Container'),
                cardColor(darkScheme.secondary, 'Secondary'),
                cardColor(darkScheme.onSecondary, 'onSecondary'),
                cardColor(darkScheme.secondaryContainer, 'Secondary Container'),
                cardColor(darkScheme.onSecondaryContainer, 'onSecondary Container'),
                cardColor(darkScheme.tertiary, 'Tertiary'),
                cardColor(darkScheme.onTertiary, 'onTertiary'),
                cardColor(darkScheme.tertiaryContainer, 'Tertiary Container'),
                cardColor(darkScheme.onTertiaryContainer, 'onTertiary Container'),
                cardColor(darkScheme.error, 'Error'),
                cardColor(darkScheme.onError, 'onError'),
                cardColor(darkScheme.errorContainer, 'Error Container'),
                cardColor(darkScheme.onErrorContainer, 'onError Container'),
                cardColor(darkScheme.background, 'Background'),
                cardColor(darkScheme.onBackground, 'onBackground'),
                cardColor(darkScheme.surface, 'Surface'),
                cardColor(darkScheme.onSurface, 'onSurface'),
                cardColor(darkScheme.surfaceVariant, 'Surface Variant'),
                cardColor(darkScheme.onSurfaceVariant, 'onSurface Variant'),
                cardColor(darkScheme.outline, 'Outline'),
                cardColor(darkScheme.inverseSurface, 'Inverse Surface'),
                cardColor(darkScheme.onInverseSurface, 'onInverse Surface'),
                cardColor(darkScheme.inversePrimary, 'Inverse Primary'),
              ],
            ),
          ),*/
          const SizedBox(
            height: 120,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.colorize_outlined,
          ),
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
                        pickerAreaBorderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(2.0),
                          topRight: Radius.circular(2.0),
                        ),
                      ),
                    ),
                  );
                },
              )),
    );
  }
}
