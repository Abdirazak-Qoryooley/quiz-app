import 'package:flutter/material.dart';
import 'package:quiznew/questions.dart';
import 'package:quiznew/result.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: homepage(),
  ));
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<questions> question = [
    questions(q: 'Flutter is a framework', a: true),
    questions(q: 'flutter is released 2015', a: false),
    questions(q: 'flutter is cross platform', a: true),
  ];

  int questionindex = 0;

  int correctanswers = 0;
  int falseanswers = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff081c15),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  question[questionindex].questionName!,
                  style: TextStyle(
                      fontSize: 20, letterSpacing: 2.0, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.only(left: 22, right: 22),
                      height: 54,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () {
                          final iscorrect =
                              question[questionindex].questionAnswers;

                          if (iscorrect == true) {
                            print('waa sax');
                            setState(() {
                              correctanswers = correctanswers + 1;
                            });
                          } else {
                            print('waa qalad');
                            setState(() {
                              falseanswers = falseanswers + 1;
                            });
                          }
                          setState(() {
                            if (questionindex < question.length - 1)
                              questionindex++;
                            else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => screentwo(
                                      answers: correctanswers,
                                      falses: falseanswers),
                                ),
                              );
                            }
                          });
                        },
                        child: Text(
                          'True',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 22, right: 22),
                      height: 54,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        onPressed: () {
                          final isfalse =
                              question[questionindex].questionAnswers;

                          if (isfalse == false) {
                            print('waa saxday');
                            setState(() {
                              correctanswers = correctanswers + 1;
                            });
                          } else {
                            print('waa qaladay');
                            setState(() {
                              falseanswers = falseanswers + 1;
                            });
                          }
                          setState(() {
                            if (questionindex < question.length - 1)
                              questionindex++;
                            else {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return screentwo(
                                    answers: correctanswers,
                                    falses: falseanswers);
                              }));
                            }
                          });
                        },
                        child: Text(
                          'True',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
