/* Author: Jonathan Simcoe, Kirk Strobeck, et al. */


$(document).ready(
    function() 
    {
		
		// Reveal mini logo when scrolling down
		
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

		
		// Shade website when viewing live
		
		if( $('body.layout-live').exists() )
		{
//			setTimeout(
//				function()
//				{
//				    scrollTo( '.content', -100 );
//				}, 
//				3000
//			);
			
			$('body').append('<div class="theatre-dimmer"></div>');
			
			$('.theatre-dimmer').delay(3000).fadeTo( 2000, .8 );
			
			$('.content').delay(3000).animate(
			    {
			        'backgroundColor': '#333333'
			    }, 
			    1000
			);
			
//			$(window).scroll(
//				function()
//				{
//					var windowOffset = $(window).offset;
//					
//					console.log(windowOffset.top);
//					
//					$('.theatre-dimmer').css(
//						{
//							top: windowOffset.top + 'px'
//						}
//					);
//				}
//			);
			
			$('.live-icon').click(
				function(e)
				{
					e.preventDefault();
					
					$('.theatre-dimmer').fadeTo( 2000, .8 );
					
					$('.content').animate(
					    {
					        'backgroundColor': '#333333'
					    }, 
					    1000
					);
					
					return false;
				}
			);
			
			$('.theatre-dimmer').click(
				function()
				{
					$(this).fadeOut();
					
					$('.content').animate(
					    {
					        'backgroundColor': '#ffffff'
					    }, 
					    1000
					);
				}
			);
		}
	}
);

// analytics

/*
var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview'],['_trackPageLoadTime']];
(function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
s.parentNode.insertBefore(g,s)}(document,'script'));
*/