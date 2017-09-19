require './config/application'
app = BlocWorks::Application.new

use Rack::ContentType

app.route do
  map "", "books#welcome"
  # adds methods for CRUD actions
  resources :books
end

run(app)
