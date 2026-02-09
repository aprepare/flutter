import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:convert' show utf8;

void main() async {
  // 可以查询指定IP，为空则查询本机IP
  String? ip; // = "121.8.215.106";  // 如需查询特定IP，取消注释并修改IP
  
  var url = Uri.parse('https://api.vore.top/api/IPdata${ip != null ? "?ip=$ip" : ""}');

  try {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // 使用 utf8 解码响应数据
      var data = convert.jsonDecode(utf8.decode(response.bodyBytes));
      
      print('IP地址: ${data['ipinfo']['text']}');
      print('位置: ${data['ipdata']['info1']} ${data['ipdata']['info2']} ${data['ipdata']['info3']}');
      print('运营商: ${data['ipdata']['isp']}');
    } else {
      print('请求失败: ${response.statusCode}');
    }
  } catch (e) {
    print('错误: $e');
  }
}