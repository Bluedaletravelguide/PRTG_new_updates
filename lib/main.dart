// ignore_for_file: constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:peraktheguide/contact_us.dart';
import 'package:peraktheguide/ebook_page.dart';
import 'package:peraktheguide/explorekl.dart';
import 'package:peraktheguide/shop.dart';
import 'package:peraktheguide/spa.dart';
import 'package:peraktheguide/stay.dart';
import 'package:peraktheguide/highlights.dart';
import 'package:peraktheguide/home_page.dart';
import 'package:peraktheguide/about_us.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CachedNetworkImage.logLevel = CacheManagerLogLevel.debug;

  await FlutterDownloader.initialize(
      debug:
          true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          true // option: set to false to disable working with http links (default: false)
      );

  // Initialize Google Mobile Ads SDK
  MobileAds.instance.initialize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PERAK THE GUIDE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 71, 133)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home'),
      routes: {
        '/highlights-0': (context) => AboutPerak(),
        '/highlights-1': (context) => GetAround(),
        '/highlights-2': (context) => const TravelTips(),
        '/highlights-3': (context) => PerakIcon(),
        '/highlights-4': (context) => Food(),
        '/rmd-0': (context) => ExploreKL(),
        '/explorekl-0': (context) => const ExploreKL_Gperak(),
        '/explorekl-1': (context) => const ExploreKL_PerakTengah(),
        '/explorekl-2': (context) => const ExploreKL_Taiping(),
        '/explorekl-3': (context) => const ExploreKL_Kangsar(),
        '/explorekl-4': (context) => const ExploreKL_TelukIntan(),
        '/explorekl-5': (context) => const ExploreKL_TMalim(),
        '/explorekl-6': (context) => const ExploreKL_SS2(),
        '/explorekl-7': (context) => const ExploreKL_P2(),
        '/rmd-1': (context) => const Stay(),
        '/rmd-2': (context) => const Eat(),
        '/rmd-3': (context) => const Worship(),
        '/ebook': (context) => Ebook(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  int currentPageIndex = 0;
  final String desiredVersion = '1.5.0';

  DateTime? currentBackPressTime;

  bool isDialogShown = false;

  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Load a banner ad
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-7002644831588730/5297882189',
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          print('Ad failed to load: $error');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      currentBackPressTime = null;
    }
  }

  Future<bool> _onWillPop() async {
    final now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Press back again to exit'),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("PERAK THE GUIDE",
              style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 0, 71, 133),
          actions: const <Widget>[
            AppBarMore(),
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_isBannerAdReady)
              SizedBox(
                height: _bannerAd.size.height.toDouble(),
                width: _bannerAd.size.width.toDouble(),
                child: AdWidget(ad: _bannerAd),
              ),
            NavigationBar(
              onDestinationSelected: (int index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              selectedIndex: currentPageIndex,
              destinations: const <Widget>[
                NavigationDestination(
                    selectedIcon: Icon(Icons.home,
                        color: Color.fromARGB(255, 0, 71, 133)),
                    icon: Icon(Icons.home_outlined),
                    label: 'Home'),
                NavigationDestination(
                    selectedIcon: Icon(Icons.menu_book,
                        color: Color.fromARGB(255, 0, 71, 133)),
                    icon: Icon(Icons.menu_book_outlined),
                    label: 'E-Book'),
              ],
            ),
          ],
        ),
        body: [
          HomeScreen(),
          Ebook(),
        ][currentPageIndex],
      ),
    );
  }
}

class AppBarMore extends StatelessWidget {
  const AppBarMore({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      color: Colors.white,
      onSelected: (value) {
        if (value == 'Contact Us') {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ContactUsPage(),
          ));
        } else if (value == 'About Us') {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AboutUsPage(),
          ));
        }
      },
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'About Us',
            child: Text('About Us'),
          ),
          const PopupMenuItem<String>(
            value: 'Contact Us',
            child: Text('Contact Us'),
          ),
        ];
      },
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

class MyFlutterApp {
  MyFlutterApp._();

  static const _kFontFam = 'MyFlutterApp';
  static const String? _kFontPkg = null;

  static const IconData instagram_1 =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);

  static const IconData whatsapp =
      IconData(0xf232, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}

class ImageData {
  final String imageUrl;
  final String actionUrl;

  ImageData({
    required this.imageUrl,
    required this.actionUrl,
  });
}
