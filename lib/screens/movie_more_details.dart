import 'package:app/utils/movie_more_details_arguments.dart';
import 'package:flutter/material.dart';

class MovieMoreDetails extends StatefulWidget {
  const MovieMoreDetails({Key? key}) : super(key: key);

  @override
  _MovieMoreDetailsState createState() => _MovieMoreDetailsState();
}

class _MovieMoreDetailsState extends State<MovieMoreDetails> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as MovieMoreDetailsArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.name),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
