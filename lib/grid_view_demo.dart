import 'package:flutter/material.dart';
import 'model/movie_model.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  static final List<MovieModel> movies = [
    MovieModel(
      title: "Avengers: Infinity War",
      genre: "Action, Adventure, Fantasy",
      image: "https://m.media-amazon.com/images/I/71niXI3lxlL._AC_SY679_.jpg",
      releaseDate: "27 April 2018",
      runtime: "2h 29min",
      rating: 4.5,
    ),
    MovieModel(
      title: "Transformers: The Last Knight",
      genre: "Action, Adventure, Sci-Fi",
      image:
          "https://i.ytimg.com/vi/5a09yJU-mCI/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLDa8_CO_x0Tp8aCQA1zAojHvm-acw",
      releaseDate: "21 June 2017",
      runtime: "2h 34min",
      rating: 4.5,
    ),
    MovieModel(
      title: "Pacific Rim: Uprising",
      genre: "Action, Adventure, Sci-Fi",
      image: "https://cinapse.co/wp-content/uploads/2023/07/pacific-rim-1.jpg",
      releaseDate: "23 March 2018",
      runtime: "1h 51min",
      rating: 4.5,
    ),
    MovieModel(
      title: "Thor: Ragnarok",
      genre: "Action, Adventure, Comedy",
      image: "https://m.media-amazon.com/images/I/71g40mlbinL._AC_SY679_.jpg",
      releaseDate: "3 November 2017",
      runtime: "2h 10min",
      rating: 4.5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text("Movies", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2),
        child: GridView.builder(
          itemCount: movies.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
            mainAxisExtent: 240,
          ),
          itemBuilder: (context, index) {
            return MovieCard(movie: movies[index]);
          },
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final MovieModel movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            elevation: 7,
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(movie.image, fit: BoxFit.cover),
                ),
                Positioned.fill(
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: Color(0XFF670E10),
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),

                Text(
                  movie.genre,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),

                const SizedBox(height: 8),

                Row(
                  children: List.generate(5, (index) {
                    double starValue = index + 1;
                    IconData icon;
                    if (movie.rating >= starValue) {
                      icon = Icons.star;
                    } else if (movie.rating >= starValue - 0.5) {
                      icon = Icons.star_half;
                    } else {
                      icon = Icons.star_border;
                    }
                    return Icon(icon, color: Colors.amber, size: 18);
                  }),
                ),

                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: .spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "RELEASE DATE:",
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        Text(
                          movie.releaseDate,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "RUNTIME:",
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        Text(
                          movie.runtime,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
