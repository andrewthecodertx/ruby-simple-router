# Ruby MVC Framework

A lightweight MVC web framework built from scratch in Ruby using raw TCP
sockets. No external web framework dependencies - just pure Ruby and the
standard library.

## Features

- Custom HTTP request parser
- Pattern-based routing with URL parameters
- MVC architecture with controllers
- Built on TCP sockets (no Rack, no Rails, no Sinatra)

## Requirements

- Ruby (any recent version)

## Getting Started

### Running the Server

```bash
ruby app.rb
```

The server will start on `localhost:8080`.

### Demo Routes

Once the server is running, visit these URLs in your browser:

#### Home Page

```
http://localhost:8080/
```

Displays a welcome message.

#### Dynamic Route with Parameters

```
http://localhost:8080/hello/YourName
```

Replace `YourName` with any name to see a personalized greeting. For example:

- `http://localhost:8080/hello/Alice` → "Hello, Alice!"
- `http://localhost:8080/hello/World` → "Hello, World!"

## Project Structure

```
.
├── app.rb                      # TCP server, request parser, and response handler
├── router.rb                   # Routing system with pattern matching
├── routes.rb                   # Route definitions
├── request.rb                  # Request object
└── controllers/
    └── home_controller.rb      # Example controller
```

## How It Works

1. **TCP Server** - Listens on port 8080 for incoming connections
2. **Request Parser** - Parses raw HTTP requests into structured data
3. **Router** - Matches request paths against registered routes
4. **Controllers** - Handle business logic and return HTML responses
5. **Response** - Constructs and sends HTTP responses back to clients

## Adding New Routes

Edit `routes.rb` to add new routes:

```ruby
# GET route
Router.get('/path', [ControllerClass, :method_name])

# POST route
Router.post('/path', [ControllerClass, :method_name])

# Route with parameters
Router.get('/users/{id}', [UserController, :show])
```

## Creating Controllers

Create a new controller in the `controllers/` directory:

```ruby
class UserController
  def show(request, params)
    user_id = params['id']
    "<h1>User ID: #{user_id}</h1>"
  end
end
```

Remember to require your controller in `routes.rb`.
