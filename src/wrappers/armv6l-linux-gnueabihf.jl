# Autogenerated wrapper script for Nettle_jll for armv6l-linux-gnueabihf
export libhogweed, libnettle, nettle_hash

using GMP_jll
JLLWrappers.@generate_wrapper_header("Nettle")
JLLWrappers.@declare_library_product(libhogweed, "libhogweed.so.6")
JLLWrappers.@declare_library_product(libnettle, "libnettle.so.8")
JLLWrappers.@declare_executable_product(nettle_hash)
function __init__()
    JLLWrappers.@generate_init_header(GMP_jll)
    JLLWrappers.@init_library_product(
        libhogweed,
        "lib/libhogweed.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_library_product(
        libnettle,
        "lib/libnettle.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_executable_product(
        nettle_hash,
        "bin/nettle-hash",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()