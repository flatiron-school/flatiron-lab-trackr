$(document).ready(function() {
  $("[data-id='lab-files']").hide();
  $("[data-class='pr-file'").hide();
  addFileSelectListener();
  addPRFileListener();

})

function addFileSelectListener(){
  $("[data-id='lab-files-down']").on("click", function(e){
    e.preventDefault;
    e.stopPropagation;
    $("[data-id='lab-files-down']").toggleClass('rotate');
    $("[data-id='lab-files-down']").toggleClass('rotate-reset');
    $("[data-id='lab-files']").slideToggle("slow")
  })
}

function addPRFileListener(){
  $("[data-id='lab-files-submit']").on("click", function(e){
    e.preventDefault;
    e.stopPropagation;
    var fileNames = $("[data-id='selected-files']:checked").map(function(i, box){
      var dataId = box.value
      $("[data-id='" + dataId + "'][style='display: none;']").slideToggle('slow')
    })

    var fileNames = $("[data-id='selected-files']:not(:checked)").map(function(i, box){
      var dataId = box.value
      debugger;
      $("[data-id='" + dataId + "'][style='display: block;']").toggleClass('hidden')
    })
  })
}

