// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:peraktheguide/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';

// Color Theme
class AppTheme {
  static const Color primaryYellow = Color(0xFFFDB813);
  static const Color darkBlack = Color(0xFF1A1A1A);
  static const Color softWhite = Color(0xFFFAFAFA);
  static const Color accentGold = Color(0xFFFFD700);
  static const Color textGrey = Color(0xFF666666);
}

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.softWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            elevation: 0,
            backgroundColor: AppTheme.darkBlack,
            iconTheme: const IconThemeData(color: AppTheme.primaryYellow),
            actions: const <Widget>[AppBarMore()],
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'About Us',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppTheme.darkBlack,
                      AppTheme.darkBlack.withOpacity(0.8),
                    ],
                  ),
                ),
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 40),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryYellow.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/icon/perak_icon.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Company Info Card
                  _buildCompanyCard(),
                  const SizedBox(height: 24),

                  // Social Media Section
                  _buildSocialMediaSection(context),
                  const SizedBox(height: 32),

                  // App Version Card
                  _buildVersionCard(),
                  const SizedBox(height: 24),

                  // Copyright Section
                  _buildCopyrightSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryYellow.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.primaryYellow.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.business_rounded,
                color: AppTheme.primaryYellow,
                size: 48,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Our Company',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppTheme.darkBlack,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 4,
              width: 60,
              decoration: BoxDecoration(
                color: AppTheme.primaryYellow,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Klang Valley 4 Locals is a free quarterly travel guidebook, providing an overall coverage on the whole Klang Valley area featuring hidden gems and hotspots for tourists.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color: AppTheme.textGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialMediaSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.primaryYellow, AppTheme.accentGold],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryYellow.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            const Icon(
              Icons.connect_without_contact_rounded,
              color: AppTheme.darkBlack,
              size: 48,
            ),
            const SizedBox(height: 16),
            const Text(
              'Connect With Us',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.darkBlack,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Follow us on social media',
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.darkBlack.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSocialButton(
                  icon: Icons.facebook_sharp,
                  color: const Color(0xFF1877F2),
                  label: 'Facebook',
                  onTap: () => _launchURL('https://www.facebook.com/klangvalley4locals/'),
                ),
                _buildSocialButton(
                  icon: MyFlutterApp.instagram_1,
                  color: const Color(0xFFE4405F),
                  label: 'Instagram',
                  onTap: () => _launchURL('https://www.instagram.com/klangvalley4locals/'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSocialButton(
                  icon: Icons.tiktok,
                  color: AppTheme.darkBlack,
                  label: 'TikTok',
                  onTap: () => _launchURL('https://www.tiktok.com/@klangvalley4locals'),
                ),
                _buildSocialButton(
                  icon: Icons.public,
                  color: const Color(0xFF4CAF50),
                  label: 'Website',
                  onTap: () => _launchURL('https://www.klangvalley4locals.com.my/'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required Color color,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 40),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppTheme.darkBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVersionCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.primaryYellow.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.primaryYellow.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.info_outline_rounded,
                color: AppTheme.primaryYellow,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: FutureBuilder<PackageInfo>(
                future: PackageInfo.fromPlatform(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryYellow),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text(
                      'Version unavailable',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.textGrey,
                      ),
                    );
                  } else {
                    String appVersion = snapshot.data!.version;
                    String buildNumber = snapshot.data!.buildNumber;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'App Version',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppTheme.textGrey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '$appVersion (Build $buildNumber)',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.darkBlack,
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCopyrightSection() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.darkBlack.withOpacity(0.05),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.copyright_rounded,
                size: 18,
                color: AppTheme.textGrey,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  '${DateTime.now().year} Bluedale Publishing Sdn. Bhd.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: AppTheme.textGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'All rights reserved',
          style: TextStyle(
            fontSize: 12,
            color: AppTheme.textGrey.withOpacity(0.7),
          ),
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