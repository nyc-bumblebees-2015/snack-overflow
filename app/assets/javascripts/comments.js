$(document).ready(function(){
  
  $('.comment_link').on('click', function(event){
    $(this).siblings('.comment_form').show();
    $(this).hide();
    $('.errors').remove();
  });

  $('.comment_form').on('submit', function(event){
    event.preventDefault();
    $commentsForm = $(this);
    $displayComments = $(this).parents().siblings('.display_comments');

    $.ajax({
      url: event.target.action, 
      method: event.target.method, 
      data: $(event.target).serialize(),
    }).done(function(response){
      $displayComments.append(response);
      $commentsForm.hide();
      $commentsForm.siblings('.comment_link').show();
    }).fail(function(error){
      $commentsForm.hide();
      $commentsForm.siblings('.comment_link').show();
      $displayComments.append('<div class="flash errors">ERROR: Your comment could not be saved</div>');
    });

  });

});