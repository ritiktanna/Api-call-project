import 'package:api_call_project/server_files/server_abstract_class.dart';
import 'package:api_call_project/utils/app_strings.dart';
import 'package:dio/dio.dart';

import '../models/server_data_model.dart';

class DioHelperClass extends DioHelperAbstractClass {
  static final dio = Dio();

  @override
  Future<List<ServerDataModelClass>> getData() async {
    List<ServerDataModelClass> listOfDataDio = [];
    int index = 0;
    Response<dynamic> response;
    listOfDataDio.clear();
    response = await dio.get(AppString.serverLink);
    for (index; index < ((response.data.length) as int); index++) {
      listOfDataDio.add(ServerDataModelClass.fromJson(
          response.data[index] as Map<String, dynamic>));
    }
    return listOfDataDio;
  }
}
