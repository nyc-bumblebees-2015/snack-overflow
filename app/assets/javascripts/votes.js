var upvoteValue = 1;
var downvoteValue = -1;

$(document).ready(function(){

  $('.question_votes').on('click', 'a.upvote', function(event){
    event.preventDefault();
    var params = getVoteParams($(this), {voteType: 'Question', value: upvoteValue});
    postVote(params);
  }).on('click', 'a.downvote', function(event){
    event.preventDefault();
    var params = getVoteParams($(this), {voteType: 'Question', value: downvoteValue});
    postVote(params);
  });

  $('.suggested_answers').on('click', '.answer_votes > a.upvote', function(event){
    event.preventDefault();
    var url = '/answers/' + answerId.toString() + '/votes';

  });
  
});

var getVoteParams = function($elem, vote){
    var questionId = $elem.parent().data().questionId;
    var url = '/questions/' + questionId.toString() + '/votes';
  var $votes_total = $elem.siblings('.votes_total')
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

var postVote = function(params){
   $.ajax({
      url: params.url,
      method: 'post',
      data: params.vote,
      dataType: 'json'
    }).done(function(response){
      params.votes_total.html(response.vote_count); 
    }).fail(function(error){
      console.log("ERROR: ", error);
    })
}
