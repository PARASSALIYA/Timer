import 'package:clock_app/header.dart';

Widget animatedAnalogClock({
  required dialType,
  required double size,
  Color? color,
}) {
  return AnimatedAnalogClock(
    size: size,
    backgroundColor: color ?? const Color(0xff1E1E26).withOpacity(0.2),
    hourHandColor: Colors.lightBlueAccent,
    numberColor: Colors.white,
    minuteHandColor: Colors.lightBlueAccent,
    secondHandColor: Colors.amber,
    centerDotColor: Colors.amber,
    extendSecondHand: false,
    hourDashColor: Colors.lightBlue,
    minuteDashColor: Colors.blueAccent,
    dialType: dialType,
  );
}

Widget transformScale({required scale, required Color color, required value}) {
  return Transform.scale(
    scale: scale,
    child: CircularProgressIndicator(
      color: color,
      strokeWidth: 1,
      value: value,
    ),
  );
}
