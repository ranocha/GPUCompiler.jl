using Test, Base.CoreLogging
import Base.CoreLogging: Info

import InteractiveUtils
InteractiveUtils.versioninfo(verbose=true)

using GPUCompiler

using LLVM, LLVM.Interop

include("testhelpers.jl")

@testset "GPUCompiler" begin

GPUCompiler.reset_runtime()

GPUCompiler.enable_timings()

include("util.jl")
include("native.jl")
include("ptx.jl")
include("spirv.jl")
include("bpf.jl")
include("gcn.jl")
include("metal.jl")
include("examples.jl")

haskey(ENV, "CI") && GPUCompiler.timings()

end
