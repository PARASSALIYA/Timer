import 'package:clock_app/header.dart';

class DigitalClock extends StatefulWidget {
  const DigitalClock({super.key});

  @override
  State<DigitalClock> createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
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
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          imageSelect(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "  ${(dateTime.hour % 12).toString().padLeft(2, "0")} : ${dateTime.minute.toString().padLeft(2, "0")} : ${dateTime.second.toString().padLeft(2, "0")}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontStyle: FontStyle.italic,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(5, 5),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    dateTime.hour < 12 ? "AM" : "PM",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      shadows: [
                        Shadow(
                          color: Colors.black26,
                          offset: Offset(5, 5),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox.square(
                    dimension: 13,
                  ),
                ],
              ),
              const SizedBox.square(
                dimension: 13,
              ),
              Text(
                "${dateTime.day} ${month[dateTime.month - 1]} ${dateTime.year} ",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontStyle: FontStyle.italic,
                  shadows: [
                    Shadow(
                      color: Colors.black26,
                      offset: Offset(5, 5),
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
