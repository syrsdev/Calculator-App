import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff232B2B),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 15),
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
                    const Text(
                      "0",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buttonComponent("AC", const Color(0xffA5A5A5)),
                        buttonComponent("+/-", const Color(0xffA5A5A5)),
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
                        buttonComponent("X", const Color(0xffF89B10)),
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            // margin: const EdgeInsets.only(bottom: 10),
                            width: 175,
                            height: 81,
                            color: const Color(0xff333333),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            child: const Center(
                              child: Text(
                                "0",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 28),
                              ),
                            ),
                          ),
                        ),
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

Widget buttonComponent(String text, Color color) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(100),
    child: Container(
      // margin: const EdgeInsets.only(bottom: 10),
      width: 81,
      height: 81,
      color: color,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
    ),
  );
}
