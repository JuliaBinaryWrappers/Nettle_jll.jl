# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule Nettle_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("Nettle")
JLLWrappers.@generate_main_file("Nettle", UUID("4c82536e-c426-54e4-b420-14f461c4ed8b"))
end  # module Nettle_jll
