
class FeedbackForm {

  String name;
  String mobile ;
  String modelNum ;
  String purchaseDate ;
  String email  ;

  FeedbackForm(this.name, this.mobile ,this.modelNum , this.purchaseDate, this.email);

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm("${json['name']}","${json['mobile']}", "${json['modelNum']}",
        "${json['purchaseDate']}", "${json['email']}");
  }

  Map toJson() => {
    'name': name,
    'mobile': mobile,
    'modelNum': modelNum,
    'purchaseDate': purchaseDate,
    'email': email
  };



}