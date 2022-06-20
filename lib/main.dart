import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:goturkey/login.dart';

import 'package:goturkey/services/auth.dart';
import 'package:goturkey/services/on_board.dart';

import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    Provider<Auth>(
      create: (context) => Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: girissayfasi(),
      ),
    ),
  );
}

class girissayfasi extends StatelessWidget {
  const girissayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loginpage();
  }
}

class mySearchDelegate extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
