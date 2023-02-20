import 'package:dartz/dartz.dart';
import 'package:test_omni/core/error/failures.dart';
import 'package:test_omni/domain/model/photo.dart';

///
abstract class PhotoRepository {
  ///
  Future<Either<Failure, List<Photo>>> getPhotos({
    required int start, required int limit,
  });
  ///
  Future<Either<Failure, Photo>> getPhoto(String id);
  ///
  Future<Either<Failure, Unit>> createPhoto(Photo photo);
  ///
  Future<Either<Failure, Unit>> deletePhoto(String id);
  ///
  Future<Either<Failure, Unit>> updatePhoto(Photo photo);
}
