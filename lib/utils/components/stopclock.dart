import 'package:clock_app/header.dart';

class StopClock extends StatefulWidget {
  const StopClock({super.key});

  @override
  State<StopClock> createState() => _StopClockState();
}

class _StopClockState extends State<StopClock> {
  List<String> flags = [];

  DateTime dateTime = DateTime.now();
  Timer? timer;
  int hour = 00;
  int minute = 00;
  int second = 00;
  bool stop = false;

  void _timer() {
    stop = true;
    Future.delayed(
      const Duration(milliseconds: 10),
      () {
        setState(() {
          if (stop) {
            second++;
          }
          if (second > 60) {
            minute++;
            second = 0;
          }
          if (minute > 60) {
            hour++;
            minute = 0;
          }
          if (hour > 23) {
            hour = 0;
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
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _addFlag() {
    setState(() {
      flags.add(dateTime.toIso8601String().toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          imageSelect(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(
                  height: 250,
                ),
                // Time
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                //Icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    stop
                        ? ElevatedButton(
                            onPressed: _addFlag,
                            style: elevatedButton(),
                            child: const Icon(Icons.flag),
                          )
                        : !stop
                            ? ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    stop = false;
                                    hour = minute = second = 0;
                                    flags = [];
                                  });
                                },
                                style: elevatedButton(),
                                child: const Icon(
                                  Icons.stop,
                                ),
                              )
                            : ElevatedButton(
                                onPressed: () {
                                  stop = false;
                                  setState(() {});
                                },
                                style: elevatedButton(),
                                child: const Icon(
                                  Icons.pause,
                                ),
                              ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (!stop) {
                          _timer();
                        } else {
                          stop = false;
                        }
                        setState(() {});
                      },
                      style: elevatedButton(),
                      child: !stop
                          ? const Icon(
                              Icons.play_arrow,
                            )
                          : const Icon(
                              Icons.pause,
                            ),
                    ),
                  ],
                ),
                //Flag Print
                Expanded(
                  child: ListView.builder(
                    itemCount: flags.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          'Flag ${index + 1}: ${flags[index]}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
