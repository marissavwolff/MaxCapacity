import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chart"
export default class extends Controller {
  connect() {
    console.log("hello")
    // new Chart(this.element, {
    //   type: 'pie',
    //   data: {
    //     labels:  ['High Priorty Tasks', 'Medium Priorty Tasks', 'Low Priority Tasks'],
    //     datasets: [{
    //       label: "Trello Tasks",
    //       data: [3, 4, 6],
    //       backgroundColor: [
    //         'rgb(228, 109, 109)',
    //         'rgb(255, 171, 109)',
    //         'rgb(122, 184, 121)'
    //       ],
    //       hoverOffSet: 4
    //     }]
    //   }
    // });
  }
}
