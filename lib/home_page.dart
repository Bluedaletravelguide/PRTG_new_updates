import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:peraktheguide/main.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  final List<String> imagesHighlights = [
    'assets/img/essentials/intro.jpg',
    'assets/img/essentials/getting_around.jpg',
    'assets/img/essentials/travel-tips.jpg',
    'assets/img/essentials/getting_to_know.jpg',
    'assets/img/essentials/food.jpg',

    // Add more image URLs as needed
  ];

  final List<String> titlesHighlights = [
    'Perak History',
    'Getting Around Perak',
    'Travel Tips',
    '11 icons of Perak',
    'Must Try Food',
    // Add more titles corresponding to image URLs
  ];

  final List<String> imagesRmd = [
    'assets/img/essentials/intro.jpg',
    'assets/img/recommendation/accomodation.jpg',
    'assets/img/recommendation/place_to_eat.jpg',
    'assets/img/recommendation/place_of_worship.jpg',
    // 'https://www.kltheguide.com.my/assets/img/recommendation/11.medical-tourism.png',

    // Add more image URLs as needed
  ];

  final List<String> titlesRmd = [
    'Explore Perak',
    'Accomodation',
    'Places To Eat',
    'Places of Worship',
    // 'Medical Tourism',
    // Add more titles corresponding to image URLs
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // Ensures even spacing
                children: [
                  GestureDetector(
                    child: const Icon(
                      Icons.facebook_sharp,
                      color: Colors.blue,
                      size: 48,
                    ),
                    onTap: () => _launchURL(
                        'https://www.facebook.com/p/Perak-The-Guide-100068158833868/?locale=mt_MT'),
                  ),
                  GestureDetector(
                    child: const Icon(
                      MyFlutterApp.instagram_1,
                      color: Colors.pink,
                      size: 48,
                    ),
                    onTap: () => _launchURL(
                        'https://www.instagram.com/peraktheguide/'),
                  ),
                  GestureDetector(
                    child: const Icon(
                      MyFlutterApp.whatsapp,
                      color: Colors.green,
                      size: 48,
                    ),
                    onTap: () => _launchURL(
                        'https://api.whatsapp.com/send?phone=60122200622'),
                  ),
                  GestureDetector(
                    child: const Icon(
                      Icons.tiktok,
                      size: 48,
                    ),
                    onTap: () => _launchURL(
                        'https://www.tiktok.com/@kltheguide'),
                  ),
                  GestureDetector(
                    child: const Icon(
                      Icons.public,
                      color: Colors.grey,
                      size: 48,
                    ),
                    onTap: () =>
                        _launchURL('https://www.kltheguide.com.my/'),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Perak Highlights',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ImageCarousel(images: imagesHighlights, titles: titlesHighlights),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Recommendations',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ImageCarousel2(images: imagesRmd, titles: titlesRmd),
            // Continue adding more widgets for scrollable content
          ],
        ),
      ),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  final List<String> images;
  final List<String> titles;

  const ImageCarousel({
    super.key,
    required this.images,
    required this.titles,
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider.builder(
          itemCount: widget.images.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/highlights-$index',
                        arguments: {'index': index, 'titles': widget.titles});
                  },
                  child: Image.asset(
                    widget.images[index],
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width, // Full width
                  ),
                ),
                Positioned(
                  bottom: 30.0,
                  left: 10.0,
                  right: 10.0,
                  child: Container(
                    color:
                        Colors.black.withOpacity(0.5), // Faded black background
                    child: Center(
                      child: Text(
                        widget.titles[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          options: CarouselOptions(
            height: 300,
            viewportFraction: 0.85,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.images.map((image) {
            int index = widget.images.indexOf(image);
            return Container(
              width: 8.0,
              height: 8.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index ? Colors.blue : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class ImageCarousel2 extends StatefulWidget {
  final List<String> images;
  final List<String> titles;

  const ImageCarousel2({
    super.key,
    required this.images,
    required this.titles,
  });

  @override
  State<ImageCarousel2> createState() => _ImageCarouselState2();
}

class _ImageCarouselState2 extends State<ImageCarousel2> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider.builder(
          itemCount: widget.images.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/rmd-$index',
                        arguments: {'index': index, 'titles': widget.titles});
                  },
                  child: Image.asset(
                    widget.images[index],
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width, // Full width
                  ),
                ),
                Positioned(
                  bottom: 30.0,
                  left: 10.0,
                  right: 10.0,
                  child: Container(
                    color:
                        Colors.black.withOpacity(0.5), // Faded black background
                    child: Center(
                      child: Text(
                        widget.titles[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          options: CarouselOptions(
            height: 180,
            aspectRatio: 16 / 9,
            viewportFraction: 0.85,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.images.map((image) {
            int index = widget.images.indexOf(image);
            return Container(
              width: 8.0,
              height: 8.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index ? Colors.blue : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
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
