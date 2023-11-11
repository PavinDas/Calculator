import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final ber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            'Calculator',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black87,
            height: 150,
            width: double.infinity,
            child: Expanded(
              child: TextFormField(
                controller: ber,
                maxLines: 2,
                keyboardType: TextInputType.none,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      ber.text = '';
                    },
                    icon: Text(
                      'AC',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  hintText: '0',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonPress('7'),
                  buttonPress('8'),
                  buttonPress('9'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonPress('4'),
                  buttonPress('5'),
                  buttonPress('6'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonPress('1'),
                  buttonPress('2'),
                  buttonPress('3'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonPress('x'),
                  buttonPress('0'),
                  buttonPress('/'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonPress('+'),
                  buttonPress('-'),
                  buttonPress('='),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  MaterialButton buttonPress(String num) {
    return MaterialButton(
      color: Colors.black,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Text(
            num,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onPressed: () {
        String flag = '';
        int num1 = 0;
        int num2 = 0;
        int result = 0;

        if (num == '+') {
          num1 = int.parse(ber.text);
          ber.text = '';
          flag = '+';
        } else if (num == '-') {
          num1 = int.parse(ber.text);
          ber.text = '';
          flag = '-';
        } else if (num == 'x') {
          num1 = int.parse(ber.text);
          ber.text = '';
          flag = 'x';
        } else if (num == '/') {
          num1 = int.parse(ber.text);
          ber.text = '';
          flag = '/';
        } else if (num == '=') {
          num2 = int.parse(ber.text);
          if (flag == '+') {
            setState(
              () {
                result = num1 + num2;
                ber.text = result.toString();
              },
            );
          } else if (flag == '-') {
            setState(
              () {
                result = num1 - num2;
                ber.text = result.toString();
              },
            );
          } else if (flag == 'x') {
            setState(
              () {
                result = num1 * num2;
                ber.text = result.toString();
              },
            );
          } else if (flag == '/') {
            setState(
              () {
                double tmp = num1 / num2;
                String tmp1 = tmp.toString();
                result = int.parse(tmp1);
                ber.text = '';
                ber.text = result.toString();
              },
            );
          }
        } else {
          setState(
            () {
              ber.text = ber.text + num;
              flag = '0';
            },
          );
        }
      },
    );
  }
}
