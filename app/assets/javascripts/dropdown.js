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

  $('.sales').on('change', function(){
    var items = $(".sales option:selected").map(function() {
    return $(this).text();
    }).get();
    var multi = items;
    var multiselected = $.unique(multi).join();

    console.log(multiselected);
    alert("hhhhhiiiiiiiiii");
    if (multiselected == "Sales of Goods"){
      $('#service_tax, #show_service_tax_add_info').hide();
      $('#sales_tax, #show_sales_tax_add_info').show();
    }
    else if(multiselected == "Sales of Services"){
      $('#sales_tax, #show_sales_tax_add_info').hide();
      $('#service_tax, #show_service_tax_add_info').show();
    }
    else if(multiselected == "Sales of Goods & Service"){
      $('#sales_tax, #show_sales_tax_add_info').show();
      $('#service_tax, #show_service_tax_add_info').show();
    }
    else if(multiselected == "Sales of Export Goods"){
      $('#sales_tax, #show_sales_tax_add_info').show();
      $('#service_tax, #show_service_tax_add_info').hide();
    }
    else if(multiselected == "Sales of Export Goods & Service"){
      $('#sales_tax, #show_sales_tax_add_info').show();
      $('#service_tax, #show_service_tax_add_info').show();
    }
    else if(multiselected == "Sales of Goods","Sales of Services"){
      $('#sales_tax, #show_sales_tax_add_info').show();
      $('#service_tax, #show_service_tax_add_info').show();
    }
    else if(multiselected == "Sales of Goods","Sales of Goods & Service"){
      $('#sales_tax, #show_sales_tax_add_info').show();
      $('#service_tax, #show_service_tax_add_info').show();
    }
    else if(multiselected == "Sales of Goods","Sales of Export Service"){
      $('#sales_tax, #show_sales_tax_add_info').show();
      $('#service_tax, #show_service_tax_add_info').show();
    }
    else if(multiselected == "Sales of Goods","Sales of Export Goods & Service"){
      $('#sales_tax, #show_sales_tax_add_info').show();
      $('#service_tax, #show_service_tax_add_info').show();
    }
    else if(multiselected == "Sales of Goods","Sales of Services","Sales of Export Goods","Sales of Export Service","Sales of Export Goods & Service"){
      $('#sales_tax, #show_sales_tax_add_info').show();
      $('#service_tax, #show_service_tax_add_info').show();
    }

    });
});
$(document).on('nested:fieldAdded', function(event){
  var field = event.field;
  var selectField = field.find('.selectpicker');
  selectField.selectpicker();
});

