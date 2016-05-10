$(document).ready(function() {
  $("[data-id='lab-files']").hide();
  $("[data-id='lab-directories']").hide();
  $("[data-class='pr-file'").hide();
  $("[data-menu='lab-directories']").toggleSelectMenu();
  $("[data-menu='lab-files']").toggleSelectMenu();

  showAllListener();
  PRFileListener();
  directoryListener();

})


function PRFileListener(){
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

function directoryListener(){
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




$.fn.toggleSelectMenu = function(e) {
  this.on("click", function(event){
    event.preventDefault;
    event.stopPropagation;
    $(this).toggleClass('rotate');
    $(this).toggleClass('rotate-reset');
    
    var dataId = $(this).data('menu')
    $('[data-id="' + dataId + '"]').slideToggle("slow")
  });
}



function showAllListener(){
  $("#show-all-prs").on("click", function(){
    $("[data-class='pr-file'").slideToggle("slow");
  })
}

