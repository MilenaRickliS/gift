import 'dart:math';
import 'package:flutter/material.dart';

class RoletaPresentes extends StatefulWidget {
  const RoletaPresentes({super.key});

  @override
  State<RoletaPresentes> createState() => _RoletaPresentesState();
}

class _RoletaPresentesState extends State<RoletaPresentes>
    with SingleTickerProviderStateMixin {
  final List<String> premios = const [
    'Vale massagem',
    'Café na cama',
    'Noite de filme',
    '10 beijos',
    'Jantar especial',
    'Abraço demorado',
    'Você escolhe',
    'Vale um docinho',
    'Dormir de conchinha',
    'Surpresa romântica',
  ];

  late AnimationController _controller;
  Animation<double>? _animation;

  double _anguloAtual = 0;
  String? premioSorteado;
  bool girando = false;

  final Random _random = Random();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _controller.addListener(() {
      if (_animation == null) return;

      setState(() {
        _anguloAtual = _animation!.value;
      });
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          girando = false;
        });
      }
    });
  }

  Future<void> girarRoleta() async {
    if (girando) return;

    final indiceSorteado = _random.nextInt(premios.length);

    final anguloSetor = (2 * pi) / premios.length;

   
    final anguloDestino =
        (2 * pi * 6) -
        (indiceSorteado * anguloSetor) -
        (anguloSetor / 2);

    final inicio = _anguloAtual;

    double destino = anguloDestino;

    while (destino <= inicio + (2 * pi * 4)) {
      destino += 2 * pi;
    }

    setState(() {
      girando = true;
      premioSorteado = null;
    });

    _controller.reset();

    _animation = Tween<double>(
      begin: inicio,
      end: destino,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    await _controller.forward();

    if (!mounted) return;

    setState(() {
      premioSorteado = premios[indiceSorteado];
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 800;

    final tamanhoRoleta = mobile ? 300.0 : 410.0;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 18 : 60,
      ),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 650,
        ),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: mobile ? 15 : 35,
          vertical: mobile ? 30 : 40,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: const Color(0xFFFFE4E9),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x16000000),
              blurRadius: 25,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            const Text(
              'Roleta do Amor 🎁',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5C3946),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Gire a roleta e descubra qual mimo você ganhou hoje. ❤️',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF8B6875),
                height: 1.5,
              ),
            ),

            const SizedBox(height: 35),

          
            Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Transform.rotate(
                    angle: _anguloAtual,
                    child: CustomPaint(
                      size: Size(
                        tamanhoRoleta,
                        tamanhoRoleta,
                      ),
                      painter: RoletaPainter(
                        premios: premios,
                      ),
                    ),
                  ),
                ),

              
                Positioned(
                  top: 0,
                  child: CustomPaint(
                    size: const Size(45, 55),
                    painter: PonteiroPainter(),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 35),

            SizedBox(
              width: mobile ? double.infinity : 260,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: girando ? null : girarRoleta,
                icon: Icon(
                  girando
                      ? Icons.autorenew_rounded
                      : Icons.favorite_rounded,
                ),
                label: Text(
                  girando ? 'Girando...' : 'Girar a roleta',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD65372),
                  foregroundColor: Colors.white,
                  disabledBackgroundColor:
                      const Color(0xFFF0BCC8),
                  elevation: 6,
                  shadowColor: const Color(0x55D65372),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: premioSorteado == null
                  ? const SizedBox(height: 25)
                  : Padding(
                      key: ValueKey(premioSorteado),
                      padding: const EdgeInsets.only(top: 25),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 22,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF4F6),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFFFFD3DC),
                          ),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              '🎉',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),

                            const SizedBox(height: 8),

                            const Text(
                              'Você ganhou:',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF9B7080),
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              premioSorteado!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFD65372),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),

            const SizedBox(height: 20),

            const Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Color(0xFFEFC4CE),
                    endIndent: 15,
                  ),
                ),
                Text(
                  'A sorte escolhe o mimo. 💕',
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFFB85C75),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Color(0xFFEFC4CE),
                    indent: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



class RoletaPainter extends CustomPainter {
  final List<String> premios;

  RoletaPainter({
    required this.premios,
  });

  final List<Color> cores = const [
    Color(0xFFD65372),
    Color(0xFFF3A6B7),
    Color(0xFFE97A91),
    Color(0xFFFFC5D0),
    Color(0xFFBF657B),
    Color(0xFFF09AAF),
    Color(0xFFD86C83),
    Color(0xFFFFB6C5),
    Color(0xFFC95872),
    Color(0xFFF28DA5),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final centro = Offset(
      size.width / 2,
      size.height / 2,
    );

    final raio = size.width / 2;

    final anguloSetor =
        (2 * pi) / premios.length;

    final rect = Rect.fromCircle(
      center: centro,
      radius: raio,
    );

    for (int i = 0; i < premios.length; i++) {
      final inicio =
          -pi / 2 + (i * anguloSetor);

      final paint = Paint()
        ..color = cores[i % cores.length]
        ..style = PaintingStyle.fill;

      canvas.drawArc(
        rect,
        inicio,
        anguloSetor,
        true,
        paint,
      );

     
      final linhaPaint = Paint()
        ..color = Colors.white.withValues(alpha: 0.8)
        ..strokeWidth = 2;

      final anguloLinha = inicio;

      canvas.drawLine(
        centro,
        Offset(
          centro.dx +
              raio * cos(anguloLinha),
          centro.dy +
              raio * sin(anguloLinha),
        ),
        linhaPaint,
      );

   
      canvas.save();

      canvas.translate(
        centro.dx,
        centro.dy,
      );

      canvas.rotate(
        inicio + anguloSetor / 2,
      );

      final textPainter = TextPainter(
        text: TextSpan(
          text: premios[i],
          style: TextStyle(
            color: Colors.white,
            fontSize: size.width < 350
                ? 10
                : 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        maxLines: 2,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout(
        maxWidth: raio * 0.55,
      );

      textPainter.paint(
        canvas,
        Offset(
          raio * 0.38,
          -textPainter.height / 2,
        ),
      );

      canvas.restore();
    }


    final borda = Paint()
      ..color = const Color(0xFFB94C66)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    canvas.drawCircle(
      centro,
      raio - 2.5,
      borda,
    );

    
    canvas.drawCircle(
      centro,
      raio * 0.13,
      Paint()
        ..color = Colors.white,
    );

    canvas.drawCircle(
      centro,
      raio * 0.10,
      Paint()
        ..color = const Color(0xFFD65372),
    );

    final heartPainter = TextPainter(
      text: const TextSpan(
        text: '♥',
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    heartPainter.layout();

    heartPainter.paint(
      canvas,
      Offset(
        centro.dx - heartPainter.width / 2,
        centro.dy - heartPainter.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(
    covariant CustomPainter oldDelegate,
  ) {
    return false;
  }
}


class PonteiroPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();

    path.moveTo(
      size.width / 2,
      size.height,
    );

    path.lineTo(4, 5);

    path.quadraticBezierTo(
      size.width / 2,
      -3,
      size.width - 4,
      5,
    );

    path.close();

    final paint = Paint()
      ..color = const Color(0xFF8D3C52);

    canvas.drawPath(
      path,
      paint,
    );
  }

  @override
  bool shouldRepaint(
    covariant CustomPainter oldDelegate,
  ) {
    return false;
  }
}