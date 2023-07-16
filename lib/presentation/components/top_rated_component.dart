import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/network/api_constance.dart';
import 'package:movies/core/unit/enum.dart';
import 'package:movies/presentation/controler/movies_bloc/movies_bloc.dart';
import 'package:movies/presentation/controler/movies_bloc/movies_state.dart';
import 'package:movies/presentation/screens/get_movies_details.dart';
import 'package:shimmer/shimmer.dart';

class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc,MoviesState>(
        buildWhen: (previous, current) => previous.topRatedState !=current.topRatedState,
        builder: (context, state) {
          switch (state.topRatedState) {
            case RequestState.loading:
              return const SizedBox(
                height: 170,
                child: Center(child: CircularProgressIndicator(),),
              );
            case RequestState.loaded:
              return SizedBox(
                height:200.0 ,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection:Axis.horizontal ,
                    itemBuilder:  (context, index) {
                      final movie = state.topRatedMovies[index];
                      return  InkWell(
                       onTap: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (BuildContext context) =>
                                 MovieDetailScreen(id:movie.id as int),
                           ),
                         );
                       },
                        child: Container(
                          padding: EdgeInsets.only(right: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            child: CachedNetworkImage(
                              imageUrl: '${ApiConstance.imageUrl(movie.backdropPath)}',
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey[850]!,
                                highlightColor: Colors.grey[700]!,
                                child: Container(
                                  height: 170.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                              fit: BoxFit.cover,
                              width: 120,

                            ),
                          ),
                        ),
                      );
                    },
                    itemCount:state.popularMovies.length ,),
                ),
              );
            case RequestState.error:
              return SizedBox(
                  height: 170,
                  child: Center(child: Text(state.popularMessage),));
          }
        }
    );
  }
}