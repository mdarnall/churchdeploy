(function ($, document, window, audiojs) {

	"use strict";

	$(function () {

		$.fn.exists = function () {
			return $(this).length > 0;
		};

		$(document).ready(function () {

      //debugger;
			audiojs.events.ready(function(){audiojs.createAll();});

			$('.downloadPopover').hover(function(){
				$(this).popover('toggle');
			});

			var hostName = window.location.hostname,
				links = $("a"),
				alertLiveCookie = $.cookie("alertLive"),
				i = 0;

			if (alertLiveCookie !== "hidden") {
				$(".alertLive").removeClass("hidden");
				$(".alertLive .close").click(function () {
					$.cookie("alertLive", "hidden", { expires: 1, path: "/" });
				});
			}

			$(".modalLiveLink").click(function (e) {
				e.preventDefault();
				$(".modalLive").modal("show");
				return false;
			});

			$(".modalLive .close").click(function (e) {
				e.preventDefault();
				$(".modalLive").modal("hide");
				return false;
			});

			$(".modalLive").on("show", function () {
				var url = $(".modalLive .modal-body .url").html();
				$(".modalLive .modal-body .ustream-embed").html("<iframe src=\"" + url + "\" width=\"600\" height=\"363\" scrolling=\"no\" frameborder=\"0\" style=\"border: 0px none transparent;\"></iframe>");
			});

			$(".modalLive").on("hidden", function () {
				$(".modalLive .modal-body .ustream-embed").html("#");
				$(".modalLive").hide();
			});

			for (i = 0; i < links.length; i += 1) {
				if (links[i].href.indexOf(hostName) === -1) {
					links[i].setAttribute("target", "_blank");
				}
			}

		});
	});
}(jQuery, window));
