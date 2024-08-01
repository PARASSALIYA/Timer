import 'package:clock_app/header.dart';

Widget imageSelect() {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          selectImage,
        ),
        fit: BoxFit.cover,
      ),
    ),
  );
}
