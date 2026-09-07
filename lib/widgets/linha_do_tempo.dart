import 'package:flutter/material.dart';

class LinhaDoTempo extends StatelessWidget {
  const LinhaDoTempo({super.key});

  static const List<Map<String, String>> momentos = [
    {
      'data': '09/09/2016',
      'titulo': 'O começo',
      'frase': 'O dia em que começou a nossa história...',
      'imagem': 'assets/images/foto_097.jpg',
      'icone': 'favorite',
    },
    {
      'data': '2017',
      'titulo': 'Pedido de namoro',
      'frase': 'O começo oficial da história que mudaria as nossas vidas.',
      'imagem': 'assets/images/foto_098.jpg',
      'icone': 'photo',
    },
    {
      'data': '2021',
      'titulo': 'Pedido de casamento',
      'frase': 'De namorados a noivos, com um sim para a vida inteira.',
      'imagem': 'assets/images/foto_050 - Copia.png',
      'icone': 'photo',
    },
    {
      'data': '2022',
      'titulo': 'Casamento civil',
      'frase': 'Uma nova página começou a ser escrita.',
      'imagem': 'assets/images/foto_115.jpg',
      'icone': 'photo',
    },
    {
      'data': '2022',
      'titulo': 'Fotos Pré-casamento',
      'frase': 'Um daqueles momentos que a gente gostaria de guardar para sempre.',
      'imagem': 'assets/images/foto_083.jpg',
      'icone': 'photo',
    },
    {
      'data': '09/07/2022',
      'titulo': 'Nosso Casamento',
      'frase': 'O dia em que prometemos continuar escolhendo um ao outro.',
      'imagem': 'assets/images/foto_066 - Copia.jpg',
      'icone': 'diamond',
    },
    {
      'data': '2022',
      'titulo': 'Lua de mel',
      'frase': 'Uma memória que sempre vai morar com a gente.',
      'imagem': 'assets/images/foto_172.png',
      'icone': 'photo',
    },
    {
      'data': '2023',
      'titulo': '1° Bebê - Elizabeth',
      'frase': 'Mais um capítulo inesquecível da nossa história.',
      'imagem': 'assets/images/foto_175.jpg',
      'icone': 'child',
    },
    {
      'data': '2025',
      'titulo': '2° Bebê - Joaquim',
      'frase': 'Foi aqui que mais uma lembrança bonita começou.',
      'imagem': 'assets/images/foto_130.jpg',
      'icone': 'child',
    },
    {
      'data': '29/08/2026',
      'titulo': 'Formatura',
      'frase': 'E seguimos colecionando momentos juntos.',
      'imagem': 'assets/images/foto_154 - Copia.jpg',
      'icone': 'photo',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    final mobile = largura < 800;

    return Container(
      width: double.infinity,
      color: const Color(0xFFFFF8F8),
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 18 : 60,
        vertical: mobile ? 65 : 100,
      ),
      child: Column(
        children: [
          _cabecalho(mobile),

          SizedBox(height: mobile ? 55 : 80),

          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1180,
            ),
            child: mobile
                ? _timelineMobile()
                : _timelineDesktop(),
          ),

          SizedBox(height: mobile ? 55 : 80),

          _continua(mobile),
        ],
      ),
    );
  }

  Widget _cabecalho(bool mobile) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFFFE4EB),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFC85C7A)
                    .withValues(alpha: 0.15),
                blurRadius: 24,
                spreadRadius: 3,
              ),
            ],
          ),
          child: const Icon(
            Icons.favorite_rounded,
            color: Color(0xFFC85C7A),
            size: 30,
          ),
        ),

        const SizedBox(height: 20),

        Text(
          'Nossa linha do tempo',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: mobile ? 29 : 42,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF5C3946),
          ),
        ),

        const SizedBox(height: 12),

        Text(
          'Alguns dos capítulos que escreveram a nossa história.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: mobile ? 15 : 17,
            color: const Color(0xFF8A6A76),
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _timelineDesktop() {
    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: 2,
              color: const Color(0xFFE9B6C5),
            ),
          ),
        ),

        Column(
          children: List.generate(
            momentos.length,
            (index) {
              final momento = momentos[index];
              final esquerda = index.isEven;

              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 70,
                ),
                child: _itemDesktop(
                  momento,
                  esquerda,
                  index,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _itemDesktop(
    Map<String, String> momento,
    bool esquerda,
    int index,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: esquerda
              ? _cardMomento(
                  momento,
                  false,
                )
              : const SizedBox(),
        ),

        SizedBox(
          width: 90,
          child: Center(
            child: _marcador(
              momento,
              index,
            ),
          ),
        ),

        Expanded(
          child: !esquerda
              ? _cardMomento(
                  momento,
                  false,
                )
              : const SizedBox(),
        ),
      ],
    );
  }

  Widget _timelineMobile() {
    return Stack(
      children: [
        Positioned(
          left: 17,
          top: 0,
          bottom: 0,
          child: Container(
            width: 2,
            color: const Color(0xFFE9B6C5),
          ),
        ),

        Column(
          children: List.generate(
            momentos.length,
            (index) {
              final momento = momentos[index];

              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 45,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 36,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 24,
                        ),
                        child: _marcador(
                          momento,
                          index,
                          pequeno: true,
                        ),
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: _cardMomento(
                        momento,
                        true,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _cardMomento(
    Map<String, String> momento,
    bool mobile,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          mobile ? 22 : 26,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF5C3946)
                .withValues(alpha: 0.08),
            blurRadius: 28,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: mobile ? 1.35 : 1.55,
            child: Image.asset(
              momento['imagem']!,
              width: double.infinity,
              fit: BoxFit.cover,

              // enquanto você ainda não colocou
              // todas as fotos
              errorBuilder: (
                context,
                error,
                stackTrace,
              ) {
                return Container(
                  color: const Color(0xFFFFE9EF),
                  child: const Center(
                    child: Icon(
                      Icons.photo_camera_back_rounded,
                      size: 48,
                      color: Color(0xFFC98599),
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.all(
              mobile ? 20 : 27,
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  momento['data']!,
                  style: TextStyle(
                    color: const Color(0xFFC85C7A),
                    fontSize: mobile ? 13 : 14,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.1,
                  ),
                ),

                const SizedBox(height: 7),

                Text(
                  momento['titulo']!,
                  style: TextStyle(
                    color: const Color(0xFF5C3946),
                    fontSize: mobile ? 21 : 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  '"${momento['frase']}"',
                  style: TextStyle(
                    color: const Color(0xFF80616D),
                    fontSize: mobile ? 14 : 16,
                    height: 1.6,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _marcador(
    Map<String, String> momento,
    int index, {
    bool pequeno = false,
  }) {
    return Container(
      width: pequeno ? 34 : 46,
      height: pequeno ? 34 : 46,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFFC85C7A),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFC85C7A)
                .withValues(alpha: 0.18),
            blurRadius: 12,
          ),
        ],
      ),
      child: Icon(
        _icone(momento['icone']),
        color: const Color(0xFFC85C7A),
        size: pequeno ? 17 : 22,
      ),
    );
  }

  IconData _icone(String? tipo) {
    switch (tipo) {
      case 'diamond':
        return Icons.diamond_rounded;

      case 'child':
        return Icons.child_care_rounded;

      case 'photo':
        return Icons.photo_camera_rounded;

      default:
        return Icons.favorite_rounded;
    }
  }

  Widget _continua(bool mobile) {
    return Column(
      children: [
        Container(
          width: 2,
          height: 45,
          color: const Color(0xFFE9B6C5),
        ),

        Container(
          width: 13,
          height: 13,
          decoration: const BoxDecoration(
            color: Color(0xFFC85C7A),
            shape: BoxShape.circle,
          ),
        ),

        const SizedBox(height: 22),

        Text(
          'E continua...',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF5C3946),
            fontSize: mobile ? 24 : 31,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          'Porque ainda temos muitos momentos para viver.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF927480),
            fontSize: mobile ? 14 : 16,
          ),
        ),
      ],
    );
  }
}