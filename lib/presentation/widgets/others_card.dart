import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/messages.dart';

class OthersCard extends StatelessWidget {
  const OthersCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Messages data;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 160,
        ),
        child: Card(
          elevation: 1,
          color: Colors.greenAccent[10],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.zero,
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 10,
                  bottom: 26,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.sender ?? ""),
                    Text(data.message ?? ""),
                  ],
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Text(DateFormat('HH:mm').format(data.modifiedAt!)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
