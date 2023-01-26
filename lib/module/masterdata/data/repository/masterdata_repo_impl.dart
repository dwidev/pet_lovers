import 'package:dio/dio.dart';

import '../../domain/repository/petcategory_master_repository.dart';
import '../model/masterdata_model.dart';

class MasterDataRepoImpl implements MasterDataRepo {
  MasterDataRepoImpl({required this.masterDataHttpRequest});

  final Dio masterDataHttpRequest;

  @override
  Future<List<MasterDataModel>> getListPetCategory() async {
    return Future.delayed(const Duration(seconds: 3), () => []);
  }
}
