$(document).ready(function () {

  $("input[type='radio']").change(function () {
    showCohorts();
  });

});

function showCohorts () {
  var $labsRadio = $("#type_labs"),
      $cohortSelect = $("#cohort_id");

  if ($labsRadio.prop("checked") === true) {
    $cohortSelect.show(500);
  } else {
    $cohortSelect.hide(500);
  }
}
