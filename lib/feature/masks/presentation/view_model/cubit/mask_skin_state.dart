part of 'mask_skin_cubit.dart';

sealed class MaskSkinState extends Equatable {
  const MaskSkinState();

  @override
  List<Object> get props => [];
}

final class MaskSkinInitial extends MaskSkinState {}
final class MaskSkinLoading extends MaskSkinState {}
final class MaskSkinSuccess extends MaskSkinState {
  final List<MasksSkin>masks;

 const  MaskSkinSuccess(this.masks);

}
final class MaskSkinFailure extends MaskSkinState {
  final  String errorMessage;

  const MaskSkinFailure({required this.errorMessage});

}
