// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// JS for dashboard
$(document).ready(function(){
  $(".tab").on("click", function(e){
    // Change active tab
    $(".active").removeClass('active');
    $(this).addClass('active');
    // Hide all tab-content (use class="hidden")
    $(".tab-content").addClass('hidden');
    // Show target tab-content (use class="hidden")
    console.log($(this).data("target"));
    $($(this).data("target")).removeClass('hidden');
  });

  console.log("ok execution");
  $('.chzn-select').chosen();
});



