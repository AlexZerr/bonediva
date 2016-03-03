$(function() {
  var pcId = $("#dta").data('pc'); 
  $('#print-form-' + pcId).hide();
  $('#pc-click' + pcId).click(function() {
    $("#print-form-" + pcId).show().append('<input type="hidden" name="print[id]" value="' + pcId + '">');
  });
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

