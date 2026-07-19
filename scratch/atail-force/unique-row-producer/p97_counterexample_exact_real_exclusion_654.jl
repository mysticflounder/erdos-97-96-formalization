#!/usr/bin/env julia

# Exact real-exclusion certificate for the fixed (6,5,4) row assignment.
#
# The metric rows are the 37 hash-bound row equalities in
# `p97_counterexample_realizability_654.py`.  Groebner.jl
# computes a characteristic-zero reduced basis together with an exact change
# matrix.  The basis contains `4*y_2^2 + 1`; the corresponding change-matrix
# row is replayed exactly against the input generators.  Since a square is
# nonnegative over R, the fixed row system has no real realization.

using TSSOS
using SHA

const G = TSSOS.Groebner
const AA = TSSOS.AbstractAlgebra

const VARIABLE_NAMES = [
    "x$(label)$(coordinate)"
    for label in 2:11 for coordinate in ("x", "y")
]
R, x = AA.polynomial_ring(
    AA.QQ,
    VARIABLE_NAMES,
    internal_ordering=:degrevlex,
)

const RETAINED_CENTERS = Set(0:11)
const ROWS = (
    (0, (3, 5, 9, 10)),
    (1, (0, 4, 7, 8, 9)),
    (2, (0, 1, 10, 11)),
    (3, (1, 5, 6, 7)),
    (4, (2, 3, 5, 8)),
    (5, (2, 4, 7, 11)),
    (6, (1, 4, 5, 8)),
    (7, (4, 6, 9, 10)),
    (8, (3, 7, 9, 11)),
    (9, (0, 2, 3, 4)),
    (10, (1, 2, 6, 9)),
    (11, (3, 6, 8, 10)),
)

point(label) = if label == 0
    (0, 0)
elseif label == 1
    (1, 0)
else
    offset = 2 * (label - 2)
    (x[offset + 1], x[offset + 2])
end

d2(left, right) = begin
    p = point(left)
    q = point(right)
    (p[1] - q[1])^2 + (p[2] - q[2])^2
end

generators = typeof(x[1])[]
generator_names = String[]
for (center, support) in ROWS
    center in RETAINED_CENTERS || continue
    pivot = support[1]
    for member in support[2:end]
        push!(generators, d2(center, pivot) - d2(center, member))
        push!(generator_names, "ROW_$(center)_$(pivot)_$(member)")
    end
end

@assert length(generators) == 37

basis, change = G.groebner_with_change_matrix(
    generators,
    ordering=G.DegRevLex(),
    certify=true,
    linalg=:deterministic,
    tasks=4,
)

target_candidates = (4 * x[2]^2 + 1, 4 * x[18]^2 + 1)
target_matches = [
    (candidate, index)
    for candidate in target_candidates
    for index in eachindex(basis)
    if basis[index] == candidate || 4 * basis[index] == candidate
]
@assert !isempty(target_matches)
target, target_index = first(target_matches)

replayed_basis = change * generators
@assert replayed_basis == basis
target_scale = replayed_basis[target_index] == target ? 1 : 4
@assert target_scale * replayed_basis[target_index] == target

certificate_row = target_scale * change[target_index, :]
identity_terms = [
    "($(certificate_row[index]))*($(generators[index]))"
    for index in eachindex(generators)
    if !iszero(certificate_row[index])
]
certificate_text = join(identity_terms, "+")

println("classification=EXACT_QQ_CHANGE_MATRIX_NO_REAL_REALIZATION")
println("retained_centers=", join(sort!(collect(RETAINED_CENTERS)), ","))
println("retained_equality_count=", length(generators))
println("groebner_basis_count=", length(basis))
println("target=", target)
println("target_basis_index=", target_index)
println("full_change_matrix_replay=true")
println("target_change_row_replay=true")
println("target_nonzero_multiplier_count=", length(identity_terms))
println("target_certificate_sha256=", bytes2hex(sha256(certificate_text)))
println("generator_names=", join(generator_names, ","))
