import 'dart:math';

import 'package:either_dart/either.dart';
import 'package:loginform/exceptions/pocketbase_exception.dart';
import 'package:loginform/presentation/dashboard_page/models/category_item_model.dart';
import 'package:pocketbase/pocketbase.dart';

import '../../../data/api/endpoint.dart';
import '../models/book_item_model.dart';

abstract class DashBoardDataSource {
  Future<Either<PocketBaseException, List<CategoryItem>>> fetchCategoryItemsList();
  Future<Either<PocketBaseException, List<BookItem>>> fetchBestSellerItemList();
}

class DashBoardRemoteDataSource extends DashBoardDataSource {
  @override
  Future<Either<PocketBaseException, List<CategoryItem>>> fetchCategoryItemsList() async {
    final pb = PocketBase(baseURL);
    
    try {
      final response = await pb.collection("Categories").getList();

      // suppose the response always returns a list of CategoryItem
      var categoryItemList = <CategoryItem>[];
      for(var item in response.items){
        CategoryItem categoryItem = CategoryItem.fromJson(item.data);
        categoryItemList.add(categoryItem);
      }

      return Right(categoryItemList);
    }
    catch(err) {
      print("Error response: ${err.toString()}");
      return Left(PocketBaseException(message: err.toString(), code: 400, data: null));
    }
  }

  @override
  Future<Either<PocketBaseException, List<BookItem>>> fetchBestSellerItemList() async {
    final pb = PocketBase(baseURL);

    try {
      final response = await pb.collection("Books").getList(
        sort:'NumberOfSellers'
      );
      // suppose the response always returns a list of CategoryItem
      var bookItemList = <BookItem>[];
      for(var i = 0; i < min(response.totalItems, 10); i++){
        final item = response.items[i];
        BookItem categoryItem = BookItem.fromJson(item.data);
        bookItemList.add(categoryItem);
      }

      return Right(bookItemList);
    }
    catch(err) {
      return Left(PocketBaseException(message: err.toString(), code: 400, data: null));
    }
  }

}