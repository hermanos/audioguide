$(document).ready(function () {

  // $("body").backstretch("/images/background.jpg");
  $.backstretch("/assets/background.jpg");
  

  // sticky footer
  var docHeight = $(window).height();
  var footerHeight = $('footer').height();
  var footerTop = $('footer').position().top + footerHeight;

  if (footerTop < docHeight) {
    $('footer.main').css('margin-top', (docHeight - footerTop) + 'px');
  }

});