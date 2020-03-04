$(function () {

  var methods = {
    zenkaku: function (value, element) {
      return this.optional(element) || /^[ぁ-んァ-ン一-龥]/i.test(value);
    },
    zenkakukana: function (value, element) {
      return this.optional(element) || /^[ぁ-んァ-ヶー－]/i.test(value);
    },
    postcode: function (value, element) {
      return this.optional(element) || /^\d{3}[-]\d{4}/i.test(value);
    },
    selectbox: function (value, element, arg) {
      return arg !== value;
    },
  }
  // メソッドの追加
  $.each(methods, function (key) {
    $.validator.addMethod(key, this);
  });
  // バリデーションの実行
  $("#signup-second-form").validate({
    // ルール設定
    rules: {
      "purchase_destination[p_first_name]": {
        zenkaku: true,
        required: true
      },
      "purchase_destination[p_last_name]": {
        zenkaku: true,
        required: true
      },
      "purchase_destination[p_first_name_kana]": {
        zenkakukana: true,
        required: true
      },
      "purchase_destination[p_last_name_kana]": {
        zenkakukana: true,
        required: true
      },
      "purchase_destination[p_postcode]": {
        required: true,
        postcode: true
      },
      "purchase_destination[p_prefecture]": {
        selectbox: ""
      },
      "purchase_destination[p_city]": {
        required: true
      },
      "purchase_destination[p_block]": {
        required: true
      }
    },
    // エラーメッセージの定義
    messages: {
      "purchase_destination[p_prefecture]": {
        selectbox: "都道府県を選択してください"
      },
    },
    errorPlacement: function(error, element){
      // 新規
      if(element.attr('name') === 'purchase_destination[p_first_name]'){
        error.insertAfter('.signup-second__main__form__name');
      } 
      else if(element.attr('name') === 'purchase_destination[p_last_name]'){
        error.insertAfter('.signup-second__main__form__name');
      } 
      else if(element.attr('name') === 'purchase_destination[p_first_name_kana]'){
        error.insertAfter('.signup-second__main__form__name-kana');
      } 
      else if(element.attr('name') === 'purchase_destination[p_last_name_kana]'){
        error.insertAfter('.signup-second__main__form__name-kana');
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
  $("#signup-second-form-first-name, #signup-second-form-last-name, #signup-second-form-first-name-kana, #signup-second-form-last-name-kana, #signup-second-form-postcode, #signup-second-form-prefecture, #signup-second-form-city, #signup-second-form-block").blur(function () {
    $(this).valid();
  });

  $(document).ready(function() {            
    $.fn.autoKana('#signup-second-form-first-name', '#signup-second-form-first-name-kana', {
      katakana : false
    });

    $.fn.autoKana('#signup-second-form-last-name', '#signup-second-form-last-name-kana', {
      katakana : false
    });
  });
});