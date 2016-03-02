$(function() {
  var pcId = $("#dta").data('pc');
  var pcProd = $("#dta").data('prod');
  var clkr = $("#pc-click" + pcId)
  $("#pc-click" + pcId).click(function() {
    var pcName= clkr.data('pcname');
    console.log(pcProd);
    $.ajax({
      url: '/products/' + pcProd + '/print_categories/new',
      dataType: "html",
      success: function fBox(data) {
        var sizeBox = $(data).find('#pform');
        console.log(sizeBox);
        $("#print-form-" + pcId).html(sizeBox).append('<input type="hidden" name="print[id]" value="' + pcId + '">');
      },
      complete: function(data) {
        var inf = data;
        $('#print-').val('checked');
        console.log('complete');
      }
    });
  });
});

