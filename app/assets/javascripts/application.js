// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .

$(function() {

	//ロード or スクロールされると実行
	$(window).on('load scroll', function(){

		//ヘッダーの高さ分(80px)スクロールするとfixedクラスを追加
		if ($(window).scrollTop() > 197) {
			$('.navbar').addClass('fixed');
		} else {
			//80px以下だとfixedクラスを削除
			$('.navbar').removeClass('fixed');
		}
	});
});

$(function(){
  // #で始まるアンカーをクリックした場合に処理
  $('a[href^="#"]').on('click', function() {
    // スクロールの速度
    var speed = 500;
    // アンカーの値取得
    var href= $(this).attr("href");
    // 移動先を取得
    var target = $(href == "#" || href == "" ? 'html' : href);
    // 移動先を数値で取得
    var position = target.offset().top - [140]; //ヘッダーの高さ
    // スムーススクロール
    $('body,html').animate({scrollTop:position}, speed, 'swing');
      return false;
  });
});



