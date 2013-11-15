$(function() {
  $('.category_container').mouseenter( function() {
    $(this).find('.paintings').css('display', 'block');
  });
});

 $(function() {
    $('.category_container').on('mouseleave',( function() {
      $('.paintings').css('display', 'none');
    })); 
});


$(function() {
  $('#second_component').mouseenter( function() {
    $(this).find('.paintings').css('display', 'block');
  });
});

 $(function() {
    $('#second_component').on('mouseleave',( function() {
      $('.paintings').css('display', 'none');
    })); 
});

