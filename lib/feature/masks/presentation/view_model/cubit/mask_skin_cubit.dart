import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:glowvana/feature/masks/data/models/mask_skin_model.dart';
import 'package:glowvana/feature/masks/data/repos/mask_repo.dart';

part 'mask_skin_state.dart';

class MaskSkinCubit extends Cubit<MaskSkinState> {
  MaskSkinCubit(this.maskRepo) : super(MaskSkinLoading());
final MaskRepo maskRepo;

Future<void>getMasks(String skinType) async{
  emit(MaskSkinLoading());
 final data= await maskRepo.fetchMasks(skinType: skinType);
data.fold((error)=>emit(MaskSkinFailure(errorMessage: error.message)), (masks)=>emit(MaskSkinSuccess(masks)));
}

}
