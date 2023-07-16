class ApiConstance{
  static const String baseUrl="https://api.themoviedb.org/3";
  static const String apiKay="api_key=9361b29b116fdeec67a998873584db8b";
  static const String getNowPlaying="$baseUrl/movie/now_playing?$apiKay";
  static const String getPopularMovies="$baseUrl/movie/popular?$apiKay";
  static const String getTopRatedMovies="$baseUrl/movie/top_rated?$apiKay";
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500/';
  static String imageUrl(String path) => '$baseImageUrl$path';
  static String movieDetailsPath(int id) => "$baseUrl/movie/$id?$apiKay";
  static String recommendationPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?$apiKay";
}