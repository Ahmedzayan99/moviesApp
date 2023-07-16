import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/network/api_constance.dart';
import 'package:movies/core/unit/enum.dart';
import 'package:movies/presentation/controler/movies_bloc/movies_bloc.dart';
import 'package:movies/presentation/controler/movies_bloc/movies_state.dart';
import 'package:movies/presentation/screens/get_movies_details.dart';
import 'package:shimmer/shimmer.dart';

class NowPlayingComponent  extends StatelessWidget {
  const NowPlayingComponent ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc,MoviesState>(
      buildWhen: (previous, current) => previous.nowPlayingState !=current.nowPlayingState,
        builder: (context, state) {
          switch (state.nowPlayingState)
      {
        case RequestState.loading:
          return const SizedBox(
            height: 400,
            child: Center(child: CircularProgressIndicator(),),
          );
        case RequestState.loaded:
           return   FadeIn(
             duration: const Duration(milliseconds: 500),
             child: CarouselSlider(
        items: state.nowPlayingMovies.map((item) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    MovieDetailScreen(id:item.id as int),
              ),
            );
        },
          child:Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  ShaderMask(
                    shaderCallback:(rect){
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          // fromLTRB
                          Colors.transparent,
                          Colors.black,
                          Colors.black,
                          Colors.transparent,
                        ],
                        stops: [0, 0.3, 0.5, 1],).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height),
                      );} ,
                    blendMode:BlendMode.dstIn ,
                    child:CachedNetworkImage(
                      height: 300.0,
                      width: double.infinity,
                      imageUrl: '${ApiConstance.imageUrl(item.backdropPath)}',
                      fit: BoxFit.fill,
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
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Column(
                     //crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.circle,
                              color: Colors.redAccent,
                              size: 18.0,
                            ),
                            SizedBox(width: 5.0,),
                            Text('now Playing'.toUpperCase(),
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],),
                        SizedBox(height: 4.0,),
                          Padding(
                              padding:EdgeInsets.only(bottom: 25.0),
                          child: Text('${item.title}'.toUpperCase(),
                              style:TextStyle(fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 24.0)),
                        ),

                      ],
                    ),
                  ),
                ]
          ),
        )).toList(),
        options: CarouselOptions(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          height: 300.0,
          viewportFraction:1.0,
        ),
      ),
             delay: Duration(microseconds: 500),
           );
        case RequestState.error:
         return SizedBox(
          height: 400,
         child: Center(child: Text(state.nowPlayingMessage),));
  }
  }
    );
  }
}