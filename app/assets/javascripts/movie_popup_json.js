var MoviePopupJson = {
  // 'setup' function omitted for brevity
  setup: function() {
    // add hidden 'div' to end of page to display popup:
    var popupDiv = $('<div id="movieInfo"></div>');
    popupDiv.hide().appendTo($('body'));
    $(document).on('click', '#movies a', MoviePopupJson.getMovieInfo);
  }
  ,getMovieInfo: function() {
    $.ajax({type: 'GET',
            dataType: 'json',
            url: $(this).attr('href'),
            success: MoviePopupJson.showMovieInfo
            // 'timeout' and 'error' functions omitted for brevity
           });
    return(false);
  }
  ,showMovieInfo: function(jsonData, requestStatus, xhrObject) {
    // center a floater 1/2 as wide and 1/4 as tall as screen
    var oneFourth = Math.ceil($(window).width() / 4);
    $('#movieInfo').
      css({'left': oneFourth,  'width': 2*oneFourth, 'top': 250}).
      html($('<p>' + jsonData.description + '</p>'),
             $('<a id="closeLink" href="#"></a>')).
      show();
    // make the Close link in the hidden element work
    $('#closeLink').click(MoviePopupJson.hideMovieInfo);
    return(false);  // prevent default link action
  }
  // hideMovieInfo omitted for brevity
  ,hideMovieInfo: function() {
    $('#movieInfo').hide();
    return(false);
  }
};
$(MoviePopupJson.setup);
