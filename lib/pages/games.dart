import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/menu.dart';
import '../widgets/footer.dart';
import '../widgets/caca_palavras_amor.dart';
import '../widgets/roleta_presentes.dart';
import '../widgets/teste_amor.dart';

class Games extends StatefulWidget {
  const Games({super.key});

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  List<String> motivos = [];
  String? motivoSorteado;

  bool carregando = true;

  @override
  void initState() {
    super.initState();
    carregarMotivos();
  }

  Future<void> carregarMotivos() async {
    final jsonString = await rootBundle.loadString(
      'assets/data/motivos_amor.json',
    );

    final List<dynamic> dados = json.decode(jsonString);

    if (!mounted) return;

    setState(() {
      motivos = dados.cast<String>();
      carregando = false;
    });
  }

  void sortearMotivo() {
    if (motivos.isEmpty) return;

    final random = Random();
    final indice = random.nextInt(motivos.length);

    setState(() {
      motivoSorteado = motivos[indice];
    });
  }

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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: mobile ? 18 : 60,
                      vertical: mobile ? 35 : 55,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Nosso cantinho ❤️',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5C3946),
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          'Um espaço só nosso para guardar carinho, memórias e um pouquinho de diversão.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF8B6875),
                            height: 1.5,
                          ),
                        ),

                        const SizedBox(height: 45),
        
                        // CARD 365 MOTIVOS                      
                        Container(
                          constraints: const BoxConstraints(
                            maxWidth: 650,
                          ),
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: mobile ? 18 : 40,
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
                                '365 motivos para eu te amar',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF5C3946),
                                ),
                              ),

                              const SizedBox(height: 10),

                              const Text(
                                'Clique no botão e tire um motivo do nosso potinho 💗',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF8B6875),
                                  height: 1.5,
                                ),
                              ),

                              const SizedBox(height: 25),

                              SizedBox(
                                width: mobile ? double.infinity : 280,
                                height: 55,
                                child: ElevatedButton.icon(
                                  onPressed:
                                      carregando ? null : sortearMotivo,
                                  icon: const Icon(
                                    Icons.favorite_rounded,
                                    size: 21,
                                  ),
                                  label: Text(
                                    motivoSorteado == null
                                        ? 'Tirar um motivo'
                                        : 'Tirar outro motivo',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color(0xFFD65372),
                                    foregroundColor: Colors.white,
                                    disabledBackgroundColor:
                                        const Color(0xFFF0BCC8),
                                    elevation: 6,
                                    shadowColor:
                                        const Color(0x55D65372),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 25),

                             
                              SizedBox(
                                width: double.infinity,
                                height: motivoSorteado == null
                                    ? (mobile ? 330 : 390)
                                    : (mobile ? 480 : 530),
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  clipBehavior: Clip.none,
                                  children: [
                                    
                                    if (motivoSorteado != null)
                                      Positioned(
                                        top: 5,
                                        left: mobile ? 5 : 80,
                                        right: mobile ? 5 : 80,
                                        child: AnimatedSwitcher(
                                          duration: const Duration(
                                            milliseconds: 450,
                                          ),
                                          transitionBuilder:
                                              (child, animation) {
                                            final slide = Tween<Offset>(
                                              begin: const Offset(
                                                0,
                                                0.4,
                                              ),
                                              end: Offset.zero,
                                            ).animate(
                                              CurvedAnimation(
                                                parent: animation,
                                                curve: Curves.easeOutBack,
                                              ),
                                            );

                                            return FadeTransition(
                                              opacity: animation,
                                              child: SlideTransition(
                                                position: slide,
                                                child: child,
                                              ),
                                            );
                                          },
                                          child: Transform.rotate(
                                            key: ValueKey(
                                              motivoSorteado,
                                            ),
                                            angle: -0.025,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 24,
                                                vertical: 25,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    const Color(0xFFFFFBF7),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                  color:
                                                      const Color(0xFFE7CBC4),
                                                ),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color:
                                                        Color(0x20000000),
                                                    blurRadius: 12,
                                                    offset: Offset(0, 6),
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    '💌',
                                                    style: TextStyle(
                                                      fontSize: 28,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    motivoSorteado!,
                                                    textAlign:
                                                        TextAlign.center,
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          Color(0xFF6A414E),
                                                    ),
                                                  ),
                                                
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                 
                                    Positioned(
                                      left: mobile ? 12 : 60,
                                      top: motivoSorteado == null
                                          ? 40
                                          : 190,
                                      child: const Text(
                                        '♡',
                                        style: TextStyle(
                                          fontSize: 35,
                                          color: Color(0xFFE9718B),
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      right: mobile ? 15 : 65,
                                      top: motivoSorteado == null
                                          ? 65
                                          : 210,
                                      child: const Text(
                                        '♥',
                                        style: TextStyle(
                                          fontSize: 31,
                                          color: Color(0xFFE9718B),
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      left: mobile ? 60 : 140,
                                      top: motivoSorteado == null
                                          ? 100
                                          : 235,
                                      child: const Text(
                                        '♥',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xFFF2A2B3),
                                        ),
                                      ),
                                    ),

                                 
                                    Positioned(
                                      bottom: 0,
                                      child: AnimatedContainer(
                                        duration: const Duration(
                                          milliseconds: 400,
                                        ),
                                        width: mobile ? 260 : 320,
                                        child: Image.asset(
                                          'assets/images/potinho.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 10),

                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Divider(
                                      color: Color(0xFFEFC4CE),
                                      endIndent: 15,
                                    ),
                                  ),
                                  Text(
                                    'Pequenos motivos, um grande amor.',
                                    textAlign: TextAlign.center,
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

                        const SizedBox(height: 70),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  //caca palavras
                  const CacaPalavrasAmor(),
                  const SizedBox(height: 40),
                  //roleta
                  const RoletaPresentes(),
                  const SizedBox(height: 40),
                  // Teste definitivo
                  const TesteAmor(),
                  const SizedBox(height: 70),

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