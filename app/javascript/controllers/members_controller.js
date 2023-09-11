import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["bar-chart"]
  connect() {
    console.log("test")

    const ctx = document.getElementById('myChart');
    const myChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: ['High Priority', 'Medium Priority', 'Low Priority'],
        datasets: [{
          label: 'Assigned tasks',
          data: [3, 5, 6,],
          backgroundColor: [
            'rgb(255, 99, 132)',
            'rgb(54, 162, 235)',
            'rgb(255, 205, 86)'
           ],
        }]
      },
      options: {
        scales: {
          yAxes: [{
            ticks: {
              beginAtZero: true
            }
          }]
        }
      }
    });
  


  }
}
