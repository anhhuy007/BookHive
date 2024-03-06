import 'package:either_dart/either.dart';
import 'package:loginform/exceptions/pocketbase_exception.dart';
import 'package:loginform/presentation/dashboard_page/models/book_item_model.dart';
import 'package:loginform/presentation/dashboard_page/models/category_item_model.dart';
import 'package:loginform/presentation/dashboard_page/models/offerbanner_item_model.dart';
import 'package:loginform/presentation/dashboard_page/repository/remote_datasource.dart';

class DashBoardRepository {
  final DashBoardDataSource dashBoardDataSource;
  DashBoardRepository({required this.dashBoardDataSource});

  Future<Either<PocketBaseException, List<CategoryItem>>> fetchCategoryItemList() async {
    return dashBoardDataSource.fetchCategoryItemsList();
  }

  Future<Either<PocketBaseException, List<BookItem>>> fetchBestSellerItemList() async {
    return dashBoardDataSource.fetchBestSellerItemList();
  }

  Future<Either<PocketBaseException, List<OfferbannerItemModel>>> fetchOfferbannerItemlist() async {
    return dashBoardDataSource.fetchOfferbannerItemList();
  }
}
