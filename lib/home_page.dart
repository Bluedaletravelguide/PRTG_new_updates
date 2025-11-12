import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  ];

  final List<String> titlesHighlights = [
    'Perak History',
    'Getting Around Perak',
    'Travel Tips',
    '11 icons of Perak',
    'Must Try Food',
  ];

  final List<String> imagesRmd = [
    'assets/img/essentials/intro.jpg',
    'assets/img/recommendation/accomodation.jpg',
    'assets/img/recommendation/place_to_eat.jpg',
    'assets/img/recommendation/place_of_worship.jpg',
  ];

  final List<String> titlesRmd = [
    'Explore Perak',
    'Accomodation',
    'Places To Eat',
    'Places of Worship',
  ];

  final List<SocialMediaItem> socialMediaItems = [
    SocialMediaItem(
      icon: Icons.facebook_rounded,
      color: Color(0xFF1877F2),
      label: 'Facebook',
      url: 'https://www.facebook.com/p/Perak-The-Guide-100068158833868/?locale=mt_MT',
    ),
    SocialMediaItem(
      icon: MyFlutterApp.instagram_1,
      color: Color(0xFFE4405F),
      label: 'Instagram',
      url: 'https://www.instagram.com/peraktheguide/',
    ),
    SocialMediaItem(
      icon: MyFlutterApp.whatsapp,
      color: Color(0xFF25D366),
      label: 'WhatsApp',
      url: 'https://api.whatsapp.com/send?phone=60122200622',
    ),
    SocialMediaItem(
      icon: Icons.tiktok,
      color: Color(0xFF000000),
      label: 'TikTok',
      url: 'https://www.tiktok.com/@kltheguide',
    ),
    SocialMediaItem(
      icon: Icons.public_rounded,
      color: Color(0xFF666666),
      label: 'Website',
      url: 'https://www.kltheguide.com.my/',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Hero Section with Social Media
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF1A1A1A),
                    Color(0xFF2D2D2D),
                  ],
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  // Welcome Text
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Connect With Us',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 3,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFD700),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 20,
                              height: 3,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFD700).withOpacity(0.5),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Social Media Icons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: socialMediaItems.map((item) {
                        return _buildSocialMediaButton(item);
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Perak Highlights Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFD700),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.star_rounded,
                      color: Color(0xFF1A1A1A),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Perak Highlights',
                        style: TextStyle(
                          color: Color(0xFF1A1A1A),
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Discover the best of Perak',
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ImageCarousel(images: imagesHighlights, titles: titlesHighlights),

            const SizedBox(height: 40),

            // Recommendations Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFF1A1A1A),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.recommend_rounded,
                      color: Color(0xFFFFD700),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recommendations',
                        style: TextStyle(
                          color: Color(0xFF1A1A1A),
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Handpicked places for you',
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ImageCarousel2(images: imagesRmd, titles: titlesRmd),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialMediaButton(SocialMediaItem item) {
    return GestureDetector(
      onTap: () => _launchURL(item.url),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: item.color.withOpacity(0.3),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                item.icon,
                color: item.color,
                size: 24,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              item.label,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialMediaItem {
  final IconData icon;
  final Color color;
  final String label;
  final String url;

  SocialMediaItem({
    required this.icon,
    required this.color,
    required this.label,
    required this.url,
  });
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
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/highlights-$index',
                    arguments: {'index': index, 'titles': widget.titles});
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(
                        widget.images[index],
                        fit: BoxFit.cover,
                      ),
                      // Gradient overlay
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7),
                            ],
                          ),
                        ),
                      ),
                      // Title with badge
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFD700),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'HIGHLIGHT',
                                  style: TextStyle(
                                    color: Color(0xFF1A1A1A),
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                widget.titles[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 320,
            viewportFraction: 0.88,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            autoPlayCurve: Curves.easeInOutCubic,
            enlargeCenterPage: true,
            enlargeFactor: 0.15,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 16),
        // Modern dot indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.images.asMap().entries.map((entry) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _currentIndex == entry.key ? 24.0 : 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: _currentIndex == entry.key
                    ? Color(0xFFFFD700)
                    : Color(0xFFE0E0E0),
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
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/rmd-$index',
                    arguments: {'index': index, 'titles': widget.titles});
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(
                        widget.images[index],
                        fit: BoxFit.cover,
                      ),
                      // Subtle gradient
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.6),
                            ],
                          ),
                        ),
                      ),
                      // Title with modern styling
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Container(
                                width: 4,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFD700),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  widget.titles[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 200,
            aspectRatio: 16 / 9,
            viewportFraction: 0.88,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            autoPlayCurve: Curves.easeInOutCubic,
            enlargeCenterPage: true,
            enlargeFactor: 0.1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 16),
        // Modern dot indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.images.asMap().entries.map((entry) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _currentIndex == entry.key ? 24.0 : 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: _currentIndex == entry.key
                    ? Color(0xFF1A1A1A)
                    : Color(0xFFE0E0E0),
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