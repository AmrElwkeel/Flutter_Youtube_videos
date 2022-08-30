import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../base/api_base.dart';
import '../blocs/fetch_bloc/fetch_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FetchBloc _bloc = FetchBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(GetData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users'), centerTitle: true),
      body: BlocProvider(
        create: (context) => _bloc,
        child: BlocBuilder(
            bloc: _bloc,
            builder: (context, state) {
              if (state is FetchSuccess) {
                return ListView.builder(
                    itemCount: state.user.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white10,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 20),
                          title: Text('${state.user[index].firstName} '
                              '${state.user[index].lastName}'),
                          leading: SizedBox(
                            child: Image.network('${state.user[index].avatar}'),
                          ),
                        ),
                      );
                    });
              }

              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
