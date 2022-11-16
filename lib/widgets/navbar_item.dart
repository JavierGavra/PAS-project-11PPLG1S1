import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/common/app_color.dart';

class NavbarItem extends StatefulWidget {
  const NavbarItem(
      {super.key,
      required this.icon,
      required this.iconSelcted,
      required this.indexItem,
      required this.index,
      required this.onChangedTab});
  final IconData icon;
  final IconData iconSelcted;
  final int index;
  final int indexItem;
  final ValueChanged<int> onChangedTab;

  @override
  State<NavbarItem> createState() => _NavbarItemState();
}

class _NavbarItemState extends State<NavbarItem> {
  @override
  Widget build(BuildContext context) {
    final isSelected = widget.indexItem == widget.index;
    return InkWell(
      onTap: () {
        widget.onChangedTab(widget.indexItem);
      },
      borderRadius: BorderRadius.circular(24),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        height: 50,
        width: isSelected ? 80 : 50,
        decoration: isSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(37),
                color: accentColor,
                boxShadow: const [
                  BoxShadow(
                      color: Color(0x80ffffff),
                      blurRadius: 10,
                      offset: Offset(-5, 5)),
                  BoxShadow(
                      color: Color(0x40AAAACC),
                      blurRadius: 10,
                      offset: Offset(5, 5)),
                  BoxShadow(
                      color: Color(0x80AAAACC),
                      blurRadius: 20,
                      offset: Offset(10, 10)),
                  BoxShadow(
                      color: Color(0xffffffff),
                      blurRadius: 20,
                      offset: Offset(-10, -10)),
                ],
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: const Color(0xffF5F5F9),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0x80AAAACC),
                      blurRadius: 20,
                      offset: Offset(10, 10)),
                  BoxShadow(
                      color: Color(0xffffffff),
                      blurRadius: 20,
                      offset: Offset(-10, -10)),
                ],
              ),
        child: Icon(
          isSelected ? widget.iconSelcted : widget.icon,
          size: 24,
          color: isSelected ? Colors.white : const Color(0xffC4C4C4),
        ),
      ),
    );
  }
}
