import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/network/api_constance.dart';
import 'package:movies/presentation/controler/movies_bloc/movies_bloc.dart';
import 'package:movies/presentation/controler/movies_bloc/movies_state.dart';
import 'package:shimmer/shimmer.dart';

class MoviesListPopular extends StatelessWidget {
   MoviesListPopular({Key? key, required this.popularMovies,}) : super(key: key);
 final String popularMovies;
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<MoviesBloc,MoviesState>(
        buildWhen: (previous, current) =>  popularMovies=='TopRated'?previous.topRatedMovies !=current.topRatedMovies:previous.popularMovies !=current.popularMovies,
    builder: (context, state) {
      return Scaffold(
          appBar: AppBar(title: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text('Top Rated Movies',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),),
          body: ListView.builder(
            itemBuilder: (context, index) {
              var listPopularMovies =popularMovies=='TopRated'?state.topRatedMovies:state.popularMovies;
              return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.all(Radius.circular(15.0))

              ),
              child:  Padding(
              padding: EdgeInsetsDirectional.all(8.0),
              child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  child: CachedNetworkImage(
                    imageUrl:'${ApiConstance.imageUrl(listPopularMovies[index].backdropPath)}',
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[850]!,
                      highlightColor: Colors.grey[700]!,
                      child: Container(
                        height: 170.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    height: 170.0,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                ),

              SizedBox(width: 10.0,),
              Expanded(
              flex: 2,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("${listPopularMovies[index].title}",
              maxLines: 1,
              style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              )) ,
              Row(
              children: [
              Chip(
              label: Text(
                  '${listPopularMovies[index].releaseDate.toString().replaceRange(4,null,'')}'),
              shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              backgroundColor: Colors.red,
              padding: EdgeInsets.all(0),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              SizedBox(
              width: 12.0,),
              Icon(
              Icons.star,
              color: Colors.amber),
              Text('${listPopularMovies[index].voteAverage}'
              ),
              ],
              ),
              SizedBox(height: 15.0,),
              Text( '${listPopularMovies[index].overview}',
              maxLines: 2,overflow: TextOverflow.ellipsis,
              style:TextStyle(color: Colors.white,
              fontWeight: FontWeight.w500,) ,)
              ]),
              ),
              ],
              ),
              ),
              ),
              );
            },
            itemCount:state.popularMovies.length,
            physics: BouncingScrollPhysics(),
          )

      );
    }
    );
  }
}
