import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/messages.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Messages data;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 160,
        ),
        child: Card(
          elevation: 1,
          color: const Color(0xFFDCF8C6),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.zero,
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 10,
                  top: 5,
                  bottom: 0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(data.message ?? ""),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(DateFormat('HH:mm').format(data.modifiedAt!)),
                        const Icon(Icons.check),
                      ],
                    )
                  ],
                ),
              ),
              // Positioned(
              //   bottom: 4,
              //   right: 0,
              //   child: Row(
              //     children: [
              //       Text(DateFormat('HH:mm').format(data.modifiedAt!)),
              //       const Icon(Icons.check),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
