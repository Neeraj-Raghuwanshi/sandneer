// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require "theme_js/modernizr/modernizr.custom.js"
//= require "theme_js/jquery/jquery.js"
//= require "theme_js/popper.js/popper.js"
//= require "theme_js/bootstrap/bootstrap.js"
//= require "theme_js/js-storage/js.storage.js"
//= require "theme_js/jquery.easing/jquery.easing.js"
//= require "theme_js/animo/animo.js"
//= require "theme_js/screenfull/screenfull.js"
//= require "theme_js/jquery-localize/jquery.localize.js"
//= require "theme_js/jquery-sparkline/jquery.sparkline.js"
//= require "theme_js/parsleyjs/parsley.js"
//= require "theme_js/jquery-slimscroll/jquery.slimscroll.js"
//= require "theme_js/datatables.net/jquery.dataTables.js"
//= require "theme_js/datatables.net-bs4/dataTables.bootstrap4.js"
//= require "theme_js/datatables.net-buttons/dataTables.buttons.js"
//= require "theme_js/datatables.net-buttons-bs/buttons.bootstrap.js"
//= require "theme_js/datatables.net-buttons/buttons.colVis.js"
//= require "theme_js/datatables.net-buttons/buttons.flash.js"
//= require "theme_js/datatables.net-buttons/buttons.html5.js"
//= require "theme_js/datatables.net-buttons/buttons.print.js"
//= require "theme_js/datatables.net-keytable/dataTables.keyTable.js"
//= require "theme_js/datatables.net-responsive/dataTables.responsive.js"
//= require "theme_js/datatables.net-responsive-bs/responsive.bootstrap.js"
//= require jquery_nested_form
//= require custom.js
//= require Chart.bundle
//= require chartkick
//= require turbolinks
// require_tree .

$(document).on('turbolinks:before-cache', function(){
  var dataTable =  $($.fn.dataTable.tables(true)).DataTable()
  if (dataTable != null){
    dataTable.destroy();
    dataTable = null;
  }
})
