#!/usr/bin/env python3
"""Emit a definition-sharded Lean replay of the exact 15-relation certificate.

The large Groebner.jl cofactors are split at signed-monomial boundaries into
small, deterministic private definitions.  The scalar contradiction then uses
only named cofactor applications; its ``linear_combination`` normalizer
explicitly unfolds the cofactor/chunk definitions before invoking ``ring``.

This is scratch-only generated source.  Fix generation defects here rather
than hand-editing the emitted Lean file.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
from fractions import Fraction
from pathlib import Path
from typing import Iterable, Mapping, Sequence


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[3]
CERTIFICATE = (
    REPO
    / "scratch/atail-force/bank-clean-lean-certificate/"
    / "unit_certificate_groebner_jl_15.json"
)
CORE = (
    REPO
    / "scratch/atail-force/bank-clean-unit-independent-audit/"
    / "confirm_15_from17.json"
)
OUTPUT = HERE / "BankClean15DefShardedCertificate.lean"
MANIFEST = HERE / "BankClean15DefShardedCertificate.manifest.json"

EXPECTED_CERTIFICATE_SHA256 = (
    "afb111002531a20ca1301afe6d05d8e0184f08183c4b2a7c0acaa0b69d834935"
)
EXPECTED_CORE_SHA256 = (
    "24f08887ccdc6c07a19b447352b40dc1ec2bf4facf50752e13708386cfdde165"
)
EXPECTED_SOURCE_POLYNOMIAL_SHA256 = (
    "b0efd512be125e72cc1847f56bac68149e0b95c002587efce23375ef72d7dbaf"
)
EXPECTED_SCHEMA = "p97-atail-bank-clean-15-groebner-jl-certificate-v1"
EXPECTED_VARIABLES = [
    "Ex", "Ey", "Fx", "Fy", "Gx", "Gy", "Kx", "Ky",
    "Xx", "Xy", "Yx", "Yy", "Zx", "Zy",
]
EXPECTED_NAMES = [
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

# Chunk bodies target 180 KB.  Every complete chunk declaration is required to
# stay below 200 KB, and every emitted command block below 250 KB.
TARGET_CHUNK_BODY_BYTES = 180_000
MAX_CHUNK_COMMAND_BYTES = 200_000
MAX_COMMAND_BYTES = 250_000

Exponent = tuple[int, ...]
SparsePolynomial = dict[Exponent, Fraction]


def file_sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def bytes_sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def canonical_sha256(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":"))
    return bytes_sha256(payload.encode("utf-8"))


def require_hash(path: Path, expected: str, label: str) -> None:
    actual = file_sha256(path)
    if actual != expected:
        raise ValueError(
            f"{label} drift: expected sha256 {expected}, found {actual}"
        )


def signed_terms(text: str) -> list[str]:
    """Split an expanded polynomial without changing term order or values."""

    normalized = text.replace("**", "^").strip().replace(" - ", " + -")
    terms = [term.strip() for term in normalized.split(" + ") if term.strip()]
    if not terms:
        raise ValueError("empty cofactor polynomial")
    return terms


def balanced_addition_tree(atoms: Sequence[str]) -> str:
    """Render a deterministic logarithmic-depth sum of already-signed atoms."""

    if not atoms:
        return "0"
    if len(atoms) == 1:
        return f"({atoms[0]})"
    midpoint = len(atoms) // 2
    left = balanced_addition_tree(atoms[:midpoint])
    right = balanced_addition_tree(atoms[midpoint:])
    return f"({left} + {right})"


def balanced_addition_depth(atom_count: int) -> int:
    """Maximum number of addition nodes on a root-to-leaf path."""

    if atom_count <= 1:
        return 0
    midpoint = atom_count // 2
    return 1 + max(
        balanced_addition_depth(midpoint),
        balanced_addition_depth(atom_count - midpoint),
    )


def balanced_addition_bytes(terms: Sequence[str]) -> int:
    """Exact byte count of ``balanced_addition_tree`` for ASCII terms."""

    if not terms:
        return 1
    # Each leaf contributes its two parentheses.  Each internal node contributes
    # its two parentheses and the three-byte separator `` + ``.
    return sum(len(term.encode("utf-8")) + 2 for term in terms) + 5 * (
        len(terms) - 1
    )


def maximum_parenthesis_nesting(text: str) -> int:
    """Measure literal parenthesis nesting in an emitted command block."""

    depth = 0
    maximum = 0
    for character in text:
        if character == "(":
            depth += 1
            maximum = max(maximum, depth)
        elif character == ")":
            depth -= 1
            if depth < 0:
                raise ValueError("unbalanced closing parenthesis in emitted source")
    if depth != 0:
        raise ValueError("unbalanced opening parenthesis in emitted source")
    return maximum


def join_signed_terms(terms: Sequence[str]) -> str:
    """Reconstruct the certificate's canonical one-line expanded polynomial."""

    if not terms:
        return "0"
    pieces = [terms[0]]
    for term in terms[1:]:
        if term.startswith("-"):
            pieces.append(" - " + term[1:])
        else:
            pieces.append(" + " + term)
    return "".join(pieces)


def normalized_polynomial_text(text: str) -> str:
    return text.replace("**", "^").strip()


def parse_sparse(
    text: str,
    variables: Sequence[str],
    variable_index: Mapping[str, int],
) -> SparsePolynomial:
    polynomial: SparsePolynomial = {}
    for raw_term in signed_terms(text):
        term = raw_term
        sign = 1
        if term.startswith("-"):
            sign = -1
            term = term[1:]
        elif term.startswith("+"):
            term = term[1:]
        coefficient = Fraction(sign)
        exponents = [0] * len(variables)
        for factor in term.split("*"):
            if re.fullmatch(r"\d+(?:/\d+)?", factor):
                coefficient *= Fraction(factor)
                continue
            match = re.fullmatch(
                r"([A-Z][A-Za-z0-9_]*[xy])(?:\^(\d+))?", factor
            )
            if match is None or match.group(1) not in variable_index:
                raise ValueError(f"cannot parse polynomial factor {factor!r}")
            exponents[variable_index[match.group(1)]] += int(
                match.group(2) or "1"
            )
        key = tuple(exponents)
        updated = polynomial.get(key, Fraction(0)) + coefficient
        if updated:
            polynomial[key] = updated
        else:
            polynomial.pop(key, None)
    return polynomial


def add_product(
    total: SparsePolynomial,
    left: SparsePolynomial,
    right: SparsePolynomial,
) -> None:
    for left_exp, left_coefficient in left.items():
        for right_exp, right_coefficient in right.items():
            exponents = tuple(
                a + b for a, b in zip(left_exp, right_exp, strict=True)
            )
            updated = (
                total.get(exponents, Fraction(0))
                + left_coefficient * right_coefficient
            )
            if updated:
                total[exponents] = updated
            else:
                total.pop(exponents, None)


def split_name(name: str) -> tuple[str, str, str]:
    parts = name.split("_")
    if len(parts) != 4 or parts[0] != "ROW":
        raise ValueError(f"unexpected relation name: {name}")
    return parts[1], parts[2], parts[3]


def suffix(name: str) -> str:
    return name.removeprefix("ROW_")


def private_name_fragment(name: str) -> str:
    return suffix(name)


def chunk_name(name: str, index: int) -> str:
    return f"bankClean15Cofactor_{private_name_fragment(name)}_chunk{index:03d}"


def cofactor_name(name: str) -> str:
    return f"bankClean15Cofactor_{private_name_fragment(name)}"


def point(name: str, *, normalized: bool) -> str:
    if not normalized:
        return name
    if name == "O":
        return "(pt 0 0)"
    if name == "A":
        return "(pt 1 0)"
    return name


def distance_hypothesis(name: str, *, normalized: bool) -> str:
    center, pivot, member = split_name(name)
    return (
        f"dist {point(center, normalized=normalized)} "
        f"{point(pivot, normalized=normalized)} = "
        f"dist {point(center, normalized=normalized)} "
        f"{point(member, normalized=normalized)}"
    )


def symbol_names(texts: Iterable[str]) -> list[str]:
    found = set()
    for text in texts:
        found.update(re.findall(r"\b[A-Z][A-Za-z0-9_]*[xy]\b", text))
    return sorted(found, key=lambda name: (name[:-1], name[-1]))


def coordinate_polynomial(text: str) -> str:
    answer = normalized_polynomial_text(text)
    for variable in symbol_names((text,)):
        point_name = variable[:-1]
        coordinate = 0 if variable[-1] == "x" else 1
        answer = re.sub(
            rf"\b{re.escape(variable)}\b",
            f"({point_name} {coordinate})",
            answer,
        )
    return answer


def active_points(names: Sequence[str]) -> list[str]:
    points = {
        role
        for name in names
        for role in split_name(name)
        if role not in {"O", "A"}
    }
    return sorted(points)


def mapping_steps(name: str, polynomial: str) -> list[str]:
    relation_suffix = suffix(name)
    squared_hypothesis = distance_hypothesis(
        name, normalized=True
    ).replace(" = ", " ^ 2 = ", 1)
    steps = [
        f"  have h{relation_suffix}_sq :=",
        "    congrArg (fun r : ℝ => r ^ 2) " f"h{relation_suffix}",
        f"  change {squared_hypothesis} ^ 2 at h{relation_suffix}_sq",
        "  rw [bankClean15_dist_sq_coord, "
        f"bankClean15_dist_sq_coord] at h{relation_suffix}_sq",
    ]
    if {"O", "A"} & set(split_name(name)):
        steps.append(
            "  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] "
            f"at h{relation_suffix}_sq"
        )
    steps.extend(
        (
            f"  have p{relation_suffix} : "
            f"{coordinate_polynomial(polynomial)} = 0 := by",
            f"    linear_combination h{relation_suffix}_sq",
        )
    )
    return steps


def chunk_terms(terms: Sequence[str]) -> list[list[str]]:
    chunks: list[list[str]] = []
    current: list[str] = []
    current_bytes = 0
    for term in terms:
        # A balanced leaf adds two parentheses.  Every leaf after the first also
        # induces one five-byte internal ``(left + right)`` node.
        addition = len(term.encode("utf-8")) + (2 if not current else 7)
        if current and current_bytes + addition > TARGET_CHUNK_BODY_BYTES:
            chunks.append(current)
            current = []
            current_bytes = 0
            addition = len(term.encode("utf-8")) + 2
        current.append(term)
        current_bytes += addition
    if current:
        chunks.append(current)
    return chunks


def render_chunk_definition(
    name: str,
    terms: Sequence[str],
    variables: Sequence[str],
) -> str:
    return "\n".join(
        (
            f"private def {name}",
            f"    ({' '.join(variables)} : ℝ) : ℝ :=",
            "  " + balanced_addition_tree(terms),
        )
    )


def render_cofactor_definition(
    relation_name: str,
    names: Sequence[str],
    variables: Sequence[str],
) -> str:
    arguments = " ".join(variables)
    applications = [f"{name} {arguments}" for name in names]
    return "\n".join(
        (
            f"private def {cofactor_name(relation_name)}",
            f"    ({arguments} : ℝ) : ℝ :=",
            "  " + balanced_addition_tree(applications),
        )
    )


def render_scalar_theorem(
    names: Sequence[str],
    generators: Sequence[str],
    variables: Sequence[str],
    all_definition_names: Sequence[str],
) -> str:
    lines = [
        "set_option maxHeartbeats 80000000 in",
        "set_option maxRecDepth 100000 in",
        "private theorem normalized_bankClean15_scalar",
        f"    ({' '.join(variables)} : ℝ)",
    ]
    lines.extend(
        f"    (p{suffix(name)} : {normalized_polynomial_text(generator)} = 0)"
        for name, generator in zip(names, generators, strict=True)
    )
    lines.extend(
        (
            "    : False := by",
            "  have impossible : (1 : ℝ) = 0 := by",
            "    linear_combination",
            "      (norm := (simp only [",
        )
    )
    for index, definition_name in enumerate(all_definition_names):
        comma = "," if index + 1 < len(all_definition_names) else ""
        lines.append(f"        {definition_name}{comma}")
    lines.extend(("      ]; ring))",))
    arguments = " ".join(variables)
    for index, name in enumerate(names):
        prefix = "      " if index == 0 else "      + "
        lines.append(
            prefix
            + f"({cofactor_name(name)} {arguments}) * p{suffix(name)}"
        )
    lines.extend(("  norm_num at impossible",))
    return "\n".join(lines)


def render_geometry(
    names: Sequence[str],
    generators: Sequence[str],
    variables: Sequence[str],
) -> list[tuple[str, str]]:
    points = active_points(names)
    blocks: list[tuple[str, str]] = []
    blocks.append(
        (
            "distance-square helper",
            "\n".join(
                (
                    "private theorem bankClean15_dist_sq_coord (x y : ℝ²) :",
                    "    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by",
                    "  rw [EuclideanSpace.dist_sq_eq]",
                    "  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]",
                )
            ),
        )
    )

    normalized_lines = [
        "private theorem normalized_bankClean15_incompatible",
        f"    {{{' '.join(points)} : ℝ²}}",
    ]
    normalized_lines.extend(
        f"    (h{suffix(name)} : {distance_hypothesis(name, normalized=True)})"
        for name in names
    )
    normalized_lines.append("    : False := by")
    for name, generator in zip(names, generators, strict=True):
        normalized_lines.extend(mapping_steps(name, generator))
    scalar_arguments = " ".join(
        f"({variable} := {variable[:-1]} "
        f"{0 if variable[-1] == 'x' else 1})"
        for variable in variables
    )
    polynomial_arguments = " ".join(f"p{suffix(name)}" for name in names)
    normalized_lines.extend(
        (
            "  exact normalized_bankClean15_scalar",
            f"    {scalar_arguments}",
            f"    {polynomial_arguments}",
        )
    )
    blocks.append(
        ("normalized geometric contradiction", "\n".join(normalized_lines))
    )

    anchor_lines = [
        "theorem bank_clean15_anchor_collision",
        f"    {{O A {' '.join(points)} : ℝ²}}",
    ]
    anchor_lines.extend(
        f"    (h{suffix(name)} : {distance_hypothesis(name, normalized=False)})"
        for name in names
    )
    anchor_lines.extend(
        (
            "    : O = A := by",
            "  by_contra hOA",
            "  let T : ℝ² → ℝ² := normSim O A",
        )
    )
    for point_name in points:
        anchor_lines.append(f"  let {point_name.lower()} := T {point_name}")
    anchor_lines.extend(
        (
            "  have hdist (P Q : ℝ²) :",
            "      dist (T P) (T Q) = (dist O A)⁻¹ * dist P Q := by",
            "    simpa [T] using normSim_dist_image O A hOA P Q",
            "  have hT0 : T O = pt 0 0 := by",
            "    simpa [T] using normSim_fst O A",
            "  have hT1 : T A = pt 1 0 := by",
            "    simpa [T] using normSim_snd O A hOA",
            "  have map_dist_eq {P Q R S : ℝ²}",
            "      (h : dist P Q = dist R S) :",
            "      dist (T P) (T Q) = dist (T R) (T S) := by",
            "    rw [hdist, hdist, h]",
        )
    )
    named_points = " ".join(
        f"({point_name} := {point_name.lower()})" for point_name in points
    )
    anchor_lines.append(
        f"  apply normalized_bankClean15_incompatible {named_points}"
    )
    simpa_names = ", ".join(
        (*[point_name.lower() for point_name in points], "hT0", "hT1")
    )
    anchor_lines.extend(
        f"  · simpa [{simpa_names}] using map_dist_eq h{suffix(name)}"
        for name in names
    )
    blocks.append(("anchor collision", "\n".join(anchor_lines)))

    false_lines = [
        "theorem false_of_bank_clean15_rows",
        f"    {{O A {' '.join(points)} : ℝ²}}",
        "    (hOA : O ≠ A)",
    ]
    false_lines.extend(
        f"    (h{suffix(name)} : {distance_hypothesis(name, normalized=False)})"
        for name in names
    )
    raw_arguments = " ".join(f"h{suffix(name)}" for name in names)
    false_lines.extend(
        (
            "    : False := by",
            "  exact hOA (bank_clean15_anchor_collision "
            f"{raw_arguments})",
        )
    )
    blocks.append(("false wrapper", "\n".join(false_lines)))
    blocks.append(
        (
            "axiom audit commands",
            "\n".join(
                (
                    "#print axioms bank_clean15_anchor_collision",
                    "#print axioms false_of_bank_clean15_rows",
                )
            ),
        )
    )
    return blocks


def build() -> tuple[bytes, dict[str, object]]:
    require_hash(CERTIFICATE, EXPECTED_CERTIFICATE_SHA256, "certificate")
    require_hash(CORE, EXPECTED_CORE_SHA256, "fifteen-core record")
    certificate = json.loads(CERTIFICATE.read_text(encoding="utf-8"))
    core = json.loads(CORE.read_text(encoding="utf-8"))
    if certificate["schema"] != EXPECTED_SCHEMA:
        raise ValueError("unexpected certificate schema")
    if certificate["source_polynomial_sha256"] != EXPECTED_SOURCE_POLYNOMIAL_SHA256:
        raise ValueError("certificate source-polynomial hash drift")
    variables = [str(value) for value in certificate["variables"]]
    names = [str(value) for value in certificate["generator_names"]]
    generators = [str(value) for value in certificate["generators"]]
    multipliers = [str(value) for value in certificate["multipliers"]]
    if variables != EXPECTED_VARIABLES:
        raise ValueError("certificate variable order drift")
    if names != EXPECTED_NAMES:
        raise ValueError("certificate relation order drift")
    if not (len(names) == len(generators) == len(multipliers) == 15):
        raise ValueError("expected fifteen aligned relations")
    core_records = core["generators"]
    if [str(record["name"]) for record in core_records] != names:
        raise ValueError("core/certificate relation order drift")
    if [str(record["polynomial"]) for record in core_records] != generators:
        raise ValueError("core/certificate generator stream drift")
    if canonical_sha256(generators) != EXPECTED_SOURCE_POLYNOMIAL_SHA256:
        raise ValueError("generator polynomial stream drift")

    variable_index = {name: index for index, name in enumerate(variables)}
    generator_polynomials = [
        parse_sparse(text, variables, variable_index) for text in generators
    ]
    multiplier_polynomials: list[SparsePolynomial] = []
    cofactor_chunks: list[list[list[str]]] = []
    cofactor_records: list[dict[str, object]] = []
    all_definition_names: list[str] = []

    for relation_name, raw_multiplier in zip(names, multipliers, strict=True):
        terms = signed_terms(raw_multiplier)
        reconstructed = join_signed_terms(terms)
        expected = normalized_polynomial_text(raw_multiplier)
        if reconstructed != expected:
            raise ValueError(f"signed-term reconstruction drift at {relation_name}")
        chunks = chunk_terms(terms)
        flattened = [term for chunk in chunks for term in chunk]
        if flattened != terms or join_signed_terms(flattened) != expected:
            raise ValueError(f"chunk reconstruction drift at {relation_name}")
        parsed = parse_sparse(reconstructed, variables, variable_index)
        multiplier_polynomials.append(parsed)
        cofactor_chunks.append(chunks)
        cofactor_records.append(
            {
                "relation": relation_name,
                "cofactor": cofactor_name(relation_name),
                "term_count": len(terms),
                "chunk_count": len(chunks),
                "chunk_aggregate_addition_depth": balanced_addition_depth(
                    len(chunks)
                ),
                "normalized_source_sha256": bytes_sha256(expected.encode("utf-8")),
                "reconstructed_source_sha256": bytes_sha256(
                    reconstructed.encode("utf-8")
                ),
            }
        )

    if sum(len(poly) for poly in multiplier_polynomials) != int(
        certificate["multiplier_term_count"]
    ):
        raise ValueError("parsed multiplier term count drift")
    max_degree = max(
        max(sum(exponents) for exponents in polynomial)
        for polynomial in multiplier_polynomials
    )
    if max_degree != int(certificate["max_multiplier_degree"]):
        raise ValueError("parsed multiplier degree drift")
    identity_text = "+".join(
        f"({multiplier})*({generator})"
        for multiplier, generator in zip(multipliers, generators, strict=True)
        if multiplier != "0"
    )
    if bytes_sha256(identity_text.encode("utf-8")) != certificate["raw_identity_sha256"]:
        raise ValueError("certificate identity-text hash drift")
    total: SparsePolynomial = {}
    for multiplier, generator in zip(
        multiplier_polynomials, generator_polynomials, strict=True
    ):
        add_product(total, multiplier, generator)
    expected_identity = {(0,) * len(variables): Fraction(1)}
    if total != expected_identity:
        raise ValueError(
            f"exact QQ unit-certificate replay failed with {len(total)} residual terms"
        )

    commands: list[tuple[str, str]] = [
        (
            "header",
            "\n".join(
                (
                    "import Erdos9796Proof.P97.Census554.EqualityCore",
                    "",
                    "/-! Definition-sharded kernel replay of the exact fifteen-relation metric certificate. -/",
                    "",
                    "open scoped EuclideanGeometry",
                    "",
                    "namespace Problem97.ATailBankClean15DefSharded",
                    "",
                    f"-- Certificate SHA256: {EXPECTED_CERTIFICATE_SHA256}",
                    f"-- Core SHA256: {EXPECTED_CORE_SHA256}",
                    f"-- Exact multiplier terms: {certificate['multiplier_term_count']}",
                    f"-- Chunk body target bytes: {TARGET_CHUNK_BODY_BYTES}",
                    "",
                    "set_option maxHeartbeats 80000000",
                    "set_option maxRecDepth 100000",
                    "set_option linter.unusedVariables false",
                    "noncomputable section",
                )
            ),
        )
    ]

    chunk_manifest_records: list[dict[str, object]] = []
    for group_index, (relation_name, chunks) in enumerate(
        zip(names, cofactor_chunks, strict=True), start=1
    ):
        local_chunk_names: list[str] = []
        for chunk_index, terms in enumerate(chunks):
            definition_name = chunk_name(relation_name, chunk_index)
            local_chunk_names.append(definition_name)
            all_definition_names.append(definition_name)
            rendered_body = balanced_addition_tree(terms)
            if len(rendered_body.encode("utf-8")) != balanced_addition_bytes(terms):
                raise ValueError(
                    f"balanced-expression byte accounting drift at {definition_name}"
                )
            command = render_chunk_definition(definition_name, terms, variables)
            command_bytes = len(command.encode("utf-8"))
            if command_bytes > MAX_CHUNK_COMMAND_BYTES:
                raise ValueError(
                    f"chunk declaration exceeds {MAX_CHUNK_COMMAND_BYTES} bytes: "
                    f"{definition_name} has {command_bytes}"
                )
            commands.append((f"chunk {definition_name}", command))
            chunk_manifest_records.append(
                {
                    "relation": relation_name,
                    "chunk_index": chunk_index,
                    "definition": definition_name,
                    "term_count": len(terms),
                    "body_bytes": len(rendered_body.encode("utf-8")),
                    "command_bytes": command_bytes,
                    "addition_tree_depth": balanced_addition_depth(len(terms)),
                    "normalized_source_sha256": bytes_sha256(
                        join_signed_terms(terms).encode("utf-8")
                    ),
                }
            )
        cofactor_definition_name = cofactor_name(relation_name)
        all_definition_names.append(cofactor_definition_name)
        commands.append(
            (
                f"cofactor {relation_name}",
                render_cofactor_definition(
                    relation_name, local_chunk_names, variables
                ),
            )
        )
        # `#check` is an intentional compile-time progress marker after each
        # independently elaborated cofactor group.
        commands.append(
            (
                f"progress marker {relation_name}",
                "\n".join(
                    (
                        f"-- Progress marker {group_index}/15: {relation_name}",
                        f"#check {cofactor_definition_name}",
                    )
                ),
            )
        )

    commands.append(
        (
            "scalar contradiction",
            render_scalar_theorem(
                names,
                generators,
                variables,
                all_definition_names,
            ),
        )
    )
    commands.extend(render_geometry(names, generators, variables))
    commands.append(
        (
            "namespace end",
            "end Problem97.ATailBankClean15DefSharded",
        )
    )

    command_sizes = [
        (label, len(command.encode("utf-8"))) for label, command in commands
    ]
    max_command_label, max_command_bytes = max(
        command_sizes, key=lambda item: item[1]
    )
    parenthesis_depths = [
        (label, maximum_parenthesis_nesting(command))
        for label, command in commands
    ]
    max_parenthesis_label, max_parenthesis_depth = max(
        parenthesis_depths, key=lambda item: item[1]
    )
    if max_command_bytes >= MAX_COMMAND_BYTES:
        raise ValueError(
            f"emitted command block {max_command_label!r} has "
            f"{max_command_bytes} bytes, limit is < {MAX_COMMAND_BYTES}"
        )
    source = ("\n\n".join(command for _label, command in commands) + "\n").encode(
        "utf-8"
    )
    manifest: dict[str, object] = {
        "schema": "p97-bank-clean-15-def-sharded-lean-emission-v1",
        "certificate": str(CERTIFICATE.relative_to(REPO)),
        "certificate_sha256": EXPECTED_CERTIFICATE_SHA256,
        "core": str(CORE.relative_to(REPO)),
        "core_sha256": EXPECTED_CORE_SHA256,
        "source_polynomial_sha256": EXPECTED_SOURCE_POLYNOMIAL_SHA256,
        "generator": str(Path(__file__).resolve().relative_to(REPO)),
        "variables": variables,
        "generator_names": names,
        "exact_qq_identity_replayed": True,
        "exact_identity_polynomial_terms": len(total),
        "exact_identity_nonconstant_residual_terms": sum(
            1 for exponents in total if any(exponents)
        ),
        "identity_text_sha256": certificate["raw_identity_sha256"],
        "multiplier_term_count": certificate["multiplier_term_count"],
        "max_multiplier_degree": certificate["max_multiplier_degree"],
        "chunk_body_target_bytes": TARGET_CHUNK_BODY_BYTES,
        "max_chunk_command_bytes_limit": MAX_CHUNK_COMMAND_BYTES,
        "max_command_bytes_exclusive_limit": MAX_COMMAND_BYTES,
        "chunk_count": len(chunk_manifest_records),
        "maximum_chunk_command_bytes": max(
            record["command_bytes"] for record in chunk_manifest_records
        ),
        "maximum_chunk_addition_tree_depth": max(
            record["addition_tree_depth"] for record in chunk_manifest_records
        ),
        "maximum_cofactor_addition_tree_depth": max(
            record["chunk_aggregate_addition_depth"]
            for record in cofactor_records
        ),
        "maximum_generated_addition_tree_depth": max(
            max(
                record["addition_tree_depth"]
                for record in chunk_manifest_records
            ),
            max(
                record["chunk_aggregate_addition_depth"]
                for record in cofactor_records
            ),
        ),
        "maximum_emitted_command_bytes": max_command_bytes,
        "maximum_emitted_command_label": max_command_label,
        "maximum_emitted_parenthesis_nesting": max_parenthesis_depth,
        "maximum_emitted_parenthesis_nesting_label": max_parenthesis_label,
        "cofactors": cofactor_records,
        "chunks": chunk_manifest_records,
        "progress_markers": len(names),
        "scalar_target": "False via a local (1 : Real) = 0 equality",
        "normalizer": "simp only [cofactor/chunk defs]; ring",
        "geometry_theorems": [
            "bank_clean15_anchor_collision",
            "false_of_bank_clean15_rows",
        ],
        "output": str(OUTPUT.relative_to(REPO)),
        "output_bytes": len(source),
        "output_sha256": bytes_sha256(source),
        "lean_validation": "pending",
    }
    return source, manifest


def check_or_write(
    output: Path,
    manifest_path: Path,
    source: bytes,
    manifest: Mapping[str, object],
    *,
    check: bool,
) -> None:
    manifest_bytes = (
        json.dumps(manifest, indent=2, sort_keys=True) + "\n"
    ).encode("utf-8")
    if check:
        if not output.exists() or output.read_bytes() != source:
            raise RuntimeError(f"generated Lean source drift: {output}")
        if not manifest_path.exists() or manifest_path.read_bytes() != manifest_bytes:
            raise RuntimeError(f"generated manifest drift: {manifest_path}")
        return
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_bytes(source)
    manifest_path.write_bytes(manifest_bytes)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=OUTPUT)
    parser.add_argument("--manifest", type=Path, default=MANIFEST)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    source, manifest = build()
    check_or_write(
        args.output,
        args.manifest,
        source,
        manifest,
        check=args.check,
    )
    print(
        json.dumps(
            {
                "check": args.check,
                "exact_qq_identity_replayed": True,
                "manifest": str(args.manifest),
                "output": str(args.output),
                "output_bytes": len(source),
                "output_sha256": bytes_sha256(source),
                "chunk_count": manifest["chunk_count"],
                "maximum_chunk_command_bytes": manifest[
                    "maximum_chunk_command_bytes"
                ],
                "maximum_emitted_command_bytes": manifest[
                    "maximum_emitted_command_bytes"
                ],
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
