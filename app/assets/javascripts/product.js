$(function () {
  $(".painting-display").on('click', function(){
    window.location.href='/products/' + $(this).data('product-id');
  });

  $('.painting-display').css( 'cursor', 'pointer' );
});
