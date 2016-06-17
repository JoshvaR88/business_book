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
    $.ajax({
      type: "POST",
      url: '/company_profiles/dropdown',
      data:{ selected: selected},
      success: function(result) {
        $('.selectpicker').selectpicker('refresh');
        $(".conditional_dropdown").empty().append(result.html);
      }
    });
  });


  $('.add_another_address').on("click", ".add_address", function() {

    $.ajax({
      type: "POST",
      url:  "/company_profiles/add_branch_address",
      success: function(result) {
        $(".another_branch_address").append(result.html);
        // $('.hide-answer-button').addClass("hide");
      }
    });
  });


});
