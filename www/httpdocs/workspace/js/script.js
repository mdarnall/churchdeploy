/* Author: Jonathan Simcoe, Kirk Strobeck, et al. */

$(document).ready(function() {

	$(window).scroll(function() {
	  if ($(window).scrollTop() >= 50) {
	  	 $('.logo').addClass('scroll');
	  }
	  if ($(window).scrollTop() == 0) {
	  	$('.logo').removeClass('scroll');
	  };
	});
	
});