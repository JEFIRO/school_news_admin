import 'package:flutter/material.dart';
import 'package:school_news/Models/MemberModel.dart';

import '../widgets/ShowOptions.dart';

class AdminViewUserProfile extends StatelessWidget {
  final MemberModel member;

  const AdminViewUserProfile({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        title: const Text('Perfil do Usuário'),
        backgroundColor: const Color(0xFFC2185B),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 80,
            decoration: const BoxDecoration(
              color: Color(0xFFC2185B),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                const Positioned(
                  bottom: -60,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Color(0xFFC2185B),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 80),

          // Informações do usuário
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.email, size: 20),
                    const SizedBox(width: 8),
                    Text(member.email),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.work, size: 20),
                    const SizedBox(width: 8),
                    Text(member.role),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.check_circle, size: 20),
                    const SizedBox(width: 8),
                    Text("Status: ${member.status}"),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Ações do admin
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // ação para editar usuário
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text("Editar"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC2185B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // ação para bloquear conta
                  },
                  icon: const Icon(Icons.block),
                  label: const Text("Bloquear"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    final updatedMember = await showOptions(context, member.id);

                    if (updatedMember != null) {
                      Navigator.of(context).pop(updatedMember);
                    }
                  },
                  icon: const Icon(Icons.work),
                  label: const Text("change function"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
