$(document).ready(function() {	
	
	$('a#hide-button').click(function(e) {
		e.preventDefault();
		e.stopPropagation();
		$('h1').hide();
		$(this).hide();
		$(this).parent().animate({height:"52px"});	
		$(this).parent().css('padding', '0px');
		$('a#download').css({'padding': '10px',
													'float': 'top', 
													'margin-top': '-10px', 
													'width': '90%'});
		$('a#download').text('Get the Audio-Guide feature now !')
	});

});