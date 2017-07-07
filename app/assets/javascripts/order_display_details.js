$(document).ready(function(){
  $('.details-button').click(function(){
    var oi = $(this).data('orderid');
    var oi_text = '#' + oi;
    var this_var = $(this);
    if ($(oi_text).hasClass('hide')) {
      $(oi_text).removeClass('hide');
      $(oi_text).hide();
      $(oi_text).slideDown();

    } else {
      $(oi_text).slideUp();
    }
  });
});
