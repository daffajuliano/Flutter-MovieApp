import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movee/bloc/popular/popular.dart';
import 'package:movee/components/other/poster_image_shimmer.dart';
import 'package:movee/components/other/poster_shimmer.dart';
import 'package:movee/model/popular_model.dart';
import 'package:movee/repository/popular_repository.dart';

class PopularWidget extends StatefulWidget {
  @override
  _PopularWidgetState createState() => _PopularWidgetState();
}

class _PopularWidgetState extends State<PopularWidget> {
  PopularBloc popularBloc;

  @override
  void initState() {
    popularBloc = PopularBloc(popularRepository: PopularRepository());
    popularBloc.add(LoadPopular());
    super.initState();
  }

  @override
  void dispose() {
    popularBloc.close();
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
                  "Very Popular",
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
          BlocBuilder<PopularBloc, PopularState>(
            cubit: popularBloc,
            builder: (context, state) {
              if (state is LoadedState) {
                return Container(
                  constraints: BoxConstraints(
                    maxHeight: 280,
                  ),
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: 4,
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

  Widget _listItem(PopularModel data) {
    return Container(
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
                    FontAwesomeIcons.solidHeart,
                    size: 13,
                    color: Colors.pink,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '${data.popularity.ceil()} ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
