import 'package:clock_app/header.dart';

class ReverseClock extends StatefulWidget {
  const ReverseClock({super.key});

  @override
  State<ReverseClock> createState() => _ReverseClockState();
}

class _ReverseClockState extends State<ReverseClock> {
  DateTime dateTime = DateTime.now();

  int hour = 23;
  int minute = 59;
  int second = 59;
  bool stop = false;

  void _timer() {
    stop = true;
    Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(() {
          if (second == 0) {
            second = 59;
            minute--;
          }
          if (minute == 0) {
            minute = 59;
            second--;
          }
          if (hour == 0) {
            hour = 23;
          } else {
            second--;
          }
        });
        if (stop) {
          _timer();
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _timer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Image
          imageSelect(),
          // Time
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 250,
              ),
              Text(
                " ${hour.toString().padLeft(2, '0')} : ${minute.toString().padLeft(2, '0')} : ${second.toString().padLeft(2, '0')}",
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
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
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      stop = false;
                      setState(() {});
                    },
                    style: elevatedButton(),
                    child: Text(
                      "Stop",
                      style: elevatedButton()
                          .textStyle!
                          .resolve(<MaterialState>{}),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _timer();
                      });
                    },
                    style: elevatedButton(),
                    child: Text(
                      "Start",
                      style: elevatedButton()
                          .textStyle!
                          .resolve(<MaterialState>{}),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
