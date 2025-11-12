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
import 'package:peraktheguide/stay.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CachedNetworkImage.logLevel = CacheManagerLogLevel.debug;

  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);

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
        primaryColor: const Color(0xFF1A1A1A), // Rich Black
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.light(
          primary: const Color(0xFF1A1A1A),
          secondary: const Color(0xFFFFD700), // Gold Yellow
          tertiary: const Color(0xFFFFA500), // Vibrant Orange-Yellow
          surface: Colors.white,
          background: Colors.white,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: false,
          backgroundColor: Color(0xFF1A1A1A),
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFD700),
            foregroundColor: const Color(0xFF1A1A1A),
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
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
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Press back again to exit',
            style: TextStyle(color: Color(0xFF1A1A1A)),
          ),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          backgroundColor: const Color(0xFFFFD700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(16),
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
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD700),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.location_city,
                  color: Color(0xFF1A1A1A),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Text("PERAK"),
              const SizedBox(width: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD700).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: const Color(0xFFFFD700),
                    width: 1.5,
                  ),
                ),
                child: const Text(
                  "THE GUIDE",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ],
          ),
          actions: const <Widget>[
            AppBarMore(),
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_isBannerAdReady)
              Container(
                height: 50, // ✅ ADD THIS LINE
                width: double.infinity, // ✅ ADD THIS LINE
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey[300]!,
                      width: 1,
                    ),
                  ),
                ),
                child: AdWidget(ad: _bannerAd), // ✅ REMOVE the inner SizedBox
              ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: NavigationBar(
                onDestinationSelected: (int index) {
                  setState(() {
                    currentPageIndex = index;
                  });
                },
                selectedIndex: currentPageIndex,
                backgroundColor: Colors.white,
                elevation: 0,
                indicatorColor: const Color(0xFFFFD700).withOpacity(0.3),
                labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
                destinations: const <Widget>[
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.home_rounded,
                      color: Color(0xFF1A1A1A),
                      size: 28,
                    ),
                    icon: Icon(
                      Icons.home_outlined,
                      color: Color(0xFF666666),
                      size: 24,
                    ),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.menu_book_rounded,
                      color: Color(0xFF1A1A1A),
                      size: 28,
                    ),
                    icon: Icon(
                      Icons.menu_book_outlined,
                      color: Color(0xFF666666),
                      size: 24,
                    ),
                    label: 'E-Book',
                  ),
                ],
              ),
            ),
          ],
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: [
            HomeScreen(),
            Ebook(),
          ][currentPageIndex],
        ),
      ),
    );
  }
}

class AppBarMore extends StatelessWidget {
  const AppBarMore({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFFFD700).withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.more_vert_rounded,
          color: Colors.white,
          size: 20,
        ),
      ),
      color: Colors.white,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      offset: const Offset(0, 50),
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
          PopupMenuItem<String>(
            value: 'About Us',
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFD700).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.info_outline_rounded,
                    color: Color(0xFF1A1A1A),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'About Us',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const PopupMenuDivider(height: 1),
          PopupMenuItem<String>(
            value: 'Contact Us',
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFD700).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.contact_mail_outlined,
                    color: Color(0xFF1A1A1A),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
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
