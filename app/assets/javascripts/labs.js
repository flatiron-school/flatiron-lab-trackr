$(document).ready(function() {
  addFileSelectListener();
})

function addFileSelectListener(){
  $("[data-id='lab-files-down']").on("click", function(e){
    debugger;
    e.preventDefault;
    e.stopPropagation;
    var btn = e.toElement;
    var parent = btn.parentElement;
    btn.remove();
    parent.append('button class="btn btn-info" data-id="lab-files-down"><span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span></button>')
    $("[data-id='lab-files']").toggleClass("hidden");
    // var studentPRFiles = btn.getAttribute('data-id')
    // $("." + studentPRFiles).toggleClass('hidden');
  })
}