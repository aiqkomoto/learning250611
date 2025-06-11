document.addEventListener("DOMContentLoaded", () => {
  const buttons = document.querySelectorAll("#buttons button");
  const resultDiv = document.getElementById("result");

  buttons.forEach((button) => {
    button.addEventListener("click", () => {
      const playerHand = button.dataset.hand;
      const hands = ["グー", "チョキ", "パー"];
      const computerHand = hands[Math.floor(Math.random() * 3)];

      let result;
      if (playerHand === computerHand) {
        result = "あいこです";
      } else if (
        (playerHand === "グー" && computerHand === "チョキ") ||
        (playerHand === "チョキ" && computerHand === "パー") ||
        (playerHand === "パー" && computerHand === "グー")
      ) {
        result = "あなたの勝ちです！";
      } else {
        result = "あなたの負けです...";
      }

      resultDiv.innerHTML = `
        <p>あなた：${playerHand}</p>
        <p>コンピュータ：${computerHand}</p>
        <h2>${result}</h2>
      `;
    });
  });
});