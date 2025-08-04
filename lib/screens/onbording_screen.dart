import 'package:campus_charcha/ui/auth/login_screen.dart';
import 'package:campus_charcha/widgets/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() => isLastPage = (index == 2));
          },
          children: [
            OnboardingContent(
              lottiePath: 'assets/lottie/onboarding1.json',
              title: 'Stay Updated',
              description: 'Get instant updates on events and notices',
            ),
            OnboardingContent(
              lottiePath: 'assets/lottie/onboarding2.json',
              title: 'Never Miss Exams',
              description: 'All exam schedules in one place',
            ),
            OnboardingContent(
              lottiePath: 'assets/lottie/onboarding3.json',
              title: 'Explore Campus',
              description: 'Discover fests, seminars and campus life',
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: 80,
        child: isLastPage
            ? ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) =>  LoginScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => _controller.jumpToPage(2),
                    child: const Text(
                      'SKIP',
                      style: TextStyle(color: AppColors.accent, fontSize: 16),
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(controller: _controller, count: 3),
                  ),
                  TextButton(
                    onPressed: () => _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut),
                    child: const Text(
                      'NEXT',
                      style: TextStyle(color: AppColors.accent, fontSize: 16),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final String lottiePath, title, description;

  const OnboardingContent({
    super.key,
    required this.lottiePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),
        Lottie.asset(lottiePath, height: 250),
        const SizedBox(height: 30),
        Text(title,
            style: const TextStyle(
                fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 15),
        Text(description,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 16)),
      ],
    );
  }
}
