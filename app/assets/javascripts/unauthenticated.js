$(document).ready(function() {	
	
	$('a#hide-button').click(function(e) {
		e.preventDefault();
		e.stopPropagation();
		$('p#download-text').hide();
		$(this).hide();
		$(this).parent().animate({height:"52px"});	
		$(this).parent().css('padding', '0px');
	});

});