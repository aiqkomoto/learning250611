document.addEventListener("DOMContentLoaded", function () {
  const buttons = document.querySelectorAll("#roshambo-buttons button");
  const result = document.getElementById("result");
  const streakDisplay = document.getElementById("streakDisplay");
  const maxStreakDisplay = document.getElementById("maxStreakDisplay");

  const choices = ["グー", "チョキ", "パー"];
  let winStreak = 0;
  let maxWinStreak = 0;

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
        winStreak += 1;
        if (winStreak > maxWinStreak) {
          maxWinStreak = winStreak;
        }
      } else {
        outcome = "あなたの負け！";
        winStreak = 0;
      }

      result.textContent = `あなた：${userChoice} / コンピューター：${computerChoice} → ${outcome}`;
      streakDisplay.textContent = `現在の連勝数: ${winStreak}`;
      maxStreakDisplay.textContent = `最高連勝数: ${maxWinStreak}`;
    });
  });
});