import { Controller } from "@hotwired/stimulus";


export default class extends Controller {
  static targets = ["barChart"]
  static values = { memberProjects: Number }

  connect() {
    this.createChart();
  }

  createChart() {
    const ctx = this.barChartTarget.getContext("2d");
    const memberProjects = this.memberProjectsValue;

    let chartData = [3, 5, 6];
    Chart.defaults.color = 'white';

    if (memberProjects === 3) {
      chartData = [8, 9, 4];
    }
    if (memberProjects === 4) {
      chartData = [10, 9, 7];
    }

    this.myChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: ['High Priority', 'Medium Priority', 'Low Priority'],
        datasets: [{
          data: chartData,
          backgroundColor: [
            'rgb(228, 109, 109)',
            'rgb(255, 171, 109)',
            'rgb(122, 184, 121)'
          ],
          hoverBackgroundColor: "rgba(232,105,90,0.8)",
        }]
      },

      options: {
        responsive: true,
        scales: {
          yAxes: [{
            ticks: {
              color: 'white',
              beginAtZero: true,
            }
          }],
          xAxes: [{
            ticks: {
                color: 'white'
            },
        }],
        },
        plugins: {
          legend: {
            display: false,
          },
        },
      },
    });
  }
}
