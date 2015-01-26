require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("pg")
require("sinatra/activerecord")
require("./lib/task")


get('/') do
  @tasks = Task.all()
  erb(:index)
end

post('/tasks') do
  description = params.fetch('description')
  @task = Task.new({:description => description})
  @task.save()
  erb(:success)
end