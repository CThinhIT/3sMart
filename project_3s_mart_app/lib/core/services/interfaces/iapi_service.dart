import 'package:project_3s_mart_app/core/dtos/base_api_dto.dart';

abstract class IApiService {
  Future<List<T>> getAPI<T extends BaseApiDto>(String apiName);
  Future<T> getOneObjectAPI<T extends BaseApiDto>(String apiName);
}