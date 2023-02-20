import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:test_omni/core/error/failures.dart';
import 'package:test_omni/data/data_sources/interfaces/photo_datasource.dart';
import 'package:test_omni/domain/model/photo.dart';
import 'package:test_omni/domain/repository/interfaces/photo_repository.dart';

///
class PhotoRepositoryImpl implements PhotoRepository {
  ///Constr
  PhotoRepositoryImpl(this.photoDataSource);
  ///Datasource
  PhotoDataSource photoDataSource;

  @override
  Future<Either<Failure, List<Photo>>> getPhotos({
    required int start, required int limit,}) async {
    try {
      final result = await photoDataSource.getPhotos(
          start: start, limit: limit,);
      return Right(result
          .map((e) => Photo(
        id: e.id,
        title: e.title,
        albumId: e.albumId,
        url: e.url,
        thumbnailUrl: e.thumbnailUrl,
      ),).toList(),);

    } catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Photo>> getPhoto(String id) async {
    try {
      final result = await photoDataSource.getPhoto(id);
      return Right(Photo(
        id: result.id,
        title: result.title,
        albumId: result.albumId,
        thumbnailUrl: result.thumbnailUrl,
        url: result.url,
      ),);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> createPhoto(Photo photo) async {
    throw Exception('Not implemented');
  }

  @override
  Future<Either<Failure, Unit>> deletePhoto(String id) async {
    throw Exception('Not implemented');
  }

  @override
  Future<Either<Failure, Unit>> updatePhoto(Photo photo) async {
    throw Exception('Not implemented');
  }
}
