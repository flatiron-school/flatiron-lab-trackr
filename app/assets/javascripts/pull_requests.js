$(document).ready(function() {
  addShowPRListener();
})

function addShowPRListener(){
  $("#pull_request_list").on("click", $(".show-pr"), function(e){
    e.preventDefault;
    e.stopPropagation;
    var btn = e.toElement;
    var studentPRFiles = btn.getAttribute('data-id');
    $("." + studentPRFiles).slideToggle('slow');
    $("." + studentPRFiles).removeClass("hidden");
  })
}