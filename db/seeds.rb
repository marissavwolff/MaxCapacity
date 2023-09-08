# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
tool = ["Jira", "Asana", "Google Meets", "Slack"]
User.destroy_all
User.create!(name: "Bob", telephone_number: "+33456 781345", email: "glbb@glb.co.uk", password: "gb@gb.co.uk", title: "product manager", company: "Google")


puts "Seeding Projects"

Project.destroy_all!
Project.create!(user_id: 1, project_manager: "Tom Jones", name: "Create MaxCapcity Site", deadline: "2024/4/15", description: "This project is about....", priority: "[\"High\"]", capacity: 70, tool_system: tool.sample)
Project.create!(user_id: 1, project_manager: "Sally Weaver", name: "Launch Capacity Product", deadline: "2024/2/15", description: "This project is about....", priority: "[\"Low\"]", capacity: 40, tool_system: tool.sample)
Project.create!(user_id: 1, project_manager: "Charlotte Reyburn", name: "Project Three", deadline: "2024/8/15", description: "This project is about....", priority: "[\"High\"]", capacity: 65, tool_system: tool.sample)
Project.create!(user_id: 1, project_manager: "Madeleine Plumridge", name: "Bake a Cake", deadline: "2024/9/1", description: "This project is about....", priority: "[\"Low\"]", capacity: 20, tool_system: tool.sample)
Project.create!(user_id: 1, project_manager: "Georgia Bean-Butler", name: "Project Five", deadline: "2024/2/15", description: "This project is about....", priority: "[\"Low\"]", capacity: 20, tool_system: tool.sample)
Project.create!(user_id: 1, project_manager: "Bijan Sabbagh", name: "Project Six", deadline: "2023/12/15", description: "This project is about....", priority: "[\"High\"]", capacity: 60, tool_system: tool.sample)
Project.create!(user_id: 1, project_manager: "Marissa Wolff", name: "Project Seven", deadline: "2023/11/15", description: "This project is about....", priority: "[\"Medium\"]", capacity: 50, tool_system: tool.sample)
Project.create!(user_id: 1, project_manager: "Ben Affleck", name: "Launch New Site", deadline: "2023/9/30", description: "This project is about....", priority: "[\"High\"]", capacity: 65, tool_system: tool.sample)
Project.create!(user_id: 1, project_manager: "Terry", name: "Marketing for New Product", deadline: "2023/10/15", description: "This project is about....", priority: "[\"Medium\"]", capacity: 45, tool_system: tool.sample)
Project.create!(user_id: 1, project_manager: "Loki Millioud", name: "New Site Feature", deadline: "2023/9/15", description: "This project is about....", priority: "[\"High\"]", capacity: 65, tool_system: tool.sample)
puts "Created seeds"


puts "Seeding Member"
Member.destroy_all!
Member.create!(name: 'Sam', company: 'Le Wagon', title: 'Engineer', email: 'sam@lewagon.com', capacity: 8, line_manager: 'Wade')
Member.create!(name: 'Will', company: 'Le Wagon', title: 'Performance', email: 'will@lewagon.com', capacity: 8, line_manager: 'Wade')
Member.create!(name: 'Jack', company: 'Le Wagon', title: 'Designer', email: 'jack@lewagon.com', capacity: 8, line_manager: 'Wade')
Member.create!(name: 'Freddie', company: 'Le Wagon', title: 'Performance', email: 'freddie@lewagon.com', capacity: 8, line_manager: 'Wade')
Member.create!(name: 'Alex', company: 'Le Wagon', title: 'Marketing', email: 'alex@lewagon.com', capacity: 8, line_manager: 'Wade')
Member.create!(name: 'Kat', company: 'Le Wagon', title: 'Performance', email: 'kat@lewagon.com', capacity: 8, line_manager: 'Wade')
Member.create!(name: 'Liz', company: 'Le Wagon', title: 'Marketing', email: 'liz@lewagon.com', capacity: 8, line_manager: 'Wade')
Member.create!(name: 'Anne', company: 'Le Wagon', title: 'Performance', email: 'anne@lewagon.com', capacity: 8, line_manager: 'Wade')
Member.create!(name: 'Bob', company: 'Le Wagon', title: 'Designer', email: 'bob@lewagon.com', capacity: 8, line_manager: 'Wade')
Member.create!(name: 'Beth', company: 'Le Wagon', title: 'Performance', email: 'beth@lewagon.com', capacity: 8, line_manager: 'Wade')
puts "created seeds"

# create project_member seeds
puts "Seeding ProjectMember"
ProjectMember.destroy_all!
ProjectMember.create!(project_id: 5, member_id: 1, capacity_member: 40)
ProjectMember.create!(project_id: 4, member_id: 2, capacity_member: 30)
ProjectMember.create!(project_id: 1, member_id: 3, capacity_member: 20)
ProjectMember.create!(project_id: 1, member_id: 4, capacity_member: 50)
# ProjectMember.create!(project_id: 3, member_id: 5, capacity_member: 50)
# ProjectMember.create!(project_id: 3, member_id: 6, capacity_member: 50)
ProjectMember.create!(project_id: 2, member_id: 7, capacity_member: 50)
ProjectMember.create!(project_id: 2, member_id: 8, capacity_member: 50)

puts "Created seeds"
