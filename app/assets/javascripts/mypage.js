jQuery(document).ready(function(){
  $(".wrapper__main__information").show();
  $(".wrapper__main__logout").hide();
  $(".wrapper__main__card").hide();
  $(".wrapper__main__card-form").hide();
});



$(function() {

  $('.wrapper__main__list__nav__box__text__home').on('click', function(){
    console.log("マイページに切り替えられました");
    $(".wrapper__main__information").show();
    $(".wrapper__main__logout").hide();
    $(".wrapper__main__card").hide();
    $(".wrapper__main__card-form").hide();
  });

  $('.wrapper__main__list__nav__box__text__logout').on('click', function(){
    console.log("ログアウトページに切り替えられました");
    $(".wrapper__main__information").hide();
    $(".wrapper__main__logout").show();
    $(".wrapper__main__card").hide();
    $(".wrapper__main__card-form").hide();
  });

  $('.wrapper__main__list__nav__box__text__card').on('click', function(){
    console.log("カードページに切り替えられました");
    $(".wrapper__main__information").hide();
    $(".wrapper__main__logout").hide();
    $(".wrapper__main__card").show();
    $(".wrapper__main__card-form").hide();
  });

  $('.wrapper__main__card__inner__btn').on('click', function(){
    console.log("カードフォームに切り替えられました");
    $(".wrapper__main__information").hide();
    $(".wrapper__main__logout").hide();
    $(".wrapper__main__card").hide();
    $(".wrapper__main__card-form").show();
  });

});
