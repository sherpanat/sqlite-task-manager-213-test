require "sqlite3"
DB = SQLite3::Database.new("tasks.db")
DB.results_as_hash = true
require_relative "task"

# TODO: CRUD some tasks
# READ - find
# puts "READ"
# task = Task.find(1)
# puts "[#{task.done ? 'X' : ' '}] #{task.title}: #{task.description}"
# task = Task.find(2)
# puts "[#{task.done ? 'X' : ' '}] #{task.title}: #{task.description}"
# task = Task.find(3)
# puts "[#{task.done ? 'X' : ' '}] #{task.title}: #{task.description}"
# task = Task.find(15)
# puts "[#{task.done ? 'X' : ' '}] #{task.title}: #{task.description}"
# task = Task.find(16)
# puts "[#{task.done ? 'X' : ' '}] #{task.title}: #{task.description}"
# puts "-" * 20

# CREATE - save
# puts "CREATE"
# task = Task.new(title: 'Brûler un gilet jaune', description: "Brûler son gilet avec de l'essence bien chère")
# task.save
# puts task.id
# puts "-" * 20

# UPDATE - save
# puts "UPDATE"
# task = Task.find(3)
# task.title = 'Sauver un arbre'
# task.description = 'Empêcher un bûcheron de couper un arbre'
# task.save
# task = Task.find(3)
# puts task.title
# task = Task.find(1)
# task.done = true
# task.save
# task = Task.find(1)
# puts task.done
# puts "-" * 20

# READ - all
tasks = Task.all
# p tasks
tasks.each do |task|
  puts "[#{task.done ? "x" : " "}] #{task.title}: #{task.description}"
end

# DELETE - destroy
# puts "DELETE"
# task = Task.find(1)
# task.destroy
# puts Task.find(1)
# puts "-" * 20