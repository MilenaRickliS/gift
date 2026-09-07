import 'dart:async';
import 'package:flutter/material.dart';

import '../widgets/menu.dart';
import '../widgets/footer.dart';
import '../widgets/linha_do_tempo.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

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
                  const HeroInicio(),

                  const LinhaDoTempo(),

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

// PRIMEIRA SEÇÃO
class HeroInicio extends StatefulWidget {
  const HeroInicio({super.key});

  @override
  State<HeroInicio> createState() => _HeroInicioState();
}

class _HeroInicioState extends State<HeroInicio> {
  late Timer _timer;
  DateTime agora = DateTime.now();

  final DateTime inicioRelacionamento = DateTime(
    2016,
    9,
    9,
  );

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (!mounted) return;

        setState(() {
          agora = DateTime.now();
        });
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Map<String, int> calcularTempo() {
    final inicio = inicioRelacionamento;

    int anos = agora.year - inicio.year;
    int meses = agora.month - inicio.month;
    int dias = agora.day - inicio.day;

    if (dias < 0) {
      meses--;

      final ultimoDiaMesAnterior = DateTime(
        agora.year,
        agora.month,
        0,
      ).day;

      dias += ultimoDiaMesAnterior;
    }

    if (meses < 0) {
      anos--;
      meses += 12;
    }

    final dataBase = DateTime(
      inicio.year + anos,
      inicio.month + meses,
      inicio.day,
    );

    final restante = agora.difference(dataBase);

    return {
      'anos': anos,
      'meses': meses,
      'dias': dias,
      'horas': restante.inHours,
      'minutos': restante.inMinutes.remainder(60),
      'segundos': restante.inSeconds.remainder(60),
    };
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final mobile = size.width < 800;
    final tempo = calcularTempo();

    return SizedBox(
      height: size.height - (mobile ? 70 : 85),
      width: double.infinity,

      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/foto_078.jpg',
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x05000000),
                  Color(0x15000000),
                  Color(0x55000000),
                  Color(0xDD000000),
                ],
                stops: [
                  0,
                  0.35,
                  0.65,
                  1,
                ],
              ),
            ),
          ),
          Positioned(
            left: mobile ? 20 : 60,
            right: mobile ? 20 : 60,
            bottom: mobile ? 45 : 70,

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.hourglass_top_rounded,
                      color: Colors.white.withValues(alpha: 0.9),
                      size: mobile ? 20 : 24,
                    ),

                    const SizedBox(width: 8),

                    Text(
                      'Estamos juntos há...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: mobile ? 17 : 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: mobile ? 16 : 22,
                ),

              
                Text(
                  '${tempo['anos']} anos • '
                  '${tempo['meses']} meses • '
                  '${tempo['dias']} dias',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: mobile ? 26 : 43,
                    fontWeight: FontWeight.bold,
                    height: 1.15,
                  ),
                ),

                const SizedBox(height: 10),

               
                Text(
                  '${tempo['horas'].toString().padLeft(2, '0')} horas • '
                  '${tempo['minutos'].toString().padLeft(2, '0')} minutos • '
                  '${tempo['segundos'].toString().padLeft(2, '0')} segundos',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: mobile ? 14 : 19,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(
                  height: mobile ? 25 : 34,
                ),

                Container(
                  height: 1,
                  width: 65,
                  color: Colors.white.withValues(
                    alpha: 0.5,
                  ),
                ),

                SizedBox(
                  height: mobile ? 22 : 28,
                ),

                Text(
                  '"E eu escolheria você em todas elas."',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: mobile ? 18 : 25,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 20),

           
                Column(
                  children: [
                    Text(
                      'continue nossa história',
                      style: TextStyle(
                        color: Colors.white.withValues(
                          alpha: 0.65,
                        ),
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(height: 3),

                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.white.withValues(
                        alpha: 0.65,
                      ),
                      size: 28,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}