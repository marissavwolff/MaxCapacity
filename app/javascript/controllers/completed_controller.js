import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="completed"
export default class extends Controller {
  static targets = ["form"]
  connect() {
    console.log("hello")
  }

  checked() {
    console.log(this.element)
    this.formTarget.submit()
  }
}
