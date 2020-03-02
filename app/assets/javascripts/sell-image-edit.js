$(function () {
  $(document).ready(function(){
    $(window).load(function(){
      // インプット枠

      var append_input = $(`<li class="input"><label class="upload-label"><div class="upload-label__text">クリックしてファイルをアップロード<div class="input-area"><input class="hidden image_upload" type="file" style = "display: none;"></div></div></label></li>`)
      $ul = $('#previews')
      $lis = $ul.find('.image-preview');
      $input = $ul.find('.input');
      if($input.length == 0){
        if($lis.length < 4 ){
          $ul.append(append_input)
          $('#previews li:last-child').css({
            'width': `calc(100% - (25% * ${$lis.length}))`
          })
        }
        else if($lis.length = 4 ){
          $ul.append(append_input)
          $('#previews .input').css({
            'display': `none`
          })
        }
      }
    });
  });
});