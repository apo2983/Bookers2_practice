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
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(function () {
  $(document).on("turbolinks:load", () => {
    $("#user_postcode").jpostal({
      postcode: ["#user_postcode"],
      address: {
        "#user_prefecture_code": "%3", // # 都道府県が入力される
        "#user_address_city": "%4%5", // # 市区町村と町域が入力される
        "#user_address_street": "%6%7", // # 大口事務所の番地と名称が入力される
      },
    });
  });
});

// $(document).ready(function(){
//   $('.jquery').on('click',function(){
//     $(this).css('color','red');
//   });
// });

$(document).ready(function(){
  $("#theTarget").skippr({
    transition : 'slide',
    speed : 1000,
    easing : 'easeOutQuart',
    navType : 'block',
    childrenElementType : 'div',
    arrows : true,
    autoPlay : true,
    autoPlayDuration : 3000,
    keyboardAlways : true,
    hidePrevious : false
  });
});