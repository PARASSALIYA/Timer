import 'package:clock_app/header.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static String splashscreen = 'splashscreen';
  static String homepage = '/';
  static String analogclock = 'analogclock';
  static String stapclock = 'stapclock';
  static String digitalclock = 'digitalclock';
  static String stopclock = 'stopclock';
}

int selectIndex = 0;
String selectImage = 'lib/assets/images/1.jpg';
Widget? selectDialClock;
bool bSize = false;

List pages = [
  const DigitalClock(),
  const StrapClock(),
  const AnalogClock(),
  const ReverseClock(),
  const StopClock(),
];
final items = <Icon>[
  const Icon(
    CupertinoIcons.timer,
    color: Colors.white,
    size: 30,
  ),
  const Icon(
    CupertinoIcons.stopwatch_fill,
    color: Colors.white,
    size: 30,
  ),
  const Icon(
    CupertinoIcons.clock_fill,
    color: Colors.white,
    size: 30,
  ),
  const Icon(
    CupertinoIcons.hourglass_tophalf_fill,
    color: Colors.white,
    size: 30,
  ),
  const Icon(
    Icons.timer_rounded,
    color: Colors.white,
    size: 30,
  ),
];
List day = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday",
];
List month = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "July",
  "Aug",
  "Sep",
  "Oct",
  "Nev",
  "Des",
];
List image = [
  'lib/assets/images/1.jpg',
  'lib/assets/images/2.jpg',
  'lib/assets/images/3.jpg',
  'lib/assets/images/4.jpg',
  'lib/assets/images/5.jpg',
  'lib/assets/images/6.jpg',
  'lib/assets/images/7.jpg',
  'lib/assets/images/8.jpg',
  'lib/assets/images/9.jpg',
  'lib/assets/images/10.jpg',
];
