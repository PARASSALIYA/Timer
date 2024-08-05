import 'package:clock_app/header.dart';

class StopClock extends StatefulWidget {
  const StopClock({super.key});

  @override
  State<StopClock> createState() => _StopClockState();
}

class _StopClockState extends State<StopClock> {
  List<Flags> flags = [];

  DateTime dateTime = DateTime.now();
  Timer? timer;
  int minute = 00;
  int second = 00;
  int mills = 00;
  bool stop = false;

  void _timer() {
    stop = true;
    Future.delayed(
      const Duration(milliseconds: 10),
      () {
        setState(() {
          if (stop) {
            mills++;
          }
          if (mills > 60) {
            second++;
            mills = 0;
          }
          if (second > 60) {
            minute++;
            second = 0;
          }
          if (minute > 23) {
            minute = 0;
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
    setState(() {});
    if (flags.isEmpty) {
      flags.add(
        Flags(
          id: flags.length + 1,
          mills: mills.toString(),
          minute: minute.toString(),
          second: second.toString(),
          previousMills: mills,
          previousSecond: second,
          previousMinute: minute,
          currentMills: mills,
          currentSecond: second,
          currentMinute: minute,
        ),
      );
    } else {
      flags.add(
        Flags(
          id: flags.length + 1,
          mills: mills.toString(),
          minute: minute.toString(),
          second: second.toString(),
          previousMills: flags.last.currentMills,
          previousSecond: flags.last.currentSecond,
          previousMinute: flags.last.currentMinute,
          currentMills: mills,
          currentSecond: second,
          currentMinute: minute,
        ),
      );
    }
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
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " ${minute.toString().padLeft(2, '0')} : ${second.toString().padLeft(2, '0')} : ${mills.toString().padLeft(2, '0')} ",
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
                ),
                const SizedBox(height: 30),
                //Icons
                Expanded(
                  flex: 1,
                  child: Row(
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
                                      minute = second = mills = 0;
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
                ),
                //Flag Print
                Expanded(
                  flex: 4,
                  child: ListView.builder(
                    itemCount: flags.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Flag ${flags[index].id.toString()}:",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "+ ${flags[index].currentMinute - flags[index].previousMinute} : ${flags[index].currentSecond - flags[index].previousSecond}  ",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "${flags[index].minute.toString().padLeft(2, '0')} : ${flags[index].second.toString().padLeft(2, '0').padLeft(2, '0')} : ${flags[index].mills.toString()}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
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
