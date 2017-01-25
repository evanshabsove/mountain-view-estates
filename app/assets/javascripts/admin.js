$(function(){
  $("#users_search input").keyup(function() {
    $.get($("#users_search").attr("action"), $("#users_search").serialize(), null, "script");
    return false;
  });

  $("#special_search input").keyup(function() {
    $.get($("#special_search").attr("action"), $("#special_search").serialize(), null, "script");
    return false;
  });
})
