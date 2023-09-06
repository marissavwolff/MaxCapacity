# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
tool = ["Jira", "Asana", "Google Meets", "Slack"]
User.create!(name: "Bob", telephone_number: "+33456 781345", email: "glbbb@gl.co.uk", password: "gb@gb.co.uk", title: "product manager", company: "Google")


puts "Seeding Projects"
Project.create!(user_id: 1, project_manager: "Project Manager", name: "Project One", deadline: "2024/4/15", description: "This project is about....", priority: "high", capacity: 0, tool_system: tool.sample)
Project.create!(user_id: 1, project_manager: "Project Manager", name: "Project Two", deadline: "2024/2/15", description: "This project is about....", priority: "low", capacity: 0, tool_system: tool.sample)
Project.create!(user_id: 1, project_manager: "Project Manager", name: "Project Three", deadline: "2024/8/15", description: "This project is about....", priority: "high", capacity: 0, tool_system: tool.sample)
Project.create!(user_id: 1, project_manager: "Project Manager", name: "Project Four", deadline: "2024/9/1", description: "This project is about....", priority: "low", capacity: 0, tool_system: tool.sample)
Project.create!(user_id: 1, project_manager: "Project Manager", name: "Project Five", deadline: "2024/2/15", description: "This project is about....", priority: "high", capacity: 0, tool_system: tool.sample)
Project.create!(user_id: 1, project_manager: "Project Manager", name: "Project Six", deadline: "2023/12/15", description: "This project is about....", priority: "high", capacity: 0, tool_system: tool.sample)
Project.create!(user_id: 1, project_manager: "Project Manager", name: "Project Seven", deadline: "2023/11/15", description: "This project is about....", priority: "medium", capacity: 0, tool_system: tool.sample)
Project.create!(user_id: 1, project_manager: "Project Manager", name: "Project Eight", deadline: "2023/9/30", description: "This project is about....", priority: "high", capacity: 0, tool_system: tool.sample)
Project.create!(user_id: 1, project_manager: "Project Manager", name: "Project Nine", deadline: "2023/10/15", description: "This project is about....", priority: "medium", capacity: 0, tool_system: tool.sample)
Project.create!(user_id: 1, project_manager: "Project Manager", name: "Project Ten", deadline: "2023/9/15", description: "This project is about....", priority: "high", capacity: 0, tool_system: tool.sample)
puts "Created seeds"


puts "Seeding Member"
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
ProjectMember.create!(project_id: 5, member_id: 1, capacity_member: 40)
ProjectMember.create!(project_id: 4, member_id: 23, capacity_member: 30)
ProjectMember.create!(project_id: 1, member_id: 13, capacity_member: 20)
ProjectMember.create!(project_id: 1, member_id: 2, capacity_member: 50)
ProjectMember.create!(project_id: 3, member_id: 14, capacity_member: 50)
ProjectMember.create!(project_id: 3, member_id: 15, capacity_member: 50)
ProjectMember.create!(project_id: 2, member_id: 16, capacity_member: 50)
ProjectMember.create!(project_id: 2, member_id: 17, capacity_member: 50)

puts "Created seeds"
