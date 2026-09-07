import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/menu.dart';
import '../widgets/footer.dart';

class Musica extends StatefulWidget {
  const Musica({super.key});

  @override
  State<Musica> createState() => _MusicaState();
}

class _MusicaState extends State<Musica> {
  Map<String, dynamic>? musicaDoDia;
  bool carregando = true;

  @override
  void initState() {
    super.initState();
    carregarMusicaDoDia();
  }

  Future<void> carregarMusicaDoDia() async {
    final jsonString =
        await rootBundle.loadString('assets/data/musicas.json');

    final List<dynamic> musicas = json.decode(jsonString);

    final agora = DateTime.now();

    final inicio = DateTime(2026, 1, 1);

    final dias = agora
        .difference(inicio)
        .inDays;

    final indice = dias % musicas.length;

    if (!mounted) return;

    setState(() {
      musicaDoDia = musicas[indice];
      carregando = false;
    });
  }

  Future<void> abrirYoutube(String link) async {
    final uri = Uri.parse(link);

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
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
                      vertical: mobile ? 50 : 70,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Nossa música de hoje 🎵',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5C3946),
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          'Todo dia, uma música que lembra um pedacinho da nossa história.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            color: Color(0xFF8B6B76),
                          ),
                        ),

                        const SizedBox(height: 40),

                        if (carregando)
                          const CircularProgressIndicator(
                            color: Color(0xFFE58A9E),
                          )
                        else
                          MusicaCard(
                            titulo: musicaDoDia!['titulo'],
                            artista: musicaDoDia!['artista'],
                            imagem: musicaDoDia!['imagem'],
                            onTap: () {
                              abrirYoutube(
                                musicaDoDia!['youtube'],
                              );
                            },
                          ),

                        const SizedBox(height: 35),

                        const Text(
                          '“Algumas músicas não são apenas músicas.\n'
                          'São momentos, pessoas e sentimentos.” ❤️',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.6,
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF8B6B76),
                          ),
                        ),

                        const SizedBox(height: 60),
                      ],
                    ),
                  ),

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

class MusicaCard extends StatefulWidget {
  final String titulo;
  final String artista;
  final String imagem;
  final VoidCallback onTap;

  const MusicaCard({
    super.key,
    required this.titulo,
    required this.artista,
    required this.imagem,
    required this.onTap,
  });

  @override
  State<MusicaCard> createState() => _MusicaCardState();
}

class _MusicaCardState extends State<MusicaCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 600;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
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
      child: AnimatedScale(
        scale: hover ? 1.025 : 1,
        duration: const Duration(milliseconds: 200),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: mobile ? double.infinity : 380,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF241B20),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(
                    alpha: hover ? 0.20 : 0.12,
                  ),
                  blurRadius: hover ? 30 : 20,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      widget.imagem,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: const Color(0xFF35282E),
                          alignment: Alignment.center,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.music_note_rounded,
                                size: 70,
                                color: Color(0xFFE58A9E),
                              ),
                              SizedBox(height: 12),
                              Text(
                                'Capa da música',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 22),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.titulo,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            widget.artista,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color(0xFFB9ADB2),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 15),

                    Container(
                      width: 58,
                      height: 58,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE58A9E),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        size: 36,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                Row(
                  children: [
                    const Icon(
                      Icons.favorite_rounded,
                      color: Color(0xFFE58A9E),
                      size: 19,
                    ),

                    const SizedBox(width: 7),

                    const Text(
                      'Uma música da nossa história',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFFB9ADB2),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}