import 'package:flutter/material.dart';

class popUpWarning extends StatelessWidget {
  final String errorMessage;
  const popUpWarning({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      backgroundColor: Color(0xFF313142),
      contentPadding: EdgeInsets.all(5),
      content: Container(
        height: 337,
        width: 337,
        child: Center(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.close, color: Color(0xFFD2AFFF)),
                  onPressed: () {
                    Navigator.pop(context, 'Close');
                  },
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.error_outline_rounded,
                      size: 100,
                      color: Color(0xFFD2AFFF),
                    ),
                    Text(
                      errorMessage,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFD2AFFF),
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
