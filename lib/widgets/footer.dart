import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    final mobile = largura < 700;

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: mobile ? 24 : 80,
            vertical: mobile ? 60 : 90,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFF8F8),
                Color(0xFFFFE8ED),
              ],
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFC85C7A).withValues(alpha: 0.18),
                      blurRadius: 20,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.favorite_rounded,
                  color: Color(0xFFC85C7A),
                  size: 34,
                ),
              ),

              const SizedBox(height: 26),


              Text(
                '❤️ E sabe o que é mais bonito?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: mobile ? 20 : 24,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFC85C7A),
                ),
              ),

              const SizedBox(height: 18),

              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 700,
                ),
                child: Text(
                  '"Essa história ainda não terminou."',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: mobile ? 18 : 22,
                    height: 1.6,
                    fontStyle: FontStyle.italic,
                    color: const Color(0xFF735864),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              Text(
                'Ainda temos muitos capítulos para escrever.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: mobile ? 21 : 28,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF5C3946),
                ),
              ),
            ],
          ),
        ),

        Container(
          width: double.infinity,
          color: const Color(0xFF5C3946),
          padding: EdgeInsets.symmetric(
            horizontal: mobile ? 24 : 70,
            vertical: 35,
          ),
          child: mobile
              ? _footerMobile(context)
              : _footerDesktop(context),
        ),
      ],
    );
  }

  Widget _footerDesktop(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // MARCA
            const Expanded(
              child: Row(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Color(0xFFFFCAD5),
                    size: 26,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Nós',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // MENU
            Wrap(
              spacing: 8,
              children: [
                _linkFooter(context, 'Início', '/'),
                _linkFooter(context, 'Galeria', '/galeria'),
                _linkFooter(context, 'Música do dia', '/musica'),
                _linkFooter(context, 'Declaração', '/declaracao'),
                _linkFooter(
                  context,
                  'Nosso cantinho',
                  '/nosso-cantinho',
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 28),

        Container(
          width: double.infinity,
          height: 1,
          color: Colors.white.withValues(alpha: 0.15),
        ),

        const SizedBox(height: 22),

        Row(
          children: [
            const Expanded(
              child: Text(
                'Feito com amor para contar a nossa história.',
                style: TextStyle(
                  color: Color(0xFFFFDCE4),
                  fontSize: 13,
                ),
              ),
            ),

            Text(
              '© ${DateTime.now().year} • Todos os direitos reservados ❤️',
              style: const TextStyle(
                color: Color(0xFFFFDCE4),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _footerMobile(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite,
              color: Color(0xFFFFCAD5),
              size: 27,
            ),
            SizedBox(width: 10),
            Text(
              'Nós',
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        const SizedBox(height: 26),

        Wrap(
          alignment: WrapAlignment.center,
          spacing: 6,
          runSpacing: 6,
          children: [
            _linkFooter(context, 'Início', '/'),
            _linkFooter(context, 'Galeria', '/galeria'),
            _linkFooter(context, 'Música', '/musica'),
            _linkFooter(context, 'Declaração', '/declaracao'),
            _linkFooter(
              context,
              'Nosso cantinho',
              '/nosso-cantinho',
            ),
          ],
        ),

        const SizedBox(height: 26),

        Container(
          width: double.infinity,
          height: 1,
          color: Colors.white.withValues(alpha: 0.15),
        ),

        const SizedBox(height: 22),

        const Text(
          'Feito com amor para contar a nossa história.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFFFDCE4),
            fontSize: 13,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          '© ${DateTime.now().year} • Todos os direitos reservados ❤️',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFFFFDCE4),
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _linkFooter(
    BuildContext context,
    String titulo,
    String rota,
  ) {
    return TextButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, rota);
      },
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
      ),
      child: Text(
        titulo,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}