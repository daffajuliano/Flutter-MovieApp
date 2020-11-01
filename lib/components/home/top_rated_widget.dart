import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:movee/bloc/top_rated/top_rated.dart';
import 'package:movee/components/other/poster_image_shimmer.dart';
import 'package:movee/components/other/poster_shimmer.dart';
import 'package:movee/model/top_rated_model.dart';
import 'package:movee/repository/top_rated_repository.dart';

class TopRatedWidget extends StatefulWidget {
  @override
  _TopRatedWidgetState createState() => _TopRatedWidgetState();
}

class _TopRatedWidgetState extends State<TopRatedWidget> {
  TopRatedBloc topRatedBloc;

  @override
  void initState() {
    topRatedBloc = TopRatedBloc(topRatedRepository: TopRatedRepository());
    Future.delayed(Duration(seconds: 5));
    topRatedBloc.add(LoadTopRated());
    super.initState();
  }

  @override
  void dispose() {
    topRatedBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Rated",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('tapped');
                  },
                  child: Text(
                    'View more',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<TopRatedBloc, TopRatedState>(
            cubit: topRatedBloc,
            builder: (context, state) {
              if (state is LoadedState) {
                return Container(
                  constraints: BoxConstraints(
                    maxHeight: 280,
                  ),
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: 5,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(width: 12),
                    itemBuilder: (context, index) => _listItem(state.data[index]),
                  ),
                );
              } else {
                return Container(
                  height: 280,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    separatorBuilder: (context, index) => SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      return PosterShimmer();
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _listItem(TopRatedModel data) {
    return GestureDetector(
      onTap: () => Get.toNamed('/detail'),
      child: Container(
        width: 140,
        child: Column(
          children: [
            Container(
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: 'https://image.tmdb.org/t/p/w500${data.posterPath}',
                  width: 140,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => PosterImageShimmer(),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  '${data.title} (${data.releaseDate.year})',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.solidStar,
                      size: 13,
                      color: Colors.yellow[700],
                    ),
                    SizedBox(width: 5),
                    Text(
                      '${data.voteAverage} ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '(${data.voteCount})',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
