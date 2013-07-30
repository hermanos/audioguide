$(document).ready(function() {

	$('a#hide-button').click(function(e) {
		e.preventDefault();
		e.stopPropagation();

		$('#notification').animate({ height: "0px" }, 500, function(){
      $('#notification p').hide();
      $('a#show-button').animate({ opacity: 1 }, 200);
    });
	});

	$('a#show-button').click(function(e) {
		e.preventDefault();
		e.stopPropagation();

    $('a#show-button').animate({ opacity: 0 }, 400, function(){
      $('#notification p').show();
  		$('#notification').animate({ height: "32px" }, 500);
    });
	});

	$('img#facebook-logo').mouseenter(function(){
		$(this).attr('src','/assets/facebook-logo-hover.png');
	});
	$('img#facebook-logo').mouseleave(function(){
		$(this).attr('src','/assets/facebook-logo.png');
	});

	$('img#twitter-logo').mouseenter(function(){
		$(this).attr('src','/assets/twitter-logo-hover.png');
	});
	$('img#twitter-logo').mouseleave(function(){
		$(this).attr('src','/assets/twitter-logo.png');
	});

	$('img#google-logo').mouseenter(function(){
		$(this).attr('src','/assets/google-plus-logo-hover.png');
	});
	$('img#google-logo').mouseleave(function(){
		$(this).attr('src','/assets/google-plus-logo.png');
	});

	$('img#pinterest-logo').mouseenter(function(){
		$(this).attr('src','/assets/pinterest-logo-hover.png');
	});
	$('img#pinterest-logo').mouseleave(function(){
		$(this).attr('src','/assets/pinterest-logo.png');
	});

	
});