$(function () {
//削除ボタンをクリックしたとき、処理が動く。
  $(document).on('click','.image-preview__btn__delete',function(){
    $ul = $('#previews')
    $lis = $ul.find('.image-preview');
    $input = $ul.find('.input');
    $ul = $('#previews')
    $li = $(this).parents('.image-preview');

    //"li"ごと削除して、previewとinputを削除させる。
    $li.remove();

    // inputボタンのサイズを更新する、または追加させる
    // まずはプレビューの数を数える。
    $lis = $ul.find('.image-preview');
    $label = $ul.find('.input');
    if($lis.length <= 4 ){
      $('.upload-label__text').css({
        'width': `calc(640px - (160px * ${$lis.length}))`
      })
    }
  });
});