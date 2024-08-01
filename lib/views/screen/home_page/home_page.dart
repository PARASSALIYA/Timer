import 'package:clock_app/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        actions: const [
          Icon(Icons.more_vert),
          SizedBox(
            width: 15,
          ),
        ],
        backgroundColor: const Color(0xff1E1E26),
        foregroundColor: Colors.white,
        title: const Text("ClockApp"),
      ),
      body: pages[selectIndex],
      bottomNavigationBar: bottomNavigationBar(
        onTap: (value) {
          selectIndex = value;
          setState(() {});
        },
      ),
    );
  }
}
