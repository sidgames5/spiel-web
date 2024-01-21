import js.Browser;

class AppRenderer {
	public static function start() {
		var doc = Browser.document;
		var container = doc.getElementById("container");
		Utils.wipePage(doc);
	}
}
