import 'package:flutter/material.dart';
import 'package:school_news/Models/MemberModel.dart';

import '../service/MemberService.dart';
import '../widgets/MemberCard.dart';

class HomeAdmPage extends StatefulWidget {
  const HomeAdmPage({super.key});

  @override
  State<HomeAdmPage> createState() => _HomeAdmPageState();
}

class _HomeAdmPageState extends State<HomeAdmPage> {
  int currentPageIndex = 0;

  List<MemberModel>? members;

  @override
  void initState() {
    super.initState();
    loadMembers();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("School News"),
        backgroundColor: const Color(0xFFC2185B),
      ),

      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Color(0xFFC2185B),
        selectedIndex: currentPageIndex,

        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person),
            label: 'Members',
          ),
          NavigationDestination(icon: Icon(Icons.settings), label: 'settings'),
          NavigationDestination(icon: Icon(Icons.bar_chart), label: 'Stats'),
        ],
      ),

      body: <Widget>[
        members == null
            ? const Center(child: CircularProgressIndicator())
            : members!.isEmpty
            ? const Center(child: Text("Nenhum membro encontrado."))
            : Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: ListView(
                children: [
                  for (MemberModel member in members!)
                    MemberCard(member: member,
                      onUpdate: atualizarMembro,

                    ),
                ],
              ),
            ),
          ),
        ),
      ][currentPageIndex],

    );
  }

  void loadMembers() async {
    try {
      var data = await findMember();
      setState(() {
        members = data;
      });
        } catch (e) {
      print("Erro ao carregar membros: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Erro ao buscar membros."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void atualizarMembro(MemberModel atualizado) {
    final index = members!.indexWhere((m) => m.id == atualizado.id);
    if (index != -1) {
      setState(() {
        members![index] = atualizado;
      });
    }
  }

}
