import 'dart:math';
import 'package:flutter/material.dart';

class TesteAmor extends StatefulWidget {
  const TesteAmor({super.key});

  @override
  State<TesteAmor> createState() => _TesteAmorState();
}

class _TesteAmorState extends State<TesteAmor>
    with TickerProviderStateMixin {
  final Random _random = Random();

  double naoLeft = 0;
  double naoTop = 0;

  int tentativas = 0;
  bool iniciou = false;
  bool desistiuDoNao = false;
  bool clicouSim = false;

  late AnimationController _coracoesController;
  late AnimationController _simController;

  late Animation<double> _simScale;

  @override
  void initState() {
    super.initState();

    _coracoesController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _simController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _simScale = Tween<double>(
      begin: 1,
      end: 1.08,
    ).animate(
      CurvedAnimation(
        parent: _simController,
        curve: Curves.easeOutBack,
      ),
    );
  }

  @override
  void dispose() {
    _coracoesController.dispose();
    _simController.dispose();
    super.dispose();
  }

  void _fugir(
    BoxConstraints constraints,
    bool mobile,
  ) {
    if (clicouSim || desistiuDoNao) return;

    final larguraBotao = mobile ? 105.0 : 125.0;
    const alturaBotao = 55.0;

    final maxX = max(
      0.0,
      constraints.maxWidth - larguraBotao,
    );

    final maxY = max(
      0.0,
      constraints.maxHeight - alturaBotao,
    );

    double novoX;
    double novoY;

   
    do {
      novoX = _random.nextDouble() * maxX;
      novoY = _random.nextDouble() * maxY;
    } while (
        iniciou &&
        (novoX - naoLeft).abs() < 60 &&
        (novoY - naoTop).abs() < 45);

    setState(() {
      iniciou = true;
      tentativas++;

      naoLeft = novoX;
      naoTop = novoY;

    
      if (tentativas >= 6) {
        desistiuDoNao = true;
      }
    });

    if (tentativas >= 6) {
      _simController.forward();
    }
  }

  void _aceitou() {
    if (clicouSim) return;

    setState(() {
      clicouSim = true;
    });

    _coracoesController.forward(from: 0);
  }

  void _reiniciar() {
    _coracoesController.reset();
    _simController.reset();

    setState(() {
      naoLeft = 0;
      naoTop = 0;
      tentativas = 0;
      iniciou = false;
      desistiuDoNao = false;
      clicouSim = false;
    });
  }

  String get gifAtual {
  if (clicouSim) {
    return 'assets/images/sim.gif';
  }

  if (desistiuDoNao) {
    return 'assets/images/talvez.gif';
  }

  return 'assets/images/nao.gif';
}

  @override
  Widget build(BuildContext context) {
    final larguraTela = MediaQuery.of(context).size.width;
    final mobile = larguraTela < 800;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 18 : 60,
        vertical: mobile ? 30 : 50,
      ),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 750,
        ),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: mobile ? 20 : 45,
          vertical: mobile ? 35 : 50,
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
           

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFFEEF2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                'O TESTE DEFINITIVO',
                style: TextStyle(
                  fontSize: 12,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD65372),
                ),
              ),
            ),

            const SizedBox(height: 18),

            Text(
              clicouSim
                  ? 'Eu sabia! ❤️'
                  : 'Você me ama? 🥺',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: mobile ? 30 : 37,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF5C3946),
              ),
            ),

            const SizedBox(height: 12),

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              child: Text(
                _mensagem(),
                key: ValueKey(
                  '$tentativas-$clicouSim-$desistiuDoNao',
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: mobile ? 15 : 16,
                  height: 1.5,
                  color: const Color(0xFF8B6875),
                ),
              ),
            ),

            const SizedBox(height: 25),

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(
                    scale: Tween<double>(
                      begin: 0.9,
                      end: 1.0,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: ClipRRect(
                key: ValueKey(clicouSim),
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  gifAtual,
                  width: mobile ? 220 : 280,
                  height: mobile ? 180 : 220,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 25),

           

            if (!clicouSim)
              LayoutBuilder(
                builder: (context, constraintsExternas) {
                  return Container(
                    height: mobile ? 260 : 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFAFB),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: const Color(0xFFFFE4E9),
                      ),
                    ),
                    child: LayoutBuilder(
                      builder: (context, area) {
                        final larguraSim = desistiuDoNao
                            ? area.maxWidth - 40
                            : (mobile ? 105.0 : 125.0);

                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                           

                            AnimatedPositioned(
                              duration:
                                  const Duration(milliseconds: 500),
                              curve: Curves.easeOutBack,
                              left: desistiuDoNao
                                  ? 20
                                  : mobile
                                      ? 25
                                      : 80,
                              bottom: desistiuDoNao
                                  ? 85
                                  : mobile
                                      ? 30
                                      : 40,
                              child: ScaleTransition(
                                scale: _simScale,
                                child: AnimatedContainer(
                                  duration:
                                      const Duration(milliseconds: 500),
                                  curve: Curves.easeOutBack,
                                  width: larguraSim,
                                  height:
                                      desistiuDoNao ? 75 : 55,
                                  child: ElevatedButton(
                                    onPressed: _aceitou,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color(0xFFD65372),
                                      foregroundColor: Colors.white,
                                      elevation: 7,
                                      shadowColor:
                                          const Color(0x55D65372),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40),
                                      ),
                                    ),
                                    child: Text(
                                      desistiuDoNao
                                          ? '❤️ SIM, EU TE AMO! ❤️'
                                          : '❤️ SIM',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: desistiuDoNao
                                            ? mobile
                                                ? 17
                                                : 20
                                            : 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          

                            if (!desistiuDoNao)
                              AnimatedPositioned(
                                duration:
                                    const Duration(milliseconds: 260),
                                curve: Curves.easeOut,
                                left: iniciou
                                    ? naoLeft
                                    : area.maxWidth -
                                        (mobile ? 130 : 205),
                                top: iniciou
                                    ? naoTop
                                    : area.maxHeight -
                                        (mobile ? 85 : 95),
                                child: MouseRegion(
                                  onEnter: (_) {
                                    _fugir(area, mobile);
                                  },
                                  child: GestureDetector(
                                    onTapDown: (_) {
                                     
                                      _fugir(area, mobile);
                                    },
                                    child: Container(
                                      width: mobile ? 105 : 125,
                                      height: 55,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color:
                                            const Color(0xFFF4F4F4),
                                        borderRadius:
                                            BorderRadius.circular(30),
                                        border: Border.all(
                                          color:
                                              const Color(0xFFD8D8D8),
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color(0x10000000),
                                            blurRadius: 8,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: const Text(
                                        '❌ NÃO',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight:
                                              FontWeight.w600,
                                          color:
                                              Color(0xFF777777),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                           

                            if (desistiuDoNao)
                              Positioned(
                                top: 35,
                                left: 15,
                                right: 15,
                                child: TweenAnimationBuilder<double>(
                                  tween: Tween(
                                    begin: 0,
                                    end: 1,
                                  ),
                                  duration: const Duration(
                                    milliseconds: 600,
                                  ),
                                  curve: Curves.easeOutBack,
                                  builder:
                                      (context, value, child) {
                                    return Transform.scale(
                                      scale: value,
                                      child: Opacity(
                                        opacity:
                                            value.clamp(0.0, 1.0),
                                        child: child,
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Você realmente achou que eu ia deixar você clicar nisso? 😂',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF6A414E),
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),

           

            if (clicouSim)
              _ResultadoAmor(
                controller: _coracoesController,
                mobile: mobile,
              ),

            const SizedBox(height: 25),

            if (clicouSim)
              TextButton.icon(
                onPressed: _reiniciar,
                icon: const Icon(
                  Icons.refresh_rounded,
                  size: 19,
                ),
                label: const Text(
                  'Fazer o teste de novo',
                ),
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFFB85C75),
                ),
              ),

            const SizedBox(height: 15),

            const Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Color(0xFFEFC4CE),
                    endIndent: 15,
                  ),
                ),
                Text(
                  'Resultado 100% confiável',
                  style: TextStyle(
                    fontSize: 13,
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

            const SizedBox(height: 8),

            const Text(
              '♥',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFFD65372),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _mensagem() {
    if (clicouSim) {
      return 'Não tinha nem outra resposta possível. 🥰';
    }

    if (desistiuDoNao) {
      return 'Acho que agora ficou bem mais fácil escolher... 👀';
    }

    if (tentativas == 0) {
      return 'Escolha com muita atenção... sua resposta será analisada cuidadosamente. 👀';
    }

    if (tentativas == 1) {
      return 'Hmm... o que você estava tentando fazer? 🤨';
    }

    if (tentativas == 2) {
      return 'Não adianta correr atrás dele 😂';
    }

    if (tentativas == 3) {
      return 'Você ainda está tentando clicar no NÃO? 😳';
    }

    if (tentativas == 4) {
      return 'Desiste... esse botão não gosta de você 😂';
    }

    return 'Última tentativa... 👀';
  }
}


class _ResultadoAmor extends StatelessWidget {
  final AnimationController controller;
  final bool mobile;

  const _ResultadoAmor({
    required this.controller,
    required this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    final animacao = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutBack,
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 15 : 30,
        vertical: 40,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFAFB),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFFFFE4E9),
        ),
      ),
      child: Column(
        children: [
          FadeTransition(
            opacity: animacao,
            child: ScaleTransition(
              scale: animacao,
              child: Text(
                '🎉❤️🎉❤️🎉',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: mobile ? 38 : 52,
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          ScaleTransition(
            scale: animacao,
            child: Text(
              'EU SABIA!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: mobile ? 35 : 48,
                fontWeight: FontWeight.w900,
                color: const Color(0xFFD65372),
                letterSpacing: 1.5,
              ),
            ),
          ),

          const SizedBox(height: 15),

          FadeTransition(
            opacity: animacao,
            child: const Text(
              'Te amo também.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF6A414E),
              ),
            ),
          ),

          const SizedBox(height: 20),

          FadeTransition(
            opacity: animacao,
            child: const Text(
              '♥  ♥  ♥',
              style: TextStyle(
                color: Color(0xFFE9718B),
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}