$(document).ready(function(){

  $('#moving').click(function(event){
    event.preventDefault()
    $("#vs").css("opacity", "0")
    $("#moving").hide();
    $("#exam").css("marginRight", "0").animate({marginRight: "+=500"}, 1000);
    $("#pane").css("opacity", "1").animate({opacity: "-=1"}, 1000);
    $("#moving").delay(1200)
    $("#moving").promise().done(function(){
      $("#sub").submit();
    });
  }); 

});

function getHuman()
  {
    document.getElementById("p1").value = document.getElementById("human").value;
  }
  function getEasy()
  {
    document.getElementById("p1").value = document.getElementById("easy").value;
  }
  function getMedium()
  {
    document.getElementById("p1").value = document.getElementById("medium").value;
  }
  function getHard()
  {
    document.getElementById("p1").value = document.getElementById("hard").value;
  }


  function getHuman2()
  {
    document.getElementById("p2").value = document.getElementById("human2").value;
  }
  function getEasy2()
  {
    document.getElementById("p2").value = document.getElementById("easy2").value;
  }
  function getMedium2()
  {
    document.getElementById("p2").value = document.getElementById("medium2").value;
  }
  function getHard2()
  {
    document.getElementById("p2").value = document.getElementById("hard2").value;
  }