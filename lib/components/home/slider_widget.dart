import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movee/bloc/carousel/carousel.dart';
import 'package:movee/bloc/upcoming/upcoming.dart';
import 'package:movee/components/other/slider_image_shimmer.dart';
import 'package:movee/repository/upcoming_repository.dart';

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final CarouselController carouselController = CarouselController();

  CarouselBloc _carouselBloc;
  UpcomingBloc _upcomingBloc;

  static final List<String> imgSlider = [
    'cap_america.jpg',
    'batman.jpg',
  ];

  @override
  void initState() {
    _carouselBloc = CarouselBloc(CarouselInitial());
    _carouselBloc.add(LoadCarousel());

    _upcomingBloc = UpcomingBloc(upcomingRepository: UpcomingRepository());
    _upcomingBloc.add(LoadUpcoming());

    super.initState();
  }

  @override
  void dispose() {
    _carouselBloc.close();
    _upcomingBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingBloc, UpcomingState>(
        cubit: _upcomingBloc,
        builder: (context, state) {
          if (state is LoadedState) {
            return Container(
              child: Stack(
                children: [
                  CarouselSlider(
                    carouselController: carouselController,
                    items: state.data.take(5).map((item) {
                      return Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              child: CachedNetworkImage(
                                imageUrl: 'https://image.tmdb.org/t/p/w500${item.backdropPath}',
                                width: 10000,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => SliderImageShimmer(),
                              ),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.all(8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                color: Color.fromARGB(120, 0, 0, 0),
                              ),
                              child: Text(
                                '${item.title}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1,
                      height: 200,
                      onPageChanged: (index, reason) {
                        _carouselBloc.add(ItemChanged(index: index));
                      },
                    ),
                  ),
                  BlocBuilder<CarouselBloc, CarouselState>(
                    cubit: _carouselBloc,
                    builder: (context, carouselState) {
                      if (carouselState is CarouselLoaded) {
                        return Positioned(
                          bottom: 8,
                          right: 0,
                          left: 0,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: state.data.take(5).map((item) {
                              int index = state.data.indexOf(item);
                              return Container(
                                width: 8,
                                height: 8,
                                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: carouselState.currentIndex == index
                                      ? Color.fromRGBO(0, 0, 0, 0.9)
                                      : Color.fromRGBO(0, 0, 0, 0.4),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          } else {
            return SliderImageShimmer();
          }
        });
  }
}
