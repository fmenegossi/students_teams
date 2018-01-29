$(document).ready(function(){
  $('.toggle-role').bind('click', toggleRole);
});

function toggleRole(){
  console.log(this.value);

  $.ajax({
    type: "GET",
    url  :'',
    dataType: "json"

  }).done(() => {

  }).fail(() => {

  })
}
