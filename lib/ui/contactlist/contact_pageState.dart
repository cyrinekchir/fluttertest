import 'package:flutter/material.dart';
import 'package:flutter_app/ui/contactlist/contact_list.dart';
import 'package:flutter_app/model/contact.dart';
import 'package:flutter_app/ui/testDialog/testDialog.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ContactModal> _beers = <ContactModal>[];
  LoadingDialog loadingDialog;

  @override
  void initState() {
    super.initState();
    listenForPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ContactsList(_beers));
  }

  Future<Stream<ContactModal>> getModalContact() async {
    final String url = 'https://jsonplaceholder.typicode.com/posts';

    final client = new http.Client();
    final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

    return streamedRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .expand((data) => (data as List))
        .map((data) => ContactModal.fromJSON(data));
  }

  void listenForPosts() async {
    showLoadingDialog();
    final Stream<ContactModal> stream = await getModalContact();
    stream.listen((ContactModal beer) => setState(() => _beers.add(beer)));
    hideDialog();
  }

  void showLoadingDialog() async {
    await new Future.delayed(new Duration(milliseconds: 30));
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) =>
            loadingDialog = loadingDialog ?? LoadingDialog());
  }

  hideDialog() {
    if (loadingDialog != null && loadingDialog.isShowing()) {
      Navigator.of(context).pop();
      loadingDialog = null;
    }
  }

}
