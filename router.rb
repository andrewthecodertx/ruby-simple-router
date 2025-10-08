class Router
  @@routes = {}

  def self.get(path, callback)
    path = path.gsub(/\{([A-Za-z_]+)\}/, '(?<\1>[^/]+)')
    @@routes['GET'] ||= {}
    @@routes['GET'][path] = callback
  end

  def self.post(path, callback)
    @@routes['POST'] ||= {}
    @@routes['POST'][path] = callback
  end

  def self.dispatch(request)
    method = request.method
    path = request.path

    if @@routes[method]
      @@routes[method].each do |route, callback|
        pattern = /^#{route}$/
        matches = path.match(pattern)

        if matches
          params = Hash[matches.names.zip(matches.captures)]

          if callback.is_a?(Array)
            controller_class = callback[0]
            controller_method = callback[1]
            controller = controller_class.new

            if controller.respond_to?(controller_method)
              return controller.send(controller_method, request, params)
            else
              raise "Method #{controller_method} not found in #{controller_class}"
            end
          else
            return callback.call(request, params)
          end
        end
      end
    end

    "404 Not Found"
  end
end
