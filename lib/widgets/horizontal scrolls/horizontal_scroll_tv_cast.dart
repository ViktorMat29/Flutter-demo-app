import 'dart:core';

import 'package:app/model/cast_model.dart';
import 'package:app/widgets/people%20widgets/cast_member.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/tv_cast.dart';

class HorizontalScrollTvCast extends StatefulWidget {
  final int id;
  const HorizontalScrollTvCast({Key? key, required this.id}) : super(key: key);

  @override
  _HorizontalScrollTvCastState createState() => _HorizontalScrollTvCastState();
}

class _HorizontalScrollTvCastState extends State<HorizontalScrollTvCast> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const PageScrollPhysics(),
        children: Provider.of<CastModel>(context, listen: true)
            .tvCast
            .where((tvcast) => tvcast.profilePath != null)
            .map((castMember) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CastMember(
                      castId: castMember.castId,
                      character: castMember.character,
                      creditId: castMember.creditId,
                      knownForDepartment: castMember.knownForDepartment,
                      name: castMember.name,
                      order: castMember.order,
                      originalName: castMember.originalName,
                      profilePath: castMember.profilePath),
                ))
            .toList(),
      ),
    );
  }
}
