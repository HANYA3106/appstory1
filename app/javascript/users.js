function tapeColor(){
  var memo = document.getElementsByClassName("tape");
  var category = gon.category
  console.log(category)


  switch(category){
    case 1:
      memo.style.backgroundColor = "#0084ff";
      break;
    case 2:
      memo.style.backgroundColor = "#ff9beb";
      break;
    case 3:
      memo.style.backgroundColor = "#ffffff";
      break;
    case 4:
      memo.style.backgroundColor = "#ffad42";
      break;
    case 5:
      memo.style.backgroundColor = '#b5b9bd';
      break;
    case 6:
      memo.style.backgroundColor = "#fd2626";
      break;
    case 7:
      memo.style.backgroundColor = "#c6fc61";
      break;
  } 
}

window.addEventListener("load",tapeColor)