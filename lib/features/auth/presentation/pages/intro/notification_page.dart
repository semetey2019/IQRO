import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<String> texts = [
    "Получите точное время молитв и\n направления на киблу",
    "Вы сможете выбрать другие голоса и параметры азана позже",
  ];
  bool _lights1 = false;
  bool _lights2 = true;
  bool _lights3 = false;
  bool _lights4 = false;
  bool _lights5 = true;
  onChangeFunction1(bool newValue) {
    setState(() {
      _lights1 = newValue;
    });
  }

  onChangeFunction2(bool newValue) {
    setState(() {
      _lights2 = newValue;
    });
  }

  onChangeFunction3(bool newValue) {
    setState(() {
      _lights3 = newValue;
    });
  }

  onChangeFunction4(bool newValue) {
    setState(() {
      _lights4 = newValue;
    });
  }

  onChangeFunction5(bool newValue) {
    setState(() {
      _lights5 = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(31, 28, 30, 29),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Настройте уведомления для каждого времени молитвы",
                  style: theme.textTheme.titleMedium
                      ?.copyWith(color: Colors.black, fontSize: 23),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 44),
                Image.asset(
                  "assets/auth/namaz.png",
                  height: height * 0.15,
                ),
                const SizedBox(height: 40),
                Column(
                  children: [
                    buildNotifycationOption(
                        'Фаджр', _lights1, onChangeFunction1),
                    buildNotifycationOption('Зор', _lights2, onChangeFunction2),
                    buildNotifycationOption('Аср', _lights3, onChangeFunction3),
                    buildNotifycationOption(
                        'Магриб', _lights4, onChangeFunction4),
                    buildNotifycationOption('Иша', _lights5, onChangeFunction5),
                  ],
                ),
                const SizedBox(height: 40),
                Center(
                  child: Text(
                    "Вы сможете выбрать другие голоса и параметры азана позже",
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    _showDialog(context);
                  },
                  child: Text(
                    "Включить уведомления",
                    style: theme.textTheme.titleSmall?.copyWith(
                        color: const Color.fromARGB(255, 22, 141, 238)),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(248, 234, 241, 253),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.fiber_manual_record,
                        size: 13, color: Colors.grey),
                    Icon(Icons.fiber_manual_record,
                        size: 13, color: Colors.blue),
                    Icon(Icons.fiber_manual_record,
                        size: 13, color: Colors.grey),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Padding buildNotifycationOption(
    String title, bool value, Function onChangeMethod) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(40, 0, 40, 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Transform.scale(
          scale: 0.9,
          child: CupertinoSwitch(
            value: value,
            onChanged: (bool newValue) {
              onChangeMethod(newValue);
            },
          ),
        ),
      ],
    ),
  );
}

Future<void> _showDialog(BuildContext context) async {
  var theme = Theme.of(context);
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Приложение “IQRO” запрашивает разрешение на отправку Вам уведомлений.',
          style: TextStyle(fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        content: const Text(
          'Уведомления могут содержать напоминания, звуки и наклейки значков. Их конфигурирование возможно в Настройках',
          textAlign: TextAlign.center,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Запретить',
                  style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.blue, fontWeight: FontWeight.w600),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Разрешить',
                    style: theme.textTheme.bodyLarge?.copyWith(
                        color: Colors.blue, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ],
      );
    },
  );
}
