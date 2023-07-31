import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rxdart/rxdart.dart';

class SpinWheel extends StatefulWidget {
  const SpinWheel({Key? key}) : super(key: key);

  @override
  State<SpinWheel> createState() => _SpinWheelState();
}

class _SpinWheelState extends State<SpinWheel> {
  final selected = BehaviorSubject<int>();
  int rewards = 0;

  List<int> items = [100, 200, 500, 1000, 2000];

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 100,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              child: Text(
                rewards.toString(),
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 300,
              child: FortuneWheel(
                selected: selected.stream,
                animateFirst: false,
                items: [
                  for (int i = 0; i < items.length; i++) ...<FortuneItem>{
                    FortuneItem(
                      child: Text(
                        items[i].toString(),
                      ),
                    ),
                  },
                ],
                onAnimationEnd: () {
                  setState(() {
                    rewards = items[selected.value];
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        rewards.toString(),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.blue,
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 8,
                  ),
                ),
              ),
              onPressed: () {
                setState(() {
                  selected.add(
                    Fortune.randomInt(
                      0,
                      items.length,
                    ),
                  );
                });
              },
              child: const Text(
                'SPIN',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
