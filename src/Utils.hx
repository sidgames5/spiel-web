import js.html.Document;

class Utils {
	public static function wrapHtml(type:String, content:String, ?extra:String = null):String {
		if (extra == null) {
			return '<$type>$content</$type>';
		} else {
			return '<$type $extra>$content</$type>';
		}
	}

	public static function wipePage(doc:Document) {
		doc.getElementById("container").innerHTML = "";
	}
}
