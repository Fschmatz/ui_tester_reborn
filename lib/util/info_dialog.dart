import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'changelog.dart';

class InfoDialog extends StatefulWidget {
  const InfoDialog({Key? key}) : super(key: key);

  @override
  _InfoDialogState createState() => _InfoDialogState();
}

class _InfoDialogState extends State<InfoDialog> {

  _launchGithub()  {
    const url = 'https://github.com/Fschmatz/ui_tester_reborn';
    launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      title: Card(
        color: Theme.of(context).colorScheme.primary,
        margin: const EdgeInsets.all(5),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: ListTile(
          title: Text(
            Changelog.appName + " " + Changelog.appVersion,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
      ),
      content: Container(
        height: 400,
        width: 300,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              ListTile(
                title: Text("Source Code".toUpperCase(),
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary,)),
              ),
              ListTile(
                onTap: () {_launchGithub();},
                leading: const Icon(Icons.open_in_new_outlined),
                title: const Text("View on GitHub",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue)),
              ),

              const Divider(),
              ListTile(

                title: Text("Changelog".toUpperCase(),
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary,)),
              ),
              ListTile(
                /*leading: const Icon(
                  Icons.article_outlined,
                ),*/
                title: Text(
                  Changelog.changelogs,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
     /* actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('OK'),
        )
      ],*/
    );
  }
}
