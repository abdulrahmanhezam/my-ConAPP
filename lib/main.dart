import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(MyApp());
}

const buttonText = TextStyle(
  fontSize: 26.0,
  color: Colors.white,
  fontFamily: "Tajawal",
);

const buttonText2 = TextStyle(
  fontSize: 20.0,
  color: Colors.white,
  fontFamily: "Tajawal",
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[

          PopupMenuButton(
            offset: Offset(0, 100),
              onCanceled: () {
                customLaunch('mailto:m.abdulrahman.hezam@gmail.com?subject=&body=');
              },
              captureInheritedThemes:false,
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.menu),
              ),
              itemBuilder: (context) {
                var list = List<PopupMenuEntry<Object>>();
                list.add(
                  PopupMenuItem(
                    child:Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      textDirection: TextDirection.rtl,
                      children: <Widget>[
                        Text("تواصل معنا ",style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: "Tajawal",

                        )),
                        SizedBox(width: 40,),
                        Icon(Icons.email,size: 35,color: Color(0xFF38A4C6),)
                      ],
                    ),
                  ),
                );

                return list;
              }),
        ],
        backgroundColor: Color(0xFF38A4C0),
        title: Center(
          child: Text(
            "كون للتقنية",
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                fontFamily: "Tajawal"),
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/D.jpg'),
                fit: BoxFit.cover,
              )),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CardButton(
                      onTap: () {
                        customLaunch('http://Con.sa');
                      },
                      buttonTitle: "صفحة الموقع ",
                      icon: Icons.language,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CardButton(
                      onTap: () {
                        customLaunch('https://goo.gl/maps/RUGn7eFfW2TaRrgt7');
                      },
                      buttonTitle: "موقع الشركة",
                      icon: Icons.location_on,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CardButton(
                      onTap: () {
                        customLaunch('tel:00966506128258');
                      },
                      buttonTitle: " رقم الاتصال",
                      icon: Icons.phone_in_talk,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CardButton(
                      onTap: () {
                        customLaunch(
                            'https://api.whatsapp.com/send?phone=+966506128258&text=Welcome');
                      },
                      buttonTitle: "رقم الواتس اب",
                      icon: MdiIcons.whatsapp,
                    ),
                  ),
                  Card(
                    shadowColor: Colors.white,
                    color: Colors.amber,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          color: Color(0xFF38A4C6),
                          width: 320,
                          height: 200,
                          child: Column(
                            children: <Widget>[
                              Text(
                                "مواعيد العمل ",
                                style: buttonText,
                              ),
                              Text(
                                "من الاحد الى الخميس : من الساعة 9 صباحا حتى 10 مساء",
                                textDirection: TextDirection.rtl,
                                style: buttonText2,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "يوم الجمعه من الساعة 1 مساء  حتى 10 مساء",
                                textDirection: TextDirection.rtl,
                                style: buttonText2,
                              ),
                            ],
                          ),
                        ),
                      ),
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
}


class CardButton extends StatelessWidget {
  CardButton({@required this.onTap, @required this.buttonTitle, this.icon});

  final Function onTap;
  final String buttonTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.white,
      color: Color(0xFF38A4C6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      child: InkWell(

        onTap: onTap,
        child: Container(
          width: 320,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(
                icon,
                size: 60,
                color: Colors.white,
              ),
              Align(
                alignment: Alignment.centerRight,
              ),
              Text(
                buttonTitle,
                textDirection: TextDirection.ltr,
                style: buttonText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

