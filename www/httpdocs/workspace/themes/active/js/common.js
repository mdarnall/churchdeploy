var jQuery, document, window;

(function ($, document, window, Date) {

	'use strict';

	$(function() {

		var alertLiveCookie = $.cookie('alertLive');

		if(alertLiveCookie != 'hidden') {
			$('.alertLive').removeClass('hidden');
			$('.alertLive .close').click( function() {
				$.cookie('alertLive', 'hidden', { expires: 1, path: '/' });
			});
		}	

		// exists

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
				
				$('.modalLive .modal-body .ustream-embed').html('<iframe src="' + url + '" width="600" height="356" scrolling="no" frameborder="0" style="border: 0px none transparent;"></iframe>');
			});
			
			$('.modalLive').on('hidden', function () {
				$('.modalLive .modal-body .ustream-embed').html('#');
				$('.modalLive').hide();
			});

		});


		//reftagger
		/*
		Logos.ReferenceTagging.lbsBibleVersion = "KJV";
		Logos.ReferenceTagging.lbsLinksOpenNewWindow = true;
		Logos.ReferenceTagging.lbsLogosLinkIcon = "dark";
		Logos.ReferenceTagging.lbsNoSearchTagNames = [ "h1", "h2", "h3" ];
		Logos.ReferenceTagging.lbsTargetSite = "biblia";
		Logos.ReferenceTagging.tag();
		Logos.ReferenceTagging.lbsCssOverride = true;
		*/
		// Reveal mini logo when scrolling down
		
		/*
		$(window).scroll(
			function() 
			{
				if ( $(window).scrollTop() >= 300 ) 
				{
					$('.logo').fadeIn();
				}
				
				if ( $(window).scrollTop() <= 200 ) 
				{
					$('.logo').fadeOut();
				}
			}
		);
		*/
		// scroll to
		/*
		function scrollTo( obj, offset )
		{
			$('html, body').animate(
				{
					scrollTop: $(obj).offset().top + offset
				}, 
				1000, 
				'easeInOutCubic'
			);
			
			return false;
		}  

		function selectAllText(obj) 
		{
			obj.focus();
			obj.select();
		}
		*/
	});
}(jQuery, window, Date));