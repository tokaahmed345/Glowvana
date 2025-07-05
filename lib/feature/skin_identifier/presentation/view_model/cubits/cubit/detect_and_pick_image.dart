import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;
part 'image_picker_state.dart';
class PickAndDetectImage extends Cubit<PickAndDetectState> {
  PickAndDetectImage() : super(ImagePickerInitial()) {
    loadModel();
  }
  final ImagePicker _imagePicker = ImagePicker();
  late Interpreter _interpreter;
  final List<String> labels = ['Dry', 'Combination', 'Oily'];
  final int inputSize = 224;
  Future<void> loadModel() async {
    try {
      _interpreter =
          await Interpreter.fromAsset('assets/images/model_unquant.tflite');
      emit(ModelLoaded());
    } catch (e) {
      emit(ModelLoadFailed(e.toString()));
    }
  }
  Future<void> pickImageFromGallery() async {
    final filePicked =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (filePicked != null) {
      emit(ImagePicked(File(filePicked.path)));
      await predictSkinType(File(filePicked.path));
    }
  }
  Future<void> predictSkinType(File imageFile) async {
    emit(Loading());
    final rawImage = imageFile.readAsBytesSync();
    final img.Image? image = img.decodeImage(rawImage);
    if (image == null) {
      emit(Error("Failed to decode image"));
      return;
    }
    final resizedImage =
        img.copyResize(image, width: inputSize, height: inputSize);
    var input = imageToByteListFloat32(resizedImage);
    var output = List.filled(labels.length, 0.0).reshape([1, labels.length]);
    _interpreter.run(input, output);
    final prediction = output[0] as List<double>;
    final maxIndex = prediction
        .indexWhere((v) => v == prediction.reduce((a, b) => a > b ? a : b));
    final predictedLabel = labels[maxIndex];

    emit(PredictionResult(imageFile, predictedLabel));
  }
  Uint8List imageToByteListFloat32(img.Image image) {
    final Float32List convertedBytes =
        Float32List(1 * inputSize * inputSize * 3);
    final buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;

    for (int y = 0; y < inputSize; y++) {
      for (int x = 0; x < inputSize; x++) {
        final pixel = image.getPixel(x, y);
        buffer[pixelIndex++] = (img.getRed(pixel)) / 255.0;
        buffer[pixelIndex++] = (img.getGreen(pixel)) / 255.0;
        buffer[pixelIndex++] = (img.getBlue(pixel)) / 255.0;
      }
    }
    return convertedBytes.buffer.asUint8List();
  }
}
