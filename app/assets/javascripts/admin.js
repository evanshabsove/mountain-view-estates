$(function(){
  $("#users_search input").keyup(function() {
    $.get($("#users_search").attr("action"), $("#users_search").serialize(), null, "script");
    return false;
  });

  $("#special_search input").keyup(function() {
    $.get($("#special_search").attr("action"), $("#special_search").serialize(), null, "script");
    return false;
  });

  $("#new_user_product").on('submit', function(){
    event.preventDefault();
    $.ajax({
      url: "/selected_user",
      method: "post",
      dataType: "text",
      data: $(this).serialize()
    }).done(function(){
      alert('yes')
    });
  });
});
