
$(function() {
  $("#added_search input").keyup(function(){
    $.get($("#added_search").attr("action"), $("#added_search").serialize(), null, "script");
    return false;
  });


  $(".coffee-button-fair-trade").change(function(){
    var checked = $(this).is(':checked')
    if (checked) {
      $(".coffee-hidden-fair-trade").css({
        display: 'block'
      });
    } else {
      $(".coffee-hidden-fair-trade").css({
        display: 'none'
      });
    }
  })

  $(".coffee-button-regular").change(function(){
    var checked = $(this).is(':checked')
    if (checked) {
      $(".coffee-hidden-regular").css({
        display: 'block'
      });
    } else {
      $(".coffee-hidden-regular").css({
        display: 'none'
      });
    }
  })


  $(".other-button").on("click",function(){
    $(".coffee-hidden-fair-trade").css({
      display: 'none'
    });
    $(".coffee-hidden-fair-regular").css({
      display: 'none'
    });
    $(".hidden-button").prop('checked',false)
  });

  $(".checkbox").change(function() {
    var checked = $(this).is(':checked');
    $(".checkbox").prop('checked',false);
    if(checked) {
      $(this).prop('checked',true);
    }
  });

  $(".hidden-button").change(function() {
    var checked = $(this).is(':checked');
    $(".hidden-button").prop('checked',false);
    if(checked) {
      $(this).prop('checked',true);
    }
  });
});
