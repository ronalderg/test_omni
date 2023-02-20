import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_omni/data/data_sources/interfaces/photo_datasource.dart';
import 'package:test_omni/data/entities/photo_entity.dart';
import 'package:test_omni/domain/model/photo.dart';
import 'package:test_omni/domain/repository/implementation/photo_repository_impl.dart';
import 'package:test_omni/domain/repository/interfaces/photo_repository.dart';

class MockPhotoDataSource extends Mock implements PhotoDataSource {}

void main() {
  late PhotoDataSource mockDS;
  late PhotoRepository photoRepository;
  setUp(() {
    mockDS = MockPhotoDataSource();
    photoRepository = PhotoRepositoryImpl(mockDS);
  });

  group('getPhotos', () {
    test('should return all list of Photo models', () async {
      //arrange
      final dsResponse = [
        const PhotoEntity(
          id: 1,
          albumId: 1,
          title: 'accusamus beatae ad facilis cum similique qui sunt',
          url:'https://via.placeholder.com/600/92c952',
          thumbnailUrl: 'https://via.placeholder.com/150/92c952',
        )
      ];

      final expected = [
        const Photo(
          id: 1,
          albumId: 1,
          title: 'accusamus beatae ad facilis cum similique qui sunt',
          url:'https://via.placeholder.com/600/92c952',
          thumbnailUrl: 'https://via.placeholder.com/150/92c952',
        )
      ];

      when(() => mockDS.getPhotos(start: 0, limit: 1))
          .thenAnswer((_) async => dsResponse);

      //act
      final result = await photoRepository.getPhotos(start: 0, limit: 1);

      //assert
      var resultList = List<Photo>.empty();
      // ignore: inference_failure_on_collection_literal
      result.fold((l) => {}, (r) => {resultList = expected});
      expect(resultList, equals(expected));
    });
  });
}
