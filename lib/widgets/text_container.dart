import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  final Widget child;

  const TextContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      width: 350,
      height: 46,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Column(
      children: [
        Container(
            height: size.height,
            width: double.infinity,
            color: Colors.white,
            child:
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                SizedBox(height: 96,),
              Container(
                height: 248,
                width: 350,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/doctorsimg.png'),
                    )
                ),
              ),
              SizedBox(height: 49,),
              Container(
                width: 305,
                height: 76,
                child: Text(
                  'Welcome to Green medical clinic',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 24,),
              Container(
                width: 350,
                height: 58,
                child: Text(
                  'You can be connected to us and track your healing process with this app',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),
              ),
              TextContainer(
                child: TextField(
                    )
                ),
                ],
              ),
            )
        ),
      ],
    );
  }

}
