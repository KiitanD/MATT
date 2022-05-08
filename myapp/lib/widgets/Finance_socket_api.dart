import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class FinanceSocketApi {
  FinanceSocketApi(this.coll);
  final DbCollection coll;

  Handler get router {
    return webSocketHandler((WebSocketChannel socket) {
      socket.stream.listen((message) async {
        final data = json.decode(message);
        print(data);

        if (data["action"] == "LOAD") {
          final payment = coll.find().toList();

          socket.sink.add(jsonEncode(payment));
        }
      });
    });
  }
}
