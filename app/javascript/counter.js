document.addEventListener("turbo:load", function () {
    let count = 0;
    const countDisplay = document.getElementById("count");
    const button = document.getElementById("increment-button");
  
    if (button && countDisplay) {
      button.addEventListener("click", function () {
        count += 1;
        countDisplay.textContent = count;
      });
    } else {
      console.log("button または countDisplay が見つかりません");
    }
});