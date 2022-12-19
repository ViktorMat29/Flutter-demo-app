import 'package:app/model/cast_model.dart';
import 'package:app/model/media_model.dart';
import 'package:app/model/video.dart';
import 'package:app/model/video_model.dart';
import 'package:app/utils/tv_show_more_details_arguments.dart';
import 'package:app/widgets/horizontal%20scrolls/horizontal_scroll_tv_cast.dart';
import 'package:app/widgets/video_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/tv_cast.dart';

class TvShowMoreDetails extends StatefulWidget {
  const TvShowMoreDetails({Key? key}) : super(key: key);

  @override
  _TvShowMoreDetailsState createState() => _TvShowMoreDetailsState();
}

class _TvShowMoreDetailsState extends State<TvShowMoreDetails> {
  @override
  Widget build(BuildContext context) {
    var castModel = CastModel();
    var videoModel = VideoModel();
    final args = ModalRoute.of(context)?.settings.arguments
        as TvShowMoreDetailsArguments;
    try {
      castModel.fetchTvCastMembers(args.id);
      videoModel.fetchTrailerLink(args.id, "tv");
    } catch (_) {}
    const String baseImageUrl = "https://image.tmdb.org/t/p/";
    return Material(
      color: Colors.black,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => castModel),
          ChangeNotifierProvider(create: (context) => videoModel)
        ],
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(args.name),
            backgroundColor: Colors.transparent,
          ),
          body: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          "${baseImageUrl}w400${args.backgrounDrop}",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.02,
                        right: MediaQuery.of(context).size.width * 0.03,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black87.withOpacity(0.8),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("User rating: ${args.userRating}"),
                          ),
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0, left: 16.0),
                    child: AutoSizeText(
                      "Overview",
                      minFontSize: 25,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 16),
                    child: AutoSizeText(
                      args.overview,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0, left: 16),
                    child: AutoSizeText(
                      "Trailer",
                      minFontSize: 25,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: VideoWidget(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0, left: 16),
                    child: AutoSizeText(
                      "Actors",
                      minFontSize: 25,
                    ),
                  ),
                  HorizontalScrollTvCast(
                    id: args.id,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
