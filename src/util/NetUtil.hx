package util;

import js.Cookie;
import models.DatabasePacket;
import haxe.Json;
import haxe.Http;
import models.Channel;

class NetUtil {
	public static function getChannel(id:Int):Channel {
		var req = new Http("http://localhost:8192");
		var pd:DatabasePacket = {
			instruction: "GET_CHANNEL",
			data1: id,
			token: Cookie.get("token")
		};
		req.setPostData(Json.stringify(pd));

		var res:Channel = null;
		req.onData = d -> {
			res = Json.parse(d);
		};
		req.onError = e -> {};

		req.request(true);

		return res;
	}
}
