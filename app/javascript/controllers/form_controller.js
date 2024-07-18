import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["step", "answer"]

  connect() {
    this.showCurrentStep()
  }

  selectAnswer(event) {
    event.preventDefault()
    const currentStep = this.currentStepIndex()
    if (currentStep < this.stepTargets.length - 1) {
      this.stepTargets[currentStep].classList.add("hidden")
      this.stepTargets[currentStep + 1].classList.remove("hidden")
    }
  }

  currentStepIndex() {
    return this.stepTargets.findIndex(step => !step.classList.contains("hidden"))
  }

  showCurrentStep() {
    this.stepTargets.forEach((step, index) => {
      if (index === 0) {
        step.classList.remove("hidden")
      } else {
        step.classList.add("hidden")
      }
    })
  }
}
