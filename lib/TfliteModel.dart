import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:file_picker/file_picker.dart';


class TfliteModel extends StatefulWidget{
  const TfliteModel({Key? key}) : super(key: key);

  @override
  _TfliteModelState createState() => _TfliteModelState();

}

class _TfliteModelState extends State<TfliteModel>{

  void initState(){
    super.initState();
        loadModel();
  }

  Future loadModel() async {
    Tflite.close();
    String? res;
    res = (await Tflite.loadModel(model: "assets/my_model.tflite" ));
    print("models loading sucessfulley: $res ");
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Baby Talks"),
      ),
      body: ListView(
        children: [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickAudio,
        tooltip: "Pick audio",
        child: Icon(Icons.audio_file),
      ),
    );
  }
  Future<void> pickAudio() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );

    if (result != null) {
      final path = result.files.single.path;
      // do something with the selected audio file
    }
  }
}