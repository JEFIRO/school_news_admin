import 'package:flutter/material.dart';

import '../Models/MemberModel.dart';
import '../pages/AdminViewUserProfile.dart';
import '../service/MemberService.dart';
import 'ShowOptions.dart';

enum SampleItem { itemOne, itemTwo, itemThree, itemFuor }

class MemberCard extends StatefulWidget {
  final MemberModel member;
  final Function(MemberModel) onUpdate;

  const MemberCard({super.key, required this.member, required this.onUpdate});

  @override
  State<MemberCard> createState() => _MemberCardState();
}

class _MemberCardState extends State<MemberCard> {
  SampleItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF5F5F5),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget.member.image?.isNotEmpty == true
                    ? widget.member.image!
                    : 'https://www.example.com/imagem_padrao.png',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) =>
                        const Icon(Icons.person, size: 60, color: Colors.grey),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.member.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF212121),
                    ),
                  ),
                  Text(
                    widget.member.role,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF757575),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.member.email,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF616161),
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuButton(
              initialValue: selectedItem,
              onSelected: (SampleItem item) async {
                switch (item) {
                  case SampleItem.itemOne:
                    final member = await showOptions(context, widget.member.id);
                    if (member != null) {
                      widget.onUpdate(member);
                    }
                    break;
                  case SampleItem.itemTwo:
                    final blockAcount = await blockAccount(widget.member.id);
                    if(blockAcount != null){
                      widget.onUpdate(blockAcount);
                    }
                    break;
                  case SampleItem.itemThree:
                    print('Membro restrito!');
                    break;
                  case SampleItem.itemFuor:
                    final updatedMember = await Navigator.push<MemberModel?>(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                AdminViewUserProfile(member: widget.member),
                      ),
                    );
                    if (updatedMember != null) {
                      widget.onUpdate(updatedMember);
                    }
                    break;
                }
              },
              itemBuilder:
                  (BuildContext context) => <PopupMenuEntry<SampleItem>>[
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemOne,
                      child: ListTile(
                        leading: Icon(Icons.functions),
                        title: Text('change function'),
                      ),
                    ),
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemTwo,
                      child: ListTile(
                        leading: Icon(Icons.block),
                        title: Text('Block User'),
                      ),
                    ),
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemThree,
                      child: ListTile(
                        leading: Icon(Icons.person_off),
                        title: Text('restrict member'),
                      ),
                    ),
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemFuor,
                      child: ListTile(
                        leading: Icon(Icons.info),
                        title: Text('view profile'),
                      ),
                    ),
                  ],
            ),
          ],
        ),
      ),
    );
  }
}
