import util.NetUtil;
import haxe.Exception;
import models.User;
import util.TokenUtil;
import models.DatabasePacket;
import haxe.Json;
import haxe.Http;
import js.html.Document;
import js.Cookie;
import js.Browser;

class AppRenderer {
	public static function start() {
		var doc = Browser.document;
		var container = doc.getElementById("container");
		Utils.wipePage(doc);

		var css = doc.createLinkElement();
		css.rel = "stylesheet";
		if (Cookie.exists("theme"))
			css.href = 'app_${Cookie.get("theme")}.css';
		else {
			Cookie.set("theme", "light");
			css.href = "app_light.css";
		}
		doc.head.appendChild(css);

		loadConvoList(doc);
	}

	public static function loadConvoList(doc:Document) {
		var req = new Http("http://localhost:8192");
		var pd:DatabasePacket = {
			instruction: "GET_USER",
			token: Cookie.get("token"),
			data1: TokenUtil.getUserId(Cookie.get("token"))
		};
		req.setPostData(Json.stringify(pd));
		req.onData = d -> {
			var user:User;
			try {
				user = Json.parse(d);
			} catch (e:Exception) {
				trace(e);
				return;
			}
			var channels = user.channels;
			trace(user);
			var convos = new Array<String>();
			for (channel in channels) {
				var convo = NetUtil.getChannel(channel);
				convos.push(convo.name);
			}

			var convolist = doc.getElementById("convoslist");
			for (convo in convos) {
				var li = doc.createElement("li");
				li.innerHTML = convo;
				convolist.appendChild(li);
			}
		};
		req.onError = e -> {
			trace(e);
		};
		req.request(true);
	}
}
