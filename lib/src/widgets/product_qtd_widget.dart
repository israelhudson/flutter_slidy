import 'package:flutter/material.dart';
import 'package:flutter_slidy/src/home/home_bloc.dart';
import 'package:flutter_slidy/src/home/home_module.dart';

class ProductQtdWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    var bloc = HomeModule.to.getBloc<HomeBloc>();
    
    return  Container(
      alignment: Alignment.center,
      width: 100,
      height: 100,
      child: StreamBuilder(
        stream: bloc.saida,
        builder: (context, snapshot){
          return Text("${snapshot.data}");
        },
      ),
    );
  }
}
