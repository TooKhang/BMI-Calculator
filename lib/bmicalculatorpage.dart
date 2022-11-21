import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class bmicalculatorpage extends StatefulWidget {
  const bmicalculatorpage({super.key});

  @override
  State<bmicalculatorpage> createState() => _bmicalculatorpageState();
}

class _bmicalculatorpageState extends State<bmicalculatorpage> {
  TextEditingController heightEditingController = TextEditingController();
  TextEditingController weightEditingController = TextEditingController();
  double height = 0.0, weight = 0.0, bmi = 0.0;
  AudioCache audioCache = new AudioCache();
  AudioPlayer audioPlayer = new AudioPlayer();
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Flexible(
                flex: 5, child: Image.asset('assets/images/BMI.png', scale: 1)),
            Flexible(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text(
                          "BMI Calculator",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 30),
                        TextField(
                          controller: heightEditingController,
                          keyboardType: const TextInputType.numberWithOptions(),
                          decoration: InputDecoration(
                              hintText: "Height in Meter",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: weightEditingController,
                          keyboardType: const TextInputType.numberWithOptions(),
                          decoration: InputDecoration(
                              hintText: "Weight in Kg",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                            onPressed: _calBMI,
                            child: const Text("Calculate BMI")),
                        const SizedBox(height: 10),
                        Text(
                          "Your BMI " + bmi.toStringAsPrecision(3),
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void _calBMI() {
    height = double.parse(heightEditingController.text);
    weight = double.parse(weightEditingController.text);
    setState(() {
      bmi = weight / (height * height);
    });
    if (bmi > 25) {
      loadFail();
    } else if ((bmi <= 24.9) && (bmi >= 18.5)) {
      loadOk();
    } else if (bmi < 18.5) {
      loadFail();
    }
  }

  Future loadOk() async {
    await audioPlayer.play(AssetSource('audios/Sucess.wav'));
  }
  Future loadFail() async {
    await audioPlayer.play(AssetSource('audios/Fail.wav'));
  }
}