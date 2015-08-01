var upvoteValue = 1;
var downvoteValue = -1;

$(document).ready(function(){

  $('.question_votes').on('click', 'a.upvote', function(event){
    event.preventDefault();
    var params = getQuestionParams($(this), 'upvote');
    postVote(params);
  }).on('click', 'a.downvote', function(event){
    event.preventDefault();
    var params = getQuestionParams($(this), 'downvote');
    postVote(params);
  });

  $('.suggested_answers').on('click', '.answer_votes > a.upvote', function(event){
    event.preventDefault();
    var url = '/answers/' + answerId.toString() + '/votes';

  });
  
});

var getQuestionParams = function($elem, voteType){
  var questionId = $elem.parent().data().questionId;
  var $votes_total = $elem.siblings('.votes_total')
  var url = '/questions/' + questionId.toString() + '/votes';
  var vote = {
    voteable_type: 'Question',
    vote_value: (voteType == 'upvote' ? upvoteValue : downvoteValue)
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
