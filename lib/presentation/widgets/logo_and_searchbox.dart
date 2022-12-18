import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/cubit/cubit/cubit/basket_cubit.dart';
import 'package:myapp/cubit/cubit/data_fetch_cubit.dart';
import 'package:myapp/presentation/screens/basket.dart';
import '../../cubit/cubit/search_value_cubit.dart';
import '../../domain/model/products.dart';

class Logo_and_Searchbox extends StatelessWidget {
  const Logo_and_Searchbox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, top: 12, right: 16, bottom: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'flutter-logo_drzj7u.png',
                width: 40,
                height: 40,
              ),
              BlocBuilder<BasketCubit, BasketState>(builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BasketScreen()),
                    );
                  },
                  child: Text(
                      'Items in basket: ' + state.records!.length.toString()),
                );
              })
            ],
          ),
          BlocBuilder<SearchValueCubit, SearchValueState>(
            builder: (context, state) {
              TextEditingController controller = TextEditingController();

              controller.value = TextEditingValue(
                  text: state.value,
                  selection: TextSelection.fromPosition(
                      TextPosition(offset: state.value.length)));
              return Container(
                margin: EdgeInsets.only(top: 12),
                child: TextField(
                    controller: controller,
                    onChanged: (value) {
                      BlocProvider.of<SearchValueCubit>(context)
                          .showSuggestions(
                              controller.text,
                              BlocProvider.of<DataFetchCubit>(context)
                                  .state
                                  .props
                                  .first as List<Record>);

                      print(controller.text);
                    },
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Search..',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.blueAccent)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.black)))),
              );
            },
          ),
        ],
      ),
    );
  }
}
