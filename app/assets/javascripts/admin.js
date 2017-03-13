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

  $(document).on('click','.delete-product-special', {}, function(){
    event.preventDefault();
    var id = $(this).attr('value')
    console.log(id);
    $.ajax({
      url: "/admin/delete_special/" + id,
      method: "delete",
      dataType: "JSON",
      data: $(this).serialize()
    }).done(function(responseData){
      console.log(responseData);
      $("#all-products").html(responseData.html)
    });
  });

  $(document).on('click','.delete-product-inventory', {}, function(){
    event.preventDefault();
    var id = $(this).attr('value')
    console.log(id);
    $.ajax({
      url: "/admin/delete_inventory/" + id,
      method: "delete",
      dataType: "JSON",
      data: $(this).serialize()
    }).done(function(responseData){
      console.log(responseData);
      $("#all-products").html(responseData.html)
    });
  });

  $(document).on('click','.edit-product-special', {}, function(){
    event.preventDefault();
    var id = $(this).attr('value')
    var tr = $(this).parent().parent()
    var sibbling = $(tr).next()
    $(tr).css("display", "none")
    $(sibbling).css("display", "table-row")
  });

  $(document).on('click','.get-out-of-edit', {}, function(){
    event.preventDefault();
    var tr = $(this).parent().parent()
    var sibbling = $(tr).prev()
    $(tr).css("display", "none")
    $(sibbling).css("display", "table-row")
  });

  $(document).on('click','.edit-button-submit', {}, function(){
    event.preventDefault();
    var tr = $(this).parent().parent()
    var sibbling = $(tr).prev()
    var id = $(this).attr('id')
    $.ajax({
      url: "/admin/update_special/" + id,
      method: "patch",
      dataType: "JSON",
      data: $('#edit_special_product_' + id).serialize()
    }).done(function(responseData){
      console.log(responseData);
      $("#all-products").html(responseData.html)
    });

    $(tr).css("display", "none")
    $(sibbling).css("display", "table-row")
  });


  $(document).on('click','.special-product-checkbox', {}, function(){
    event.preventDefault();
    console.log();
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
