class XmlParamsParser
  def initialize(app)
    @app = app
  end

  def call(env)
    if env["CONTENT_TYPE"]&.include?("application/xml")
      body = env["rack.input"].read
      unless body.empty?
        begin
          request = Rack::Request.new(env)
          body_hash = Hash.from_xml(body).with_indifferent_access
          body_hash.each { |key, value| request.update_param key, value }
          env["rack.request.form_hash"] = body_hash
        rescue REXML::ParseException => e
          return [ 400, { "Content-Type" => "text/plain" }, [ "Bad Request: Malformed XML\n" ] ]
        ensure
          env["rack.input"].rewind
        end
      end
    end

    @app.call(env)
  end
end
