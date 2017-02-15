
$(function() {
  // $("#products_search input").keyup(function(){
  //   $.get($("#products_search").attr("action"), $("#products_search").serialize(), null, "script");
  //   return false;
  // });


  $(".coffee-button").change(function(){
    var checked = $(this).is(':checked')
    if (checked) {
      $("#coffee-hidden").css({
        display: 'block'
      });
    } else {
      $("#coffee-hidden").css({
        display: 'none'
      });
    }
  })


  $(".other-button").on("click",function(){
    $("#coffee-hidden").css({
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
