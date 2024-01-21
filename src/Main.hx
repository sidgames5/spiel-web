import haxe.crypto.Sha256;
import haxe.Json;
import haxe.Http;
import js.Cookie;
import js.Browser;

using StringTools;

class Main {
	static function main() {
		var doc = Browser.document;
		var container = doc.getElementById("container");

		if (Browser.window.location.href.contains("handle_login")) {
			var title = doc.createElement("h1");
			title.innerHTML = "Please Wait";

			container.appendChild(title);

			final params = Browser.window.location.href.split("?")[1].split("&");

			var uname:String = "";
			var pwd:String = "";

			for (param in params) {
				var k = param.split("=")[0];
				var v = param.split("=")[1];
				if (k == "uname")
					uname = v;
				if (k == "pwd")
					pwd = v;
			}

			var req = new Http("http://localhost:8192");
			req.setPostData(Json.stringify({
				register: false,
				username: uname,
				passwordHash: Sha256.encode(pwd)
			}));
			req.onData = d -> {
				Cookie.set("token", d);
				Browser.window.location.href = "/app.html";
			};
			req.onError = e -> {
				Browser.window.location.href = "/";
			};
			req.request(true);
		} else if (Browser.window.location.href.contains("handle_register")) {
			var title = doc.createElement("h1");
			title.innerHTML = "Please Wait";

			container.appendChild(title);

			final params = Browser.window.location.href.split("?")[1].split("&");

			var uname:String = "";
			var pwd:String = "";
			var dname:String = "";

			for (param in params) {
				var k = param.split("=")[0];
				var v = param.split("=")[1];
				if (k == "uname")
					uname = v;
				if (k == "pwd")
					pwd = v;
				if (k == "dname")
					dname = v;
			}

			var req = new Http("http://localhost:8192");
			req.setPostData(Json.stringify({
				instruction: "ADD_USER",
				data1: {
					username: uname,
					displayName: dname,
					pictureBytes: "",
					passwordHash: Sha256.encode(pwd)
				}
			}));
			req.onData = d -> {
				Cookie.set("token", d);
				Browser.window.location.href = "/app.html";
			};
			req.onError = e -> {
				Browser.window.location.href = "/";
			};
			req.request(true);
		} else if (Browser.window.location.href.contains("app")) {} else {
			// check if a token is stored in the cookies
			if (Cookie.exists("token")) {
				// TODO: authenticate with the server
			} else {
				var sbox = doc.createDivElement();
				sbox.classList.add("loginBox");

				var lbTitle = doc.createElement("h1");
				lbTitle.innerHTML = "Welcome to Spiel";

				var lbButton = doc.createButtonElement();
				lbButton.innerHTML = "Log in";
				lbButton.classList.add("loginBoxButton");
				lbButton.onclick = LoginPage.renderLogin;

				var sgButton = doc.createButtonElement();
				sgButton.innerHTML = "Sign up";
				sgButton.classList.add("loginBoxButton");
				sgButton.onclick = LoginPage.renderSignup;

				sbox.appendChild(lbTitle);
				sbox.appendChild(lbButton);
				sbox.appendChild(doc.createBRElement());
				sbox.appendChild(sgButton);
				container.appendChild(sbox);
			}
		}
	}
}
