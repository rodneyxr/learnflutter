import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Xylophone(),
          ),
        ),
      ),
    );
  }
}

class Xylophone extends StatefulWidget {
  const Xylophone({Key key}) : super(key: key);

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  static const int NUMBER_OF_KEYS = 7;
  List<AudioPlayer> keys = List.generate(NUMBER_OF_KEYS, (_) => AudioPlayer());

  @override
  void initState() {
    super.initState();
    loadSounds();
  }

  void loadSounds() async {
    for (int i = 0; i < keys.length; i++) {
      await keys[i].setUrl('asset:assets/note${i + 1}.wav');
      await keys[i].setLoopMode(LoopMode.off);
    }
  }

  List<Widget> buildKeys() {
    List<Color> colors = [Colors.black, Colors.white];
    List<Widget> keyButtons = [];
    for (int i = 0; i < keys.length; i++) {
      keyButtons.add(
        Expanded(
          child: GestureDetector(
            onTapDown: (action) async {
              keys[i].pause();
              await keys[i].seek(Duration.zero);
              await keys[i].play();
            },
            child: Container(
              width: double.infinity,
              color: colors[i % 2],
              child: Icon(
                Icons.music_note,
                size: 128,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      );
    }
    return keyButtons;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: buildKeys(),
    );
  }
}
