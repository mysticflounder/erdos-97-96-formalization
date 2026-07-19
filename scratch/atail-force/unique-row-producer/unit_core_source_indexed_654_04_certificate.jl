#!/usr/bin/env julia

# Exact QQ change-matrix certificate for the last previously known unit core
# on the first source-indexed (6,5,4) card-five support.  The earlier interior
# search catalogued this row pattern as unit-core-654-14.

using TSSOS
using SHA

const G = TSSOS.Groebner
const AA = TSSOS.AbstractAlgebra

const ROWS = (
    (1, (0, 2, 7, 8, 9)),
    (2, (0, 1, 10, 11)),
    (8, (3, 6, 7, 9)),
    (9, (0, 2, 3, 5)),
    (10, (0, 1, 3, 4)),
    (11, (1, 5, 8, 10)),
)
const EXPECTED_RAW_IDENTITY_SHA256 =
    "f277bae93f98134713731b91a792f78d334167481a99e788f0a57cf13828afaf"

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
@assert length(generators) == 19

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
    joinpath(@__DIR__, "unit_core_source_indexed_654_04_certificate.json") : ARGS[1]
open(output, "w") do io
    println(io, "{")
    println(io, "  \"schema\": \"p97-atail-qq-change-matrix-certificate-v1\",")
    println(io, "  \"target\": \"normalized_unit_core_source_indexed_654_04\",")
    println(io, "  \"coordinate_model\": \"p0_zero_p1_e1\",")
    println(io, "  \"prior_interior_core_id\": \"unit-core-654-14\",")
    println(io, "  \"prior_interior_row_signature_sha256\": ",
        json_quote("931934c22cd8d9981306090a0b4170345224368dbfcbb2d1dcf5e4626e4a9849"), ",")
    println(io, "  \"prior_interior_full_equality_sha256\": ",
        json_quote("d0c3e1e3a0eae06200d695420266d5bdc4f9b18338c3a5adc3eaf13918cbdd74"), ",")
    println(io, "  \"core_equality_sha256\": ",
        json_quote("8e65e620a67f71e09f738e2ef0a4bbbc74098357f3708b14fa72ba495a5fccc9"), ",")
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
