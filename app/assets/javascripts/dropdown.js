$( document ).on('ready page:load', function() {
  $('.select_country').click(function () {
    $('.add_class_business').removeClass("dropdown_business");
    $('.add_class_country').addClass("dropdown_country");
  });
  $('.select_business').click(function () {
    $('.add_class_business').addClass("dropdown_business");
  });
  $('.select_state').click(function () {
    $('.add_class_country').removeClass("dropdown_country");
    $('.add_class_business').removeClass("dropdown_business");
  });

  $('.selectpicker').on('change', function(){
    var selected = $(this).find("option:selected").text();
    if (selected == "Sole proprietorship"){
      $('#cin_num').hide();
    }
    else{
      $('#cin_num').show();
    }
    $.ajax({
      type: "POST",
      url: '/company_profiles/dropdown',
      data:{ selected: selected},
      success: function(result) {
        $(".conditional_dropdown").html(result.html);
        $('.selectpicker').selectpicker('refresh');
      }
    });
  });

  $('#tax_details, #add_details, #remove_tan_info').hide();
  $('#show_fields').on('click', function(){
    $('.selectpicker').selectpicker('refresh');
    $('#tax_details').show();
    $('#add_details').show();
    $('#remove_tan_info').show();
    $('#plus_details').hide();
  })

  $('#remove_address_info').hide();
  $('#show_address_fields').on('click', function(){
    $('.selectpicker').selectpicker('refresh');
    $('#add_address_details').show();
    $('#remove_address_info').show();
  })

  $('#sales_tax_add_details').hide();
  $('#show_sales_tax_add_info').on('click', function(){
    $('#add_sales_tax_additional_details').hide();
    $('#remove_sales_tax_additional_info').show();
  })
  $('#service_tax_add_details').hide();
  $('#show_service_tax_add_info').on('click', function(){
    $('#add_service_tax_additional_details').hide();
    $('#remove_service_tax_additional_info').show();
  })
});
$(document).on('nested:fieldAdded', function(event){
  var field = event.field;
  var selectField = field.find('.selectpicker');
  selectField.selectpicker();
});

