
 function bigImg(x)
  {
    $(x).css('height','225%');
    $(x).css('width', '201%');
      
  };
  
  function normalImg(x){
    $(x).css('height','100%');
    $(x).css('width', '100%');

  };



  /*  $( ".painting-display" ).each(function( index ) {
       $('.painting-display').hover( function(){
         alert("hi");
          $(this).css('background-color', '#F00');
       },
       function(){
         alert("bye");
          $(this).css('background-color', '#000');
       });
    });*/
$(function() {
  $('.painting1').hover( function(){
    bigImg($(this));
  },
  function(){
    normalImg($(this));
  });
});

        

/*$(function() {
   $('#painting-display').hover( function(){
     alert("hi");
      $(this).css('background-color', '#F00');
   },
   function(){
     alert("bye");
      $(this).css('background-color', '#000');
   });
}); */


/*   JQuery("#painting-display").addClass("painting2") */
