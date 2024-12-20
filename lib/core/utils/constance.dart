class ApiConstance{
  static const String baseUrl="https://api.themoviedb.org/3";

  static const String apiKey="61665dea1d8f56d9fb803fa5681450bf";

  static const String upComingPath="$baseUrl/movie/upcoming?api_key=$apiKey";

  static const String popularPath="$baseUrl/movie/popular?api_key=$apiKey";

  static const String topRatedPath="$baseUrl/movie/top_rated?api_key=$apiKey";

  static  String movieDetailsPath(int movieId)=> "$baseUrl/movie/$movieId?api_key=$apiKey";

  static  String castCrewPath(int movieId)=> "$baseUrl/movie/$movieId/credits?api_key=$apiKey";

  static  String VideoPath(movieId)=> "$baseUrl/movie/$movieId/videos?api_key=$apiKey";

  static  String SearchPath(String movieName)=> "$baseUrl/search/movie?api_key=$apiKey&&query=$movieName";

  static  String movieRecommendationPath(int movieId)=> "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  static const String baseImageUrl='https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path)=>'$baseImageUrl$path';

}
