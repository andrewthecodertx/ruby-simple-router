class Request
  attr_reader :method, :path, :headers, :params

  def initialize(method:, path:, headers:, params: {})
    @method = method
    @path = path
    @headers = headers
    @params = params
  end
end
