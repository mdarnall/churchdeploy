/* Author: Jonathan Simcoe, Kirk Strobeck, et al. */

$(document).ready(function() {

	$(window).scroll(function() {
	  if ($(window).scrollTop() >= 50) {
	  	 $('.logo').fadeIn(1000);
	  }
	  if ($(window).scrollTop() == 0) {
	  	$('.logo').fadeOut(1000);
	  };
	});
	
});