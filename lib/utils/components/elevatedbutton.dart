import 'package:clock_app/header.dart';

ButtonStyle elevatedButton() {
  return ButtonStyle(
    alignment: Alignment.center,
    padding: const WidgetStatePropertyAll(
      EdgeInsets.all(10),
    ),
    iconSize: const WidgetStatePropertyAll(30),
    iconColor: const WidgetStatePropertyAll(Colors.white),
    backgroundColor: WidgetStatePropertyAll(
      Colors.black.withOpacity(0.15),
    ),
    fixedSize: const WidgetStatePropertyAll(
      Size.fromWidth(100),
    ),
    textStyle: WidgetStatePropertyAll(
      const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
  );
}

Widget bottomNavigationBar({required onTap}) {
  return CurvedNavigationBar(
    onTap: onTap,
    items: items,
    index: 2,
    buttonBackgroundColor: const Color(0xff1E1E26),
    color: const Color(0xff1E1E26),
    animationCurve: Curves.decelerate,
    backgroundColor: Colors.white,
  );
}
