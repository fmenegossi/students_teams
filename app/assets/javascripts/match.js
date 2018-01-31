function generateMatches(){
  let matchesList = $('#matches-list');

  let date = $('#date').val();
  let team_size = 2;

  let user_match = {
      date : date,
      team_size : team_size
    };

  $.ajax({
    type :'POST',
    url : '/api/user_matches',
    contentType: "application/json",
    dataType: "json",
    data : JSON.stringify(user_match)
  }).done(function(response){
    console.log(response);

    showMatches();

  })
}

function showMatches(){
  $.ajax({
    type :'GET',
    url : '/api/matches',
    contentType: "application/json",
    dataType: "json"
  })
  .done(function(response){
    console.log(response);

    let teamList = $('#team-list');
    teamList.empty();

    let matchesListLi = $('<li></li>');

    $(response).each(function(match, item){
      console.log(item);
      matchesListLi.append(`<li>${item.users[0].email} - ${item.users[1].email}</li>`);
    })

    let matchesListUl = $('<ul></ul>');

    matchesListUl.append(matchesListLi);
    teamList.append(matchesListUl);
  });
}

$(document).ready( function(){
  $('#generate-btn').bind('click', generateMatches );
  showMatches();
})
