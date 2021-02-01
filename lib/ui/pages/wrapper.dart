part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: nanti disini bakal ada if else dari bloc builder yang bakal ke re render ketika menerima page state berbeda
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Test"),
        ),
      ),
    );
  }
}
