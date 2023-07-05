import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:demo_app_architecture/core/domain/model/cat.dart';
import 'package:demo_app_architecture/core/domain/model/get_cats_list_failure.dart';
import 'package:demo_app_architecture/core/domain/networking/networking_client.dart';
import 'package:demo_app_architecture/core/domain/repositories/cats_repository.dart';
import 'package:demo_app_architecture/core/utils/either_extensions.dart';

class RestApiCatsRepository implements CatsRepository {
  final NetworkClient networkClient;

  const RestApiCatsRepository(this.networkClient);

  @override
  Future<Either<GetCatsListFailure, List<Cat>>> getCatsList() {
    return networkClient.get(path: '').mapSuccess((response) {
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final catsData = body as List<dynamic>;
        final cats = catsData.map((catData) => Cat.fromJson(catData)).toList();
        return cats;
      } else {
        throw const GetCatsListFailure.unknown();
      }
    }).mapFailure((fail) => const GetCatsListFailure.unknown());
  }
}
