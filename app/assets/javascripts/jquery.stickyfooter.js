$(document).ready(function () {
    var docHeight = $(window).height();
    var footerHeight = $('footer').height();
    var footerTop = $('footer').position().top + footerHeight;

    if (footerTop < docHeight) {
      $('footer.main').css('margin-top', (docHeight - footerTop) + 'px');
    }
});