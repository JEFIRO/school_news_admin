import 'package:flutter/material.dart';
import 'package:school_news/Models/MemberModel.dart';
import '../service/MemberService.dart';

Future<MemberModel?> showOptions(BuildContext context, String memberId) async {
  return await showModalBottomSheet<MemberModel>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Wrap(
          children: [
            const Center(
              child: Text(
                'Escolha a nova função',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Estudante'),
              onTap: () async {
                final member = await changePermission(memberId, "student");
                Navigator.pop(context, member);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Editor'),
              onTap: () async {
                final member = await changePermission(memberId, "editor");
                Navigator.pop(context, member);
              },
            ),
            ListTile(
              leading: const Icon(Icons.admin_panel_settings),
              title: const Text('Administrador'),
              onTap: () async {
                final member = await changePermission(memberId, "admin");
                Navigator.pop(context, member);
              },
            ),
          ],
        ),
      );
    },
  );
}
