# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Todo.create!(title: 'grocery shopping', notes: 'pickles, eggs, red onion')
Todo.create!(title: 'wash the car')
Todo.create!(title: 'register kids for school', notes: 'Register Kira for Ruby Junior High and Caleb for Rails High School')
Todo.create!(title: 'check engine light', notes: 'The check engine light is on in the Tacoma')
Todo.create!(title: 'dog groomers', notes: 'Take Pinky and Redford to the groomers on Wednesday the 23rd')

#100.times { Todo.create!(title: Faker::Friends.location, notes: Faker::Friends.quote)}
100.times {
	todo = Todo.create!(title: Faker::Book.title, notes: "Author: #{Faker::Book.author}")
	Comment.create!(description: Faker::Book.publisher, todo_id: todo)
}