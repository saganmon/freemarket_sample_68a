$(function () {
      //プレビュー表示カウントメソッド
      var PricePreviewCount = function (count) {
        console.log(count)
        if (count < 4){
          $('#previews .input').css('display', '')
          $('#previews .input').css({'width': `calc(100% - (25% * ${count}))`})
        }
        else if (count == 4) {
          $('#previews .input').css('display', 'none')
        }
      }

      $ul = $('#previews')
      $lis = $ul.find('.image-preview');
      $input = $ul.find('.input');

        $(window).on('load',function(){
          var count = $('#previews').find('.image-preview').length
          PricePreviewCount(count)
      });

    //削除ボタンをクリックしたとき、処理が動く。
      $(document).on('click','.image-preview__btn__delete',function(){
        $li = $(this).parents('.image-preview');
        //"li"ごと削除して、previewとinputを削除させる。
        $li.remove();
        // inputボタンのサイズを更新する、または追加させる
        // まずはプレビューの数を数える。
        $lis = $ul.find('.image-preview');
        $label = $ul.find('.input');
        PricePreviewCount($lis.length)

      });
});