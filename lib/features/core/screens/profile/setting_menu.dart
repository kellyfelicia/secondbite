import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_secondbite/utils/constants/colors.dart';

class SettingMenu extends StatelessWidget {
  const SettingMenu(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      this.trailing,
      this.OnTap});

  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? OnTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: AppColors.primaryColor),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.labelMedium),
      trailing: trailing,
      onTap: OnTap,
    );
  }
}
