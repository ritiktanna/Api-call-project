import 'package:flutter/material.dart';
import '../server_files/database_connector.dart';
import '../models/server_data_model.dart';

class HomeScreenDio extends StatefulWidget {
  const HomeScreenDio({Key? key}) : super(key: key);

  @override
  State<HomeScreenDio> createState() => _HomeScreenDioState();
}

class _HomeScreenDioState extends State<HomeScreenDio> {
  List<ServerDataModelClass> listOfDataDio = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.refresh,
          ),
          onPressed: () {
            _getData();
          },
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: listOfDataDio.isEmpty
                ? const CircularProgressIndicator()
                : ListView.builder(
                    itemCount: listOfDataDio.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(listOfDataDio[index].name),
                          subtitle: Text(listOfDataDio[index].username),
                          trailing: Text(listOfDataDio[index].id.toString()),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }

  Future<void> _getData() async {
    final connector = DioHelperClass();
    listOfDataDio.clear();
    listOfDataDio = await connector.getData();
    setState(() {});
  }
}
