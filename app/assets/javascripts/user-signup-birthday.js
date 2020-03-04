$(function () {
  $(window).load(function() {
    // ユーザーの誕生日の閏年を動的に変化させる
    // 誕生日の配列を宣言
    var birthday_year = [];
    var birthday_month = [];
    var months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    // 現在の年を取得する
    var date = new Date();
    var this_year = date.getFullYear();
    var oldest_year = 1900;

    // 誕生年月の配列を自動生成
    for (var i = this_year; i >= oldest_year; i--) {
      var year = { var: i, txt: String(i) };
      birthday_year.push(year);
    }
    for (var i = 1; i <= 12; i++) {
      var month = { var: i, txt: String(i) };
      birthday_month.push(month);
    }
    // hamlの年と月のセレクトボックスに配列内容を反映させる
    for (var i = 0; i < birthday_year.length; i++) {
      $("<option>", {
        value: birthday_year[i].var,
        text: birthday_year[i].txt
      }).appendTo('#signup-first-birthday-year');
    }
    for (var i = 0; i < birthday_month.length; i++) {
      $("<option>", {
        value: birthday_month[i].var,
        text: birthday_month[i].txt
      }).appendTo('#signup-first-birthday-month');
    }

    // 年、もしくは月のセレクトボックスの中身に変更があったら日の内容を変更する
    $('#signup-first-birthday-year, #signup-first-birthday-month').change(function () {
      // 日が入っているセレクトボックスの中身を空っぽにする
      $('#signup-first-birthday-date').empty();
      // 日が入るセレクトボックスにデフォルト値の'--'を入れる
      $("<option>", {
        text: '--'
      }).appendTo('#signup-first-birthday-date');
      // ２月の日にち、すなわちmonths[1]を28にセットし直す
      months[1] = 28;
      // 年と月に入力されている情報を取得する
      var year = $('#signup-first-birthday-year').val();
      var month = $("#signup-first-birthday-month").val();
      // yearとmonth共に数字が入力されている、すなわち共に'--'でないときに実行
      if (year != '--' && month != '--') {
        // monthに２月が選択されている時実行
        if (month == 2) {
          // yearが閏年の時、2月の日付が格納されているmonths[1]の値を29にする
          if (year % 4 == 0 && year % 100 == 0 && year % 400 == 0) {
            months[1] = 29;
          }
        }
        // 日を入れる配列を宣言し、閏年を考慮したデータを格納してhamlの日の
        // セレクトボックスに反映させる
        var birthday_date = []
        for (var i = 1; i <= months[month - 1]; i++) {
          var day = { var: i, txt: String(i) };
          birthday_date.push(day);
        }
        for (var i = 0; i < birthday_date.length; i++) {
          $("<option>", {
            value: birthday_date[i].var,
            text: birthday_date[i].txt
          }).appendTo('#signup-first-birthday-date');
        };
      };
    });
  });
});