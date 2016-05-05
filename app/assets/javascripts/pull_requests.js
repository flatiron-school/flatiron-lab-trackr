$(document).ready(function() {
  addShowPRListener();
  addPRLoadingSpinner();
})

function addShowPRListener(){
  $("#pull_request_list").on("click", $(".show-pr"), function(e){
    e.preventDefault;
    e.stopPropagation;
    var btn = e.toElement;
    var prFilesId = btn.getAttribute('data-pr')
    $("[data-pr-parent='" + prFilesId +  "']").slideToggle('slow');
    $("[data-pr-parent='" + prFilesId +  "']").removeClass("hidden");
  })
}

function addPRLoadingSpinner(){
  $("#get-prs-btn").on("click", function(e){
    // e.preventDefault;
    e.stopPropagation;
    $("#pull_request_list").spin();
    
  })
}