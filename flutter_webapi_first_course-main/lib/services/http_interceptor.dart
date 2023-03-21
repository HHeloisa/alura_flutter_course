import 'package:http_interceptor/http_interceptor.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor implements InterceptorContract {
  Logger logger = Logger();
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    logger.v(//v de verbose
        "Requisição para ${data.baseUrl}, \n Cabeçalho: ${data.headers}, \n Corpo: ${data.body}");
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    if (data.statusCode ~/ 100 == 2) {
      // só se estiver na faixa do 200 que vai ser true
      logger.i(// i de info
          "Resposta de ${data.url},\n  status: ${data.statusCode}, \n Cabeçalho: ${data.headers}, \n Corpo: ${data.body}");
    } else {
      logger.e(// e de erro
          "Resposta de ${data.url},\n  status: ${data.statusCode}, \n Cabeçalho: ${data.headers}, \n Corpo: ${data.body}");
    }

    return data;
  }
}
