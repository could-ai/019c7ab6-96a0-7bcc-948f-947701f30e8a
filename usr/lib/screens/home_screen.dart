import 'package:flutter/material.dart';
import 'package:kgbm_redesign/theme/app_theme.dart';
import 'package:kgbm_redesign/data/site_data.dart';
import 'package:kgbm_redesign/widgets/layout_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const _MobileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomNavBar(),
            const _HeroSection(),
            const _ServicesSection(),
            const _IndustriesSection(),
            const _ContactCTASection(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class _MobileDrawer extends StatelessWidget {
  const _MobileDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppTheme.primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(FontAwesomeIcons.chartPie, color: Colors.white, size: 40),
                const SizedBox(height: 16),
                Text(
                  'KGBM',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(title: const Text('Home'), onTap: () {}),
          ListTile(title: const Text('Services'), onTap: () {}),
          ListTile(title: const Text('Industries'), onTap: () {}),
          ListTile(title: const Text('About'), onTap: () {}),
          ListTile(title: const Text('Contact'), onTap: () {}),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    
    return Container(
      width: double.infinity,
      color: AppTheme.primaryColor,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: isDesktop ? 100 : 60,
      ),
      child: isDesktop
          ? Row(
              children: [
                Expanded(child: _buildContent(context)),
                const SizedBox(width: 60),
                Expanded(child: _buildIllustration()),
              ],
            )
          : Column(
              children: [
                _buildContent(context),
                const SizedBox(height: 40),
                _buildIllustration(),
              ],
            ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          SiteData.tagline.toUpperCase(),
          style: const TextStyle(
            color: AppTheme.secondaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "Strategic Financial Leadership for Your Business",
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            color: Colors.white,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          SiteData.heroDescription,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.white.withOpacity(0.9),
          ),
        ),
        const SizedBox(height: 40),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("Our Services"),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Contact Us",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildIllustration() {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: const Center(
        child: Icon(
          FontAwesomeIcons.chartColumn,
          size: 100,
          color: Colors.white54,
        ),
      ),
    );
  }
}

class _ServicesSection extends StatelessWidget {
  const _ServicesSection();

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;
    final isTablet = MediaQuery.of(context).size.width > 600;
    
    int crossAxisCount = isDesktop ? 3 : (isTablet ? 2 : 1);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Column(
        children: [
          Text(
            "Our Expertise",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 16),
          Text(
            "Comprehensive solutions tailored to your business lifecycle",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                  childAspectRatio: 1.1,
                ),
                itemCount: SiteData.services.length,
                itemBuilder: (context, index) {
                  final service = SiteData.services[index];
                  return _ServiceCard(service: service);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final ServiceItem service;

  const _ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.secondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(service.icon, color: AppTheme.secondaryColor, size: 28),
          ),
          const SizedBox(height: 20),
          Text(
            service.title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Text(
              service.description,
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.fade,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                "Learn More",
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.arrow_forward, size: 16, color: AppTheme.primaryColor),
            ],
          ),
        ],
      ),
    );
  }
}

class _IndustriesSection extends StatelessWidget {
  const _IndustriesSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Industries We Serve",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: SiteData.industries.map((industry) => Chip(
              label: Text(industry),
              labelStyle: const TextStyle(fontSize: 16, color: AppTheme.primaryColor),
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color: AppTheme.primaryColor.withOpacity(0.2)),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }
}

class _ContactCTASection extends StatelessWidget {
  const _ContactCTASection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      decoration: const BoxDecoration(
        color: AppTheme.secondaryColor,
      ),
      child: Column(
        children: [
          Text(
            "Ready to optimize your business?",
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text(
            "Contact us today for a consultation with our expert team.",
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppTheme.secondaryColor,
            ),
            child: const Text("Get in Touch"),
          ),
        ],
      ),
    );
  }
}
