import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/cubit/cubit/cubit/basket_cubit.dart';
import 'package:myapp/cubit/cubit/data_fetch_cubit.dart';
import 'package:myapp/cubit/cubit/details_cubit.dart';
import 'package:myapp/cubit/cubit/search_value_cubit.dart';
import 'package:myapp/domain/model/products.dart';
import 'package:myapp/domain/repository/products_repository.dart';
import 'package:myapp/presentation/widgets/logo_and_searchbox.dart';
import 'package:myapp/presentation/widgets/modal.dart';
import '../../data/api/service/api_service.dart';

class Home extends StatefulWidget {
  final ApiService apiService;

  const Home({super.key, required this.apiService});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

class Placeholder extends StatelessWidget {
  const Placeholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<DataFetchCubit, DataFetchState>(
        listener: (context, state) {
          if (state is DataFetchLoaded) {
            BlocProvider.of<SearchValueCubit>(context).showSuggestions(
                '',
                BlocProvider.of<DataFetchCubit>(context).state.props.first
                    as List<Record>);
          }
        },
        child: Container(
          child: Column(
            children: [
              Logo_and_Searchbox(),
              Expanded(
                child: Container(
                  color: Colors.grey[50],
                  child: BlocBuilder<DataFetchCubit, DataFetchState>(
                      builder: (context, state) {
                    if (state is DataFetchLoaded) {
                      return BlocBuilder<SearchValueCubit, SearchValueState>(
                        builder: (context, state) {
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Text(
                                    "Today's Deals",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                GridView.builder(
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                      childAspectRatio: 1 / 1.5,
                                      maxCrossAxisExtent: 200,
                                      mainAxisSpacing: 10.0,
                                      crossAxisSpacing: 10.0,
                                    ),
                                    itemCount: state.suggestions.length,
                                    itemBuilder: (BuildContext ctx, index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Column(
                                          children: [
                                            Flexible(
                                              flex: 2,
                                              child: GestureDetector(
                                                onTap: () {
                                                  BlocProvider.of<DetailsCubit>(
                                                          context)
                                                      .show_details(state
                                                          .suggestions[index]);
                                                  showModalBottomSheet<void>(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return Modal();
                                                    },
                                                  );
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Container(
                                                    foregroundDecoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                state
                                                                    .suggestions[
                                                                        index]
                                                                    .fields
                                                                    .picture),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 4,
                                                                left: 8.0),
                                                        child: Text(state
                                                            .suggestions[index]
                                                            .fields
                                                            .name),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 4,
                                                            left: 8,
                                                            right: 8),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          '\$' +
                                                              state
                                                                  .suggestions[
                                                                      index]
                                                                  .fields
                                                                  .price
                                                                  .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        IconButton(
                                                            onPressed: () {
                                                              BlocProvider.of<
                                                                          BasketCubit>(
                                                                      context)
                                                                  .add_product(
                                                                      state.suggestions[
                                                                          index]);
                                                            },
                                                            icon: Icon(
                                                                Icons.shop))
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ],
                            ),
                          );
                        },
                      );
                    }
                    return Text('');
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
