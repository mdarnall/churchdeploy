(function ($, document, window, Date) {

	'use strict';

	$(function() {

		var alertLiveCookie = $.cookie('alertLive');

		if(alertLiveCookie !== 'hidden') {
			$('.alertLive').removeClass('hidden');
			$('.alertLive .close').click( function() {
				$.cookie('alertLive', 'hidden', { expires: 1, path: '/' });
			});
		}

		jQuery.fn.exists = function() // test to see if an object exists
		{
			return jQuery(this).length > 0;
		};

		$(document).ready( function() {

			$('.modalLiveLink').click( function(e) {
				e.preventDefault();
				$('.modalLive').modal('show');
				return false;
			});

			$('.modalLive .close').click( function(e) {
				e.preventDefault();
				$('.modalLive').modal('hide');
				return false;
			});

			$('.modalLive').on('show', function () {
				var url = $('.modalLive .modal-body .url').html();

				$('.modalLive .modal-body .ustream-embed').html('<iframe src="' + url + '" width="600" height="364" scrolling="no" frameborder="0" style="border: 0px none transparent;"></iframe>');
			});

			$('.modalLive').on('hidden', function () {
				$('.modalLive .modal-body .ustream-embed').html('#');
				$('.modalLive').hide();
			});

		});

		if($('layout-search'))
		{
			$('.search input.keywords').focus();
		}
	});
}(jQuery, window, Date));