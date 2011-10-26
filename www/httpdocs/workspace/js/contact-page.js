        // contact page
        
        if($('.locations').exists())
        {
            updateContactFocus(); 
            
            $('.subnav li').bind(
                'click', 
                function() 
                {
                    updateContactFocus(handleize($(this)));
                }
            );
        }








function updateContactFocus(obj)
{
    $('.active').removeClass('active');
    
    if(obj)
    {
        var loc = obj;
    }
    else
    {
        var loc = $.url().attr('fragment').replace(/\//g,'');
    }
    
    $('.left_column li, .nav li').each(
        function(i)
        {
            if(loc == handleize($(this)))
            {
                $(this).addClass('active');
            }
        }
    ); 
}

function handleize(obj)
{
    return String($(obj).children('a').html()).replace(/\s+/g, '-').toLowerCase();
}



jQuery.fn.exists = function() // test to see if an object exists
{
    return jQuery(this).length > 0;
}