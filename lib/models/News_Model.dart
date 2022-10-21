class NewsModel {
  String? news;
  String? dateTime;


  NewsModel({this.news,this.dateTime});

  NewsModel.fromjson(Map<String,dynamic> json){
    news = json['news'];
    dateTime = json['dateTime'];

  }
  Map<String,dynamic> toMap ()
  {
    return {
      'news':news,
      'dateTime':dateTime,
    };
  }
}
