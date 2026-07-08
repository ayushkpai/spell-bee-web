import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    word: String,
    id: Number,
  };

  static targets = ["answer", "result"];

  connect() {
    this.speak();
  }

  speak() {
    const speech = new SpeechSynthesisUtterance(this.wordValue);
    speech.rate = 0.8;
    speech.pitch = 1;
    speechSynthesis.speak(speech);
  }

  submit() {
    fetch("/practice/check", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']")
          .content,
      },
      body: JSON.stringify({
        word_id: this.idValue,
        answer: this.answerTarget.value,
      }),
    })
      .then((r) => r.json())
      .then((data) => {
        if (data.correct) {
          this.resultTarget.innerHTML = "✅ Correct!";
        } else {
          this.resultTarget.innerHTML = `❌ Correct spelling: ${data.correct_word}`;
        }

        this.wordValue = data.next_word.text;
        this.idValue = data.next_word.id;

        this.answerTarget.value = "";

        setTimeout(() => {
          this.speak();
        }, 1500);
      });
  }
}
