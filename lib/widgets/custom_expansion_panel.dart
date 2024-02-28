import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class CustomExpansionPanel extends StatefulWidget {
  const CustomExpansionPanel({super.key});

  @override
  State<CustomExpansionPanel> createState() => _CustomExpansionPanelState();
}

class _CustomExpansionPanelState extends State<CustomExpansionPanel> {
  final List<Item> _data = [
    Item(
      expandedValue:
          'É possível se tornar um parceiro e aceitar pedidos de compras em alguns dias. Faça seu cadastro agora e aguarde nosso contato.',
      headerValue: 'Quanto tempo leva para se tornar um parceiro?',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      elevation: 0,
      expandedHeaderPadding: EdgeInsets.zero,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          backgroundColor: Colors.transparent,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  item.isExpanded = !item.isExpanded;
                });
              },
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      item.headerValue,
                      style: GoogleFonts.roboto(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          body: Row(
            children: [
              Expanded(
                child: Text(
                  item.expandedValue,
                  style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontSize: 18,
                    height: 1.3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
