$(function() {
  $('.category_container').mouseenter( function() {
    $(this).find('.paintings').show(400);
  });
});

 $(function() {
    $('.category_container').on('mouseleave',( function() {
      $('.paintings').hide(400);
    })); 
});


$(function() {
  $('#second_component').mouseenter( function() {
    $(this).find('.paintings').show(400);
  });
});

 $(function() {
    $('#second_component').on('mouseleave',( function() {
      $('.paintings').hide(400);
    })); 
});

