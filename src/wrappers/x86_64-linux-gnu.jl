# Autogenerated wrapper script for Nettle_jll for x86_64-linux-gnu
export nettle_hash, libnettle, libhogweed

using GMP_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `nettle_hash`
const nettle_hash_splitpath = ["bin", "nettle-hash"]

# This will be filled out by __init__() for all products, as it must be done at runtime
nettle_hash_path = ""

# nettle_hash-specific global declaration
function nettle_hash(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(nettle_hash_path)
    end
end


# Relative path to `libnettle`
const libnettle_splitpath = ["lib", "libnettle.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libnettle_path = ""

# libnettle-specific global declaration
# This will be filled out by __init__()
libnettle_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libnettle = "libnettle.so.6"


# Relative path to `libhogweed`
const libhogweed_splitpath = ["lib", "libhogweed.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libhogweed_path = ""

# libhogweed-specific global declaration
# This will be filled out by __init__()
libhogweed_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libhogweed = "libhogweed.so.4"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"Nettle")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (GMP_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (GMP_jll.LIBPATH_list,))

    global nettle_hash_path = normpath(joinpath(artifact_dir, nettle_hash_splitpath...))

    push!(PATH_list, dirname(nettle_hash_path))
    global libnettle_path = normpath(joinpath(artifact_dir, libnettle_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libnettle_handle = dlopen(libnettle_path)
    push!(LIBPATH_list, dirname(libnettle_path))

    global libhogweed_path = normpath(joinpath(artifact_dir, libhogweed_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libhogweed_handle = dlopen(libhogweed_path)
    push!(LIBPATH_list, dirname(libhogweed_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

