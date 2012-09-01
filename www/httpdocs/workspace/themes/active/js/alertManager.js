(function($, window){
  "use strict";

  $.cookie.json = true;

  var alertManager = {
    alertCookieName : "alerts",

    getHiddenAlerts : function (){
      return $.cookie(this.alertCookieName) || [] ;
    },
    saveHiddenAlerts : function(alerts) {
      $.cookie(this.alertCookieName, alerts, { json: true, expires: 365, path : "/" });
    },

    shouldAlertShow : function (id){
      window.console.log('shouldAlertShow');
      var alerts = this.getHiddenAlerts();
      return (alerts.indexOf(id) < 0);
    }, 
    markAlertHidden : function (id) {
      window.console.log('markAlertHidden ' + id);
      var alerts = this.getHiddenAlerts();
      alerts.push(id);
      this.saveHiddenAlerts(alerts);
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
