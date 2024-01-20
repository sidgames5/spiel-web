import js.Cookie;
import js.Browser;

class Main {
	static function main() {
		var doc = Browser.document;
		var container = doc.getElementById("container");

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

			var sgButton = doc.createButtonElement();
			sgButton.innerHTML = "Sign up";
			sgButton.classList.add("loginBoxButton");

			sbox.appendChild(lbTitle);
			sbox.appendChild(lbButton);
			sbox.appendChild(doc.createBRElement());
			sbox.appendChild(sgButton);
			container.appendChild(sbox);
		}
	}
}
