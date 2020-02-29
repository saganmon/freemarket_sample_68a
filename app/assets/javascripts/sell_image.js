$(function () {
  $(document).ready(function(){
    $(window).load(function(){
      var image_number = 4; //４回繰り返す
      // 画像用のinputを生成する関数
      const buildFileField = (num)=> {
        const html = `<div data-index="${num}" class="sell-main__image__box__js-file-group">
                        <label class="sell-image-label" for="product_images_attributes_${num}_name" >ここをクリックしてください</label>
                        <input style="display:none;" class="sell-image-js-file" type="file" name="product[images_attributes][${num}][name]" id="product_images_attributes_${num}_name"><br>
                      </div>`;
        return html;
      }
      // プレビューを生成する関数
      const buildImg = (index, url)=> {
        const html = `<div class="image-preview">
                        <img data-index="${index}" src="${url}" width="150px" height="150px"><br>
                        <label class="sell-image-botton" for="product_images_attributes_${index}_name">編集</label>
                        <label class="sell-image-js-remove sell-image-botton">削除</label>
                        <div data-index="${index}" class="sell-main__image__box__js-file-group">
                          <input style="display:none;" class="sell-image-js-file" type="file" 
                            name="product[images_attributes][${index}][name]" id="product_images_attributes_${index}_name">
                        </div>
                      </div>
                    `;
        return html;
      }

      // file_fieldのnameに動的なindexをつける為の配列
      let fileIndex = [1,2,3,4,5,6,7,8,9,10];
      // 既に使われているindexを除外
      lastIndex = $('.sell-main__image__box__js-file-group:last').data('index'); //
      fileIndex.splice(0, lastIndex);

      $('.hidden-destroy').hide();  //編集時の削除のチェックボックスを隠している

      //画像を添付したらイベントが発火
      $('#image-box').on('change', '.sell-image-js-file', function(e) {
        $(document).ready(function(){
            $('.sell-image-label').css('display', 'none');
        });
        const targetIndex = $(this).parent().data('index');
        // ファイルのブラウザ上でのURLを取得する
        const file = e.target.files[0];
        const blobUrl = window.URL.createObjectURL(file);
        
          // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
          if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
            img.setAttribute('src', blobUrl);
          } else {
            // 新規画像追加の処理(プレビューの表示)
            $('#previews').append(buildImg(targetIndex, blobUrl));
            console.log(targetIndex + "targetIndex")
                // fileIndexの先頭の数字を使ってinputを作る()
              $('#previews').append(buildFileField(fileIndex[0]));
              fileIndex.shift();
                // 末尾の数に1足した数を追加する
              fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
              $(document).ready(function(){
                // インプット画面の幅を調整する
                console.log($('.image-preview').length)
              if ($('.image-preview').length < 4) {
                $('.sell-image-label').css({'width': `calc( 620px - (155px * ${$('.image-preview').length}))`});
              } else {
                $('.sell-image-label').css({'display': `none`});
              }
              });
        }
      });

      $(document).ready(function(){
      // 編集画面上の配列番号を、辻褄を合わせて取得する(削除ボタンを押した時に配列が変わる)
      $('#previews').on('click', '.sell-image-js-remove', function() {
        const targetIndex = $(this).next().data('index');
        // 該当indexを振られているチェックボックスを取得する
        const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
        // もしチェックボックスが存在すればチェックを入れる
        if (hiddenCheck) hiddenCheck.prop('checked', true);
        $(this).parent().remove();
        $(`[data-index="${targetIndex}"]`).remove();
        $(document).ready(function(){
          // インプット画面の幅を調整する
        if ($('.image-preview').length < 4) {
          $('.sell-image-label').css({'width': `calc( 620px - (155px * ${$('.image-preview').length}))`});
        } else {
          $('.sell-image-label').css({'display': `none`});
        }
        });
        // 画像入力欄が0個にならないようにしておく
        if ($('.sell-image-js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));

      });
    });
    });
  });
});