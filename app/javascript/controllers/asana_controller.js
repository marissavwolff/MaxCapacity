import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="asana"
export default class extends Controller {
  static targets = [ 'input' ];

  connect() {
    console.log("hello")
  }

  fetchasana(event) {
    event.preventDefault()
    console.log(this.inputTarget.value)
    const asanaToken = this.inputTarget.value
    const options = {
      method: 'GET',
      url: 'https://app.asana.com/api/1.0/workspaces',
      headers: {
        accept: 'application/json',
        authorization: `Bearer ${asanaToken}`
      }
    };
    fetch('https://app.asana.com/api/1.0/workspaces', options)
    .then(response => response.json())
    .then(data => console.log(data))
  }
  
}
