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
//= require jquery3
//= require jquery_ujs
//= require activestorage
//= require_tree .

$(document).ready(function () {

  $('input').iCheck({
    checkboxClass: 'icheckbox_square-blue'
  });

  $('input').on('ifClicked', function (event) {
    event.preventDefault();
    this.form.submit();
  });

  $("#imagePlus").click(function () {
    $(".block_3").css("display", "block");
  });

  $(".hideDiv").click(function (event) {
    event.preventDefault();
    $(".block_3").css("display", "none");
  });

  $(".submit_bnt_fake").click(function (event) {
    event.preventDefault();
    $(".submit_bnt_real").click();
  });

  $(window).resize(function () {
    $('.div_addTodo').css({
      position: 'absolute',
      left: ($(window).width() - $('.div_addTodo').outerWidth()) / 2,
      top: ($(window).height() - $('.div_addTodo').outerHeight()) / 2
    });
    $('.block_3').css({
      height: $(document).outerHeight(true)
    });
  });
  $(window).resize();

});