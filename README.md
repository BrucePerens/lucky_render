# lucky_render
Render a page to a `String` or `Lucky::TextResponse`, for the Lucky web framework.

I packaged these two small functions just so that other people would know how to do
this with Lucky.

## render_to_string: Render a Lucky page to a String.

Arguments:

*page* The page to render.

*context* This is a HTTP::Server::Context, you pass it down from the `#context` method
of your action. It mainly supports Cross-Site Request-Forgery protection.

Any parameters to the page are provided after those first two arguments.
This function doesn't automatically provide Lucky's *exposures* (arguments that are
automatically supplied to every page render), you must provide them explicitly.

```crystal
def render_to_string(page, context : HTTP::Server::Context, **named_parameters)
```

## render_to_text_response: Render to a Lucky::TextResponse.

This has the same arguments as `render_to_string`, but returns a `Lucky::TextResponse`.
That is the object that Actions must return, so it can facilitate programatic rendering
in your action, for example rendering a different page depending on the arguments to
the action.
