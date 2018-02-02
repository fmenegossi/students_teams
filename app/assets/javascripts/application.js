//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
  let alerts = $('.alerts');

  alerts.map(function(index,value){
    console.log($(value).text());
    if ($(value).text() !== ""){
       $(value).addClass('show-alerts');
       setTimeout(function(){  $(value).addClass('fade-alerts'); }, 6000);

    }

  })
});
