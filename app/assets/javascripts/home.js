$(function () {

  // 大カテゴリ表示メソッド
  $(".header__inner__nav__left__categorize").on("mouseover", function() {
  // $(document).on("mouseover", ".header__inner__nav__left__categorize", function() {
  // // $(".header__inner__nav__left__categorize").on("mouseover", function() {
    var list_id = 0;
    $.ajax({
      type: 'GET',
      url: `homes/search`,
      data: {list_id},
      dataType: 'json'
    })
    .done(function (list_categories) {
      // $(".header__inner__nav__left__categorize__big").empty();
      $(list_categories).each(function (i, list) {
        $(".header__inner__nav__left__categorize__big").append(
          `<li value="${list.id}" class="header__inner__nav__left__categorize__big__list">
            <a href="#">${list.name}</a>
          </li>`
        );
      });
    })
    .fail(function () {
      alert('カテゴリーの取得に失敗しました');
    });
  });

  // 中カテゴリ表示メソッド
  $(document).on("mouseover", ".header__inner__nav__left__categorize__big__list", function() {
    var list_id = $(this).val();
    $.ajax({
      type: 'GET',
      url: `homes/search`,
      data: {list_id},
      dataType: 'json'
    })
    .done(function (list_categories) {
      $(".header__inner__nav__left__categorize__medium").empty();
      $(".header__inner__nav__left__categorize__small").empty();
      $(list_categories).each(function (i, list) {
        $(".header__inner__nav__left__categorize__medium").append(
          `<li value="${list.id}" class="header__inner__nav__left__categorize__medium__list">
            <a href="#">${list.name}</a>
          </li>`
        );
      });
    })
    .fail(function () {
      alert('カテゴリーの取得に失敗しました');
    });
  });

  // 小カテゴリ表示メソッド
  $(document).on("mouseover", ".header__inner__nav__left__categorize__medium__list", function() {
    var list_id = $(this).val();
    $.ajax({
      type: 'GET',
      url: `homes/search`,
      data: {list_id},
      dataType: 'json'
    })
    .done(function (list_categories) {
      $(".header__inner__nav__left__categorize__small").empty();
      $(list_categories).each(function (i, list) {
        $(".header__inner__nav__left__categorize__small").append(
          `<li value="${list.id}" class="header__inner__nav__left__categorize__small__list">
            <a href="#">${list.name}</a>
          </li>`
        );
      });
    })
    .fail(function () {
      alert('カテゴリーの取得に失敗しました');
    });
  });
  
  $(document).on("mouseleave", ".header__inner__nav__left__categorize", function() {
  // $(".header__inner__nav__left__categorize").on("mouseleave", function() {
    $(".header__inner__nav__left__categorize__big").remove();
    $(".header__inner__nav__left__categorize__medium").remove();
  });
});