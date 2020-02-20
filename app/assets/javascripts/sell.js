$(function () {
  var changeSelect = function (id, nextSelect) {
    // var category_id = $('.sell__upload__head').data('item-id');
    $.ajax({
      type: 'GET',
      url: `/sells/${id}/edit`,
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



  $('.sell-main__product-details__contents__category__lists').prepend(
    `<option value="" >---</option>`
    ).val("");

  // $(document).ready(function(){
  //   $('#category_2_category_2').hide();
  // });
  

  $('#category_category').change(function(){
    var id = $(this).val();
    console.log(id);
    // $('#category_2_category_2').fadeIn();
    // $(@categories).each(function (i,category) {
    //   $('#category_2_category_2').append(
    //     `<option value="${category.children.id}">${category.children.name}</option>`);
    // });
      // $('.category-box__grandchild').css('display', 'none');
      // return;
    // $('.category-box__child').css('display', 'block');
  });

  // $('#category_2_category_2').change(function(){
  //   var id = $(this).val();
  //   if (id == "") {
  //     $('#category_2_category_2').hide()
  //     // ('display', 'none');
  //     // return;
  //   }
  //   $('.category-box__grandchild').css('display', 'block');
  // });
});