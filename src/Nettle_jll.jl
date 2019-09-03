module Nettle_jll
using Pkg, Pkg.BinaryPlatforms, Pkg.Artifacts, Libdl
import Base: UUID

# Load Artifacts.toml file
artifacts_toml = joinpath(@__DIR__, "..", "Artifacts.toml")

# Extract all platforms
artifacts = Pkg.Artifacts.load_artifacts_toml(artifacts_toml; pkg_uuid=UUID("4c82536e-c426-54e4-b420-14f461c4ed8b"))
platforms = [Pkg.Artifacts.unpack_platform(e, "Nettle", artifacts_toml) for e in artifacts["Nettle"]]

# Filter platforms based on what wrappers we've generated on-disk
platforms = filter(p -> isfile(joinpath(@__DIR__, "wrappers", triplet(p) * ".jl")), platforms)

# From the available options, choose the best platform
best_platform = select_platform(Dict(p => triplet(p) for p in platforms))

# Silently fail if there's no binaries for this platform
if best_platform === nothing
    @debug("Unable to load Nettle; unsupported platform $(triplet(platform_key_abi()))")
else
    # Load the appropriate wrapper
    include(joinpath(@__DIR__, "wrappers", "$(best_platform).jl"))
end

end  # module Nettle_jll
