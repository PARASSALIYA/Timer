import 'package:clock_app/header.dart';

Widget drawer() {
  return Drawer(
    backgroundColor: const Color(0xff1E1E26),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text(
            "Clock App",
            style: TextStyle(
                // color: Colors.black,
                ),
          ),
          accountEmail: Text(
            "ClockApp@gmail.com ",
            style: TextStyle(
                // color: Colors.black,
                ),
          ),
          currentAccountPicture: CircleAvatar(
            foregroundImage: NetworkImage(
              "https://static-00.iconduck.com/assets.00/profile-circle-icon-2048x2048-cqe5466q.png",
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Select Images",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              // shadows: [
              //   Shadow(
              //     color: Colors.grey,
              //     offset: Offset(2, 2),
              //     blurRadius: 2,
              //   ),
              // ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: image
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        selectImage = e;
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(e),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Select Dial",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    selectDialClock = animatedAnalogClock(
                      dialType: DialType.numbers,
                      size: 250,
                    );
                  },
                  child: animatedAnalogClock(
                    dialType: DialType.numbers,
                    size: 100,
                    color: const Color(0xff1E1E26),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    selectDialClock = animatedAnalogClock(
                      dialType: DialType.dashes,
                      size: 250,
                    );
                  },
                  child: animatedAnalogClock(
                    dialType: DialType.dashes,
                    size: 100,
                    color: const Color(0xff1E1E26),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    selectDialClock = animatedAnalogClock(
                      dialType: DialType.numberAndDashes,
                      size: 250,
                    );
                  },
                  child: animatedAnalogClock(
                    dialType: DialType.numberAndDashes,
                    size: 100,
                    color: const Color(0xff1E1E26),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    selectDialClock = animatedAnalogClock(
                      dialType: DialType.none,
                      size: 250,
                    );
                  },
                  child: animatedAnalogClock(
                    dialType: DialType.none,
                    size: 100,
                    color: const Color(0xff1E1E26),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    selectDialClock = animatedAnalogClock(
                      dialType: DialType.romanNumerals,
                      size: 250,
                    );
                  },
                  child: animatedAnalogClock(
                    dialType: DialType.romanNumerals,
                    size: 100,
                    color: const Color(0xff1E1E26),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
