import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_omni/core/error/failures.dart';
import 'package:test_omni/domain/model/photo.dart';
import 'package:test_omni/domain/repository/interfaces/photo_repository.dart';
import 'package:test_omni/domain/use_cases/photo/get_photos.dart';

class MockPhotoRepository extends Mock implements PhotoRepository {}

void main() {
  late PhotoRepository mockCustomerRepository;
  late GetPhotos usecase;

  setUp(() {
    mockCustomerRepository = MockPhotoRepository();
    usecase = GetPhotosImpl(mockCustomerRepository);
  });

  test('should get all customers from the customer repository', () async {
    // ignore: prefer_final_locals
    Either<Failure, List<Photo>> repoResult =
        const Right<Failure, List<Photo>>([
      Photo(
        id: 1,
        albumId: 1,
        title: 'accusamus beatae ad facilis cum similique qui sunt',
        url: 'https://via.placeholder.com/600/92c952',
        thumbnailUrl: 'https://via.placeholder.com/150/92c952',
      ),
      Photo(
        id: 2,
        albumId: 1,
        title: 'reprehenderit est deserunt velit ipsam',
        url: 'https://via.placeholder.com/600/771796',
        thumbnailUrl: 'https://via.placeholder.com/150/771796',
      ),
    ]);

    when(() => mockCustomerRepository.getPhotos(start: 0, limit: 2))
        .thenAnswer((_) async => repoResult);

    final result = await usecase.execute(start: 0, limit: 2);

    expect(result, equals(repoResult));
    verify(() => mockCustomerRepository.getPhotos(start: 0, limit: 2));
    verifyNoMoreInteractions(mockCustomerRepository);
  });
}
