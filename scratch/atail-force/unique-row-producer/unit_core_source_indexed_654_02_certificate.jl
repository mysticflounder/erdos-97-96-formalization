#!/usr/bin/env julia

# Exact QQ change-matrix certificate for the six-row core extracted from the
# second source-indexed (6,5,4) target-negative survivor.

using TSSOS
using SHA

const G = TSSOS.Groebner
const AA = TSSOS.AbstractAlgebra

const ROWS = (
    (1, (0, 2, 7, 8, 9)),
    (2, (0, 1, 10, 11)),
    (8, (0, 2, 3, 4)),
    (9, (0, 5, 6, 8)),
    (10, (3, 6, 9, 11)),
    (11, (1, 4, 8, 10)),
)
const EXPECTED_RAW_IDENTITY_SHA256 =
    "19dc34760df7c641b7ab3577195d594cced9fb2f56f7f118e2a9db79c3ef92b2"

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
@assert raw_identity_sha256 == EXPECTED_RAW_IDENTITY_SHA256

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
    joinpath(@__DIR__, "unit_core_source_indexed_654_02_certificate.json") : ARGS[1]
open(output, "w") do io
    println(io, "{")
    println(io, "  \"schema\": \"p97-atail-qq-change-matrix-certificate-v1\",")
    println(io, "  \"target\": \"normalized_unit_core_source_indexed_654_02\",")
    println(io, "  \"coordinate_model\": \"p0_zero_p1_e1\",")
    println(io, "  \"source_row_signature_sha256\": ",
        json_quote("15fe067b9bb18b35a8e24f1760558a3dd7200d716fe6dcdabbea85092e85f382"), ",")
    println(io, "  \"source_full_equality_sha256\": ",
        json_quote("7ab383e87ec9327c125a574719aceb290f4554471358342b4eec96d4121392d1"), ",")
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
println("raw_change_identity_sha256=", EXPECTED_RAW_IDENTITY_SHA256)
println("normalized_change_identity_sha256=", bytes2hex(sha256(identity_text)))
