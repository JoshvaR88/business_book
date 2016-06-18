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
    alert(selected);
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

  $('#tax_details, #add_details').hide();
  $('#show_fields').on('click', function(){
    $('#tax_details').show();
    $('#add_details').show();
    $('#plus_details').hide();
  })

  // $('.selectpicker').on('change', function(){
  //   var selected = $(this).find("option:selected").text();
  //   ('#cin_num').hide();
});


