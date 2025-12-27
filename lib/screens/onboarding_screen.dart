
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: const [
                  OnboardingPage(
                    image: 'assets/images/gift-box.svg',
                    title: 'Welcome to our App!',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  ),
                  OnboardingPage(
                    image: 'assets/images/clock.svg',
                    title: 'Save Time and Effort',
                    description:
                        'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  ),
                  OnboardingPage(
                    image: 'assets/images/logo.png',
                    title: 'Get Started!',
                    description:
                        'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => buildDot(index, context),
              ),
            ),
            const SizedBox(height: 40),
            if (_currentPage == 2)
              ElevatedButton(
                onPressed: () {
                  context.go('/login');
                },
                child: const Text('Get Started'),
              )
            else
              const SizedBox(height: 50),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: _currentPage == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image.endsWith('.svg')
              ? SvgPicture.asset(
                  image,
                  height: 200,
                )
              : Image.asset(
                  image,
                  height: 200,
                ),
          const SizedBox(height: 40),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            description,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
