import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["step", "answer", "form"]

  connect() {
    this.showCurrentStep();
  }

  selectAnswer(event) {
    event.preventDefault();
    const currentStep = this.currentStepIndex();
    const selectedAnswer = event.currentTarget.dataset.answer;
    this.addHiddenField(currentStep, selectedAnswer);
    if (currentStep < this.stepTargets.length - 1) {
      this.stepTargets[currentStep].classList.add("hidden");
      this.stepTargets[currentStep + 1].classList.remove("hidden");
    } else {
      // Affiche les valeurs des champs cachés avant la soumission du formulaire
      this.formTarget.submit();
      console.log("Champs cachés avant soumission :");
      Array.from(this.formTarget.elements).forEach((element) => {
        if (element.type === "hidden") {
          console.log(`${element.name}: ${element.value}`);
        }
      });


    }
  }

  currentStepIndex() {
    return this.stepTargets.findIndex(step => !step.classList.contains("hidden"));
  }

  showCurrentStep() {
    this.stepTargets.forEach((step, index) => {
      if (index === 0) {
        step.classList.remove("hidden");
      } else {
        step.classList.add("hidden");
      }
    })
  }

  addHiddenField(stepIndex, answer) {
    const input = document.createElement("input");
    input.type = "hidden";
    input.name = `result[answer_${stepIndex + 1}]`;
    input.value = answer;
    this.formTarget.appendChild(input);
  }
}
