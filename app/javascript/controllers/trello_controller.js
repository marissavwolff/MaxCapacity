import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="trello"
export default class extends Controller {
  static targets = ["task", "highPriority", "hours"]

  connect() {
    console.log("test")
    console.log(this.taskTarget)
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
      console.log(data);
      let count = 0;
      let hoursCount = 0;
      data.forEach((info) => {
        // console.log(info.name);
        info.labels.forEach((item) => {
          if (item.name === 'high') {
            count = count + 1
            const card = "<p>" + info.name + "</p>"
            this.taskTarget.insertAdjacentHTML("beforeend", card)
          }
          if (item.name === '2' || item.name === '4' || item.name === '8') {
            let hour = parseInt(item.name)
            hoursCount = hoursCount + hour
          }
        })
      })
      const highCount = "<p>" + count + "</p>"
      this.highPriorityTarget.insertAdjacentHTML("beforeend", highCount)

      const hoursWork = "<p>" + hoursCount + "</p>"
      this.hoursTarget.insertAdjacentHTML("beforeend", hoursWork)

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
