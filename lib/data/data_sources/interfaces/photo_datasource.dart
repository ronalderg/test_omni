import 'package:dartz/dartz.dart';
import 'package:test_omni/data/entities/photo_entity.dart';

///Interfaz of Photo Data source
abstract class PhotoDataSource {
  ///Interface to get Photo's
  Future<List<PhotoEntity>> getPhotos({
    required int start, required int limit,
  });
  ///Interface to get an photo
  Future<PhotoEntity> getPhoto(String id);
  ///Interface to create Photo's
  Future<Unit> create(PhotoEntity photoEntity);
  ///Interface to delete Photo's
  Future<Unit> delete(String id);
  ///Interface to update Photo's
  Future<Unit> update(PhotoEntity photoEntity);
}
