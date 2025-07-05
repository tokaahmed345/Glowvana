part of 'detect_and_pick_image.dart';

abstract class PickAndDetectState extends Equatable {
  final List<Object?> _props;
  const PickAndDetectState([this._props = const []]);

  @override
  List<Object?> get props => [];
}

class ImagePickerInitial extends PickAndDetectState {}

class ImagePicked extends PickAndDetectState {
  final File image;

  ImagePicked(this.image) : super([image]);
}

class ModelLoaded extends PickAndDetectState {}

class ModelLoadFailed extends PickAndDetectState {
  final String error;

  ModelLoadFailed(this.error) : super([error]);
}

class Loading extends PickAndDetectState {}

class PredictionResult extends PickAndDetectState {
  final File image;
  final String prediction;

  PredictionResult(this.image, this.prediction) : super([image, prediction]);
}

class Error extends PickAndDetectState {
  final String message;

  Error(this.message) : super([message]);
}
