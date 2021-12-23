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

  _launchChangelog()  {
    const url = 'https://github.com/Fschmatz/ui_tester_reborn/blob/master/lib/util/changelog.dart';
    launch(url);
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      title:  Card(
        color: Theme.of(context).colorScheme.primary,
        elevation: 1,
        margin: const EdgeInsets.fromLTRB(5, 20, 5, 0),
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
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            onTap: () {_launchGithub();},
            leading: const Icon(Icons.open_in_new_outlined),
            title: const Text("Source Code on GitHub",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue)),
          ),
          //const Divider(),
          ListTile(
            onTap: () {_launchChangelog();},
            leading: const Icon(Icons.open_in_new_outlined),
            title: const Text("View Changelog",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue)),
          ),
        ],
      ),
      actions: [

      ],
    );
  }
}
