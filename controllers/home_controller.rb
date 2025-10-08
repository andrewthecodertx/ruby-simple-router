class HomeController
  def index(request, params)
    "<h1>Welcome to the Home Page!</h1>"
  end

  def say_hello(request, params)
    name = params['name']
    "<h1>Hello, #{name}!</h1>"
  end

  def submit_form(request, params)
    # Access form data from the request
    form_data = request.params

    # Process the form data (you can add your logic here)
    "Form submitted with data: #{form_data.inspect}"
  end
end
