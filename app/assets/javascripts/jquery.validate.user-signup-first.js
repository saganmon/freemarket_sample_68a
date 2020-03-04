$(function () {

  var methods = {
    email: function (value, element) {
      return this.optional(element) || /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})/i.test(value);
    },
    password: function (value, element) {
      return this.optional(element) || /^(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}$/i.test(value);
    },
    zenkaku: function (value, element) {
      return this.optional(element) || /^[ぁ-んァ-ン一-龥]/i.test(value);
    },
    zenkakukana: function (value, element) {
      return this.optional(element) || /^[ぁ-んァ-ヶー－]/i.test(value);
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
  $("#signup-first-form").validate({
    // ルール設定
    rules: {
      "user[nickname]": {
        required: true,
        maxlength: 15
      },
      "user[email]": {
        required: true,
        email: true
      },
      "user[password]": {
        required: true,
        password: true
      },
      "user[password_confirmation]": {
        required: true,
        equalTo: "#signup-first-password"
      },
      "user[first_name]": {
        required: true,
        zenkaku: true
      },
      "user[last_name]": {
        required: true,
        zenkaku: true
      },
      "user[first_name_kana]": {
        required: true,
        zenkakukana: true
      },
      "user[last_name_kana]": {
        required: true,
        zenkakukana: true
      },
      "user[birthday_year]": {
        selectbox: "--"
      },
      "user[birthday_month]": {
        selectbox: "--"
      },
      "user[birthday_date]": {
        selectbox: "--"
      },
    },
    // エラーメッセージの定義
    messages: {
      "user[password_confirmation]": {
        equalTo: "パスワードが一致していません"
      },
      "user[birthday_year]": {
        selectbox: "年を選択してください"
      },
      "user[birthday_month]": {
        selectbox: "月を選択してください"
      },
      "user[birthday_date]": {
        selectbox: "日を選択してください"
      },
    },
    errorPlacement: function(error, element){
      if(element.attr('name') === 'user[first_name]'){
        error.insertAfter('.signup-first__main__form__name');
      } 
      else if(element.attr('name') === 'user[last_name]'){
        error.insertAfter('.signup-first__main__form__name');
      } 
      else if(element.attr('name') === 'user[first_name_kana]'){
        error.insertAfter('.signup-first__main__form__name-kana');
      } 
      else if(element.attr('name') === 'user[last_name_kana]'){
        error.insertAfter('.signup-first__main__form__name-kana');
      }
      else if(element.attr('name') === 'user[birthday_year]'){
        error.insertAfter('.signup-first__main__form__birthday');
      } 
      else if(element.attr('name') === 'user[birthday_month]'){
        error.insertAfter('.signup-first__main__form__birthday');
      } 
      else if(element.attr('name') === 'user[birthday_date]'){
        error.insertAfter('.signup-first__main__form__birthday');
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
  $("#signup-first-nickname, #signup-first-email, #signup-first-password, #signup-first-password-confirmation, #signup-first-first-name, #signup-first-first-name, #signup-first-last-name, #signup-first-first-name-kana, #signup-first-last-name-kana, #signup-first-birthday-year ,#signup-first-birthday-month, #signup-first-birthday-date").blur(function () {
    $(this).valid();
  });

  // かな変換
  $(document).ready(function() {            
    $.fn.autoKana('#signup-first-first-name', '#signup-first-first-name-kana', {
      katakana : false  //true：カタカナ、false：ひらがな（デフォルト）
    });

    $.fn.autoKana('#signup-first-last-name', '#signup-first-last-name-kana', {
      katakana : false  //true：カタカナ、false：ひらがな（デフォルト）
    });
  });
});