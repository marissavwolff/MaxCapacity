# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
tool = ["jira", "asana", "google meets", "slack"]
User.create!(name: "Bob", telephone_number: "+33456 781345", email: "gb@gb.co.uk", password: "gb@gb.co.uk", title: "product manager", company: "Google")

Project.create!(user_id: 1, name: "Project One", deadline: "15/9/23", description: "This project is about....", priority: "high", capacity: 0, tool_system: tool.sample)
Project.create!(user_id: 1, name: "Project Two", deadline: "15/1/24", description: "This project is about....", priority: "low", capacity: 0, tool_system: tool.sample)
Project.create!(user_id: 1, name: "Project Three", deadline: "15/10/24", description: "This project is about....", priority: "high", capacity: 0, tool_system: tool.sample)
Project.create!(user_id: 1, name: "Project Four", deadline: "15/12/23", description: "This project is about....", priority: "low", capacity: 0, tool_system: tool.sample)
Project.create!(user_id: 1, name: "Project Five", deadline: "15/11/23", description: "This project is about....", priority: "high", capacity: 0, tool_system: tool.sample)
Project.create!(user_id: 1, name: "Project Six", deadline: "15/9/24", description: "This project is about....", priority: "high", capacity: 0, tool_system: tool.sample)
Project.create!(user_id: 1, name: "Project Seven", deadline: "25/9/23", description: "This project is about....", priority: "medium", capacity: 0, tool_system: tool.sample)
Project.create!(user_id: 1, name: "Project Eight", deadline: "30/4/24", description: "This project is about....", priority: "high", capacity: 0, tool_system: tool.sample)
Project.create!(user_id: 1, name: "Project Nine", deadline: "28/11/23", description: "This project is about....", priority: "medium", capacity: 0, tool_system: tool.sample)
Project.create!(user_id: 1, name: "Project Ten", deadline: "12/10/23", description: "This project is about....", priority: "high", capacity: 0, tool_system: tool.sample)

puts "created seeds"
