(function (window) {
	'use strict';
	function downloadJSAtOnload() { 
		var _gaq = _gaq || [],
		js = {
			"scripts":[
				"/workspace/themes/active/js/common-ck.js"
			]
		};

		_gaq.push(['_setAccount', 'UA-32000708-1']);
		_gaq.push(['_trackPageview']);

		for (var key in js.scripts) {
			if (js.scripts[key]) {
				var element=document.createElement("script");
				element.src=js.scripts[key];
				document.body.appendChild(element);
			}
		}
	}

	if(window.addEventListener) {
		window.addEventListener("load",downloadJSAtOnload,false);
	} else if (window.attachEvent) {
		window.attachEvent("onload",downloadJSAtOnload); 
	} else { 
		window.onload=downloadJSAtOnload;
	}
}(window));