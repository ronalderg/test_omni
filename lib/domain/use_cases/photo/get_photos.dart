import 'package:dartz/dartz.dart';
import 'package:test_omni/core/error/failures.dart';
import 'package:test_omni/domain/model/photo.dart';
import 'package:test_omni/domain/repository/interfaces/photo_repository.dart';

/// Interface of Photos
abstract class GetPhotos {
  ///Execute use-case
  Future<Either<Failure, List<Photo>>> execute({
    required int start, required int limit,});
}

///Implementation
class GetPhotosImpl implements GetPhotos {
  ///Constructor
  GetPhotosImpl(this.photoRepository);
  ///Repository to get Photo
  final PhotoRepository photoRepository;

  @override
  Future<Either<Failure, List<Photo>>> execute({
    required int start, required int limit,}) async {
    final result = await photoRepository.getPhotos(start: start, limit: limit);
    return result;
  }
}
