import 'package:flutter/material.dart';

class CacaPalavrasAmor extends StatefulWidget {
  const CacaPalavrasAmor({super.key});

  @override
  State<CacaPalavrasAmor> createState() => _CacaPalavrasAmorState();
}

class _CacaPalavrasAmorState extends State<CacaPalavrasAmor> {
  final List<List<String>> cacaPalavras = [
    ['A', 'M', 'O', 'R', 'X', 'B', 'Q', 'L'],
    ['P', 'T', 'V', 'C', 'E', 'E', 'I', 'V'],
    ['A', 'B', 'R', 'A', 'Ç', 'O', 'J', 'I'],
    ['I', 'U', 'Z', 'S', 'O', 'P', 'K', 'D'],
    ['X', 'B', 'E', 'I', 'J', 'O', 'M', 'A'],
    ['N', 'O', 'S', 'T', 'U', 'R', 'A', 'D'],
    ['Q', 'W', 'P', 'A', 'I', 'X', 'A', 'O'],
    ['F', 'G', 'H', 'J', 'K', 'L', 'M', 'N'],
  ];

  final List<String> palavrasAmor = [
    'AMOR',
    'BEIJO',
    'ABRAÇO',
    'PAIXAO',
    'VIDA',
    'NOS',
  ];

  final Set<String> letrasSelecionadas = {};
  final Set<String> palavrasEncontradas = {};

  final Map<String, List<String>> posicoesPalavras = {
    // HORIZONTAL →
    'AMOR': [
      '0-0',
      '0-1',
      '0-2',
      '0-3',
    ],

    // HORIZONTAL →
    'ABRAÇO': [
      '2-0',
      '2-1',
      '2-2',
      '2-3',
      '2-4',
      '2-5',
    ],

    // HORIZONTAL →
    'BEIJO': [
      '4-1',
      '4-2',
      '4-3',
      '4-4',
      '4-5',
    ],

    // HORIZONTAL →
    'NOS': [
      '5-0',
      '5-1',
      '5-2',
    ],

    // HORIZONTAL →
    'PAIXAO': [
      '6-2',
      '6-3',
      '6-4',
      '6-5',
      '6-6',
      '6-7',
    ],

    // VERTICAL ↓
    'VIDA': [
      '1-7',
      '2-7',
      '3-7',
      '4-7',
    ],
  };

  void selecionarLetra(int linha, int coluna) {
    final chave = '$linha-$coluna';

    setState(() {
      if (letrasSelecionadas.contains(chave)) {
        letrasSelecionadas.remove(chave);
      } else {
        letrasSelecionadas.add(chave);
      }

      verificarPalavras();
    });
  }

  void verificarPalavras() {
    palavrasEncontradas.clear();

    posicoesPalavras.forEach((palavra, letras) {
      final encontrou = letras.every(
        (posicao) => letrasSelecionadas.contains(posicao),
      );

      if (encontrou) {
        palavrasEncontradas.add(palavra);
      }
    });
  }

  void limparCacaPalavras() {
    setState(() {
      letrasSelecionadas.clear();
      palavrasEncontradas.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 800;

    return Container(
      constraints: const BoxConstraints(
        maxWidth: 650,
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 18 : 35,
        vertical: mobile ? 28 : 35,
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
            'Caça-palavras do amor 💕',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5C3946),
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Encontre as palavrinhas escondidas que fazem parte da nossa história.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
              color: Color(0xFF8B6875),
            ),
          ),

          const SizedBox(height: 25),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: palavrasAmor.map((palavra) {
              final encontrada =
                  palavrasEncontradas.contains(palavra);

              return AnimatedContainer(
                duration: const Duration(
                  milliseconds: 250,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: encontrada
                      ? const Color(0xFFD65372)
                      : const Color(0xFFFFF1F4),
                  borderRadius:
                      BorderRadius.circular(20),
                  border: Border.all(
                    color: encontrada
                        ? const Color(0xFFD65372)
                        : const Color(0xFFF2B9C5),
                  ),
                ),
                child: Text(
                  encontrada
                      ? '✓ $palavra'
                      : palavra,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: encontrada
                        ? Colors.white
                        : const Color(0xFFB85C75),
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 30),

          LayoutBuilder(
            builder: (context, constraints) {
              final tamanho =
                  (constraints.maxWidth / 8) - 5;

              return Column(
                children: List.generate(
                  cacaPalavras.length,
                  (linha) {
                    return Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: List.generate(
                        cacaPalavras[linha].length,
                        (coluna) {
                          final chave =
                              '$linha-$coluna';

                          final selecionada =
                              letrasSelecionadas
                                  .contains(chave);

                          return GestureDetector(
                            onTap: () =>
                                selecionarLetra(
                              linha,
                              coluna,
                            ),
                            child:
                                AnimatedContainer(
                              duration:
                                  const Duration(
                                milliseconds: 200,
                              ),
                              width: tamanho,
                              height: tamanho,
                              margin:
                                  const EdgeInsets.all(
                                2.5,
                              ),
                              decoration:
                                  BoxDecoration(
                                color: selecionada
                                    ? const Color(
                                        0xFFD65372,
                                      )
                                    : const Color(
                                        0xFFFFF4F6,
                                      ),
                                borderRadius:
                                    BorderRadius.circular(
                                  10,
                                ),
                                border: Border.all(
                                  color: selecionada
                                      ? const Color(
                                          0xFFD65372,
                                        )
                                      : const Color(
                                          0xFFFFD8E0,
                                        ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  cacaPalavras[linha]
                                      [coluna],
                                  style: TextStyle(
                                    fontSize:
                                        mobile
                                            ? 15
                                            : 18,
                                    fontWeight:
                                        FontWeight.bold,
                                    color:
                                        selecionada
                                            ? Colors.white
                                            : const Color(
                                                0xFF6A414E,
                                              ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            },
          ),

          const SizedBox(height: 25),

          if (palavrasEncontradas.length ==
              palavrasAmor.length)
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color:
                    const Color(0xFFFFF1F4),
                borderRadius:
                    BorderRadius.circular(18),
                border: Border.all(
                  color:
                      const Color(0xFFF1BAC6),
                ),
              ),
              child: const Column(
                children: [
                  Text(
                    '💗',
                    style:
                        TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Você encontrou todas!',
                    textAlign:
                        TextAlign.center,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight:
                          FontWeight.bold,
                      color:
                          Color(0xFF5C3946),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Mas a minha palavra favorita ainda é: nós.',
                    textAlign:
                        TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          Color(0xFF8B6875),
                    ),
                  ),
                ],
              ),
            ),

          const SizedBox(height: 18),

          Text(
            '${palavrasEncontradas.length} de ${palavrasAmor.length} encontradas',
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFFB85C75),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 15),

          TextButton.icon(
            onPressed: letrasSelecionadas.isEmpty
                ? null
                : limparCacaPalavras,
            icon: const Icon(
              Icons.refresh_rounded,
              size: 19,
            ),
            label: const Text(
              'Limpar caça-palavras',
            ),
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFFB85C75),
              disabledForegroundColor:
                  const Color(0xFFD7B9C0),
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(
                  color: Color(0xFFF2B9C5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}