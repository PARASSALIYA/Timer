import 'package:clock_app/header.dart';

class StrapClock extends StatefulWidget {
  const StrapClock({super.key});

  @override
  State<StrapClock> createState() => _StrapClockState();
}

class _StrapClockState extends State<StrapClock> {
  DateTime dateTime = DateTime.now();
  void startClock() {
    Future.delayed(const Duration(seconds: 1), () {
      dateTime = DateTime.now();
      setState(() {});
      startClock();
    });
  }

  @override
  void initState() {
    startClock();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          imageSelect(),
          transformScale(
            scale: 7.0,
            color: Colors.blueAccent,
            value: dateTime.hour / 12,
          ),
          transformScale(
            scale: 5.0,
            color: Colors.lightBlueAccent,
            value: dateTime.minute / 60,
          ),
          transformScale(
            scale: 3.0,
            color: Colors.amber,
            value: dateTime.second / 60,
          ),
        ],
      ),
    );
  }
}
