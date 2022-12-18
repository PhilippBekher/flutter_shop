import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/cubit/cubit/cubit/basket_cubit.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Back',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.black),
      ),
      backgroundColor: Colors.grey[50],
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Text(
              'Cart',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            BlocBuilder<BasketCubit, BasketState>(
              builder: (context, state) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.records!.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          leading: Image.network(
                              state.records![index].fields.picture),
                          visualDensity: VisualDensity(vertical: 3),
                          title: Column(
                            children: [
                              Text(
                                BlocProvider.of<BasketCubit>(context)
                                    .state
                                    .records![index]
                                    .fields
                                    .name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                BlocProvider.of<BasketCubit>(context)
                                    .state
                                    .records![index]
                                    .fields
                                    .name,
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                BlocProvider.of<BasketCubit>(context)
                                    .state
                                    .records![index]
                                    .fields
                                    .name,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
