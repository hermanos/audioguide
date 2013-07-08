$(document).ready(function() {

    e.preventDefault();
    e.stopPropagation();
    
    var description_text = $("p.description").val();

    $.getJSON("http://speech.jtalkplugin.com/api/?callback=?",
      {
        speech: description_text.replace(/[\n\r]/g, ''),
        usecache: "false"
      },
      function(json) {
        if (json.success == true){
          // Success - perform your audio operations here
          $('audio#player').attr('src', json.data.url);
          var audioElement = document.getElementById("player");
          audioElement.play();
          $('a#read-email').text(old_text);
        } else {
          // Failure
          $('a#read-email').text('Error.');
        }
    });

 

});