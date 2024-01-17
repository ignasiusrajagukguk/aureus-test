import 'package:aureus_group/src/common/constants/collors.dart';
import 'package:aureus_group/src/presentation/screens/camera/bloc/camera_bloc.dart';
import 'package:aureus_group/src/presentation/widgets/separator_widget.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CameraArguments {
  final CameraDescription camera;
  final Function(XFile imageResult)? onTakePicture;
  final Function(XFile imageResult)? onTakePictureResult;
  final bool? isWithVideo;

  CameraArguments(
      {required this.camera,
      this.onTakePicture,
      this.onTakePictureResult,
      this.isWithVideo});
}

class CameraScreen extends StatelessWidget {
  final CameraArguments? cameraArguments;
  const CameraScreen({super.key, this.cameraArguments});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CameraBloc(),
      child: _TakePictureScreen(
          camera: cameraArguments!.camera,
          isWithVideo: cameraArguments!.isWithVideo,
          onTakePicture: cameraArguments!.onTakePicture,
          onTakePictureResult: cameraArguments!.onTakePictureResult),
    );
  }
}

class _TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;
  final Function(XFile imageResult)? onTakePicture;
  final Function(XFile imageResult)? onTakePictureResult;
  final bool? isWithVideo;

  const _TakePictureScreen(
      {Key? key,
      required this.camera,
      this.onTakePicture,
      this.onTakePictureResult,
      this.isWithVideo})
      : super(key: key);

  @override
  _TakePictureScreenState createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<_TakePictureScreen>
    with WidgetsBindingObserver {
  late CameraController _controller;

  late Future<void> _setupCameraAndControllerFuture;
  late Future<void> _initializeControllerFuture;
  bool pressed = false;
  late String title;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _setupCameraAndControllerFuture = _setupCameras();
  }

  Future<void> _setupCameras() async {
    return await _setupController();
  }

  Future<void> _setupController() async {
    try {
      _controller = CameraController(
        widget.camera,
        ResolutionPreset.high,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );
      _initializeControllerFuture = _controller.initialize();
      _controller.addListener(() {
        if (mounted) setState(() {});
        if (_controller.value.hasError) {}
      });
      return await _initializeControllerFuture;
      // ignore: empty_catches
    } on CameraException {}
    if (!mounted) {
      return;
    }
    setState(() {});
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _controller.dispose();
      _setupCameraAndControllerFuture = _setupController();
    }
    if (state == AppLifecycleState.inactive) {
      _controller.dispose();
    } else if (state == AppLifecycleState.paused) {
      _controller.dispose();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _setupCameraAndControllerFuture,
        builder: (context, snapshot) {
          double widthFull = MediaQuery.of(context).size.width;
          double heihgtFull = MediaQuery.of(context).size.height;

          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              color: Colors.black,
              width: widthFull,
              height: heihgtFull,
              padding: const EdgeInsets.fromLTRB(
                24,
                24,
                24,
                0,
              ),
              child: Stack(
                children: [
                  Positioned(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              padding: const EdgeInsets.all(0),
                              alignment: Alignment.centerLeft,
                              icon: const Icon(
                                Icons.close,
                                size: 24,
                                color: ConstColors.white,
                              ),
                              onPressed: () {
                                Navigator.of(context).maybePop();
                              },
                            ),
                            InkWell(
                                child: Icon(
                                  pressed == true
                                      ? Icons.flash_on
                                      : Icons.flash_off,
                                  color: ConstColors.white,
                                ),
                                onTap: () {
                                  setState(() {
                                    pressed = !pressed;
                                  });
                                  if (pressed) {
                                    _controller.setFlashMode(FlashMode.off);
                                  } else {
                                    _controller.setFlashMode(FlashMode.torch);
                                  }
                                }),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: _captureControlRowWidget(),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: CameraPreview(_controller),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _captureControlRowWidget() {
    final CameraController cameraController = _controller;
    return BlocBuilder<CameraBloc, CameraState>(builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (cameraController.value.isInitialized &&
              !cameraController.value.isRecordingVideo &&
              !state.isStopped)
            InkWell(
              onTap: () {
                takePicture(
                    
                  (file) {
                    context.read<CameraBloc>().add(
                          CameraUpdateImageFile(file: file),
                        );
                    context.read<CameraBloc>().add(
                         const CameraUpdateIsStopped(isStopped: true),
                        );
                  }
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: ConstColors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.camera_alt_rounded,
                    size: 30,
                    color: ConstColors.black,
                  ),
                ),
              ),
            ),
          SeparatorWidget.width10(),
          if (state.isStopped)
            InkWell(
              onTap: () {
                widget.onTakePicture!(
                  state.cameraFile,
                );
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: ConstColors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.check,
                    size: 30,
                  ),
                ),
              ),
            ),
        ],
      );
    });
  }


  Future<void> onPausePreviewButtonPressed() async {
    final CameraController cameraController = _controller;

    if (!cameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return;
    }

    if (cameraController.value.isPreviewPaused) {
      await cameraController.resumePreview();
    } else {
      await cameraController.pausePreview();
    }

    if (mounted) {
      setState(() {});
    }
  }




  Future<XFile?> takePicture(Function(XFile file) updateBloc) async {
    final CameraController cameraController = _controller;
    if (!cameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      return null;
    }

    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();
      updateBloc(image);
      _controller.pausePreview();
    } on CameraException catch (e) {
      _showCameraException(e);
    }
    return null;
  }

  void showInSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 50),
    ));
  }

  void _showCameraException(CameraException e) {
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }

}
