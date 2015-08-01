$(document).ready(function(){
  var upvoteValue = 1;
  var downvoteValue = -1;

  $('.question_votes').on('click', 'a.upvote', function(event){
    event.preventDefault();
    var questionId = $(this).parent().data().questionId;
    var $votes_total = $(this).siblings('.votes_total')
    var url = '/questions/' + questionId.toString() + '/votes';
    var vote = {
      voteable_type: 'Question',
      vote_value: upvoteValue
    };

    $.ajax({
      url: url,
      method: 'post',
      data: vote,
      dataType: 'json'
    }).done(function(response){
      $votes_total.html(response.vote_count); 
    }).fail(function(error){
      console.log("ERROR: ", error);
    })

  });

  $('.question_votes').on('click', 'a.downvote', function(event){
    event.preventDefault();
    var questionId = $(this).parent().data().questionId;
    var $votes_total = $(this).siblings('.votes_total')
    var url = '/questions/' + questionId.toString() + '/votes';
    var vote = {
      voteable_type: 'Question',
      vote_value: downvoteValue
    };

    $.ajax({
      url: url,
      method: 'post',
      data: vote,
      dataType: 'json'
    }).done(function(response){
      $votes_total.html(response.vote_count); 
    }).fail(function(error){
      console.log("ERROR: ", error);
    })

  });


  $('.suggested_answers').on('click', '.answer_votes > a.upvote', function(event){
    event.preventDefault();
    var url = '/answers/' + answerId.toString() + '/votes';

  });
  
});
