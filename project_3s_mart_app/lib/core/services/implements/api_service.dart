import 'dart:convert';
import 'dart:io';
import 'package:project_3s_mart_app/core/dtos/base_api_dto.dart';
import 'package:project_3s_mart_app/core/services/interfaces/iapi_service.dart';
import 'package:project_3s_mart_app/core/utils/api_exception.dart';
import 'package:project_3s_mart_app/core/utils/connection_checking.dart';
import 'package:project_3s_mart_app/global/app_text.dart';
import 'package:project_3s_mart_app/global/environment.dart';
import 'package:project_3s_mart_app/global/global_data.dart';
import 'package:project_3s_mart_app/global/locator.dart';

class ApiService extends IApiService{
  late String _serverAddress;
  late String _deviceSerial;
  late HttpClient _httpClient;

  ApiService(){
    _serverAddress = EnvironmentUtil.apiURL;
    if(_serverAddress.endsWith('/')){
      _serverAddress = EnvironmentUtil.apiURL.substring(0, _serverAddress.length -1);
    }
    _deviceSerial = locator<GlobalData>().deviceInfo.deviceSerial;
    _httpClient = HttpClient();
    _httpClient.badCertificateCallback = ((X509Certificate cert, String host, int port) => host == EnvironmentUtil.apiURL);
  }

  final _deviceFactory =  <Type, Function>{
    // DeviceApiDto: (Map<String, dynamic> json) => DeviceApiDto.fromJson(json),
    // SyncDeviceSettingApiDto: (Map<String, dynamic> json) => SyncDeviceSettingApiDto.fromJson(json),
  };

  @override
  Future<List<T>> getAPI<T extends BaseApiDto>(String apiName) async {
    // var map = <Type, Function>{
    //   ProductTagDto: (Map<String, dynamic> json) => ProductTagDto.fromJson(json),
    // };
  
  final factories = Map<String, dynamic>();

  var haveConnection = await ConnectionChecking.check();
  if(!haveConnection){
    throw new Exception(AppText.noConection);
  }else{
    HttpClientRequest request = await _httpClient.getUrl(Uri.parse(_serverAddress + '/api/DeviceSyncs/$apiName/$_deviceSerial'));

    HttpClientResponse response = await request.close();
    String responseBody = await response.transform(utf8.decoder).join();

    if(response.statusCode == 200){
      List<dynamic> jsonList = json.decode(responseBody);
      List<T> objectList = jsonList.map<T>((jsonItem) => factories[T](jsonItem).toList()).toList();
      return objectList;
    }else{
      throw new ApiException(AppText.getApiDatafailed, responseBody);
    }
  }
  }

  @override
  Future<T> getOneObjectAPI<T extends BaseApiDto>(String apiName) async{
  var haveConnection = await ConnectionChecking.check();
    if (!haveConnection) {
      throw new Exception(AppText.noConection);
    } else {
      HttpClientRequest request = await _httpClient.getUrl(Uri.parse(_serverAddress + '/api/DeviceSyncs/$apiName/$_deviceSerial'));

      HttpClientResponse response = await request.close();
      String responseBody = await response.transform(utf8.decoder).join();

      if (response.statusCode == 200) {
        dynamic jsonObject = json.decode(responseBody);
        T object =  _deviceFactory[T]!(jsonObject);
        return object;
      } else {
        throw new ApiException(AppText.getApiDatafailed, responseBody);
      }
    }
  }
}