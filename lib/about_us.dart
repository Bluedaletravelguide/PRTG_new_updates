// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:peraktheguide/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text("About Us", style: TextStyle(color: Colors.white)),
        // foregroundColor: const Color.fromARGB(255, 0, 71, 133),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        actions: const <Widget>[
          AppBarMore(),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon/perak_icon.png',
            ),
            const SizedBox(height: 16),
            const Text(
              'Our Company',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Klang Valley 4 Locals is a free quarterly travel guidebook, providing an overall coverage on the whole Klang Valley area featuring hidden gems and hotspots for tourists. ",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Find Us',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // const Text(
            //   "No.31-2, Block F2, Level 2, Jalan PJU 1/42a, Dataran Prima, 47301 Petaling Jaya, Selangor.",
            //   textAlign: TextAlign.justify,
            //   style: TextStyle(fontSize: 16),
            // ),
            // const SizedBox(height: 8),
            // Container(
            //   child: const Text(
            //     "Opening Hours:",
            //     textAlign: TextAlign.start,
            //     style: TextStyle(fontSize: 16),
            //   ),
            // ),
            // RichText(
            //   text: const TextSpan(
            //     text: 'Monday-Friday :',
            //     style:
            //         TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            //     children: [
            //       TextSpan(
            //         text: '9:00AM - 6:00PM',
            //         style: TextStyle(color: Colors.black),
            //       ),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 8),
            // RichText(
            //   text: TextSpan(
            //     text: 'Mobile Num.: ',
            //     style: const TextStyle(
            //         color: Colors.black, fontWeight: FontWeight.bold),
            //     children: [
            //       TextSpan(
            //         text: '+6012-2200622',
            //         style: const TextStyle(color: Colors.blue),
            //         recognizer: TapGestureRecognizer()
            //           ..onTap = () {
            //             _launchURL('tel:+60122200622');
            //           },
            //       ),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 8),
            // RichText(
            //   text: TextSpan(
            //     text: 'Telephone Num.: ',
            //     style: const TextStyle(
            //         color: Colors.black, fontWeight: FontWeight.bold),
            //     children: [
            //       TextSpan(
            //         text: '+603-7886 9219',
            //         style: const TextStyle(color: Colors.blue),
            //         recognizer: TapGestureRecognizer()
            //           ..onTap = () {
            //             _launchURL('tel:+60378869219');
            //           },
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: const Icon(
                    Icons.facebook_sharp,
                    color: Colors.blue,
                    size: 64,
                  ),
                  onTap: () => _launchURL(
                      'https://www.facebook.com/klangvalley4locals/'),
                ),
                GestureDetector(
                  child: const Icon(
                    MyFlutterApp.instagram_1,
                    color: Colors.pink,
                    size: 64,
                  ),
                  onTap: () => _launchURL(
                      'https://www.instagram.com/klangvalley4locals/'),
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.tiktok,
                    size: 64,
                  ),
                  onTap: () =>
                      _launchURL('https://www.tiktok.com/@klangvalley4locals'),
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.public,
                    color: Colors.grey,
                    size: 64,
                  ),
                  onTap: () =>
                      _launchURL('https://www.klangvalley4locals.com.my/'),
                ),
              ],
            ),
            const SizedBox(height: 8),

            Center(
              child: FutureBuilder<PackageInfo>(
                future: PackageInfo.fromPlatform(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // While waiting for the package info, show a loading indicator
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    // If there's an error, show an error message
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // If the package info is available, display the app version
                    String appVersion = snapshot.data!.version;
                    String buildNumber = snapshot.data!.buildNumber;

                    return Text('App Version: $appVersion+$buildNumber');
                  }
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Copyrighted by: Bluedale Pulishing Sdn. Bhd.')
          ],
        ),
      ),
    );
  }
}

void _launchURL(url) async {
  var url2 = Uri.parse(url);
  if (await canLaunchUrl(url2)) {
    await launchUrl(url2, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
