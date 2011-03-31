$(document).ready(function() {

  // convert post date to relative timestamp
  $(".relative_post_date").each(function(i) {
    $(this).text(new Date(this.innerHTML).toRelativeTime());
  });
  
  $("#post_body").change(function() {
    $("#post_url").val("");
  }); 
  
  
});
