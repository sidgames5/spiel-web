package util;

import haxe.crypto.Base64;

class TokenUtil {
	public static function isExpired(token:String):Bool {
		var t = Base64.decode(token).toString().split(":")[1];
		var expiry = Date.fromTime(Std.parseFloat(t.split(".")[1]));
		return expiry.getTime() > (Date.now().getTime() / 1000);
	}

	public static function getUserId(token:String):Int {
		var id = Std.parseInt(Base64.decode(token).toString().split(".")[0]);
		return id;
	}
}
