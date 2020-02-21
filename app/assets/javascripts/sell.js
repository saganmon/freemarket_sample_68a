$(function () {
  // 中カテゴリ抽出メソッド
  var changeSelectMiddle = function (id, nextSelect) {
    $.ajax({
      type: 'GET',
      url: 'select_category_middle',
      data: {keyword: id},
      dataType: 'json'
    })

    .done(function (categories) {
      nextSelect.empty();
      nextSelect.append(`
        <option value="">---</option>
        `);
      $(categories).each(function (i,category) {
        nextSelect.append(`
        <option value="${category.id}">${category.name}</option>
        `);
      });
    })
    .fail(function () {
      alert('カテゴリの取得に失敗しました');
    });
  }

// 小カテゴリ抽出メソッド
  var changeSelectSmall = function (id, nextSelect) {
    $.ajax({
      type: 'GET',
      url: 'select_category_small',
      data: {keyword: id},
      dataType: 'json'
    })
    .done(function (categories) {
      nextSelect.empty();
      nextSelect.append(`
        <option value="">---</option>
        `);
      $(categories).each(function (i,category) {
        nextSelect.append(`
        <option value="${category.id}">${category.name}</option>
        `);
      });
    })
    .fail(function () {
      alert('カテゴリの取得に失敗しました');
    });
  }

// 配送の方法抽出メソッド
var changeSelectShipping = function (id, nextSelect) {
  $.ajax({
    type: 'GET',
    url: 'select_shipping_method',
    data: {keyword: id},
    dataType: 'json'
  })

  .done(function (shipping) {
    nextSelect.empty();
    nextSelect.append(`
      <option value="">---</option>
      `);
    $(shipping).each(function (i,shipping) {
      nextSelect.append(`
      <option value="${shipping.id}">${shipping.name}</option>
      `);
    });
  })
  .fail(function () {
    alert('カテゴリの取得に失敗しました');
  });
}

    // 中カテゴリ・小カテゴリ非表示
    $(document).ready(function(){
      $(window).load(function(){
        $('.category-box__middle').css('display', 'none');
        $('.category-box__small').css('display', 'none');
      });
    });
  
  // 大カテゴリにプルダウンを「---」に変更する
  $('.sell-main__product-details__contents__category__lists').prepend(
    `<option value="" >---</option>`
    ).val("");


  // 大カテゴリが選択されたら、中カテゴリ表示
  $('#category_large_category_large').change(function(){
    var id = $(this).val();
    if (id === "") {
      $('.category-box__middle').css('display', 'none'); //中カテゴリ非表示
      $('.category-box__small').css('display', 'none'); //小カテゴリ非表示
      return;
    }
    $('.category-box__middle').css('display', 'block');// 大カテゴリが選択されたら、中カテゴリ表示
    changeSelectMiddle(id, $('#category_middle_category_middle'));
  });

  // 中カテゴリが選択されたら、小カテゴリ表示
  $('#category_middle_category_middle').change(function(){
    var id = $(this).val();
    if (id === "") {
      $('.category-box__small').css('display', 'none');
      return;
    }
    $('.category-box__small').css('display', 'block');// 中カテゴリが選択されたら、小カテゴリ表示
    changeSelectSmall(id, $('#product_category_id'));
  });

  //販売手数料・販売利益の表示
  $(document).ready(function(){
    $("#product_price").keyup(function(){
      var price = $(this).val();
      if (price >= 300 & price <= 999999999){
        var tax = Math.floor(price * 0.1)
        var tax_add = tax.toLocaleString();
        var profit = price - tax
        var profit_add = profit.toLocaleString();
        $(".sell-main__product-price__contents__sales-commission__price").text("¥" + tax_add);
        $(".sell-main__product-price__contents__sales-profit__price").text("¥" + profit_add)
      }
      else{
        $(".sell-main__product-price__contents__sales-commission__price").text("---")
        $(".sell-main__product-price__contents__sales-profit__price").text("---")
      }
    });
  });


  // 配送料の負担・方法の表示

  // 配送の方法の非表示
  $(document).ready(function(){
    $(window).load(function(){
      $('.sell-main__product-delivery__contents__shipping-method').css('display', 'none');
    });
  });

  // 配送料の負担が選ばれたら、配送の方法が表示される
  $('#product_shipping_burden').change(function(){
    var burden = $(this).val();
    console.log(burden)
    if (burden === "") {
      $('.sell-main__product-delivery__contents__shipping-method').css('display', 'none'); //配送料の負担非表示
      return;
    }
    $('.sell-main__product-delivery__contents__shipping-method').css('display', 'block');// 負担が選択されたら、方法表示
    changeSelectShipping(burden, $('#product_shipping_id'));
  });
});

