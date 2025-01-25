import 'package:flutter/material.dart';
import 'package:project_secondbite/general/widgets/texts/heading_text.dart';

class AddressBilling extends StatelessWidget {
  const AddressBilling({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadingText(title: 'Pickup Location'),
      ],
    );
  }
}