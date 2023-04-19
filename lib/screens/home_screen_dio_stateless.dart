import 'dart:async';

import 'package:flutter/material.dart';
import '../server_files/database_connector.dart';
import '../models/server_data_model.dart';

class HomeScreenDioStateless extends StatelessWidget {
  HomeScreenDioStateless({Key? key}) : super(key: key);

  final StreamController<List<ServerDataModelClass>> _streamController =
      StreamController<List<ServerDataModelClass>>();
  final List<ServerDataModelClass> listOfDataDio = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          getData();
        },
      ),
      body: Center(
        child: StreamBuilder(
          stream: _streamController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data![index].name),
                      subtitle: Text(snapshot.data![index].username),
                      trailing: Text('${snapshot.data![index].id}'),
                    ),
                  );
                },
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Future<void> getData() async {
    final connector = DioHelperClass();
    _streamController.sink.add(await connector.getData());
  }
}
