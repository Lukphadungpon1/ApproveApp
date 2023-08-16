import 'package:flutter/material.dart';
import 'package:prsystem/provider/getMobileinfo.dart';
import 'package:prsystem/ui/widgets/responsive_ui.dart';

class authMobileScreen extends StatefulWidget {
  authMobileScreen({
    Key? key,
  }) : super(key: key);

  @override
  _authMobileScreenState createState() => _authMobileScreenState();
}

class _authMobileScreenState extends State<authMobileScreen> {
  late String _deviceID = "";

  late double _height;
  late double _width;
  late double _pixelRatio;
  late bool _large;
  late bool _medium;
  void getMobileInfo1() async {
    getMobileINF getinfo = getMobileINF();

    var _data = await getinfo.initPlatformState();
    _deviceID = _data.toString();
    print(_deviceID);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    getMobileInfo1();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Scaffold(
      appBar: AppBar(
        title: Text('Notification..'),
      ),
      body: Material(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 100.0,
              ),
              Text(
                'Please register your mobile into the system. ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: _large ? 20 : (_medium ? 17.5 : 15),
                ),
              ),
              Text(
                'Register Code : ${_deviceID}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: _large ? 20 : (_medium ? 17.5 : 15),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
