document.addEventListener("DOMContentLoaded", function () {
  const buttons = document.querySelectorAll("#roshambo-buttons button");
  const result = document.getElementById("result");

  const choices = ["グー", "チョキ", "パー"];

  buttons.forEach(button => {
    button.addEventListener("click", () => {
      const userChoice = button.dataset.choice;
      const computerChoice = choices[Math.floor(Math.random() * 3)];

      let outcome = "";

      if (userChoice === computerChoice) {
        outcome = "あいこ！";
      } else if (
        (userChoice === "グー" && computerChoice === "チョキ") ||
        (userChoice === "チョキ" && computerChoice === "パー") ||
        (userChoice === "パー" && computerChoice === "グー")
      ) {
        outcome = "あなたの勝ち！";
      } else {
        outcome = "あなたの負け！";
      }

      result.textContent = `あなた：${userChoice} / コンピューター：${computerChoice} → ${outcome}`;
    });
  });
});