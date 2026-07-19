#!/usr/bin/env julia

# Exact QQ change-matrix certificate for the five-row core reused by the
# third source-indexed (6,5,4) target-negative survivor.  This is the row
# pattern previously catalogued as unit-core-654-13 by the interior search.

using TSSOS
using SHA

const G = TSSOS.Groebner
const AA = TSSOS.AbstractAlgebra

const ROWS = (
    (1, (0, 2, 7, 8, 9)),
    (2, (0, 1, 10, 11)),
    (8, (2, 6, 9, 11)),
    (10, (1, 3, 5, 8)),
    (11, (1, 4, 9, 10)),
)
const EXPECTED_RAW_IDENTITY_SHA256 =
    "c21f42eb040eecc473d48bd1a3dd08f47c2d0565bf16957cc43bb958c2efa81d"

const VARIABLE_NAMES = [
    "x$(label)$(coordinate)"
    for label in 2:11 for coordinate in ("x", "y")
]
R, x = AA.polynomial_ring(
    AA.QQ,
    VARIABLE_NAMES,
    internal_ordering=:degrevlex,
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
    pivot = support[1]
    for member in support[2:end]
        push!(generators, d2(center, pivot) - d2(center, member))
        push!(generator_names, "ROW_$(center)_$(pivot)_$(member)")
    end
end
@assert length(generators) == 16

basis, change = G.groebner_with_change_matrix(
    generators,
    ordering=G.DegRevLex(),
    certify=true,
    linalg=:deterministic,
    tasks=4,
)
@assert change * generators == basis
@assert length(basis) == 1
@assert !iszero(basis[1]) && AA.is_constant(basis[1])

scale = inv(AA.leading_coefficient(basis[1]))
certificate_row = scale * change[1, :]
@assert sum(certificate_row[i] * generators[i]
    for i in eachindex(generators)) == 1

raw_identity_terms = [
    "($(certificate_row[i]))*($(generators[i]))"
    for i in eachindex(generators)
    if !iszero(certificate_row[i])
]
raw_identity = join(raw_identity_terms, "+")
raw_identity_sha256 = bytes2hex(sha256(raw_identity))
println("computed_raw_change_identity_sha256=", raw_identity_sha256)
if !isempty(EXPECTED_RAW_IDENTITY_SHA256)
    @assert raw_identity_sha256 == EXPECTED_RAW_IDENTITY_SHA256
end

# AbstractAlgebra prints rationals as `a//b`; `/` is the shared syntax used
# by the independent SymPy replay.
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
    joinpath(@__DIR__, "unit_core_source_indexed_654_03_certificate.json") : ARGS[1]
open(output, "w") do io
    println(io, "{")
    println(io, "  \"schema\": \"p97-atail-qq-change-matrix-certificate-v1\",")
    println(io, "  \"target\": \"normalized_unit_core_source_indexed_654_03\",")
    println(io, "  \"coordinate_model\": \"p0_zero_p1_e1\",")
    println(io, "  \"source_row_signature_sha256\": ",
        json_quote("ad632272bddedf60157332efe3cae8b6d3613d7fc1ed630d52e3bd1e17459fbb"), ",")
    println(io, "  \"source_full_equality_sha256\": ",
        json_quote("6d78b24936645ccfbaa706b6f94520bec4b5f1148c20ebabf4b1384a971f1030"), ",")
    println(io, "  \"core_equality_sha256\": ",
        json_quote("97fadfad2f964c6e6f9c7f1d646fef4a72c584678328efd057a54bbd17e8e50d"), ",")
    println(io, "  \"raw_change_identity_sha256\": ",
        json_quote(EXPECTED_RAW_IDENTITY_SHA256), ",")
    println(io, "  \"normalized_change_identity_sha256\": ",
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
println("raw_change_identity_sha256=", raw_identity_sha256)
println("normalized_change_identity_sha256=", bytes2hex(sha256(identity_text)))
