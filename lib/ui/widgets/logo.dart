part of 'widgets.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 30,
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Logo.png"), fit: BoxFit.fill)),
          ),
        ),
        Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          child: Text("Haloo"),
        ),
      ],
    );
  }
}
