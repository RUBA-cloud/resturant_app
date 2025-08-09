import 'package:resturant_app/constants/exported_package.dart';

class BasicAuthPage extends StatelessWidget {
  final Widget? formWidget;
  final String? title;
  final String? description;
  final String? backgroundImage; // Optional custom background

  const BasicAuthPage({
    super.key,
    this.formWidget,
    this.title,
    this.description,
    this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image or gradient
        Container(
          decoration: BoxDecoration(
            image: backgroundImage != null
                ? DecorationImage(
                    image: AssetImage(backgroundImage!),
                    fit: BoxFit.cover,
                  )
                : null,
            gradient: backgroundImage == null
                ? const LinearGradient(
                    colors: [mainColor, secondrycolor, primaryColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
          ),
        ),

        // Overlay for better text visibility
        Container(color: Colors.black.withOpacity(0.35)),

        // Scrollable content with fade-in animation
        Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOut,
                builder: (context, double opacity, child) {
                  return Opacity(
                    opacity: opacity,
                    child: Transform.translate(
                      offset: Offset(0, 30 * (1 - opacity)),
                      child: child,
                    ),
                  );
                },
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.black26,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.white.withOpacity(0.15),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 32,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // App Logo
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'asset/images/logo.png',
                            width: 100,
                            height: 100,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // App Name
                        Text(
                          'app_name'.tr,
                          style: headingStyle.copyWith(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              const Shadow(
                                blurRadius: 4,
                                color: Colors.black45,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Page Title
                        if (title != null)
                          Text(
                            title!,
                            style: headingStyle.copyWith(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),

                        // Description
                        if (description != null) ...[
                          const SizedBox(height: 8),
                          Text(
                            description!,
                            style: subHeadingStyle.copyWith(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],

                        const SizedBox(height: 24),

                        // Form widget
                        formWidget ?? const SizedBox(),

                        const SizedBox(height: 16),
                      ],
                    ),
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
