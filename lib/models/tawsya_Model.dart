class tewsyaModel {
  String? sahm;
  String? description;
  String? priceBefore;
  String? priceAfter;

  tewsyaModel({this.sahm,this.description,this.priceAfter,this.priceBefore});

  tewsyaModel.fromjson(Map<String,dynamic> json){
      sahm = json['sahm'];
      description = json['description'];
      priceBefore = json['priceBefore'];
      priceAfter = json['priceAfter'];
  }
  Map<String,dynamic> toMap ()
  {
    return {
      'sahm':sahm,
      'description':description,
      'priceBefore':priceBefore,
      'priceAfter':priceAfter,
    };
  }
}
