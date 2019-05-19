import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class InstaCamera extends StatefulWidget {

  List<CameraDescription> cameras;

  InstaCamera(this.cameras);

}

  @override
  _InstaCameraState createState() => _InstaCameraState();
}

class _InstaCameraState extends State<InstaCamera> {

  CameraController controller;

  @override
  void initState() {
    super.initState();
    controller =
        new CameraController(widget.cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return new Container();
    }
    return new AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: new CameraPreview(controller),
    );
  }
}