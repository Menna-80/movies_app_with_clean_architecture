import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_color.dart';
import 'package:movies_app/core/utils/constance.dart';
import 'package:movies_app/movies/domain/entities/favorite_movies.dart';
import 'package:movies_app/movies/presentation/screens/movie_detail_screen.dart';



class VerticalListViewCard extends StatelessWidget {
  const VerticalListViewCard({
    super.key,
    required this.media,
  });

  final FavoritesMovies media;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>MovieDetailScreen(id: media.id,)));
      },
      child: Container(
        height: 175,
        decoration: BoxDecoration(
          color: AppColor.secondaryBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: ApiConstance.imageUrl(media.posterUrl),
                  width: 110,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      media.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleMedium,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        media.releaseDate.split(',')[0],
                        style: const TextStyle(
                          fontSize: 14.0,
                         // fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16.0,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            (media.voteAverage / 2)
                                .toStringAsFixed(1),
                            style: const TextStyle(
                              fontSize: 12.0,
                              //fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            '(${media.voteAverage})',
                            style: const TextStyle(
                              fontSize: 1.0,
                             // fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Text(
                      media.overview,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
