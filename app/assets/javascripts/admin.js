$(function(){
  $("#users_search input").keyup(function() {
    $.get($("#users_search").attr("action"), $("#users_search").serialize(), null, "script");
    return false;
  });

  $("#special_search input").keyup(function() {
    $.get($("#special_search").attr("action"), $("#special_search").serialize(), null, "script");
    console.log('here');
    $(".special-product-checkbox").on('click', function(){
      console.log('here');
      event.preventDefault();
      console.log($(this).serialize());
      $.ajax({
        url: "/create_product_user",
        method: "post",
        dataType: "JSON",
        data: $(this).serialize()
      }).done(function(responseData){
        console.log(responseData);
        $("#added-products-list").html(responseData.html)
      });
    });
    return false;
  });

  $("#all_search input").keyup(function() {
    $.get($("#all_search").attr("action"), $("#all_search").serialize(), null, "script");
    return false;
  });


  $(document).on('click','.special-product-checkbox', {}, function(){
    event.preventDefault();
    console.log($(this).serialize());
    $.ajax({
      url: "/create_product_user",
      method: "post",
      dataType: "JSON",
      data: $(this).serialize()
    }).done(function(responseData){
      console.log(responseData);
      $("#added-products-list").html(responseData.html)
    });
  });
});
