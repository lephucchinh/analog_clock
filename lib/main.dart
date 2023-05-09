import 'dart:async';
import 'dart:math';
import 'package:analog_clock/provider/theme_provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final String title = 'light & Dark Theme';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'analog clock Dark & light',
        themeMode: ThemeMode.dark,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        home: homemyapp());
  }
}

class homemyapp extends StatelessWidget {
  const homemyapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // độ bóng = 0
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings,
            color: Colors.grey,
            size: 40,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_circle,
              color: Colors.deepOrangeAccent,
              size: 40,
            ),
          )
        ],
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final text = MediaQuery.of(context).platformBrightness == Brightness.dark
    //     ? 'DarkTheme'
    //     : 'LightTheme';

    Color centerColorText = Theme.of(context).brightness == Brightness.light
        ? Colors.black26
        : Colors.white24;
    Color centerColorText1 = Theme.of(context).brightness == Brightness.light
        ? Colors.black
        : Colors.white;
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Column(
          children: [
            Text(
              'Newport beach USA | PST',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TimeClock(),
            SizedBox(
              height: 1,
            ),
            clock(),
            SizedBox(
              height: 23,
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 230,
                    height: 170,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: centerColorText,
                            )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "New York , USA",
                              style: TextStyle(
                                color: centerColorText1,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "+3 HRS | EST",
                              style: TextStyle(color: centerColorText),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(Icons.flag_circle,size: 40,),
                                Text(
                                  "9:20",
                                  style: TextStyle(
                                    fontSize: 40,
                                  ),
                                ),
                                RotatedBox(
                                  quarterTurns: 3,
                                  child: Text('AM'),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 230,
                    height: 170,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: centerColorText,
                            )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "New York , USA",
                              style: TextStyle(
                                color: centerColorText1,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: 5,

                            ),
                            Text(
                              "+3 HRS | EST",
                              style: TextStyle(color: centerColorText),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(Icons.flag_circle,size: 40,),
                                Text(
                                  "9:20",
                                  style: TextStyle(
                                    fontSize: 40,
                                  ),
                                ),
                                RotatedBox(
                                  quarterTurns: 3,
                                  child: Text('AM'),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TimeClock extends StatefulWidget {
  const TimeClock({Key? key}) : super(key: key);

  @override
  State<TimeClock> createState() => _TimeClockState();
}

class _TimeClockState extends State<TimeClock> {
  TimeOfDay _timeOfDay = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeOfDay.minute != TimeOfDay.now().minute) {
        setState(() {
          _timeOfDay = TimeOfDay.now();
        });
      }
    });
  }

  String get period => (_timeOfDay.period == DayPeriod.am) ? "Am" : "Pm";
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        '${_timeOfDay.hour}:${_timeOfDay.minute}',
        style: const TextStyle(fontSize: 80),
      ),
      RotatedBox(
        quarterTurns: 3,
        child: Text(
          period,
          style: const TextStyle(fontSize: 20),
        ),
      )
    ]);
  }
}

class clock extends StatefulWidget {
  const clock({Key? key}) : super(key: key);

  @override
  State<clock> createState() => _clockState();
}

class _clockState extends State<clock> {
  DateTime _dateTime = DateTime.now();
  IconData get centerIcon => Theme.of(context).brightness == Brightness.light
      ? Icons.sunny
      : Icons.mode_night_rounded;
  Color get centerColor5 => Theme.of(context).brightness == Brightness.light
      ? Colors.deepOrangeAccent
      : Colors.deepOrangeAccent;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      color: Colors.black12,
                      blurRadius: 20,
                    )
                  ]),
              child: Transform.rotate(
                angle: -pi / 2,
                child: CustomPaint(
                  painter: ClockPaint(context, _dateTime),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 0,
          right: 0,
          child: IconButton(
            onPressed: () {},
            icon: Icon(centerIcon),
            color: centerColor5,
          ),
        ),
      ],
    );
  }
}

class ClockPaint extends CustomPainter {
  final BuildContext context;
  final DateTime dateTime;
  ClockPaint(this.context, this.dateTime);
  Color get centerColor1 => Theme.of(context).brightness == Brightness.light
      ? Colors.black
      : Colors.white;
  Color get centerColor3 => Theme.of(context).brightness == Brightness.light
      ? Colors.deepOrange
      : Colors.deepOrange;
  Color get centerColor2 => Theme.of(context).brightness == Brightness.dark
      ? Colors.black
      : Colors.white;
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    // Minute Caculation
    double minX =
        centerX + size.width * 0.35 * cos((dateTime.minute * 6) * pi / 180);
    double minY =
        centerY + size.width * 0.35 * sin((dateTime.minute * 6) * pi / 180);

    //Minute Line
    canvas.drawLine(
      center,
      Offset(minX, minY),
      Paint()
        ..color = centerColor1
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10,
    );

    // hour Calculation
    double hourX = centerX +
        size.width *
            0.25 *
            cos((DateTime.now().hour * 30 + dateTime.minute * 0.5) * pi / 180);
    double hourY = centerY +
        size.width *
            0.25 *
            sin((DateTime.now().hour * 30 + dateTime.minute * 0.5) * pi / 180);

    // Hour Line
    canvas.drawLine(
        center,
        // Those offset value just random value
        // we kill change those in future
        Offset(hourX, hourY),
        Paint()
          ..color = centerColor1
          ..style = PaintingStyle.stroke
          ..strokeWidth = 10);

    //Second Calculation
    double secondX =
        centerX + size.width * 0.4 * cos((dateTime.second * 6) * pi / 180);
    double secondY =
        centerY + size.width * 0.4 * sin((dateTime.second * 6) * pi / 180);

    // Second Line
    canvas.drawLine(
        center,
        Offset(secondX, secondY),
        Paint()
          ..color = centerColor3
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3);

    // center Dots
    Paint doPainter = Paint()..color = centerColor2;
    canvas.drawCircle(center, 24, doPainter);
    canvas.drawCircle(center, 22, Paint()..color = centerColor1);

    canvas.drawCircle(center, 10, doPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
