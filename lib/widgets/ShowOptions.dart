import 'package:flutter/material.dart';

void showOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return const _OptionsContent();
    },
  );
}

class _OptionsContent extends StatelessWidget {
  const _OptionsContent();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.admin_panel_settings, color: Colors.black87),
            title: const Text('Admim'),
            onTap: () {
              Navigator.pop(context);
              print('Função alterada!');
            },
          ),
          ListTile(
            leading: const Icon(Icons.mode_edit_outline_rounded, color: Colors.black87),
            title: const Text('Editor in chief'),
            onTap: () {
              Navigator.pop(context);
              print('Usuário bloqueado!');
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit, color: Colors.black87),
            title: const Text('Editor'),
            onTap: () {
              Navigator.pop(context);
              print('Membro restrito!');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.black87),
            title: const Text('Student'),
            onTap: () {
              Navigator.pop(context);
              print('Visualizar perfil!');
            },
          ),
        ],
      ),
    );
  }
}
