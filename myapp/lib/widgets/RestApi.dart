import 'dart:io';
import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../model/constant.dart';

class RestApi {
  RestApi(this.coll);

  DbCollection coll;

  Handler get router {
    final app = Router();
    app.get('/', (Request req) async {
      final con = await coll.find().toList();
      return Response.ok(json.encode({"payment": con}), headers: {
        "Content-Type": ContentType.json.mimeType,
      });
    });

    app.post('/', (Request req) async {
      final payload = await req.readAsString();
      final data = json.decode(payload);
      await coll.insert(data);
      final entry = await coll.findOne(where.eq("name", data["name"]));

      return Response(HttpStatus.created, body: (json.encode(entry)), headers: {
        "Content-Type": ContentType.json.mimeType,
      });
    });

    app.delete('/<id|.+>', (Request req, String id) async {
      await coll.deleteOne(where.eq('_id', ObjectId.fromHexString(id)));
      return Response.ok('Deleted $id');
    });

    return app;
  }
}
