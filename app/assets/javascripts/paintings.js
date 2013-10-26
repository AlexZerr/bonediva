
 function bigImg(x)
  {
    $(x).css('height','225px');
    $(x).css('width', '220px');
      
  };
  
  function normalImg(x){
    $(x).css('height','100px');
    $(x).css('width', '100px');

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
