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
		} else if (Browser.window.location.href.contains("handle_register")) {
			var title = doc.createElement("h1");
			title.innerHTML = "Please Wait";

			container.appendChild(title);
		} else {
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
