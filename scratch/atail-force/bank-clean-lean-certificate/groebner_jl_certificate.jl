#!/usr/bin/env julia

# Exact change-matrix extraction for the independently audited 15-equality core.
# Groebner.jl uses its modular F4 implementation for QQ and returns M with
# M * generators == basis.  The equality is rechecked here before any
# cofactors are emitted; a separate Python verifier checks the final unit
# identity again over SymPy's QQ domain.

using AbstractAlgebra
using Groebner

const OUTPUT = joinpath(@__DIR__, "groebner_jl_15_raw.txt")

R, variables = polynomial_ring(
    QQ,
    ["Ex", "Ey", "Fx", "Fy", "Gx", "Gy", "Kx", "Ky",
     "Xx", "Xy", "Yx", "Yy", "Zx", "Zy"],
    internal_ordering=:degrevlex,
)
Ex, Ey, Fx, Fy, Gx, Gy, Kx, Ky, Xx, Xy, Yx, Yy, Zx, Zy = variables

names = [
    "ROW_A_O_G",
    "ROW_A_O_K",
    "ROW_F_A_Z",
    "ROW_F_A_K",
    "ROW_G_X_E",
    "ROW_G_X_K",
    "ROW_K_O_Y",
    "ROW_K_O_G",
    "ROW_O_A_E",
    "ROW_X_Z_G",
    "ROW_X_Z_F",
    "ROW_Y_O_X",
    "ROW_Y_O_Z",
    "ROW_Z_A_Y",
    "ROW_Z_A_G",
]

generators = [
    -Gx^2 + 2Gx - Gy^2,
    -Kx^2 + 2Kx - Ky^2,
    2Fx*Zx - 2Fx + 2Fy*Zy - Zx^2 - Zy^2 + 1,
    2Fx*Kx - 2Fx + 2Fy*Ky - Kx^2 - Ky^2 + 1,
    -Ex^2 + 2Ex*Gx - Ey^2 + 2Ey*Gy - 2Gx*Xx - 2Gy*Xy + Xx^2 + Xy^2,
    2Gx*Kx - 2Gx*Xx + 2Gy*Ky - 2Gy*Xy - Kx^2 - Ky^2 + Xx^2 + Xy^2,
    2Kx*Yx + 2Ky*Yy - Yx^2 - Yy^2,
    -Gx^2 + 2Gx*Kx - Gy^2 + 2Gy*Ky,
    -Ex^2 - Ey^2 + 1,
    -Gx^2 + 2Gx*Xx - Gy^2 + 2Gy*Xy - 2Xx*Zx - 2Xy*Zy + Zx^2 + Zy^2,
    -Fx^2 + 2Fx*Xx - Fy^2 + 2Fy*Xy - 2Xx*Zx - 2Xy*Zy + Zx^2 + Zy^2,
    -Xx^2 + 2Xx*Yx - Xy^2 + 2Xy*Yy,
    2Yx*Zx + 2Yy*Zy - Zx^2 - Zy^2,
    -Yx^2 + 2Yx*Zx - Yy^2 + 2Yy*Zy - 2Zx + 1,
    -Gx^2 + 2Gx*Zx - Gy^2 + 2Gy*Zy - 2Zx + 1,
]

@assert length(names) == length(generators) == 15

started = time()
basis, change = Groebner.groebner_with_change_matrix(
    generators;
    ordering=Groebner.DegRevLex(),
    certify=true,
    tasks=Threads.nthreads(),
)
elapsed = time() - started

@assert size(change) == (length(basis), length(generators))
@assert change * generators == basis
@assert length(basis) == 1
@assert is_constant(basis[1]) && !iszero(basis[1])

unit = basis[1]
cofactors = [change[1, index] / unit for index in eachindex(generators)]
@assert sum(cofactors[index] * generators[index] for index in eachindex(generators)) == one(R)

open(OUTPUT, "w") do io
    println(io, "SCHEMA\tp97-bank-clean-groebner-jl-change-matrix-v1")
    println(io, "SECONDS\t", elapsed)
    println(io, "BASIS\t", unit)
    for index in eachindex(generators)
        println(io, "ENTRY\t", names[index], "\t", generators[index], "\t", cofactors[index])
    end
end

println("output=", OUTPUT)
println("seconds=", elapsed)
println("bytes=", filesize(OUTPUT))

