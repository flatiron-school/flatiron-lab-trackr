$(document).ready(function() {
  $("[data-id='lab-files']").hide();
  $("[data-id='lab-directories']").hide();
  $("[data-class='pr-file'").hide();
  addFileSelectListener();
  addPRFileListener();
  addDirectorySelectListener();
  showAllListener();

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
      $("[data-id='" + dataId + "'][style='display: block;']").toggleClass('hidden')
    })
  })
}

function addPRFileListener(){
  $("[data-id='lab-directories-submit']").on("click", function(e){
    e.preventDefault;
    e.stopPropagation;
    var fileNames = $("[data-id='selected-directories']:checked").map(function(i, box){
      var dataId = box.value
      $("[data-directory='" + dataId + "'][style='display: none;']").slideToggle('slow')
    })

    var fileNames = $("[data-id='selected-directories']:not(:checked)").map(function(i, box){
      var dataId = box.value
      $("[data-directory='" + dataId + "'][style='display: block;']").toggleClass('hidden')
    })
  })
}


function addDirectorySelectListener(){
  $("[data-id='lab-directories-down']").on("click", function(e){
    e.preventDefault;
    e.stopPropagation;
    $("[data-id='lab-directories-down']").toggleClass('rotate');
    $("[data-id='lab-directories-down']").toggleClass('rotate-reset');
    $("[data-id='lab-directories']").slideToggle("slow")
  })
}

function showAllListener(){
  $("#show-all-prs").on("click", function(){
    $("[data-class='pr-file'").slideToggle("slow");
  })
}

