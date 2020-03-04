$(function () {
  var methods = {
    imagemax: function (value, element) {
      var count = $('.image-preview').length()
      return count !== 0
    }
  }
  $.each(methods, function (key) {
    $.validator.addMethod(key, this);
  });
  $("#sell-form").validate({
    rules: {
      "product[name]": { required: true, maxlength: 40 },
      "product[images_attributes][0][name]": { image: true }
    },
    messages: {

    },
    errorPlacement: function(error, element){
      if(element.attr('name') === "product[images_attributes][0][name]"){
        error.insertAfter('.form-image');
      } 
      else {
        error.insertAfter(element);
      }
    },
    errorClass: "invalid", // バリデーションNGの場合に追加するクラス名の指定
    errorElement: "p", // エラーメッセージの要素種類の指定
    validClass: "valid", // バリデーションOKの場合に追加するクラス名の指定
  });

  // 入力欄をフォーカスアウトしたときにバリデーションを実行
  $("#sell-form-name", "#product_images_attributes_1_name").blur(function () {
    $(this).valid();
  });

});