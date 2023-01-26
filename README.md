# HTMX

## Usage

- Here is (a slight variation of) the HTMX quickstart at [https://htmx.org](https://htmx.org):

```html
<div>
  <script src="https://unpkg.com/htmx.org@1.8.5"></script>

  <button hx-post="/clicked" hx-swap="outerHTML">
    Click Me
  </button>
</div>
```

- In Julia, you would write:

```julia
using Cobweb: Page, h
using HTMX

node = HTMX.hx(h.button("Click Me"), post="/clicked", swap="outerHTML")

h.div(HTMX.CDN(), node)
```
