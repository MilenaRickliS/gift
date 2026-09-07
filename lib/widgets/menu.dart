import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    final mobile = largura < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 20 : 60,
        vertical: 18,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Row(
            children: [
              Icon(
                Icons.favorite,
                color: Color(0xFFC85C7A),
                size: 30,
              ),
              SizedBox(width: 10),
              Text(
                'Nós',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5C3946),
                ),
              ),
            ],
          ),

          const Spacer(),

          if (mobile)
            Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu_rounded,
                    size: 30,
                    color: Color(0xFF5C3946),
                  ),
                );
              },
            ),

          if (!mobile) ...[
            _itemMenu(
              context,
              'Início',
              Icons.home_rounded,
              '/',
            ),
            _itemMenu(
              context,
              'Galeria',
              Icons.photo_library_rounded,
              '/galeria',
            ),
            _itemMenu(
              context,
              'Música do dia',
              Icons.music_note_rounded,
              '/musica',
            ),
            _itemMenu(
              context,
              'Declaração',
              Icons.mail_rounded,
              '/declaracao',
            ),
            _itemMenu(
              context,
              'Nosso cantinho',
              Icons.favorite_rounded,
              '/nosso-cantinho',
            ),
          ],
        ],
      ),
    );
  }

  Widget _itemMenu(
    BuildContext context,
    String titulo,
    IconData icone,
    String rota,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: TextButton.icon(
        onPressed: () {
          Navigator.pushReplacementNamed(context, rota);
        },
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF5C3946),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        icon: Icon(
          icone,
          size: 18,
          color: const Color(0xFFC85C7A),
        ),
        label: Text(
          titulo,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFFFF8F8),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),

            const Icon(
              Icons.favorite,
              color: Color(0xFFC85C7A),
              size: 42,
            ),

            const SizedBox(height: 10),

            const Text(
              'Nossa História',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5C3946),
              ),
            ),

            const SizedBox(height: 30),

           _itemDrawer(
              context,
              Icons.home_rounded,
              'Início',
              '/',
            ),

            _itemDrawer(
              context,
              Icons.photo_library_rounded,
              'Galeria',
              '/galeria',
            ),

            _itemDrawer(
              context,
              Icons.music_note_rounded,
              'Música do dia',
              '/musica',
            ),

            _itemDrawer(
              context,
              Icons.mail_rounded,
              'Declaração',
              '/declaracao',
            ),

            _itemDrawer(
              context,
              Icons.favorite_rounded,
              'Nosso cantinho',
              '/nosso-cantinho',
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemDrawer(
    BuildContext context,
    IconData icone,
    String titulo,
    String rota,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 5,
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        leading: Icon(
          icone,
          color: const Color(0xFFC85C7A),
        ),
        title: Text(
          titulo,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF5C3946),
          ),
        ),
       onTap: () {
          final navigator = Navigator.of(context);

          navigator.pop();
          navigator.pushReplacementNamed(rota);
        },
      ),
    );
  }
}