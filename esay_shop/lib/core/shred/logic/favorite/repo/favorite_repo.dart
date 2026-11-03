import 'package:dio/dio.dart';

import '../../../../network/end_points.dart';

class FavoriteRepo {
  final Dio _dio;

  FavoriteRepo(this._dio);


  Future<Response> toggleFavorite(String productId) async {
    return await _dio.post(
      EndPoints.favoritesStore,
      data: {'product_id': productId},
    );
  }


  Future<Response> destroyFavorite(String productId) async {
    return await _dio.delete(
      EndPoints.favoritesDestroy,
      data: {'product_id': productId},
    );
  }

  Future<Response> getFavorites() async {
    return await _dio.get(EndPoints.favorites);
  }
}