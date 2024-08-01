import 'package:clock_app/header.dart';

class AnalogClock extends StatefulWidget {
  const AnalogClock({super.key});

  @override
  State<AnalogClock> createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
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
        children: [
          imageSelect(),
          SizedBox(
            child: selectDialClock ??
                animatedAnalogClock(
                  dialType: DialType.numbers,
                  size: 250,
                ),
          ),
        ],
      ),
    );
  }
}

/*
                 Stack(
                  alignment: Alignment.center,
                  children: [
                    ...List.generate(
                      60,
                      (index) => Transform.rotate(
                        angle: index * pi * 2 / 60,
                        child: Divider(
                          endIndent:
                              index % 5 == 0 ? s.width * 0.84 : s.width * 0.86,
                          thickness: index % 5 == 0 ? 3 : 1,
                          color: index % 5 == 0 ? Colors.white : Colors.white,
                        ),
                      ),
                    ),
                    Transform.rotate(
                      angle: dateTime.hour * pi * 2 / 12,
                      child: Transform.rotate(
                        angle: pi / 2,
                        child: Divider(
                          indent: s.width * 0.25,
                          endIndent: s.width * 0.5,
                          thickness: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Transform.rotate(
                      angle: dateTime.minute * pi * 2 / 60,
                      child: Transform.rotate(
                        angle: pi / 2,
                        child: Divider(
                          indent: s.width * 0.2,
                          endIndent: s.width * 0.5,
                          thickness: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Transform.rotate(
                      angle: dateTime.second * pi * 2 / 60,
                      child: Transform.rotate(
                        angle: pi / 2,
                        child: Divider(
                          indent: s.width * 0.15,
                          endIndent: s.width * 0.5,
                          thickness: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 10,
                       backgroundColor: Colors.white,
               ),
            ],
          ),
*/
