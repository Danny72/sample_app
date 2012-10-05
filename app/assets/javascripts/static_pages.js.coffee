# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("#click").click ->
    alert("Yoip")
  
  $("#micropost_content").keyup ->
    max = 140
    num = $("#micropost_content").val().length
    char_entered = max-num
    
    if (char_entered <= 0) || (char_entered == 140)
      $(".btn").attr('disabled', 'disabled')
      $('#char_limit').text("Cannot enter more than 140 characters").css("color","red")
    else
      $(".btn").removeAttr('disabled')
      $('#char_limit').text(" ")

    $("#char_count").text(char_entered)
     
