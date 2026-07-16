#!/usr/bin/env julia

# Bounded finite-field change-matrix smoke for the independently crosschecked
# bank-clean 15-core.  This deliberately does not attempt a QQ lift.

using AbstractAlgebra
using Groebner

const PRIME = 1_000_000_007
const REDUCED = !("--unreduced" in ARGS)
const HOMOGENIZE = "--homogenize-no" in ARGS ? :no : :auto
const VARIABLE_ORDER = if "--variables-reverse" in ARGS
    :reverse
elseif "--variables-numeric" in ARGS
    :numeric
else
    :current
end
const REVERSE_GENERATORS = "--reverse-generators" in ARGS

const CURRENT_VARIABLE_NAMES = [
    "Ex", "Ey", "Fx", "Fy", "Gx", "Gy", "Kx", "Ky",
    "Xx", "Xy", "Yx", "Yy", "Zx", "Zy",
]
const NUMERIC_VARIABLE_NAMES = [
    "Xx", "Xy", "Yx", "Yy", "Zx", "Zy", "Ex", "Ey",
    "Gx", "Gy", "Kx", "Ky", "Fx", "Fy",
]
const VARIABLE_NAMES = if VARIABLE_ORDER == :reverse
    reverse(CURRENT_VARIABLE_NAMES)
elseif VARIABLE_ORDER == :numeric
    NUMERIC_VARIABLE_NAMES
else
    CURRENT_VARIABLE_NAMES
end

F = GF(PRIME)
R, variables = polynomial_ring(
    F,
    VARIABLE_NAMES,
    internal_ordering=:degrevlex,
)
variable_by_name = Dict(name => variable for (name, variable) in zip(VARIABLE_NAMES, variables))
Ex, Ey = variable_by_name["Ex"], variable_by_name["Ey"]
Fx, Fy = variable_by_name["Fx"], variable_by_name["Fy"]
Gx, Gy = variable_by_name["Gx"], variable_by_name["Gy"]
Kx, Ky = variable_by_name["Kx"], variable_by_name["Ky"]
Xx, Xy = variable_by_name["Xx"], variable_by_name["Xy"]
Yx, Yy = variable_by_name["Yx"], variable_by_name["Yy"]
Zx, Zy = variable_by_name["Zx"], variable_by_name["Zy"]

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
if REVERSE_GENERATORS
    reverse!(names)
    reverse!(generators)
end

GC.gc()
started = time_ns()
basis, change = Groebner.groebner_with_change_matrix(
    generators;
    ordering=Groebner.DegRevLex(),
    certify=true,
    linalg=:deterministic,
    tasks=1,
    reduced=REDUCED,
    homogenize=HOMOGENIZE,
)
elapsed_seconds = (time_ns() - started) / 1.0e9

@assert size(change) == (length(basis), length(generators))
change_identity_ok = change * generators == basis
@assert change_identity_ok
constant_indices = findall(poly -> is_constant(poly) && !iszero(poly), basis)
@assert !isempty(constant_indices)
constant_rows = map(constant_indices) do row_index
    unit = basis[row_index]
    cofactors = [
        change[row_index, index] / unit for index in eachindex(generators)
    ]
    identity_ok = sum(
        cofactors[index] * generators[index] for index in eachindex(generators)
    ) == one(R)
    @assert identity_ok
    term_counts = [length(collect(terms(cofactor))) for cofactor in cofactors]
    degrees = [iszero(cofactor) ? -1 : total_degree(cofactor) for cofactor in cofactors]
    (
        basis_row_index=row_index,
        basis_constant=unit,
        normalized_identity_ok=identity_ok,
        nonzero_cofactor_count=count(!iszero, cofactors),
        total_cofactor_terms=sum(term_counts),
        cofactor_term_counts=term_counts,
        max_cofactor_degree=maximum(degrees),
        cofactor_degrees=degrees,
    )
end
best = argmin(row -> row.total_cofactor_terms, constant_rows)

println("prime=", PRIME)
println("reduced=", REDUCED)
println("homogenize=", HOMOGENIZE)
println("variable_order=", VARIABLE_ORDER)
println("variable_names=", join(VARIABLE_NAMES, ","))
println("reverse_generators=", REVERSE_GENERATORS)
println("seconds=", elapsed_seconds)
println("basis_size=", length(basis))
println("constant_basis_row_count=", length(constant_indices))
println("constant_basis_row_indices=", join(constant_indices, ","))
println("change_times_generators_equals_basis=", change_identity_ok)
println("best_constant_basis_row_index=", best.basis_row_index)
println("best_constant_basis_value=", best.basis_constant)
println(
    "normalized_cofactor_identity_equals_one=",
    best.normalized_identity_ok,
)
println("nonzero_cofactor_count=", best.nonzero_cofactor_count)
println("minimum_total_cofactor_term_count=", best.total_cofactor_terms)
println("max_cofactor_degree=", best.max_cofactor_degree)
println("best_cofactor_term_counts=", join(best.cofactor_term_counts, ","))
println("best_cofactor_degrees=", join(best.cofactor_degrees, ","))
