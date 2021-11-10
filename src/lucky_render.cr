# Render a Lucky page to a string.
# This does not automatically get the exposures, as a usual Lucky page render
# would. You have to provide them explicitly.
#
# 
private def fake_context
  request = HTTP::Request.new(method: "http", resource: "/")
  response = HTTP::Server::Response.new(IO::Memory.new(0))
  HTTP::Server::Context.new(request, response)
end

def render_to_string(page, context : HTTP::Server::Context = fake_context, **named_parameters)
  tr = render_to_text_response(**named_parameters, page: page, context: context)
  tr.body.to_s
end

def render_to_text_response(page, context : HTTP::Server::Context = fake_context, **named_parameters)
  p = page.new(**named_parameters, context: context)
  tr = Lucky::TextResponse.new(
    context,
    "text/html",
    p.perform_render,
    debug_message: "Rendered #{page.colorize.bold} to string",
    enable_cookies: true
  )
end
