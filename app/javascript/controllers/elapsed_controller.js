import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="elapsed"
export default class extends Controller {
  static targets = ['days', 'total', 'end', 'start', 'btn']
  static values = {
    price: Number
  }
  connect() {
  }

  calc() {
    const startDate = Date.parse(this.startTarget.value)
    const endDate = Date.parse(this.endTarget.value)
    const elapsed_time = (endDate - startDate)/(1000*60*60*24) + 1
    if (elapsed_time > 0) {
      this.daysTarget.innerHTML = `${elapsed_time} days booked`
      this.totalTarget.innerHTML = `Total cost: §${elapsed_time * this.priceValue}`
      this.btnTarget.disabled = false
    } else if (elapsed_time <= 0 ){
      this.daysTarget.innerHTML = "Invalid booking"
      this.totalTarget.innerHTML = ``
      this.btnTarget.disabled = true
    };
  }
}
