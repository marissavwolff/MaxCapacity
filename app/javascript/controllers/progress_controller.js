import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="progress"
export default class extends Controller {
  static values = {capacity: Number, asana: Number}
  static targets = ["progress", "notice"]
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
        const hoursWork = parseInt(hoursCount + this.asanaValue)

        if (hoursWork >= this.capacityValue) {
          this.progressTarget.style = 'background-color:#FB6060;'
          this.noticeTarget.innerHTML = '<strong><p><i class="fa-regular fa-bell" style="color: #374259;"></i> WARNING! Capacity is at or over maximum, you may need to make some changes.</p></strong>'
          this.noticeTarget.style = 'color:#374259'
        } else if ((hoursWork / this.capacityValue) > 0.80 ){
          this.progressTarget.style = 'background-color:#FBB360;'
          this.noticeTarget.innerHTML = '<strong><p><i class="fa-regular fa-bell" style="color: #374259;"></i> WARNING! Project is nearing capacity.</p></strong>'
          this.noticeTarget.style = 'color:#374259'
        } else if ((hoursWork / this.capacityValue) < 0.80 ) {
          this.progressTarget.style = 'background-color:#7AB879;'
          this.noticeTarget.innerHTML = '<strong><p><i class="fa-regular fa-thumbs-up" style="color: #374259;"></i> Project is on track!</p></strong>'
          this.noticeTarget.style = 'color:#374259'
        }

        console.log("trello hours")
        console.log(hoursWork/this.capacityValue)
    })



}}
