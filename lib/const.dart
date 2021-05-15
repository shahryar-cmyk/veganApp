import 'package:http/http.dart' as http;

const BATH_PATH =
    'https://www.veganchoicefoods.com/adminapp.veganchoicefoods.com/wp-json';

//WORDPRESS POST OF THE CONTENT
const WORDPRESS_POST_OF_THE_CONTENT = '$BATH_PATH/wp/v2/posts';

//Function of the Post Request
class HttpRequestOfApp {
  //Post Request
  Future<dynamic> postFunction(
    dynamic jsonBody,
    String url,
  ) async {
    print('This is the Response Body $jsonBody}');
    print('This is the Response url $url}');

    print(url);
    var responseData = await http.get(url, headers: {
      'Accept': 'application/json',
    });
    print('This is the Url $url');
    print('This is the jsonBody $jsonBody');

    return responseData;
  }
}
