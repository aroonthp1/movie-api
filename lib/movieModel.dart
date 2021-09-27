



class MovieModel {
  String title;
  int votecount;
  String image;

  MovieModel({this.title, this.votecount, this.image});
  factory MovieModel.fromJson(Map<String,dynamic>json){
return MovieModel(title: json['title'], votecount: json['vote_count'], image:json['poster_path']);
  }

}
