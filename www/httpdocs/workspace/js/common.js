
$(document).ready(
    function() 
    {
    	// html5
        document.documentElement.className = 'js'; 
        
        // png fix
        var i;
        
        for (i in document.images) {
            if (document.images[i].src) {
                var imgSrc = document.images[i].src;
                if (imgSrc.substr(imgSrc.length-4) === '.png' || imgSrc.substr(imgSrc.length-4) === '.PNG') {
                    document.images[i].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='crop',src='" + imgSrc + "')";
                }
            }
        }

        // back to top
        $('.back_to_top').click( //↑
            function() 
            {
                $('html, body').animate(
                    {
                        scrollTop: 0
                    }, 
                    1000, 
                    'easeInOutCubic'
                );
                
                return false;
            }
        );
    }
);



$(window).load(
    function() 
    {

		if( $('.page-home').exists() )
		{
			$('.slideshow-container').css('filter', 'alpha(opacity=40)');
			
			$(".slideshow").cycle(
				{     
					fx: 'fade',
					speed: 1500,
					timeout: 10000,
					width: '100%',
					slideResize: 0
				}
			);
			
			$('.slideshow-container').fadeIn(1500, 'easeInOutCubic');
			
			img1 = new Image();
			img2 = new Image();
			img3 = new Image();
			img4 = new Image();
			
			img1.src = "/workspace/images/home/masthead/1.jpg";
			img2.src = "/workspace/images/home/masthead/2.jpg";
			img3.src = "/workspace/images/home/masthead/3.jpg";
			img4.src = "/workspace/images/home/masthead/4.jpg";
		}
    
    }
);



// scroll to this
function scrollToThis(obj)
{
    $('html, body').animate(
        {
            scrollTop: $(obj).offset().top
        }, 
        1000, 
        'easeInOutCubic'
    );
    
    return false;
}  



jQuery.fn.exists = function() // test to see if an object exists
{
    return jQuery(this).length > 0;
}



// sea analytics
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-26440960-1']);
_gaq.push(['_trackPageview']);

(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();