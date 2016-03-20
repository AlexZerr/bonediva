$(function() {
  //var pcId = $(".dta").data('pc'); 
  //$('#print-form-' + pcId).hide();
  
  //var conts = $(".dta-container")
  //for(var i=0;i<conts.length;i++){
    //console.log('circling', i);
    //var thing = $(conts[i]);
    //var pcId = thing.data('pc'); 
    //$('.print-form').hide();

    $('.pc-click').click(function() {
      var pcId =$(this).attr('id').split('pc-click-')[1];
      var pcProd =$(this).attr('product');
      $.ajax({
        url: '/products/' + pcProd + '/print_categories/new',
        dataType: "html",
        success: function () {
         console.log('wahhhhhh');
          console.log(pcProd);
        },
        complete: function fBox(data) {
        var sizeBox = $(data).find('#ello');
          console.log(sizeBox);
          var pf = $("#print-form-" + pcId)
          pf.show()
          pf.append('<input type="hidden" name="print_category[print_type]" value="' + pcId + '">');
          console.log('complete');
        }

      });
//      $("#print-form-" + pcId).show().append('<input type="hidden" name="print[id]" value="' + pcId + '">');
    });

  //}
  //$('#pc-click' + pcId).click(function() {
    //console.log(pcId);
    //$("#print-form-" + pcId).show().append('<input type="hidden" name="print[id]" value="' + pcId + '">');
  //});
});


//$(function() {
 // var pcId = $("#dta").data('pc');
 // var pcProd = $("#dta").data('prod');
 // var clkr = $("#pc-click" + pcId)
 // $("#pc-click" + pcId).click(function() {
 //   console.log(pcProd);
 //   $.ajax({
 //     url: '/products/' + pcProd + '/print_categories/new',
 //     dataType: "html",
 //     success: function fBox(data) {
 //       var sizeBox = $(data).find('#pform');
 //       console.log(sizeBox);
 //       $("#print-form-" + pcId).show().append('<input type="hidden" name="print[id]" value="' + pcId + '">');
 //     },
 //     complete: function(data) {
 //       var inf = data;
 //       $('#print-').val('checked');
 //       console.log('complete');
 //     }
 //   });
 // });
 //});

