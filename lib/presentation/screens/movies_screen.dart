import 'package:flutter/material.dart';
import 'package:movies/core/services/services_locator.dart';
import 'package:movies/core/network/api_constance.dart';
import 'package:movies/domain/use_cases/get_now_playing_use_case.dart';
import 'package:movies/presentation/components/now_playing_component%20.dart';
import 'package:movies/presentation/components/popular_component.dart';
import 'package:movies/presentation/components/top_rated_component.dart';
import 'package:movies/presentation/controler/movies_bloc/movies_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/presentation/controler/movies_bloc/movies_event.dart';
import 'package:movies/presentation/controler/movies_bloc/movies_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies/presentation/screens/movies_list_popular_screen.dart';

class MoviesScreen extends StatelessWidget {
   const MoviesScreen({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
     return Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NowPlayingComponent(),
                    Container(
                      margin: const EdgeInsets.fromLTRB(19.0, 24.0, 16.0, 0.0),
                      child: Row(
                        children: [
                          const Text(
                            'Popular',
                            style:TextStyle(
                              fontSize:20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.15,
                            ),
                          ),
                          Spacer(),
                        InkWell(onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MoviesListPopular(popularMovies: '',)));
                        },
                          child: Row(
                            children: [
                              Text('show more',
                                style:TextStyle(
                                fontSize:16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w200,
                                letterSpacing: 0.15,
                              ),),
                              Icon(Icons.arrow_forward_ios,size: 18.0,color: Colors.grey,),
                            ],
                          ),
                        ),
                        ],
                      ),
                    ),
                    PopularComponent(),
                    Container(
                      margin: const EdgeInsets.fromLTRB(19.0, 24.0, 16.0, 0.0),
                      child: Row(
                        children: [
                          const Text(
                            'Top Rated',
                            style:TextStyle(
                              fontSize:20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.15,
                            ),
                          ),
                          Spacer(),
                          InkWell(onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MoviesListPopular(popularMovies: 'TopRated',)));

                          },
                            child: Row(
                              children: [
                                Text('show more',
                                  style:TextStyle(
                                    fontSize:16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w200,
                                    letterSpacing: 0.15,
                                  ),),
                                Icon(Icons.arrow_forward_ios,size: 18.0,color: Colors.grey,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    TopRatedComponent(),
                  ]),
            )
    );
  }
}
