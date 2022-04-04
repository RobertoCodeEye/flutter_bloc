import 'dart:developer';

import 'package:bloc_example/blocs/productos_bloc.dart';
import 'package:bloc_example/views/home/home.dart';
import 'package:bloc_example/views/post/post_list.dart';
import 'package:bloc_example/views/post/post_list_sink.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/',
      routes: {
        '/': ( context ) => const Home(),
        '/productos': (context) => Productos(),
        '/posts': (context) => const PostList(),
        '/postNetworking':(context) => const PostsList()
      },
    );
  }
}

class Productos extends StatelessWidget {
  final productosBloc = new ProductosBloc();

  Productos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    productosBloc.ContadorProdcutos;
    return Scaffold(
        appBar: AppBar(
          title: StreamBuilder(
            stream: productosBloc.ContadorProdcutos,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot){
              return Text('Productos (${snapshot.data ?? 0})');
            },
          ),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: productosBloc.GetProductos,
          builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
            log(snapshot.data.toString());
            final productos = snapshot.data ?? [];

            return ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(productos[index]),
                );
              }
            );
          },
        ),
      );
  }
}
