import js.html.DivElement;
import js.Cookie;
import js.html.Storage;
import js.Browser;
import js.html.Document;

class Main {
	static function main() {
		var doc = Browser.document;
		var container = doc.getElementById("container");

		// check if a token is stored in the cookies
		if (Cookie.exists("token")) {
			// TODO: authenticate with the server
		} else {
			// TODO: show login page
			var sbox = doc.createDivElement();
			sbox.classList.add("loginBox");
			container.appendChild(sbox);
		}
	}
}
