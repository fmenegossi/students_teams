function generateMatches(){
  let matchesList = $('#matches-list');

  let date = $('#date').val();
  let team_size = 2;

  $ajax({
    type :'POST',
    url : '/api/user_matches',
    contentType: "application/json",
    dataType: "json",
    data : {
      user_match : {
        date : date,
        team_size : team_size
      }
    }
  }).done(function(response){

    showMatches(response);

  })
}

function fetchMatches(){
  $ajax({
    type :'GET',
    url : '/api/user_matches',
    contentType: "application/json",
    dataType: "json"

  }).done(function(response){

    showMatches(response);

  })
}

function showMatches(response){


  let teamList = $('#team-list');
  teamList.empty();

  let matchesListLi = $('<li></li>');

  $(response.matches).each(function(match){
     matchesListLi.append(`<li>${response.user_id}</li>`);
  })
  let matchesListUl = $(document).create('<ul></ul>');
  matchesListUl.append(matchesListLi);
}

$(document).ready( function(){

  $('#generate-button').bind('click', generateMatches );
  fetchMatches();
})
