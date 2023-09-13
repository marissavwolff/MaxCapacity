import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="trello"
export default class extends Controller {
  static targets = ["hours", "progress", "pieChart"]
  static values = {capacity: Number}

  connect() {
    // console.log("test")
    // console.log(this.taskTarget)
    this.getTasks()
  }

  getTasks = () => {
  const url = `https://api.trello.com/1/boards/64f88e6e1c5aa49598c65a5f/cards?key=3176e8152f30516a0b31e587eda58514&token=ATTAe5a9a5814363170dbd4214525d9d3a1f0e9f7fab7d7e435b352149488f5afd5fC50AB5E9`;

  const options = {
    method: "GET",
    headers: {
      'Content-Type': 'application/json'
    },
  };

  fetch(url, options)
    .then(response => response.json())
    .then((data) => {
      // console.log(data);
      this.count = 0;
      this.hoursCount = 0;
      this.countmed = 0;
      this.countlow = 0;
      data.forEach((info) => {
        // console.log(info.name);
        info.labels.forEach((item) => {
          if (item.name === 'high') {
            this.count = this.count + 1
          }
          if (item.name === '2' || item.name === '4' || item.name === '8') {
            let hour = parseInt(item.name)
            this.hoursCount = this.hoursCount + hour
          }
          if (item.name === 'medium') {
            this.countmed = this.countmed + 1
          }
          if (item.name === 'low') {
            this.countlow = this.countlow + 1
          }
        })
      })
      const highCount = "<p>" + this.count + "</p>"

      const medCount = "<p>" + this.countmed + "</p>"

      const hoursWork = "<p>" + this.hoursCount + "</p>"
      this.hoursTarget.innerHTML=this.hoursCount

      let trelloPercentage = 0

      if (this.hoursCount > this.capacityValue) {
        trelloPercentage = 100
      }
      else {
        trelloPercentage = (this.hoursCount / this.capacityValue)*100
      }
      // console.log(trelloPercentage)
      this.progressTarget.style = `height:10px; width: ${trelloPercentage}%; background-color:#1F2533;`

      const myChart = new Chart(this.pieChartTarget, {
        type: 'pie',
        data: {
          labels:  ['High', 'Medium', 'Low'],
          datasets: [{
            label: "Trello Tasks",
            data: [this.count, this.countmed, this.countlow],
            backgroundColor: [
              'rgb(228, 109, 109)',
              'rgb(255, 171, 109)',
              'rgb(122, 184, 121)'],
            hoverOffSet: 4
            }]
          }
        });
    });
  }
}








// import { Controller } from "@hotwired/stimulus"

// // Connects to data-controller="trello"
// export default class extends Controller {
//   static targets = ["task"]

//   connect() {
//     console.log("test")
//     console.log(this.taskTarget)
//     this.getTasks()
//   }

//   getTasks = () => {
//   const url = `https://api.trello.com/1/boards/64f88e6e1c5aa49598c65a5f/cards?key=3176e8152f30516a0b31e587eda58514&token=ATTAe5a9a5814363170dbd4214525d9d3a1f0e9f7fab7d7e435b352149488f5afd5fC50AB5E9`;

//   const options = {
//     method: "GET",
//     headers: {
//       'Content-Type': 'application/json'
//     },
//   };

//   fetch(url, options)
//     .then(response => response.json())
//     .then((data) => {
//       console.log(data);
//       data.forEach((info) => {
//         console.log(info.name);
//         const card = "<p>" + info.name + "</p>"
//         this.taskTarget.insertAdjacentHTML("beforeend", card)
//       })
//     });
//   }
// }
