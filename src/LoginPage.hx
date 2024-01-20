import js.Browser;

class LoginPage {
	public static function renderLogin() {
		var doc = Browser.document;
		var container = doc.getElementById("container");
		Utils.wipePage(doc);

		var sbox = doc.createDivElement();
		sbox.classList.add("loginBox");

		var lbTitle = doc.createElement("h1");
		lbTitle.innerHTML = "Log in to Spiel";

		var lgForm = doc.createFormElement();
		lgForm.method = "GET";
		lgForm.action = "/handle_login.html";
		var unLabel = doc.createLabelElement();
		unLabel.innerHTML = "Username";
		unLabel.htmlFor = "uname";
		var unInput = doc.createInputElement();
		unInput.type = "text";
		unInput.id = "uname";
		unInput.name = "uname";
		var pwdLabel = doc.createLabelElement();
		pwdLabel.innerHTML = "Password";
		pwdLabel.htmlFor = "pwd";
		var pwdInput = doc.createInputElement();
		pwdInput.type = "text";
		pwdInput.id = "pwd";
		pwdInput.name = "pwd";

		var submitButton = doc.createButtonElement();
		submitButton.classList.add("loginBoxButton");
		submitButton.innerHTML = "Login";

		lgForm.appendChild(unLabel);
		lgForm.appendChild(unInput);
		lgForm.appendChild(doc.createBRElement());
		lgForm.appendChild(pwdLabel);
		lgForm.appendChild(pwdInput);
		lgForm.appendChild(doc.createBRElement());
		lgForm.appendChild(submitButton);

		sbox.appendChild(lbTitle);
		sbox.appendChild(lgForm);
		container.appendChild(sbox);
	}

	public static function renderSignup() {
		var doc = Browser.document;
		Utils.wipePage(doc);

		// TODO
	}
}
