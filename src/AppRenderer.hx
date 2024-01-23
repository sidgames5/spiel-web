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
			css.href = "app_light";
		}
		doc.head.appendChild(css);
	}
}
