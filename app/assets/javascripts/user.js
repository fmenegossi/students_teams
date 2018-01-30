$(document).ready(function(){
  $('.toggle-role').bind('click', toggleRole);
});

function toggleRole(){
  console.log(this.value);

  $.ajax({
    type: "PATCH",
    url  :`/api/users/${this.value}`,
    dataType: "json",
    contentType : 'application/json'

  }).done((response) => {

    $(this).text(response.user.is_admin ? 'Demote' : 'Promote')
    $(this).toggleClass('btn-success');
    $(this).toggleClass('btn-danger');
  }).fail(() => {
    
  })
}
