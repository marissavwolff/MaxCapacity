import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="battery"
export default class extends Controller {
  static values = {capacity: Number, asana: Number}
  static targets = ["hours"]

  connect() {
    const trello_url = `https://api.trello.com/1/boards/64f88e6e1c5aa49598c65a5f/cards?key=3176e8152f30516a0b31e587eda58514&token=ATTAe5a9a5814363170dbd4214525d9d3a1f0e9f7fab7d7e435b352149488f5afd5fC50AB5E9`;

    const options = {
      method: "GET",
      headers: {
        'Content-Type': 'application/json'
      },
    };

    fetch(trello_url, options)
      .then(response => response.json())
      .then((data) => {
        // console.log(data);
        let hoursCount = 0;
        data.forEach((info) => {
          info.labels.forEach((item) => {
            if (item.name === '2' || item.name === '4' || item.name === '8') {
              let hour = parseInt(item.name)
              hoursCount = hoursCount + hour
            }
          })
        })
        // hoursCount = hoursCount + this.asanaValue
        const hoursWork = (hoursCount + this.asanaValue)

        if (hoursWork >= this.capacityValue) {
          this.hoursTarget.innerHTML = '<i class="fa-solid fa-battery-empty" style="color: #fb6060;font-size: 30px;"></i>'
        } else if ((hoursWork / this.capacityValue) > 0.8 ){
          this.hoursTarget.innerHTML = '<i class="fa-solid fa-battery-quarter" style="color: #fbb360;font-size: 30px;"></i>'
        } else if ((hoursWork / this.capacityValue) < 0.8 ) {
          this.hoursTarget.innerHTML = '<i class="fa-solid fa-battery-full" style="color: #7AB879;font-size: 30px;"></i>'
        }

        console.log("trello hours")
        console.log(hoursWork)
        // this.hoursTarget.innerHTML=hoursWork
    })



}}
