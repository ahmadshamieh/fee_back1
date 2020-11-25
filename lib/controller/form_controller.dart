import 'dart:convert' as convert;
import 'package:fee_back/model/form.dart';
import 'package:http/http.dart' as http;

class FormController {

  static const String URL = "https://script.google.com/macros/s/AKfycbxRriJgzV086HfqlC4YTvMP651VI5Kp3MHkS0dz/exec";

  static const STATUS_SUCCESS = "SUCCESS";

  void submitForm(
      FeedbackForm feedbackForm, void Function(String) callback) async {
    try {
      await http.post(URL, body: feedbackForm.toJson()).then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(url).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }


  }

  Future<List<FeedbackForm>> getFeedbackList() async {
    return await http.get(URL).then((response) {
      var jsonFeedback = convert.jsonDecode(response.body) as List;
      return jsonFeedback.map((json) => FeedbackForm.fromJson(json)).toList();
    });
  }
  Future<List<FeedbackForm>> deleteFeedbackList( ) async {
    return await http.delete(URL).then((response) {


    });
  }

}