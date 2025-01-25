import 'package:flutter/material.dart';
import 'package:project_secondbite/utils/constants/colors.dart';

class SelectableButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const SelectableButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50, 
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? AppColors.primaryColor : AppColors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50), 
            side: BorderSide.none, 
          ),
          padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20),
        ),
        onPressed: onPressed,
        child: FittedBox(

          fit: BoxFit.scaleDown,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
