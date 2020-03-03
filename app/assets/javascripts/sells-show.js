jQuery(document).ready(function(){
  $(".sell-product-detail__items__main-image1").show();
  $(".sell-product-detail__items__main-image2").hide();
  $(".sell-product-detail__items__main-image3").hide();
  $(".sell-product-detail__items__main-image4").hide();
});


$(function() {

  $('.sell-product-detail__items__sub-image1').on('click', function(){
    $(".sell-product-detail__items__main-image1").show();
    $(".sell-product-detail__items__main-image2").hide();
    $(".sell-product-detail__items__main-image3").hide();
    $(".sell-product-detail__items__main-image4").hide();
  });

  $('.sell-product-detail__items__sub-image2').on('click', function(){
    $(".sell-product-detail__items__main-image1").hide();
    $(".sell-product-detail__items__main-image2").show();
    $(".sell-product-detail__items__main-image3").hide();
    $(".sell-product-detail__items__main-image4").hide();
  });

  $('.sell-product-detail__items__sub-image3').on('click', function(){
    $(".sell-product-detail__items__main-image1").hide();
    $(".sell-product-detail__items__main-image2").hide();
    $(".sell-product-detail__items__main-image3").show();
    $(".sell-product-detail__items__main-image4").hide();
  });

  $('.sell-product-detail__items__sub-image4').on('click', function(){
    $(".sell-product-detail__items__main-image1").hide();
    $(".sell-product-detail__items__main-image2").hide();
    $(".sell-product-detail__items__main-image3").hide();
    $(".sell-product-detail__items__main-image4").show();
  });
});