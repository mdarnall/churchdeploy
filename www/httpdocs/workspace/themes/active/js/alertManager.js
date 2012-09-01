(function($, window){
  "use strict";

  var alertManager = {

    shouldAlertShow : function (id){
      window.console.log('shouldAlertShow');
      return true;
      
    }, 
    markAlertHidden : function (id) {
      window.console.log('markAlertHidden ' + id);
      // todo:
    }
  };

  $(function(){
    var $containerEl = $('.header');
    $containerEl.find('.alert').each(function(){
      var $alertEl = $(this),
      id = $alertEl.attr('id');

      if(alertManager.shouldAlertShow(id)){
        $alertEl.removeClass('hidden');
      }
    }).on('click', '.alert .close', function(){
      var id = $(this).closest('.alert').attr('id');
      alertManager.markAlertHidden(id);
    });
  });
})(jQuery, window);
