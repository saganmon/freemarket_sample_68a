$(function () {

  // 大カテゴリ表示メソッド
  $("#category_match").on("mouseenter", function() {
    var list_id = "none";
    $.ajax({
      type: 'GET',
      url: `homes/search`,
      data: {list_id},
      dataType: 'json'
    })
    .done(function (list_categories) {
      $(list_categories).each(function (i, list) {
        $(".header__inner__nav__left__categorize__tree__big").append(
          `<li value="${list.id}" class="header__inner__nav__left__categorize__tree__big__list">
            <a href="/searches/${list.id}", id="big_category">${list.name}</a>
          </li>`
        );
      });
    })
    .fail(function () {
      alert('カテゴリーの取得に失敗しました');
    });
  });

  // 中カテゴリ表示メソッド
  $(document).on("mouseenter", ".header__inner__nav__left__categorize__tree__big__list", function() {
    var list_id = $(this).val();
    $.ajax({
      type: 'GET',
      url: `homes/search`,
      data: {list_id},
      dataType: 'json'
    })
    .done(function (list_categories) {
      $(".header__inner__nav__left__categorize__tree__medium").empty();
      $(".header__inner__nav__left__categorize__tree__small").empty();
      $(list_categories).each(function (i, list) {
        $(".header__inner__nav__left__categorize__tree__medium").append(
          `<li value="${list.id}" class="header__inner__nav__left__categorize__tree__medium__list">
            <a href="/searches/${list.id}">${list.name}</a>
          </li>`
        );
      });
    })
    .fail(function () {
      alert('カテゴリーの取得に失敗しました');
    });
  });

  // 小カテゴリ表示メソッド
  $(document).on("mouseenter", ".header__inner__nav__left__categorize__tree__medium__list", function() {
    var list_id = $(this).val();
    $.ajax({
      type: 'GET',
      url: `homes/search`,
      data: {list_id},
      dataType: 'json'
    })
    .done(function (list_categories) {
      $(".header__inner__nav__left__categorize__tree__small").empty();
      $(list_categories).each(function (i, list) {
        $(".header__inner__nav__left__categorize__tree__small").append(
          `<li value="${list.id}" class="header__inner__nav__left__categorize__tree__small__list">
            <a href="/searches/${list.id}">${list.name}</a>
          </li>`
        );
      });
    })
    .fail(function () {
      alert('カテゴリーの取得に失敗しました');
    });
  });
  
  $(document).on("mouseleave", ".header__inner__nav__left__categorize__tree", function() {
  // $(".header__inner__nav__left__categorize").on("mouseleave", function() {
    $(".header__inner__nav__left__categorize__tree__big").empty();
    $(".header__inner__nav__left__categorize__tree__medium").empty();
    $(".header__inner__nav__left__categorize__tree__small").empty();
  });
});