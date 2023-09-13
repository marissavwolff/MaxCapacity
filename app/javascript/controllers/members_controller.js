import { Controller } from "@hotwired/stimulus"

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
          label: 'Assigned tasks',
          data: chartData,
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
        },
        plugins: {
          legend: {
            labels: {
              font: {
                size: 16,
                fontFamily:'Jost',
              },
              color: 'white',
            },
          },
          datalabels: {
            color: 'white',
            font: {
              color: 'white',
              weight: 'bold',
              size: 12,
            },
          },
        },
      },
    });
  }
}
