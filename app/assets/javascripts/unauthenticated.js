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

});