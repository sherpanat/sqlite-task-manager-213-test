require "pry-byebug"
class Task
  attr_reader :id
  attr_accessor :title, :description, :done

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @description = attributes[:description]
    @done = attributes[:done] || false
  end

  def self.find(id)
    attributes = DB.execute("SELECT * FROM tasks WHERE id = ?", id).first
    attributes ? build_record(attributes) : nil
  end

  def self.all
    list_of_attributes = DB.execute("SELECT * FROM tasks")
    list_of_attributes.map do |attributes|
      build_record(attributes)
    end
  end

  def save
    if id
      update
    else
      create
    end
  end

  def destroy
    DB.execute("DELETE FROM tasks WHERE id = ?", id)
  end

  def create
    DB.execute("INSERT INTO tasks(title, description, done) VALUES (?, ?, ?)", title, description, done ? 1 : 0)
    @id = DB.last_insert_row_id
  end

  def update
    DB.execute("UPDATE tasks SET title = ?, description = ?, done = ? WHERE id = ?", title, description, done ? 1 : 0, id)
  end

  def self.build_record(attributes)
    Task.new(
      id: attributes['id'],
      title: attributes['title'],
      description: attributes['description'],
      done: attributes['done'] == 1,
    )
  end
end