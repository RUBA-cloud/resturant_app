import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:resturant_app/constants/styles.dart';

class AboutUsPage extends StatelessWidget {
  final bool isAppBar;
  const AboutUsPage({super.key, required this.isAppBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isAppBar
          ? AppBar(title: Text('about_us'.tr), centerTitle: true)
          : null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLogoAndName(context),
            const SizedBox(height: 24),
            _buildMission(context),
            const SizedBox(height: 24),
            _buildValues(context),
            const SizedBox(height: 24),
            _buildHistory(context),
            const SizedBox(height: 24),
            _buildTeam(context),
            const SizedBox(height: 24),
            _buildTestimonials(context),
            const SizedBox(height: 24),
            _buildContactUs(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoAndName(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'asset/images/resturant.jpg',
          width: MediaQuery.of(context).size.width,
          height: 130,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 12),
        Text('app_name'.tr),
        const SizedBox(height: 8),
        Text('', style: boldTextStyle, textAlign: TextAlign.center),
      ],
    );
  }

  Widget _buildMission(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('our_mission'.tr),
        const SizedBox(height: 8),
        Text('we_deliver_high_quality_food_experiences_and_convenience'.tr),
      ],
    );
  }

  Widget _buildValues(BuildContext context) {
    final values = [
      'customer_satisfaction_is_our_top_priority'.tr,
      'sustainableand_ethical_sourcing'.tr,
      'transparency_and_integrity'.tr,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('our_values'.tr), // Fixed key
        const SizedBox(height: 8),
        ...values.map(
          (v) => ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.check_circle,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(v),
          ),
        ),
      ],
    );
  }

  Widget _buildHistory(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('our_story'.tr),
        const SizedBox(height: 8),
        Text('founded_in_2020'.tr),
      ],
    );
  }

  Widget _buildTeam(BuildContext context) {
    final members = [
      {'name': 'Alice — CEO', 'icon': Icons.verified_user},
      {'name': 'Bob — Head Chef', 'icon': Icons.restaurant},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('meet_the_team'.tr),
        const SizedBox(height: 12),
        Row(
          children: members.map((m) {
            return Expanded(
              child: Column(
                children: [
                  CircleAvatar(radius: 36, child: Icon(m['icon'] as IconData)),
                  const SizedBox(height: 8),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildTestimonials(BuildContext context) {
    final reviews = [
      {'author': 'Jane', 'text': 'Best food in town! Excellent service.'},
      {'author': 'Mark', 'text': 'Loved the atmosphere and quality.'},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('testimonials'.tr),
        const SizedBox(height: 8),
        ...reviews.map(
          (r) => Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(r['text']!),
                  const SizedBox(height: 6),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text('- ${r['author']!}'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactUs(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('contact_us'.tr),
        const SizedBox(height: 8),
        ListTile(
          leading: const Icon(Icons.location_on),
          title: Text('123 Main St, Amman, Jordan'),
        ),
        ListTile(
          leading: const Icon(Icons.phone),
          title: Text('+962 7 1234 5678'),
        ),
        ListTile(
          leading: const Icon(Icons.email),
          title: Text('info@yourcompany.com'),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(icon: const Icon(Icons.facebook), onPressed: () {}),
            IconButton(
              icon: const Icon(Icons.camera_alt), // Replaced invalid icon
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.alternate_email),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
