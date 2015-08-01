var upvoteValue = 1;
var downvoteValue = -1;

$(document).ready(function(){

  $('.question_votes').on('click', 'a.upvote', function(event){
    event.preventDefault();
    postVote($(this), {voteType: 'Question', value: upvoteValue});
  }).on('click', 'a.downvote', function(event){
    event.preventDefault();
    postVote($(this), {voteType: 'Question', value: downvoteValue});
  });

  $('.suggested_answers').on('click', 'a.upvote', function(event){
    event.preventDefault();
    postVote($(this), {voteType: 'Answer', value: upvoteValue});
  }).on('click', 'a.downvote', function(event){
    event.preventDefault();
    postVote($(this), {voteType: 'Answer', value: downvoteValue});
  });
  
});

var getVoteParams = function($elem, vote){
  if (vote.voteType == 'Question'){
    var questionId = $elem.parent().data().questionId;
    var url = '/questions/' + questionId.toString() + '/votes';
  } else {
    var answerId = $elem.parent().data().answerId;
    var url = '/answers/' + answerId.toString() + '/votes';
  }
  var $votes_total = $elem.siblings('.votes_total');
  var vote = {
    voteable_type: vote.voteType,
    vote_value: vote.value
  };
  return {
    url: url, 
    vote: vote, 
    votes_total: $votes_total
  }
};

var postVote = function($elem, vote){
  if (vote.voteType == 'Question'){
    var questionId = $elem.parent().data().questionId;
    var url = '/questions/' + questionId.toString() + '/votes';
  } else {
    var answerId = $elem.parent().data().answerId;
    var url = '/answers/' + answerId.toString() + '/votes';
  }
  var $votesTotal = $elem.siblings('.votes_total');
  var vote = {
    voteable_type: vote.voteType,
    vote_value: vote.value
  };

   $.ajax({
      url: url,
      method: 'post',
      data: vote,
      dataType: 'json'
    }).done(function(response){
      $votesTotal.html(response.vote_count); 
    }).fail(function(error){
      console.log("ERROR: ", error);
    })
}
