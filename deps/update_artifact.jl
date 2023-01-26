using Pkg
Pkg.activate(@__DIR__)

using Downloads, ArtifactUtils

dir = mkpath(joinpath(tempdir(), "temp"))
include(joinpath(@__DIR__, "..", "src", "version.jl"))  # get `cdn_url`

#---------------------------------------------------------------------------# Artifact 1: htmx.js
Downloads.download(cdn_url, joinpath(dir, "htmx.$version.min.js"))

#-----------------------------------------------------------------------------# make artifact
id = artifact_from_directory(dir)
gist = upload_to_gist(id)
add_artifact!(joinpath(@__DIR__, "..", "Artifacts.toml"), "HTMX", gist; force=true)

#-----------------------------------------------------------------------------# instantiate local
using Pkg
Pkg.activate(joinpath(@__DIR__, ".."))
Pkg.instantiate()
