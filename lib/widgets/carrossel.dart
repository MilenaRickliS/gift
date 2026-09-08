import 'dart:async';
import 'package:flutter/material.dart';

class Carrossel extends StatefulWidget {
  const Carrossel({super.key});

  @override
  State<Carrossel> createState() => _CarrosselState();
}

class _CarrosselState extends State<Carrossel> {
  final PageController _controller = PageController(
    viewportFraction: 0.82,
  );

  int paginaAtual = 0;
  Timer? timer;

  final List<Map<String, dynamic>> slides = [
    {
      'tipo': 'imagem',
      'conteudo': 'assets/images/foto_073.jpg',
    },
    {
      'tipo': 'frase',
      'conteudo': 'Em português: Te amo.',
    },
    {
      'tipo': 'imagem',
      'conteudo': 'assets/images/foto_066.jpg',
    },
    {
      'tipo': 'frase',
      'conteudo': 'Em Doutor Estranho: Eu te amo em todos os universos.',
    },
    {
      'tipo': 'imagem',
      'conteudo': 'assets/images/foto_089.jpg',
    },
    {
      'tipo': 'frase',
      'conteudo': 'Em Os Incríveis: Você é minha maior aventura.',
    },
    {
      'tipo': 'imagem',
      'conteudo': 'assets/images/foto_108.jpg',
    },
    {
      'tipo': 'frase',
      'conteudo': 'Em Vigadores Ultimato: Te amo Mil Milhões.',
    },
    {
      'tipo': 'imagem',
      'conteudo': 'assets/images/foto_130.jpg',
    },
    {
      'tipo': 'frase',
      'conteudo': 'Em Thor: Você me tornou digno.',
    },
    {
      'tipo': 'imagem',
      'conteudo': 'assets/images/foto_175.jpg',
    },
    {
      'tipo': 'frase',
      'conteudo': 'Em Vingadores: Guerra Infinita: Só consigo sentir você.',
    },
    {
      'tipo': 'imagem',
      'conteudo': 'assets/images/foto_095.jpg',
    },
    {
      'tipo': 'frase',
      'conteudo': 'Em a Princesa e o Sapo: Meu sonho não estaria completo sem você.',
    },
    {
      'tipo': 'imagem',
      'conteudo': 'assets/images/foto_109.jpg',
    },
    {
      'tipo': 'frase',
      'conteudo': 'Em Enrolados: Daqui posso ver que é aqui que devo estar.',
    },
    {
      'tipo': 'imagem',
      'conteudo': 'assets/images/foto_141.jpg',
    },
    {
      'tipo': 'frase',
      'conteudo': 'Em Procurando Nemo: Quando te vejo, me sinto em casa.',
    },
    {
      'tipo': 'imagem',
      'conteudo': 'assets/images/foto_147.jpg',
    },
    {
      'tipo': 'frase',
      'conteudo': 'Em Deadpool: As suas loucuras combinam com as minhas.',
    },
  ];

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
      const Duration(seconds: 4),
      (_) {
        if (!_controller.hasClients || slides.isEmpty) return;

        paginaAtual++;

        if (paginaAtual >= slides.length) {
          paginaAtual = 0;
        }

        _controller.animateToPage(
          paginaAtual,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOutCubic,
        );
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: mobile ? 45 : 70,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFFFFF1F3),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  'Diferentes formas de dizer: eu te amo ❤️',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5C3946),
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  'Porque às vezes um simples "eu te amo" não é suficiente para explicar tudo o que eu sinto por você.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: Color(0xFF8A6572),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 35),

          SizedBox(
            height: mobile ? 310 : 430,
            child: PageView.builder(
              controller: _controller,
              itemCount: slides.length,
              onPageChanged: (index) {
                setState(() {
                  paginaAtual = index;
                });
              },
              itemBuilder: (context, index) {
                final slide = slides[index];
                final bool ehImagem = slide['tipo'] == 'imagem';

                return AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    double scale = 1;

                    if (_controller.position.haveDimensions) {
                      final page =
                          _controller.page ?? paginaAtual.toDouble();

                      scale = (1 - ((page - index).abs() * 0.12))
                          .clamp(0.88, 1.0);
                    }

                    return Transform.scale(
                      scale: scale,
                      child: child,
                    );
                  },

                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),

                      gradient: ehImagem
                          ? null
                          : const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFFFE4EA),
                                Color(0xFFFFF8F8),
                                Color(0xFFFAD1DB),
                              ],
                            ),

                      color: ehImagem ? Colors.white : null,

                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x25000000),
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),

                      child: ehImagem

                         
                          ? Image.asset(
                              slide['conteudo'],
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            )

                          
                          : Padding(
                              padding: EdgeInsets.all(
                                mobile ? 30 : 55,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.favorite,
                                    color: Color(0xFFC9536B),
                                    size: 38,
                                  ),

                                  const SizedBox(height: 25),

                                  Text(
                                    slide['conteudo'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: mobile ? 21 : 28,
                                      height: 1.5,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.italic,
                                      color: const Color(0xFF5C3946),
                                    ),
                                  ),

                             

                                  
                                ],
                              ),
                            ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

         
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              slides.length,
              (index) {
                final selecionado = paginaAtual == index;

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: selecionado ? 22 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: selecionado
                        ? const Color(0xFFC9536B)
                        : const Color(0xFFE3B7C0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}