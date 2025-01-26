import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String input = "0";
  String output = "0";

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "AC") {
        input = "0";
        output = "0";
      } else if (buttonText == "=") {
        var expression = input;
        expression = expression.replaceAll("x", "*");

        try {
          Parser parser = Parser();
          Expression exp = parser.parse(expression);

          ContextModel cm = ContextModel();

          input = '${exp.evaluate(EvaluationType.REAL, cm)}';
          output = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          output = "Error";
        }
      } else if (buttonText == "<") {
        input = input.substring(0, input.length - 1);
        if (input == "") {
          input = "0";
        }
      } else if (buttonText == "%") {
        if (output == "0") {
          input = (double.parse(input) / 100).toString();
        } else {
          output = (double.parse(input) / 100).toString();
        }
      } else {
        if (input == "0") {
          input = buttonText;
          output = "0";
          if (buttonText == "+" ||
              buttonText == "-" ||
              buttonText == "x" ||
              buttonText == "/" ||
              buttonText == "%" ||
              buttonText == "=") {
            input = "0";
          }
        } else {
          input = input + buttonText;
          if (buttonText == "+" ||
              buttonText == "-" ||
              buttonText == "x" ||
              buttonText == "/" ||
              buttonText == "%" ||
              buttonText == "=") {
            output = "0";
          }
        }
      }
    });
  }

  Widget buttonComponent(String text, Color color,
      {double width = 81, Icon? icon}) {
    return InkWell(
      onTap: () => buttonPressed(text),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Container(
          // margin: const EdgeInsets.only(bottom: 10),
          width: width,
          height: 81,
          color: color,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Center(
            child: icon ??
                Text(
                  text,
                  style: const TextStyle(color: Colors.white, fontSize: 28),
                ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff232B2B),
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 24, bottom: 15, top: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Kalkulator",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: Text(
                        output == "0" ? input : output,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buttonComponent("AC", const Color(0xffA5A5A5)),
                        buttonComponent("<", const Color(0xffA5A5A5),
                            icon: const Icon(
                              Icons.backspace_outlined,
                              color: Colors.white,
                            )),
                        buttonComponent("%", const Color(0xffA5A5A5)),
                        buttonComponent("/", const Color(0xffF89B10)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buttonComponent("7", const Color(0xff333333)),
                        buttonComponent("8", const Color(0xff333333)),
                        buttonComponent("9", const Color(0xff333333)),
                        buttonComponent("x", const Color(0xffF89B10)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buttonComponent("4", const Color(0xff333333)),
                        buttonComponent("5", const Color(0xff333333)),
                        buttonComponent("6", const Color(0xff333333)),
                        buttonComponent("-", const Color(0xffF89B10)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buttonComponent("1", const Color(0xff333333)),
                        buttonComponent("2", const Color(0xff333333)),
                        buttonComponent("3", const Color(0xff333333)),
                        buttonComponent("+", const Color(0xffF89B10)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buttonComponent("0", const Color(0xff333333),
                            width: 175),
                        buttonComponent(".", const Color(0xff333333)),
                        buttonComponent("=", const Color(0xffF89B10)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
