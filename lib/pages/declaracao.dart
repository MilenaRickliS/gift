import 'package:flutter/material.dart';
import '../widgets/menu.dart';
import '../widgets/footer.dart';
import '../widgets/carrossel.dart';

class Declaracao extends StatefulWidget {
  const Declaracao({super.key});

  @override
  State<Declaracao> createState() => _DeclaracaoState();
}

class _DeclaracaoState extends State<Declaracao>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _cartaAnimation;
  late Animation<double> _tampaAnimation;

  bool aberto = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _cartaAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.35,
        1,
        curve: Curves.easeOutBack,
      ),
    );

    _tampaAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0,
        0.55,
        curve: Curves.easeInOut,
      ),
    );
  }

  void alternarCarta() {
    setState(() {
      aberto = !aberto;
    });

    if (aberto) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F8),

      drawer: mobile ? const MenuDrawer() : null,

      body: Column(
        children: [
          const Menu(),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: mobile ? 20 : 40,
                      vertical: mobile ? 45 : 70,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Uma carta para você ❤️',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5C3946),
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          aberto
                              ? 'Tem coisas que eu nunca quero deixar de te dizer...'
                              : 'Clique no envelope para abrir',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF8A6572),
                          ),
                        ),

                        AnimatedContainer(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeInOut,
                          height: aberto
                              ? (mobile ? 160 : 140)
                              : 70,
                        ),

                        GestureDetector(
                          onTap: alternarCarta,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeInOut,
                            width: mobile ? 330 : 430,

                           
                            height: aberto
                                ? (mobile ? 900 : 930)
                                : 330,

                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              clipBehavior: Clip.none,
                              children: [
                                
                                AnimatedBuilder(
                                  animation: _cartaAnimation,
                                  builder: (context, child) {
                                    final value = _cartaAnimation.value;

                                    return Positioned(
                                      bottom: 40 + (value * 180),
                                      child: Opacity(
                                        opacity: value.clamp(0.0, 1.0),
                                        child: Transform.scale(
                                          scale: 0.92 + (value * 0.08),
                                          child: child,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: mobile ? 315 : 365,
                                    constraints: const BoxConstraints(
                                      minHeight: 360,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: mobile ? 18 : 35,
                                      vertical: mobile ? 24 : 32,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFFEFC),
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x22000000),
                                          blurRadius: 18,
                                          offset: Offset(0, 8),
                                        ),
                                      ],
                                    ),
                                    child: const _CartaTexto(),
                                  ),
                                ),

                              
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    width: mobile ? 330 : 430,
                                    height: 220,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE9A8B5),
                                      borderRadius: BorderRadius.circular(14),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x22000000),
                                          blurRadius: 16,
                                          offset: Offset(0, 8),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                               
                                Positioned(
                                  bottom: 110,
                                  child: AnimatedBuilder(
                                    animation: _tampaAnimation,
                                    builder: (context, child) {
                                      return Transform(
                                        alignment: Alignment.bottomCenter,
                                        transform: Matrix4.identity()
                                          ..setEntry(3, 2, 0.001)
                                          ..rotateX(
                                            _tampaAnimation.value * 3.14159,
                                          ),
                                        child: child,
                                      );
                                    },
                                    child: ClipPath(
                                      clipper: TampaEnvelopeClipper(),
                                      child: Container(
                                        width: mobile ? 330 : 430,
                                        height: 130,
                                        color: const Color(0xFFF3BBC6),
                                      ),
                                    ),
                                  ),
                                ),

                               
                                Positioned(
                                  bottom: 0,
                                  child: ClipPath(
                                    clipper: FrenteEnvelopeClipper(),
                                    child: Container(
                                      width: mobile ? 330 : 430,
                                      height: 220,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFFF5C1CB),
                                            Color(0xFFE99CAC),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                              
                                Positioned(
                                  bottom: 83,
                                  child: AnimatedOpacity(
                                    duration:
                                        const Duration(milliseconds: 300),
                                    opacity: aberto ? 0 : 1,
                                    child: Container(
                                      width: 52,
                                      height: 52,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFC9536B),
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x33000000),
                                            blurRadius: 8,
                                          ),
                                        ],
                                      ),
                                      child: const Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                        size: 27,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 40),

                        TextButton.icon(
                          onPressed: alternarCarta,
                          icon: Icon(
                            aberto
                                ? Icons.favorite
                                : Icons.mark_email_unread_rounded,
                            color: const Color(0xFFC9536B),
                          ),
                          label: Text(
                            aberto ? 'Fechar carta' : 'Abrir minha carta',
                            style: const TextStyle(
                              color: Color(0xFFC9536B),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                       
                        SizedBox(
                          height: aberto ? 80 : 40,
                        ),
                      ],
                    ),
                  ),

                  const Carrossel(),

                 
                  const Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CartaTexto extends StatelessWidget {
  const _CartaTexto();

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Meu amor,',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF5C3946),
          ),
        ),

        SizedBox(height: 22),

        Text(
          'Se eu pudesse voltar no tempo e escolher novamente, '
          'eu escolheria você em cada uma das vezes.\n\n'
          'Escolheria nossas conversas, nossas risadas, nossos momentos '
          'bobos, nossas dificuldades e todas as coisas que fizeram '
          'a nossa história chegar até aqui.\n\n'
          'Você se tornou muito mais do que o amor da minha vida. '
          'Você é minha companhia, meu parceiro, minha família e a pessoa '
          'com quem eu quero dividir todos os capítulos que ainda estão '
          'por vir.\n\n'
          'Obrigada por cada abraço, cada cuidado, cada momento e por '
          'construir essa vida ao meu lado.\n\n'
          'Eu amo quem nós fomos, amo quem somos hoje e, principalmente, '
          'amo imaginar tudo aquilo que ainda vamos viver juntos.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            height: 1.7,
            color: Color(0xFF704F5B),
          ),
        ),

        SizedBox(height: 25),

        Icon(
          Icons.favorite,
          color: Color(0xFFC9536B),
          size: 25,
        ),

        SizedBox(height: 12),

        Text(
          'Eu te amo. Hoje, amanhã e em todos os nossos próximos capítulos.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            height: 1.5,
            color: Color(0xFF5C3946),
          ),
        ),

        SizedBox(height: 20),

        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Com todo o meu amor, ❤️',
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: Color(0xFFC9536B),
            ),
          ),
        ),
      ],
    );
  }
}


class TampaEnvelopeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


class FrenteEnvelopeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width / 2, size.height * 0.55);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}