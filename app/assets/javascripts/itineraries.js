$(document).ready(function(){
  toggleForm("#continue-button", "#add-title-and-description")

  function toggleForm(buttonID, formID){
    $(buttonID).click(function(){
      $(formID).toggleClass('hidden');
    });
  };

});
