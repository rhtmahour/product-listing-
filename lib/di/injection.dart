import 'package:flutter_clean_mvvm/data/models/sources/product_remote_data_source.dart';
import 'package:flutter_clean_mvvm/data/repositories/product_repository_impl.dart';
import 'package:flutter_clean_mvvm/domain/entities/repositories/product_repository.dart';
import 'package:flutter_clean_mvvm/presentation/viewmodels/product_list_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // External
  sl.registerLazySingleton<http.Client>(() => http.Client());

  // Data sources
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(client: sl()),
  );

  // Repositories
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDataSource: sl()),
  );

  // ViewModels
  sl.registerFactory(() => ProductListViewModel(repository: sl()));
}
