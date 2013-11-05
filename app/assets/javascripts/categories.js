/* function drop() {
        $(this).load(
         [myData], ( function() { 
          $(this).addClass('#drop-down');
        }));
 }; 
   var myData = $('#cat').data('cat')
   console.log(myData);

 
 var alertAll = function (array, callback ) {
  for(
    var i = 0, len = array.length;
      i < len;
      i++
  );
    callback.call(array[i], i );
 }; 
function display(x) {
  
};

$(function() {
    $('#cat').click( function() {
      $('#drop-down').css('display', 'block');
   $(document).bind('click', function(){ $("#drop-down").css('display', 'none') });
    });
}); */
$(function() {
    $(document).on('click', '#cat', function() {
      $('#drop-down').css('display', 'block');
      $(document).on('click', function(){ 
        $("#drop-down").css('display', 'none') 
      });
    });
});
