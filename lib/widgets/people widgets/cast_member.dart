import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CastMember extends StatefulWidget {
  final int castId;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final String? profilePath;
  final String character;
  final String creditId;
  final int order;
  const CastMember(
      {Key? key,
      required this.castId,
      required this.knownForDepartment,
      required this.name,
      required this.originalName,
      required this.profilePath,
      required this.character,
      required this.creditId,
      required this.order})
      : super(key: key);

  @override
  _CastMemberState createState() => _CastMemberState();
}

class _CastMemberState extends State<CastMember> {
  @override
  Widget build(BuildContext context) {
    const String baseImageUrl = "https://image.tmdb.org/t/p/";
    print("profile path:${widget.profilePath}");
    return SizedBox(
      width: 150,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Image.network(
              '${baseImageUrl}w200${widget.profilePath}',
              scale: 1,
            ),
          ),
          Center(
            child: AutoSizeText(
              widget.name,
              minFontSize: 12,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: AutoSizeText(
              "(${widget.character})",
              minFontSize: 12,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
