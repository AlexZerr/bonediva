$(function () {
  $(".prod-disp").on('click', function(){
    window.location.href='/products/' + $(this).data('product-id');
  });

  $('.prod-disp').css( 'cursor', 'pointer' );
});

$(function () {
  $(".sold-prod-disp").on('click', function(){
    window.location.href='/sold_products/' + $(this).data('product-id');
  });

  $('.sold-prod-disp').css( 'cursor', 'pointer' );
});
