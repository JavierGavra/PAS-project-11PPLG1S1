class RecipeNutrition {
  String? calories;
  String? carbs;
  String? fat;
  String? protein;
  List<Bad>? bad;
  List<Good>? good;
  num? expires;
  bool? isStale;

  RecipeNutrition(
      {this.calories,
      this.carbs,
      this.fat,
      this.protein,
      this.bad,
      this.good,
      this.expires,
      this.isStale});

  RecipeNutrition.fromJson(Map<String, dynamic> json) {
    calories = json['calories'];
    carbs = json['carbs'];
    fat = json['fat'];
    protein = json['protein'];
    if (json['bad'] != null) {
      bad = <Bad>[];
      json['bad'].forEach((v) {
        bad!.add(new Bad.fromJson(v));
      });
    }
    if (json['good'] != null) {
      good = <Good>[];
      json['good'].forEach((v) {
        good!.add(new Good.fromJson(v));
      });
    }
    expires = json['expires'];
    isStale = json['isStale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['calories'] = this.calories;
    data['carbs'] = this.carbs;
    data['fat'] = this.fat;
    data['protein'] = this.protein;
    if (this.bad != null) {
      data['bad'] = this.bad!.map((v) => v.toJson()).toList();
    }
    if (this.good != null) {
      data['good'] = this.good!.map((v) => v.toJson()).toList();
    }
    data['expires'] = this.expires;
    data['isStale'] = this.isStale;
    return data;
  }
}

class Bad {
  String? title;
  String? amount;
  bool? indented;
  num? percentOfDailyNeeds;

  Bad({this.title, this.amount, this.indented, this.percentOfDailyNeeds});

  Bad.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    amount = json['amount'];
    indented = json['indented'];
    percentOfDailyNeeds = json['percentOfDailyNeeds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['amount'] = this.amount;
    data['indented'] = this.indented;
    data['percentOfDailyNeeds'] = this.percentOfDailyNeeds;
    return data;
  }
}

class Good {
  String? title;
  String? amount;
  bool? indented;
  num? percentOfDailyNeeds;

  Good({this.title, this.amount, this.indented, this.percentOfDailyNeeds});

  Good.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    amount = json['amount'];
    indented = json['indented'];
    percentOfDailyNeeds = json['percentOfDailyNeeds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['amount'] = this.amount;
    data['indented'] = this.indented;
    data['percentOfDailyNeeds'] = this.percentOfDailyNeeds;
    return data;
  }
}
