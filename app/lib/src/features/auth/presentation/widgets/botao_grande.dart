import 'package:flutter/material.dart';

import '../../../../config/themes/app_colors.dart';

class BotaoGrande extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const BotaoGrande({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(vertical: 20),
          color: AppColors.amarelo,
          child: Stack(
            children: [
              Center(
                child: Text(
                  text,
                  softWrap: false,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
