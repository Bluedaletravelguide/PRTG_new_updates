import 'package:flutter/material.dart';
import 'package:peraktheguide/main.dart';
import 'package:url_launcher/url_launcher.dart';

// Color Theme
class AppTheme {
  static const Color primaryYellow = Color(0xFFFDB813);
  static const Color darkBlack = Color(0xFF1A1A1A);
  static const Color softWhite = Color(0xFFFAFAFA);
  static const Color accentGold = Color(0xFFFFD700);
  static const Color textGrey = Color(0xFF666666);
}

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.softWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220.0,
            floating: false,
            pinned: true,
            elevation: 0,
            backgroundColor: AppTheme.darkBlack,
            iconTheme: const IconThemeData(color: AppTheme.primaryYellow),
            actions: const <Widget>[AppBarMore()],
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Contact Us',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
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
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 40),
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryYellow.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/icon/perak_icon.png',
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header Card
                  _buildHeaderCard(),
                  const SizedBox(height: 24),

                  // Contact Methods
                  _buildContactItem(
                    icon: Icons.email_rounded,
                    title: 'Email',
                    content: 'enquiry@bluedale.com.my',
                    color: const Color(0xFFEA4335),
                    onTap: () => _launchURL('mailto:enquiry@bluedale.com.my'),
                  ),
                  const SizedBox(height: 16),

                  _buildContactItem(
                    icon: MyFlutterApp.whatsapp,
                    title: 'WhatsApp',
                    content: '+6012-220 0622',
                    color: const Color(0xFF25D366),
                    onTap: () => _launchURL('https://api.whatsapp.com/send?phone=60122200622'),
                  ),
                  const SizedBox(height: 16),

                  _buildContactItem(
                    icon: Icons.phone_rounded,
                    title: 'Phone',
                    content: '+603-7886 9219',
                    color: const Color(0xFF2196F3),
                    onTap: () => _launchURL('tel:+60378869219'),
                  ),
                  const SizedBox(height: 16),

                  _buildContactItem(
                    icon: Icons.location_on_rounded,
                    title: 'Address',
                    content: 'No.31-2, Block F2, Level 2, Jalan PJU 1/42a, Dataran Prima, 47301 Petaling Jaya, Selangor',
                    color: const Color(0xFFFF9800),
                    onTap: () => _launchURL('https://goo.gl/maps/p2Ew3gSvjttiQdGY9'),
                  ),
                  const SizedBox(height: 16),

                  _buildContactItem(
                    icon: Icons.access_time_rounded,
                    title: 'Business Hours',
                    content: 'Monday - Friday\n9:00 AM - 6:00 PM',
                    color: AppTheme.primaryYellow,
                    onTap: null,
                  ),
                  const SizedBox(height: 32),

                  // CTA Card
                  _buildCTACard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      padding: const EdgeInsets.all(24),
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
      child: Column(
        children: [
          const Icon(
            Icons.contact_support_rounded,
            color: AppTheme.darkBlack,
            size: 48,
          ),
          const SizedBox(height: 12),
          const Text(
            'Get in Touch',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppTheme.darkBlack,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'We\'re here to help! Reach out to us through any of the channels below',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.darkBlack.withOpacity(0.7),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String content,
    required Color color,
    required VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: onTap != null
                ? color.withOpacity(0.3)
                : AppTheme.textGrey.withOpacity(0.2),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: onTap != null
                  ? color.withOpacity(0.1)
                  : Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textGrey,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      content,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.darkBlack,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              if (onTap != null)
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: color,
                    size: 16,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCTACard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.darkBlack,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppTheme.darkBlack.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(
            Icons.support_agent_rounded,
            color: AppTheme.primaryYellow,
            size: 48,
          ),
          const SizedBox(height: 16),
          const Text(
            'Need Immediate Assistance?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'Our team is ready to answer your questions and provide support during business hours',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.7),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _buildQuickActionButton(
                  icon: MyFlutterApp.whatsapp,
                  label: 'WhatsApp',
                  color: const Color(0xFF25D366),
                  onTap: () => _launchURL('https://api.whatsapp.com/send?phone=60122200622'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildQuickActionButton(
                  icon: Icons.phone_rounded,
                  label: 'Call Now',
                  color: const Color(0xFF2196F3),
                  onTap: () => _launchURL('tel:+60378869219'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
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