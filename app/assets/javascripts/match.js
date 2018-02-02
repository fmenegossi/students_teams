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
function formatDate(dateToConvert){

  const date= new Date(dateToConvert);

  const day = date.getDate() < 10 ? `0${date.getDate()}` : date.getDate();
  const month = date.getMonth() < 9 ? `0${date.getMonth() + 1}` : date.getMonth() + 1;
  //const month = date.getMonth() + 1;
  const year = date.getFullYear();

  return `${day} ${month} ${year}`;

}
function showMatches(){
  $.ajax({
    type :'GET',
    url : '/api/matches',
    contentType: "application/json",
    dataType: "json"
  })
  .done(function(response){
    let data = createUniqueDates(response);

    let teamList = $('#team-list');
    teamList.empty();

    let matchesListLi = $('<li></li>');
    let matchesListUl = $('<ul></ul>');

    data.map(function(match,index){
      console.log(match.date);
      console.log(match.users);
      let matchLi = $('<li class="row user-group-li"></li>');
      matchLi.html(`<div class="col-xs-12"><div class="date">${formatDate(match.date)}</div></div>`);

      let studentsUl = $('<ul class="user-group col-xs-8"></ul>');

      $(match.users).map(function(index, user){
        console.log('users : ' , user);
        userJoined = user.map(function(elem){
            return elem.email;
        }).join(", ");
        studentsUl.append(`<li>${ userJoined }</li>`);
      });

      matchLi.append(studentsUl);

      matchesListUl.append(matchLi);

    });


    teamList.append(matchesListUl);
  });
}

function createUniqueDates(response){

  let dates=[];
  let reduced =[];

  $(response).each(function(index, match){
     dates.push(match.date);
  })

  let uniqueMatches = $.uniqueSort(dates);
  console.log(uniqueMatches)
  console.log(uniqueMatches.sort());
  uniqueMatches.reverse();

  uniqueMatches.map(function(value,index){

     let newObject = new Object();
     newObject.date = value;
     let newUserObj = []
     $(response).each(function(index, match){

        if ( newObject.date === match.date ) {
           newUserObj.push(match.users);
        }

        newObject.users = newUserObj;
     })
     reduced.push(newObject);

  })
  //educed.sort();
  return reduced;
}

$(document).ready( function(){
  $('#generate-btn').bind('click', generateMatches );
  showMatches();
})
