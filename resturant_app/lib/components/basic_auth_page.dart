import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_app/constants/styles.dart';

class BasicAuthPage extends StatelessWidget {
  final Widget? formWidget;
  final String? title;
  final String? description;

  const BasicAuthPage({Key? key, this.formWidget, this.title, this.description})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Gradient Background
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFff9d76), Color(0xFFff6a88)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),

        // Semi-transparent overlay
        Container(color: Colors.black.withOpacity(0.3)),
        // Scrollable content
        Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Card(
                elevation: 12,
                shadowColor: Colors.black45,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white.withOpacity(0.3),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Logo
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'asset/images/logo.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text('app_name'.tr, style: headingStyle),
                      const SizedBox(height: 32),
                      title != null
                          ? Text(title!, style: headingStyle)
                          : const SizedBox(),
                      description != null
                          ? Text(description!, style: subHeadingStyle)
                          : const SizedBox(),
                      // Sign In Title
                      const SizedBox(height: 20),
                      formWidget ?? Container(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
