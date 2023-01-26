module HTMX

using Artifacts
using Cobweb

include("version.jl")

htmxjs = joinpath(artifact"HTMX", "htmx.$version.min.js")

#-----------------------------------------------------------------------------# CDN
struct CDN end
Base.show(io::IO, ::MIME"text/html", o::CDN) = print(io, """<script src="https://unpkg.com/htmx.org@1.8.5" integrity="sha384-7aHh9lqPYGYZ7sTHvzP1t3BAfLhYSTy9ArHdP3Xsr9/3TlGurYgcPBoFmXX2TX/w" crossorigin="anonymous"></script>""")


function hx(o::Cobweb.Node; kw...)
    for (k,v) in kw
        setproperty!(o, Symbol("hx-$k"), v)
    end
end

end
