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
function displaydiv(e,divid){

    var left  = (e.clientX  + "px");
    var top  = (e.clientY  + "px");

    var div = document.getElementById(divid);

    div.style.postion = "fixed";
    div.style.left = left;
    div.style.top = top;

    $("#"+divid).toggle(
    600);
    return false;

}
    $(function() {
      var cat = $('#cat'),
          dropDown = $('#drop-down')
      cat.click( function() {
        displaydiv('#drop-down', 'drop-down');
        $('.top_image').on('mouseover', function() {dropDown.hide(600)}); 
      });
    });

    $(function() {
      $('#cat2').click( function() {
        displaydiv('#bottom', 'bottom')
      });
    });
/*$(function() {
    $(document).on('click', '#cat', function() {
      $('#drop-down').css('display', 'block');
      $(this).slideDown('slow');
      $(document).on('click', function(){ 
        $("#drop-down").css('display', 'none'); 
      });
    });
}); */
