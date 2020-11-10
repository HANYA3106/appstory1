
var SA = {};
SA.opacityIn = [0,1];
SA.scaleIn = [0.2, 1];
SA.scaleOut = 3;
SA.durationIn = 800;
SA.durationOut = 600;
SA.delay = 500;

function theme() {
  const startButton = document.getElementById("start_button");
  
  startButton.addEventListener("click", function(e) {
  anime.timeline({loop: false})
    .add({
    targets: '.story_anime_theme .messages-0',
    opacity: 0,
    scale: 300,
    duration: 300,
    easing: "easeInExpo",
    delay: 200
    }).add({
      targets: '.story_anime_theme .messages-1',
      opacity: SA.opacityIn,
      scale: SA.scaleIn,
      duration: SA.durationIn
    }).add({
      targets: '.story_anime_theme .messages-1',
      opacity: 0,
      scale: SA.scaleOut,
      duration: SA.durationOut,
      easing: "easeInExpo",
      delay: SA.delay
    }).add({
      targets: '.story_anime_theme .messages-2',
      opacity: SA.opacityIn,
      scale: SA.scaleIn,
      duration: SA.durationIn
    }).add({
      targets: '.story_anime_theme .messages-2',
      opacity: 0,
      scale: SA.scaleOut,
      duration: SA.durationOut,
      easing: "easeInExpo",
      delay: SA.delay
    }).add({
      targets: '.story_anime_theme .messages-3',
      opacity: SA.opacityIn,
      scale: SA.scaleIn,
      duration: SA.durationIn
    }).add({
      targets: '.story_anime_theme .messages-3',
      opacity: 0,
      scale: SA.scaleOut,
      duration: SA.durationOut,
      easing: "easeInExpo",
      delay: SA.delay
    }).add({
      targets: '.story_anime_theme',
      opacity: 0,
      duration: 530,
      delay: 500
    }).add({
      targets:'.story_anime',
      opacity: 0.7,
      duration: 30,
      delay: 25
    }).add({
      targets:'.story_anime',
      opacity: 0.5,
      duration: 30,
      delay: 25
    }).add({
      targets:'.story_anime',
      opacity: 0.3,
      duration: 30,
      delay: 25
    }).add({
      targets:'.story_anime',
      opacity: 0,
      duration: 30,
      delay: 25
    });
  });
  document.getElementById("subject").value = gon.subject.id
  document.getElementById("purpose").value = gon.purpose.id
  document.getElementById("tale").value = gon.tale.id
}


document.addEventListener("DOMContentLoaded", function(){
  var el = document.querySelector(".button_bird");
  var text = document.querySelector(".button_bird__text");
  el.addEventListener('click', function() {
    el.classList.toggle('active');
    
    if(el.classList.contains('active')){
        console.log('true');
        text.innerHTML = '投稿しました';
        el.setAttribute("type","submit");
    }else{
        text.innerHTML = '投稿する';
    }

  });
});
  

window.addEventListener("load", theme);