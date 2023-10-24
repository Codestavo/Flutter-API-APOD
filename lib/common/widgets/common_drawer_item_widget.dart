import 'package:flutter/material.dart';

class CommonDrawerItemWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final Function()? onTap;

  const CommonDrawerItemWidget({
    required this.title,
    required this.icon,
    required this.isSelected,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            color: Colors.transparent,
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? Colors.grey.shade500
                        : Colors.purple.shade600,
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  title,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
