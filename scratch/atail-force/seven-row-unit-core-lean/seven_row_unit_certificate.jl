#!/usr/bin/env julia

# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

# Exact QQ change-matrix certificate for the first clean seven-row UNIT
# frontier in the synchronized `(5,5,5)` continuation shadow.

using TSSOS
using SHA

const G = TSSOS.Groebner
const AA = TSSOS.AbstractAlgebra

const ROWS = (
    (1, (0, 2, 6, 7)),
    (2, (0, 1, 9, 10)),
    (7, (2, 5, 9, 11)),
    (8, (0, 3, 5, 7)),
    (9, (3, 6, 8, 11)),
    (10, (1, 7, 8, 9)),
    (11, (1, 5, 6, 10)),
)
const USED_FREE_LABELS = (2, 3, 5, 6, 7, 8, 9, 10, 11)
const VARIABLE_NAMES = [
    "x$(label)$(coordinate)"
    for label in USED_FREE_LABELS for coordinate in ("x", "y")
]

R, x = AA.polynomial_ring(
    AA.QQ,
    VARIABLE_NAMES,
    internal_ordering=:degrevlex,
)

const VARIABLE_INDEX = Dict(
    (label, coordinate) => 2 * (index - 1) + coordinate
    for (index, label) in enumerate(USED_FREE_LABELS)
    for coordinate in 1:2
)

point(label) = if label == 0
    (0, 0)
elseif label == 1
    (1, 0)
else
    (x[VARIABLE_INDEX[(label, 1)]], x[VARIABLE_INDEX[(label, 2)]])
end

d2(left, right) = begin
    p = point(left)
    q = point(right)
    (p[1] - q[1])^2 + (p[2] - q[2])^2
end

generators = typeof(x[1])[]
generator_names = String[]
for (center, support) in ROWS
    pivot = support[1]
    for member in support[2:end]
        push!(generators, d2(center, pivot) - d2(center, member))
        push!(generator_names, "ROW_$(center)_$(pivot)_$(member)")
    end
end
@assert length(generators) == 21

basis, change = G.groebner_with_change_matrix(
    generators,
    ordering=G.DegRevLex(),
    certify=true,
    linalg=:deterministic,
    tasks=8,
)
@assert change * generators == basis
@assert length(basis) == 1
@assert !iszero(basis[1]) && AA.is_constant(basis[1])

scale = inv(AA.leading_coefficient(basis[1]))
certificate_row = scale * change[1, :]
@assert sum(certificate_row[i] * generators[i]
    for i in eachindex(generators)) == 1

# AbstractAlgebra prints rationals as `a//b`; `/` is accepted by both the
# independent SymPy replay and the generated Lean source.
common_text(p) = replace(string(p), "//" => "/")
generator_texts = common_text.(generators)
multiplier_texts = common_text.(collect(certificate_row))
identity_terms = [
    "($(multiplier_texts[i]))*($(generator_texts[i]))"
    for i in eachindex(generators)
    if !iszero(certificate_row[i])
]
identity_text = join(identity_terms, "+")

json_quote(s) = "\"" * replace(
    string(s),
    "\\" => "\\\\",
    "\"" => "\\\"",
    "\n" => "\\n",
    "\r" => "\\r",
    "\t" => "\\t",
) * "\""

output = isempty(ARGS) ?
    joinpath(@__DIR__, "seven_row_unit_certificate.json") : ARGS[1]
open(output, "w") do io
    println(io, "{")
    println(io, "  \"schema\": \"p97-atail-qq-change-matrix-certificate-v1\",")
    println(io, "  \"target\": \"normalized_seven_row_anchor_collision\",")
    println(io, "  \"coordinate_model\": \"p0_zero_p1_e1\",")
    println(io, "  \"source_full_equality_sha256\": ",
        json_quote("1efeea69810bbff6fa00ab5719b620a4bde75b11dd91dad5c9791cec54737d4e"), ",")
    println(io, "  \"raw_change_identity_sha256\": ",
        json_quote(bytes2hex(sha256(identity_text))), ",")
    println(io, "  \"generator_stream_sha256\": ",
        json_quote(bytes2hex(sha256(join(generator_texts, "\n")))), ",")
    println(io, "  \"variables\": [",
        join(("    " * json_quote(v) for v in VARIABLE_NAMES), ",\n"), "\n  ],")
    println(io, "  \"rows\": [")
    for i in eachindex(ROWS)
        center, support = ROWS[i]
        suffix = i == lastindex(ROWS) ? "" : ","
        println(io, "    {\"center\": ", center, ", \"support\": [",
            join(support, ", "), "]}", suffix)
    end
    println(io, "  ],")
    println(io, "  \"generator_names\": [",
        join(("    " * json_quote(v) for v in generator_names), ",\n"), "\n  ],")
    println(io, "  \"generators\": [",
        join(("    " * json_quote(v) for v in generator_texts), ",\n"), "\n  ],")
    println(io, "  \"multipliers\": [",
        join(("    " * json_quote(v) for v in multiplier_texts), ",\n"), "\n  ],")
    println(io, "  \"identity\": \"1 = sum_i multipliers[i] * generators[i]\",")
    println(io, "  \"basis_count\": 1,")
    println(io, "  \"nonzero_multiplier_count\": ", length(identity_terms))
    println(io, "}")
end

println("classification=EXACT_QQ_CHANGE_MATRIX_UNIT")
println("output=", output)
println("generator_count=", length(generators))
println("nonzero_multiplier_count=", length(identity_terms))
println("raw_change_identity_sha256=", bytes2hex(sha256(identity_text)))
