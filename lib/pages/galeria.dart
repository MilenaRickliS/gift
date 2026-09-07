import 'package:flutter/material.dart';

import '../widgets/menu.dart';
import '../widgets/footer.dart';

class Galeria extends StatelessWidget {
  const Galeria({super.key});

  static const List<String> fotos = [
  'assets/images/foto_001.png',
  'assets/images/foto_002.jpg',
  'assets/images/foto_003.jpg',
  'assets/images/foto_004.jpg',
  'assets/images/foto_005.jpg',
  'assets/images/foto_006.jpg',
  'assets/images/foto_007.jpg',
  'assets/images/foto_008.jpg',
  'assets/images/foto_009.jpg',
  'assets/images/foto_010.jpg',
  'assets/images/foto_011.jpg',
  'assets/images/foto_012.jpg',
  'assets/images/foto_013.jpg',
  'assets/images/foto_014.jpg',
  'assets/images/foto_015.jpg',
  'assets/images/foto_016.jpg',
  'assets/images/foto_017.jpg',
  'assets/images/foto_018.jpg',
  'assets/images/foto_019.jpg',
  'assets/images/foto_020.jpg',
  'assets/images/foto_021.jpg',
  'assets/images/foto_022.jpg',
  'assets/images/foto_023.jpg',
  'assets/images/foto_024.jpg',
  'assets/images/foto_025.jpg',
  'assets/images/foto_026.jpg',
  'assets/images/foto_027.jpg',
  'assets/images/foto_028.jpg',
  'assets/images/foto_029.jpg',
  'assets/images/foto_030.jpg',
  'assets/images/foto_031.jpg',
  'assets/images/foto_032.jpg',
  'assets/images/foto_033.jpg',
  'assets/images/foto_034.jpg',
  'assets/images/foto_035.jpg',
  'assets/images/foto_036.jpg',
  'assets/images/foto_037.jpg',
  'assets/images/foto_038.jpg',
  'assets/images/foto_039.jpg',
  'assets/images/foto_040.jpg',
  'assets/images/foto_041.jpg',
  'assets/images/foto_042.jpg',
  'assets/images/foto_043.jpg',
  'assets/images/foto_044.jpg',
  'assets/images/foto_045.jpg',
  'assets/images/foto_046.jpg',
  'assets/images/foto_047.jpg',
  'assets/images/foto_048.png',
  'assets/images/foto_049.png',
  'assets/images/foto_050.png',
  'assets/images/foto_051.jpg',
  'assets/images/foto_052.jpg',
  'assets/images/foto_053.jpg',
  'assets/images/foto_054.jpg',
  'assets/images/foto_055.jpg',
  'assets/images/foto_056.jpg',
  'assets/images/foto_057.jpg',
  'assets/images/foto_058.jpg',
  'assets/images/foto_059.jpg',
  'assets/images/foto_060.jpg',
  'assets/images/foto_061.jpg',
  'assets/images/foto_062.jpg',
  'assets/images/foto_063.jpg',
  'assets/images/foto_064.jpg',
  'assets/images/foto_065.jpg',
  'assets/images/foto_066.jpg',
  'assets/images/foto_067.jpg',
  'assets/images/foto_068.jpg',
  'assets/images/foto_069.jpg',
  'assets/images/foto_070.jpg',
  'assets/images/foto_071.jpg',
  'assets/images/foto_072.jpg',
  'assets/images/foto_073.jpg',
  'assets/images/foto_074.jpg',
  'assets/images/foto_075.jpg',
  'assets/images/foto_076.jpg',
  'assets/images/foto_077.jpg',
  'assets/images/foto_078.jpg',
  'assets/images/foto_079.jpg',
  'assets/images/foto_080.jpg',
  'assets/images/foto_081.jpg',
  'assets/images/foto_082.jpg',
  'assets/images/foto_083.jpg',
  'assets/images/foto_084.jpg',
  'assets/images/foto_085.png',
  'assets/images/foto_086.png',
  'assets/images/foto_087.png',
  'assets/images/foto_088.jpeg',
  'assets/images/foto_089.jpg',
  'assets/images/foto_090.jpg',
  'assets/images/foto_091.jpg',
  'assets/images/foto_092.jpg',
  'assets/images/foto_093.jpg',
  'assets/images/foto_094.png',
  'assets/images/foto_095.jpg',
  'assets/images/foto_096.jpg',
  'assets/images/foto_097.jpg',
  'assets/images/foto_098.jpg',
  'assets/images/foto_099.jpg',
  'assets/images/foto_100.jpg',
  'assets/images/foto_101.jpg',
  'assets/images/foto_102.jpg',
  'assets/images/foto_103.jpg',
  'assets/images/foto_104.jpg',
  'assets/images/foto_105.jpg',
  'assets/images/foto_106.jpg',
  'assets/images/foto_107.jpg',
  'assets/images/foto_108.jpg',
  'assets/images/foto_109.jpg',
  'assets/images/foto_110.jpg',
  'assets/images/foto_111.jpg',
  'assets/images/foto_112.jpg',
  'assets/images/foto_113.jpg',
  'assets/images/foto_114.jpg',
  'assets/images/foto_115.jpg',
  'assets/images/foto_116.jpg',
  'assets/images/foto_117.jpg',
  'assets/images/foto_118.jpg',
  'assets/images/foto_119.jpg',
  'assets/images/foto_120.jpg',
  'assets/images/foto_121.jpg',
  'assets/images/foto_122.jpg',
  'assets/images/foto_123.jpg',
  'assets/images/foto_124.jpg',
  'assets/images/foto_125.jpg',
  'assets/images/foto_126.jpg',
  'assets/images/foto_127.jpg',
  'assets/images/foto_128.jpg',
  'assets/images/foto_129.jpg',
  'assets/images/foto_130.jpg',
  'assets/images/foto_131.jpg',
  'assets/images/foto_132.jpg',
  'assets/images/foto_133.jpg',
  'assets/images/foto_134.jpg',
  'assets/images/foto_135.jpg',
  'assets/images/foto_136.jpg',
  'assets/images/foto_137.jpg',
  'assets/images/foto_138.jpg',
  'assets/images/foto_139.jpg',
  'assets/images/foto_140.jpg',
  'assets/images/foto_141.jpg',
  'assets/images/foto_142.jpg',
  'assets/images/foto_143.jpg',
  'assets/images/foto_144.jpg',
  'assets/images/foto_145.jpg',
  'assets/images/foto_146.jpg',
  'assets/images/foto_147.jpg',
  'assets/images/foto_148.jpg',
  'assets/images/foto_149.jpg',
  'assets/images/foto_150.jpg',
  'assets/images/foto_151.jpg',
  'assets/images/foto_152.jpg',
  'assets/images/foto_153.jpg',
  'assets/images/foto_154.jpg',
  'assets/images/foto_155.jpg',
  'assets/images/foto_156.jpg',
  'assets/images/foto_157.jpg',
  'assets/images/foto_158.jpg',
  'assets/images/foto_159.jpg',
  'assets/images/foto_160.jpg',
  'assets/images/foto_161.jpg',
  'assets/images/foto_162.jpg',
  'assets/images/foto_163.jpg',
  'assets/images/foto_164.jpg',
  'assets/images/foto_165.png',
  'assets/images/foto_166.png',
  'assets/images/foto_167.png',
  'assets/images/foto_168.png',
  'assets/images/foto_169.png',
  'assets/images/foto_170.png',
  'assets/images/foto_171.png',
  'assets/images/foto_172.png',
  'assets/images/foto_173.png',
  'assets/images/foto_174.jpg',
  'assets/images/foto_175.jpg',
  'assets/images/foto_176.jpg',
  'assets/images/foto_177.jpg',
  'assets/images/foto_178.jpg',
  'assets/images/foto_179.jpg',
  'assets/images/foto_180.jpg',
  'assets/images/foto_181.jpg',
  'assets/images/foto_182.jpg',
  'assets/images/foto_183.jpg',
  'assets/images/foto_184.jpg',
  'assets/images/foto_185.jpg',
  'assets/images/foto_186.jpg',
  'assets/images/foto_187.jpg',
  'assets/images/foto_188.jpg',
  'assets/images/foto_189.jpg',
  'assets/images/foto_190.jpeg',
  'assets/images/foto_191.jpg',
  'assets/images/foto_192.jpg',
  'assets/images/foto_193.jpg',
  'assets/images/foto_194.png',
  'assets/images/foto_195.jpg',
];

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    final mobile = largura < 800;

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
                  const _CabecalhoGaleria(),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: mobile ? 18 : 60,
                      vertical: mobile ? 30 : 50,
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        int colunas;

                        if (constraints.maxWidth < 550) {
                          colunas = 2;
                        } else if (constraints.maxWidth < 900) {
                          colunas = 3;
                        } else if (constraints.maxWidth < 1300) {
                          colunas = 4;
                        } else {
                          colunas = 5;
                        }

                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: fotos.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: colunas,
                            crossAxisSpacing: mobile ? 10 : 18,
                            mainAxisSpacing: mobile ? 10 : 18,
                            childAspectRatio: 0.82,
                          ),
                          itemBuilder: (context, index) {
                            final foto = fotos[index];

                            return _FotoGaleria(
                              foto: foto,
                              indice: index,
                              fotos: fotos,
                            );
                          },
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

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

class _CabecalhoGaleria extends StatelessWidget {
  const _CabecalhoGaleria();

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: mobile ? 45 : 70,
      ),
      child: Column(
        children: [
          Icon(
            Icons.favorite_rounded,
            color: const Color(0xFFC98B9E),
            size: mobile ? 28 : 34,
          ),

          const SizedBox(height: 14),

          Text(
            'Nossa Galeria',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: mobile ? 30 : 42,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF5C3946),
            ),
          ),

          const SizedBox(height: 12),

          Text(
            'Alguns momentos que fizeram parte da nossa história.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: mobile ? 15 : 18,
              height: 1.5,
              color: const Color(0xFF8A6975),
            ),
          ),

          const SizedBox(height: 24),

          Container(
            width: 55,
            height: 2,
            decoration: BoxDecoration(
              color: const Color(0xFFC98B9E),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}

class _FotoGaleria extends StatefulWidget {
  final String foto;
  final int indice;
  final List<String> fotos;

  const _FotoGaleria({
    required this.foto,
    required this.indice,
    required this.fotos,
  });

  @override
  State<_FotoGaleria> createState() => _FotoGaleriaState();
}

class _FotoGaleriaState extends State<_FotoGaleria> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hover = true;
        });
      },
      onExit: (_) {
        setState(() {
          hover = false;
        });
      },
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              opaque: false,
              pageBuilder: (_, __, ___) {
                return VisualizadorGaleria(
                  fotos: widget.fotos,
                  indiceInicial: widget.indice,
                );
              },
            ),
          );
        },
        child: AnimatedScale(
          duration: const Duration(milliseconds: 200),
          scale: hover ? 1.025 : 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(
                    alpha: hover ? 0.16 : 0.08,
                  ),
                  blurRadius: hover ? 20 : 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: widget.foto,
                    child: Image.asset(
                      widget.foto,
                      fit: BoxFit.cover,
                    ),
                  ),

                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: hover ? 1 : 0,
                    child: Container(
                      color: Colors.black.withValues(alpha: 0.18),
                      child: const Center(
                        child: Icon(
                          Icons.zoom_in_rounded,
                          color: Colors.white,
                          size: 38,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class VisualizadorGaleria extends StatefulWidget {
  final List<String> fotos;
  final int indiceInicial;

  const VisualizadorGaleria({
    super.key,
    required this.fotos,
    required this.indiceInicial,
  });

  @override
  State<VisualizadorGaleria> createState() =>
      _VisualizadorGaleriaState();
}

class _VisualizadorGaleriaState
    extends State<VisualizadorGaleria> {
  late PageController controller;
  late int indiceAtual;

  @override
  void initState() {
    super.initState();

    indiceAtual = widget.indiceInicial;

    controller = PageController(
      initialPage: widget.indiceInicial,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void anterior() {
    if (indiceAtual > 0) {
      controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void proxima() {
    if (indiceAtual < widget.fotos.length - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      backgroundColor: Colors.black.withValues(alpha: 0.96),
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: controller,
              itemCount: widget.fotos.length,
              onPageChanged: (index) {
                setState(() {
                  indiceAtual = index;
                });
              },
              itemBuilder: (context, index) {
                return Center(
                  child: InteractiveViewer(
                    minScale: 1,
                    maxScale: 5,
                    panEnabled: true,
                    scaleEnabled: true,
                    child: Hero(
                      tag: widget.fotos[index],
                      child: Image.asset(
                        widget.fotos[index],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
            ),

            Positioned(
              top: 16,
              right: 16,
              child: Material(
                color: Colors.black.withValues(alpha: 0.35),
                shape: const CircleBorder(),
                child: IconButton(
                  tooltip: 'Fechar',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            if (!mobile && indiceAtual > 0)
              Positioned(
                left: 25,
                top: 0,
                bottom: 0,
                child: Center(
                  child: _BotaoNavegacao(
                    icone: Icons.chevron_left_rounded,
                    onPressed: anterior,
                  ),
                ),
              ),

            if (!mobile &&
                indiceAtual < widget.fotos.length - 1)
              Positioned(
                right: 25,
                top: 0,
                bottom: 0,
                child: Center(
                  child: _BotaoNavegacao(
                    icone: Icons.chevron_right_rounded,
                    onPressed: proxima,
                  ),
                ),
              ),

            Positioned(
              bottom: 25,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.45),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    '${indiceAtual + 1} / ${widget.fotos.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BotaoNavegacao extends StatelessWidget {
  final IconData icone;
  final VoidCallback onPressed;

  const _BotaoNavegacao({
    required this.icone,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withValues(alpha: 0.35),
      shape: const CircleBorder(),
      child: IconButton(
        onPressed: onPressed,
        iconSize: 38,
        icon: Icon(
          icone,
          color: Colors.white,
        ),
      ),
    );
  }
}