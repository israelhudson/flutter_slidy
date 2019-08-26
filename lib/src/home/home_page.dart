import 'package:flutter/material.dart';
import 'package:flutter_slidy/src/widgets/product_qtd_widget.dart';

import 'home_bloc.dart';
import 'home_module.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var bloc = HomeModule.to.getBloc<HomeBloc>();

  @override
  void initState() {
    //bloc.getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        leading: ProductQtdWidget(),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder<int>(
              stream:bloc.saida ,
              builder: (context, snapshot) {

                return Center(child: Text("${snapshot.data}",style: TextStyle(fontSize: 36),));

              }
              ,
            ),
          ),

        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(child: Icon(Icons.exposure_plus_1),
            onPressed: ()=> bloc.aumentar(),
          ),
          FloatingActionButton(child: Icon(Icons.exposure_neg_1),
            onPressed: ()=> bloc.diminuir(),
          ),
        ],
      ),


    );
  }

}
