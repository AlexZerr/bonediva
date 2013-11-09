function displaydiv(e, divid){

    var left  = (e.clientX  + "px");
    var top  = (e.clientY  + "px");

    var div = document.getElementById(divid);


    $("#"+divid).toggle(
    600);
    return false;

}
    $(function() {
      var aceo = $('#acs'),
          dropDown = $('#aceo-drop');
      aceo.click( function() {
        displaydiv('#aceo-drop', 'aceo-drop');
        $('.top_image').on('mouseover', function() {dropDown.hide(600)}); 
        $('#cat').on('mouseover', function() {dropDown.hide(600)}); 
      });
    });
