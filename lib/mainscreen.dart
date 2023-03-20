import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar,
        body: Column(
      children: [
        Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 224, 79, 17)),
          height: 8.h,
          width: 135.w,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 40, 0, 0),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // ignore: prefer_const_constructors
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 62, 84, 122))),
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },

                    // ignore: prefer_const_constructors
                    child: Text(
                      'Flight Plan',
                      // ignore: prefer_const_constructors
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                // bottom: 0,
                child: SizerUtil.orientation == Orientation.landscape
                    ? SizedBox(
                        height: 67.h,
                        width: 135.w,
                      )
                    : SizedBox(
                        height: 100.h,
                        width: 100.w,
                      ),
              ),
              if (_isExpanded) FlightPlanContainer(),
            ],
          ),
        ),
      ],
    ));
  }

  // ignore: non_constant_identifier_names
  Positioned FlightPlanContainer() {
    TextEditingController textFieldController = TextEditingController();
    return Positioned(
      top: -30,
      left: 135,
      child: AnimatedContainer(
        color: const Color.fromARGB(255, 62, 84, 122),
        duration: const Duration(milliseconds: 800),
        curve: Curves.bounceInOut,
        height: 20.h,
        width: 100.w,
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.skip_previous),
                  onPressed: () {
                    setState(() {
                      _isExpanded = false;
                    });
                  },
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) => setState(() {}),
                  controller: textFieldController,
                  maxLines: 2,
                  style: const TextStyle(decorationColor: Colors.black),
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(4.0)))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
