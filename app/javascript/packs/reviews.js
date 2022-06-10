// class = "ratings"の子要素を取得
const stars = document.querySelector(".ratings").children;
// const stars = document.getElementsByClassName("ratings").children;
// id = "rating-value"の要素を取得
const ratingValue = document.getElementById("rating-value");
// id = "rating-value-display"の要素を取得
const ratingValueDisplay = document.getElementById("rating-value-display");
// indexという変数を定義
let index;

for(let i=0; i<stars.length; i++){
  stars[i].addEventListener("mouseover", function(){
    for(let j=0; j<stars.length; j++){
      stars[j].classList.remove("fa-star");
      stars[j].classList.add("fa-star-o");
    }
    for(let j=0; j<=i; j++){
      stars[j].classList.remove("fa-star-o");
      stars[j].classList.add("fa-star");
    }
  })
  stars[i].addEventListener("click", function(){
    ratingValue.value = i + 1;
    ratingValueDisplay.textContent = ratingValue.value;
    index = i;
  })
  stars[i].addEventListener("mouseout", function(){
    for(let j=0; j<stars.length; j++){
      stars[j].classList.remove("fa-star");
      stars[j].classList.add("fa-star-o");
    }
    for(let j=0; j<=index; j++){
      stars[j].classList.remove("fa-star-o");
      stars[j].classList.add("fa-star");
    }
  })
}
