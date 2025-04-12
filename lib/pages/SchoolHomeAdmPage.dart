import 'package:flutter/material.dart';
import 'package:school_news/Models/MemberModel.dart';

import '../service/MemberService.dart';
import '../widgets/MembersWidget.dart';

class SchoolHomeAdmPage extends StatefulWidget {
  SchoolHomeAdmPage({super.key});

  @override
  State<SchoolHomeAdmPage> createState() => _SchoolHomeAdmPageState();
}

class _SchoolHomeAdmPageState extends State<SchoolHomeAdmPage> {
  int currentPageIndex = 0;

  List<MemberMode>? members;

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

      body:
          <Widget>[
            Card(
              shadowColor: Colors.transparent,
              margin: const EdgeInsets.all(8.0),
              child: SizedBox.expand(
                child: Center(
                  child: Flexible(
                    child: ListView(
                      children: [
                        for (MemberMode membe in members!)
                          MemberCard(
                            imageUrl: 'https://i.pravatar.cc/150?img=8',
                            name: membe.name,
                            role: membe.role,
                            email: membe.role,
                          ),
                      ],
                    ),
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
        members = data as List<MemberMode>;
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
}
