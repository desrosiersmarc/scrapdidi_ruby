$(document).ready(function(){
  $('.add-basket-alert').click(function(){
    var productName = $(this);
    $('#add_basket').text(productName[0].id + ' ajouté au panier');
    $('#add_basket').removeClass("hidden");
    $('#add_basket').fadeIn(2500);
    $('#add_basket').fadeOut(1000);
  });
});
