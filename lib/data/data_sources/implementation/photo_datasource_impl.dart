import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_omni/data/data_sources/interfaces/photo_datasource.dart';
import 'package:test_omni/data/entities/photo_entity.dart';

/// API Url
const String apiBase = 'jsonplaceholder.typicode.com';
/// Controller/Path of api
const String basePath = 'photos';

/// Photo data source impl
class PhotoDataSourceImpl implements PhotoDataSource {

  @override
  Future<List<PhotoEntity>> getPhotos(
      {required int start, required int limit,}) async{
    final uri = Uri.http(apiBase, basePath, {
      '_start': '$start',
      '_limit': '$limit',
    });
    // ignore: inference_failure_on_function_invocation
    final response = await Dio().getUri(uri);
    if (response.statusCode != 200) {
      throw Exception('status code: ${response.statusCode}');
    }
    try{
      return (response.data as List<dynamic>)
          .map((e) => PhotoEntity.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    catch(e){
      throw Exception(response.statusCode);
    }
  }

  @override
  Future<PhotoEntity> getPhoto(String id) async {
    //Some implementation
    //await Dio().post('$api_base/customers'});
    throw Exception('Not implemented');
  }

  @override
  Future<Unit> create(PhotoEntity data) async {
    //Some implementation
    //await Dio().post('$api_base/customers'});
    return unit;
  }

  @override
  Future<Unit> delete(String id) async {
    //Some implementation
    //await Dio().delete();
    return unit;
  }


  @override
  Future<Unit> update(PhotoEntity photoEntity) async {
    //Some implementation
    //await Dio().put();
    return unit;
  }
}
