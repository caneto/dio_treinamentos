// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:trilhaapp/app/core/ui/styles/text_styles.dart';

class ExpansionTileWidget extends StatefulWidget {
  final String expansionTile;
  final String expansionSubTile;
  final List<Widget> children;

  const ExpansionTileWidget({
    super.key,
    required this.expansionTile,
    required this.children,
    this.expansionSubTile = '',
  });

  @override
  State<ExpansionTileWidget> createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {
  @override
  Widget build(BuildContext context) {
    bool _tileExpanded = false;

    return ExpansionTile(
      title: Text(
        widget.expansionTile,
        style: context.textStyles.textMedium.copyWith(color: Colors.black),
      ),
      subtitle: widget.expansionSubTile.isEmpty
          ? null
          : Text(
              widget.expansionSubTile,
              style:
                  context.textStyles.textMedium.copyWith(color: Colors.black45),
            ),
      // ignore: dead_code
      trailing: Icon(
          _tileExpanded ? Icons.arrow_drop_down_circle : Icons.arrow_drop_down),
      childrenPadding: const EdgeInsets.only(left: 20),
      onExpansionChanged: (bool extands) {
        setState(() => _tileExpanded = extands);
      },
      children: widget.children,
    );
  }
}
