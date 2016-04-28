$(document).ready(function() {
  addFileSelectListener();
  $("[data-id='lab-files']").hide();
})

function addFileSelectListener(){
  $("[data-id='lab-files-down']").on("click", function(e){
    // debugger;
    e.preventDefault;
    e.stopPropagation;
    // debugger;
    $("[data-id='lab-files-down']").toggleClass('rotate');
    $("[data-id='lab-files-down']").toggleClass('rotate-reset');
    // this.style.transform = "rotate(180deg)";
    
    // debugger;
    // var btn = e.toElement;
    // btn.rotate();
    // var parent = btn.parentElement;
    // btn.remove();
    // parent.append('button class="btn btn-info" data-id="lab-files-down"><span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span></button>')
    $("[data-id='lab-files']").slideToggle("slow")
    // var studentPRFiles = btn.getAttribute('data-id')
    // $("." + studentPRFiles).toggleClass('hidden');
  })
}

