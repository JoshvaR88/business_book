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
//= require twitter/bootstrap
//= require turbolinks
//= require bootstrap-select
//= require jquery_nested_form
//= require bootstrap-multiselect
//= require bootstrap-datepicker
//= require_tree .

$( document ).on('ready page:load', function() {

  $('.selectpicker').selectpicker('refresh');

  $('.checkbox_list_for_tax_org').multiselect({
    includeSelectAllOption: true,
    maxHeight: 200,
    enableClickableOptGroups: true,
    buttonWidth: '350px',
    buttonText: function(options, select) {
      if (options.length === 0) {
          return 'Tax organization type...';
      }
      else if (options.length > 1) {
          return 'More than '+(options.length - 1)+' tax organization selected!';
      }
      else {
        return options.val();
      }
    }
  });

  $('.datepicker').datepicker({
     format: "dd-mm-yyyy",
     todayHighlight: true,
     todayBtn: 'linked',
     autoclose: true
  });

});

