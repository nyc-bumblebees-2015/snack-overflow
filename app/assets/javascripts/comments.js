$(document).ready(function(){
  
  $('.comment_link').on('click', function(event){
    $(this).siblings('.comment_form').show();
    $(this).hide();
  });

});