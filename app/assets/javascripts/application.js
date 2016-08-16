// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap.min
//= require jquery_ujs
//= require turbolinks
//= require_tree . 

$(document).ready( function(){
  window.onresize = function(event) {
    if( $(document).width() > 1200 ) fixedNavbar();
  };

  if( $(document).width() > 1200 ) fixedNavbar();
});

function fixedNavbar() {
  var navbar_right = $('#navbar-right'),
      navbar_top = $('#navbar-top'),
      caurusel = $('#myCarousel'),
      total_height = navbar_top.height() + caurusel.height();

  navbar_right.affix({
      offset: {
        top: total_height
      }
  });
}
