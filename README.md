# lucky_render
Render a page to a `String` or `Lucky::TextResponse`, for the Lucky web framework.

I packaged these two small functions just so that other people would know how to do
this with Lucky.

## Usage
Add this to your `shard.yml`
```
  dependencies:
    ...
    lucky_render:
      github: BrucePerens/lucky_render
      version: ~> 0.1.3
```

And add this to files that use the function:
```
require "lucky_render"
```

## API

## render_to_string: Render a Lucky page to a String.

Arguments:

*page* The page to render.

*context* This is an optional HTTP::Server::Context, you pass it down from the
`#context` method of your action. It mainly supports Cross-Site
Request-Forgery protection. If you can't provide this argument, make sure your
pages don't call `csrf_meta_tags` or `csrf_hidden_input`.


Any parameters to the page are provided after those first two arguments.
This function doesn't automatically provide Lucky's *exposures* (arguments that are
automatically supplied to every page render), you must provide them explicitly.

```crystal
def render_to_string(page, context : HTTP::Server::Context, **named_parameters)
```

## render_to_text_response: Render to a Lucky::TextResponse.

This is a lot like the `html` macro you'd usually use in actions, but it doesn't
insist on being invoked inside of an action rather than another object. It has the
same arguments as `render_to_string`, but returns a `Lucky::TextResponse`.
That is the object that Actions must return, so it can facilitate programatic rendering
in your action, for example: having classes with methods to render them, and rendering
a different class depending on the arguments to your action.
