import 'package:pet_lovers/module/masterdata/data/model/masterdata_model.dart';

abstract class MasterDataRepo {
  Future<List<MasterDataModel>> getListPetCategory();
}
