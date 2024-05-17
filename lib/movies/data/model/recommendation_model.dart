
import 'package:movies_app/movies/domain/entities/movie_recommendation.dart';

class RecommendationModel extends MovieRecommendation{
 const RecommendationModel({required super.id, required super.backdropPath, required super.title});

 factory RecommendationModel.fromjson(Map<String,dynamic>json)=>
     RecommendationModel(
         id:json["id"],
         backdropPath: json["backdrop_path"],
       title: json['title'],
     );

}