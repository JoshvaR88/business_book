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

  $('#tax_details, #add_details, #remove_tan_info, .remove_tan_info_main').hide();
  $('#show_tax_fields').on('click', function(){
    $('.selectpicker').selectpicker('refresh');
    $('#tax_details').addClass("add_box_company");
    $('#tax_details').show();
    $('#add_details').show();
    $('#remove_tan_info').hide();
    $('.remove_tan_info_main').show();
    $('#plus_details').hide();
    $('#show_tax_fields').hide();
  });

  var count = 0;
  $('#show_another_tax_fields').on('click', function(){
    count++;
    alert(count);

  });

  $('#remove_address_info').hide();
  $('#show_address_fields').on('click', function(){
    alert("jjjjjssss");
    $('.selectpicker').selectpicker('refresh');
    $('#add_address_details').show();
    var value = "false"
    console.log(value);
    $("#reg_off_address:hidden").val(value);
    console.log("worked");

  });

  $('#remove_sales_tax_additional_info').hide();
  $(".sales-ie").show();
  $('#show_sales_tax_add_info').on('click', function(){
    $('#sales_tax_add_details').addClass("add_box_sales");
    $(".sales-ie").show();
    $('#show_sales_tax_add_info').hide();
    $('#remove_sales_tax_additional_info').show();
    $('#sales_tax_add_details').show();

  });

  $('#central_tax_no').on('click', '.sales_tax_false, .sales_tax_true', function(){
    alert("ssssssssssssssssssssssssss");
    var get_val = $(this).val();
      if(get_val == "false"){
        $('.central-condition').hide();
      }
      else{
        $('.central-condition').show();
      }

  });

  $('.checkbox_list_for_tax_org').on('change', function(){
    $('.checkbox_list_for_tax_org option:disabled').remove();


    var items = []
    $(".checkbox_list_for_tax_org option:selected").map(function() {
      items.push($(this).text());
    });
    // .get();
    var multi = items;
    var multiselected = $.unique(multi);
    console.log(multiselected);
    if(multiselected == "Sales of Goods"){
      $('#service_tax, #show_service_tax_add_info').hide();
      $('#sales_tax, #show_sales_tax_add_info').show();
      $(".sales-ie").hide();
      $('#show_sales_tax_add_info').on('click', function() {
        $(".sales-ie").hide();
      });
      $('#remove_sales_tax_add_info').on('click', function() {
        $("#show_sales_tax_add_info").show();
      });
    }
    else if(multiselected == "Sales of Services"){
      $('#sales_tax, #show_sales_tax_add_info').hide();
      $(".sales-ie").hide();
      $('#service_tax, #show_service_tax_add_info').show();
      $('#remove_service_tax_add_info').on('click', function() {
        $("#show_service_tax_add_info").show();

      });

    }

    else if(multiselected == "Sales of Export Goods"){
      $('#sales_tax, #show_sales_tax_add_info').show();
      $('#service_tax, #show_service_tax_add_info').hide();
      $('#show_sales_tax_add_info').on('click', function() {
        $(".sales-ie").show();
      });
    }
    else if(multiselected == "Sales of Export Services"){
      $('#sales_tax, #show_sales_tax_add_info').hide();
      $('#service_tax, #show_service_tax_add_info').show();
      $(".sales-ie").show();
    }

    else if(multiselected == "Sales of Goods,Sales of Export Goods"){
      $('#sales_tax, #show_sales_tax_add_info').show();
      $('#service_tax, #show_service_tax_add_info').hide();
      $('#show_sales_tax_add_info').on('click', function() {
        $(".sales-ie").show();
      });
    }
    else if(multiselected == "Sales of Services,Sales of Export Services"){
      $(".sales-ie").show();
      $('#sales_tax, #show_sales_tax_add_info').hide();
      $('#service_tax, #show_service_tax_add_info').show();
    }
    else if(multiselected == "Sales of Goods,Sales of Services"){
      $('#sales_tax, #show_sales_tax_add_info').show();
      $('#service_tax, #show_service_tax_add_info').show();
      $(".sales-ie").hide();
    }
    else if(multiselected.indexOf("Sales of Export Goods") > -1){
      $('#sales_tax, #show_sales_tax_add_info').show();
      $('#service_tax, #show_service_tax_add_info').show();
      $('#show_sales_tax_add_info').on('click', function() {
        $(".sales-ie").show();
      });
    }
    else if(multiselected.indexOf("Sales of Export Services") > -1){
      $('#sales_tax, #show_sales_tax_add_info').show();
      $('#service_tax, #show_service_tax_add_info').show();
      $(".sales-ie").show();
    }

    else {
      $('#sales_tax, #show_sales_tax_add_info').show();
      $('#service_tax, #show_service_tax_add_info').show();
      $('#show_sales_tax_add_info').on('click', function() {
        $(".sales-ie").show();
      });
    }
  });

  $('.domestic_select, .abroad_select').on('click', function(){
    alert($(this).val());
    if($(this).val() == "true") {
      $('#customer_goods_details').show();
    }
    else {
      $('#customer_goods_details').hide();
    }
  });

  $(document).on('nested:fieldAdded', function(event){
    var field = event.field;
    var selectField = field.find('.selectpicker');
    selectField.selectpicker();
    $('.another_branch_address .fields:visible').addClass("add_box_company");
    $('.append_tan_info .fields:visible').addClass("add_box_company");
    $(".remove_tan_info_main").hide();
  });

  $(document).on('nested:fieldRemoved', function(event){
    var field = event.field;
    // it's already extended by Prototype
    var selectField = field.find('#remove_tan_info');
    var a = count--;
    if(a == 1){
      $('.remove_tan_info_main').show();
    }
 });
});

