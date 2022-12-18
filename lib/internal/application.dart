import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/data/api/service/api_service.dart';
import '../cubit/cubit/cubit/basket_cubit.dart';
import '../cubit/cubit/data_fetch_cubit.dart';
import '../cubit/cubit/details_cubit.dart';
import '../cubit/cubit/search_value_cubit.dart';
import '../domain/repository/products_repository.dart';
import '../presentation/screens/home.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DataFetchCubit(
              productsRepository: ProductsRepository(apiService: ApiService()))
            ..fetchDataApi(),
        ),
        BlocProvider(
          create: (context) => BasketCubit(),
        ),
        BlocProvider(
          create: (context) => SearchValueCubit(),
        ),
        BlocProvider(
          create: (context) => DetailsCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(
          apiService: ApiService(),
        ),
      ),
    );
  }
}
