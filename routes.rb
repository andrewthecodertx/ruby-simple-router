require_relative 'router'
require_relative 'controllers/home_controller'

Router.get('/', [HomeController, :index])
Router.get('/hello/{name}', [HomeController, :say_hello])
