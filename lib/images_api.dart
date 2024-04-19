
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService{
  static Future<Map<String,dynamic>> fetchPhotos() async {
    var headers = {
      'Cookie': '__cf_bm=2A2rtbZ9fmJkAWSNyTcvkFo6odds6gdkXbdEqM8sUdo-1713502958-1.0.1.1-BJbrhO4LXrS7wMVlm0aIdAZIMzdjpRRgMdPP_MiXi19A24gCd3xQSsvixwwGqr3DWcr0GvMxsKDCLpzHhh7LXA; anonymous_user_id=None; csrftoken=bGu0r1fjxGVQtcW92aEVwlhdkXrVKzB2GgOxhFs2CkxuYEcyzJHQjxLVgmMRCj91; dwf_es_default_operator_or=False; dwf_es_my_boost_modifier=False'
    };
    var request = http.Request('GET', Uri.parse('https://pixabay.com/api/?key=35917204-1667a98eb38fa5ceb4f59db1a&q=planet&image_type=photo&pretty=true'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final decodedResponse = json.decode(jsonResponse);
      return decodedResponse;
    }
    else {
      return {'success': false, 'error': response.reasonPhrase};
    }

  }
}