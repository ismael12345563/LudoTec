import 'package:flutter/material.dart';

import '../../app/theme/app_theme.dart';
import '../../core/routes/app_routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFCFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1120),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 22,
                ),
                child: Column(
                  children: [
                    const _Header(),
                    const SizedBox(height: 65),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final compact = constraints.maxWidth < 750;

                        if (compact) {
                          return Column(
                            children: [
                              const _Illustration(),
                              const SizedBox(height: 38),
                              const _WelcomeContent(centered: true),
                            ],
                          );
                        }

                        return const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(flex: 11, child: _WelcomeContent()),
                            SizedBox(width: 55),
                            Expanded(flex: 10, child: _Illustration()),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 48),
                    const Text(
                      '¡Hay mucho por descubrir!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF263650),
                      ),
                    ),
                    const SizedBox(height: 35),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppTheme.primary,
            borderRadius: BorderRadius.circular(13),
          ),
          child: const Icon(
            Icons.lightbulb_rounded,
            color: Colors.white,
            size: 27,
          ),
        ),
        const SizedBox(width: 11),
        const Text(
          'LudoTec',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
            color: Color(0xFF263650),
          ),
        ),
      ],
    );
  }
}

class _WelcomeContent extends StatelessWidget {
  const _WelcomeContent({this.centered = false});

  final bool centered;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: centered
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFE7F7F3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'TU AVENTURA COMIENZA AQUÍ',
            style: TextStyle(
              color: Color(0xFF269C89),
              fontSize: 10,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.7,
            ),
          ),
        ),
        const SizedBox(height: 24),
        RichText(
          textAlign: centered ? TextAlign.center : TextAlign.left,
          text: const TextSpan(
            style: TextStyle(
              fontSize: 39,
              height: 1.12,
              fontWeight: FontWeight.w800,
              color: Color(0xFF202E46),
            ),
            children: [
              TextSpan(text: '¡Aprender nunca\nfue tan '),
              TextSpan(
                text: 'divertido!',
                style: TextStyle(color: AppTheme.primary),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        const Text(
          'Descubre el mundo de la tecnología, explora nuevas profesiones y desarrolla tus habilidades mientras te diviertes.',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 14,
            height: 1.65,
            color: Color(0xFF718096),
          ),
        ),
        const SizedBox(height: 27),
        Wrap(
          alignment: centered ? WrapAlignment.center : WrapAlignment.start,
          spacing: 13,
          runSpacing: 12,
          children: [
            FilledButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.register);
              },
              icon: const Icon(Icons.rocket_launch_rounded, size: 16),
              label: const Text('¡Comenzar!'),
              style: FilledButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 19,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.login);
              },
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF53647C),
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 14,
                ),
              ),
              child: const Text(
                'Ya tengo una cuenta',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 21),
        Row(
          mainAxisAlignment: centered
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.check_circle_rounded,
              color: Color(0xFF52B78C),
              size: 14,
            ),
            const SizedBox(width: 8),
            const Flexible(
              child: Text(
                'Explora, aprende y descubre a tu ritmo',
                style: TextStyle(color: Color(0xFF8996A8), fontSize: 11),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Illustration extends StatelessWidget {
  const _Illustration();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      decoration: BoxDecoration(
        color: const Color(0xFFEAF2F2),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
            top: 42,
            left: 28,
            child: Icon(Icons.star_rounded, color: Color(0xFFFFC857), size: 23),
          ),
          const Positioned(
            top: 25,
            right: 35,
            child: Icon(Icons.circle, color: Color(0xFFFFC857), size: 13),
          ),
          const Positioned(
            bottom: 48,
            left: 18,
            child: Icon(Icons.circle, color: AppTheme.secondary, size: 11),
          ),
          Container(
            width: 168,
            height: 168,
            decoration: BoxDecoration(
              color: const Color(0xFFFFFEF7),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF718096).withValues(alpha: 0.08),
                  blurRadius: 25,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const Icon(
              Icons.school_rounded,
              size: 77,
              color: AppTheme.primary,
            ),
          ),
          const Positioned(
            top: 35,
            right: 65,
            child: _FloatingIcon(
              icon: Icons.code_rounded,
              color: Colors.white,
              iconColor: Color(0xFF52647D),
            ),
          ),
          const Positioned(
            bottom: 43,
            left: 35,
            child: _FloatingIcon(
              icon: Icons.lightbulb_rounded,
              color: Color(0xFFFFF8E7),
              iconColor: Color(0xFFE9B64A),
            ),
          ),
          const Positioned(
            bottom: 42,
            right: 53,
            child: _FloatingIcon(
              icon: Icons.science_rounded,
              color: Color(0xFFE9F8F3),
              iconColor: AppTheme.secondary,
            ),
          ),
          const Positioned(
            bottom: 72,
            right: 22,
            child: Icon(Icons.auto_awesome, color: AppTheme.purple, size: 22),
          ),
        ],
      ),
    );
  }
}

class _FloatingIcon extends StatelessWidget {
  const _FloatingIcon({
    required this.icon,
    required this.color,
    required this.iconColor,
  });

  final IconData icon;
  final Color color;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 47,
      height: 47,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(icon, color: iconColor, size: 23),
    );
  }
}
