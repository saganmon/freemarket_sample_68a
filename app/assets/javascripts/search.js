$(function () {
  $(".search-main__left-contents__sort-selector__box").on("change", function() {
    var keyword = $(".search-main__right-contents__keyword").html()
    var num = $(this).val();
    $.ajax({
      type: 'GET',
      url: `/searches/sort`,
      data: {keyword, num},
      dataType: 'json'
    })
    .done(function (products) {
      $(".search-main__right-contents__images").empty();
      $(products).each(function (i, product) {
        $(".search-main__right-contents__images").append(
          `<div class="search-main__right-contents__images__list">
            <div class="search-main__right-contents__images__list__image">
              <img width="220px" height="150px" src="${product.image}">
            </div>
            <div class="search-main__right-contents__images__list__name">
              ${product.name}
            </div>
            <div class="search-main__right-contents__images__list__price">
              ${product.price}
            </div>
          </div>`
        );
      });
    })
    .fail(function () {
      alert('検索結果の取得に失敗しました');
    });
  });
});