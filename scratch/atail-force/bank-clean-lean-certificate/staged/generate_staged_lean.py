#!/usr/bin/env python3
"""Emit a staged Lean replay of the exact fifteen-relation QQ certificate.

The source certificate is the independently replayed Groebner.jl unit
certificate.  This generator expands its fifteen multiplier-generator products
with exact ``Fraction`` arithmetic, replays the pinned cancellation-greedy
merge tree, and emits one Lean theorem per internal tree node.  A multiplier is
introduced exactly once, at the first internal node above its leaf; all later
steps combine two previously checked polynomial equations.

The generated source is intentionally scratch-only.  Fix generation bugs here,
never by hand-editing the large generated Lean payload.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
from fractions import Fraction
from pathlib import Path
from typing import Iterable, Iterator, Mapping, Sequence


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[3]
CERTIFICATE = (
    REPO
    / "scratch/atail-force/bank-clean-lean-certificate/"
    / "unit_certificate_groebner_jl_15.json"
)
MERGE_ANALYSIS = (
    REPO
    / "scratch/atail-force/bank-clean-unit-independent-audit/"
    / "unit_certificate_groebner_jl_15_merge_analysis.json"
)
CORE = (
    REPO
    / "scratch/atail-force/bank-clean-unit-independent-audit/"
    / "confirm_15_from17.json"
)
OUTPUT = HERE / "BankClean15StagedCertificate.lean"
MANIFEST = HERE / "BankClean15StagedCertificate.manifest.json"

EXPECTED_CERTIFICATE_SHA256 = (
    "afb111002531a20ca1301afe6d05d8e0184f08183c4b2a7c0acaa0b69d834935"
)
EXPECTED_MERGE_ANALYSIS_SHA256 = (
    "936540291da3f1c1fc2b4bc0e355af50660a4d7eac4ce0ef9e1e1a5217569a37"
)
EXPECTED_CORE_SHA256 = (
    "24f08887ccdc6c07a19b447352b40dc1ec2bf4facf50752e13708386cfdde165"
)
EXPECTED_SCHEMA = "p97-atail-bank-clean-15-groebner-jl-certificate-v1"
EXPECTED_MERGE_SCHEMA = "p97-bank-clean-15-certificate-merge-analysis-v1"
EXPECTED_TREE_STRATEGY = (
    "greedy_min_subtree_peak_then_support_with_balance_tiebreaks"
)
EXPECTED_PEAK_SUPPORT = 132_499
EXPECTED_TREE_HEIGHT = 8
CHUNK_TERMS = 64

Monomial = bytes
SparsePolynomial = dict[Monomial, Fraction]


def file_sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def bytes_sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def require_hash(path: Path, expected: str, label: str) -> None:
    actual = file_sha256(path)
    if actual != expected:
        raise ValueError(
            f"{label} drift: expected sha256 {expected}, found {actual}"
        )


def signed_terms(text: str) -> Iterator[str]:
    normalized = text.replace("**", "^").replace(" - ", " + -")
    for term in normalized.split(" + "):
        term = term.strip()
        if term:
            yield term


def parse_sparse(
    text: str, variables: Sequence[str], variable_index: Mapping[str, int]
) -> SparsePolynomial:
    polynomial: SparsePolynomial = {}
    zero = Fraction(0)
    for raw_term in signed_terms(text):
        sign = 1
        if raw_term.startswith("-"):
            sign = -1
            raw_term = raw_term[1:]
        elif raw_term.startswith("+"):
            raw_term = raw_term[1:]
        coefficient = Fraction(sign)
        exponents = bytearray(len(variables))
        for factor in raw_term.split("*"):
            if not factor:
                continue
            if factor[0].isdigit():
                coefficient *= Fraction(factor)
                continue
            if "^" in factor:
                name, raw_power = factor.split("^", 1)
                power = int(raw_power)
            else:
                name = factor
                power = 1
            try:
                exponents[variable_index[name]] += power
            except KeyError as exc:
                raise ValueError(f"unknown factor {factor!r}") from exc
        monomial = bytes(exponents)
        updated = polynomial.get(monomial, zero) + coefficient
        if updated:
            polynomial[monomial] = updated
        else:
            polynomial.pop(monomial, None)
    return polynomial


def add_sparse(
    left: SparsePolynomial, right: SparsePolynomial
) -> SparsePolynomial:
    if len(left) < len(right):
        left, right = right, left
    result = left.copy()
    zero = Fraction(0)
    for monomial, coefficient in right.items():
        updated = result.get(monomial, zero) + coefficient
        if updated:
            result[monomial] = updated
        else:
            result.pop(monomial, None)
    return result


def multiply_sparse(
    left: SparsePolynomial, right: SparsePolynomial
) -> SparsePolynomial:
    result: SparsePolynomial = {}
    zero = Fraction(0)
    for left_monomial, left_coefficient in left.items():
        for right_monomial, right_coefficient in right.items():
            monomial = bytes(
                a + b for a, b in zip(left_monomial, right_monomial)
            )
            updated = (
                result.get(monomial, zero)
                + left_coefficient * right_coefficient
            )
            if updated:
                result[monomial] = updated
            else:
                result.pop(monomial, None)
    return result


def polynomial_sha256(polynomial: SparsePolynomial) -> str:
    digest = hashlib.sha256()
    for monomial in sorted(polynomial):
        coefficient = polynomial[monomial]
        digest.update(monomial.hex().encode())
        digest.update(b":")
        digest.update(str(coefficient.numerator).encode())
        digest.update(b"/")
        digest.update(str(coefficient.denominator).encode())
        digest.update(b"\n")
    return digest.hexdigest()


def is_one(polynomial: SparsePolynomial, dimension: int) -> bool:
    return polynomial == {bytes(dimension): Fraction(1)}


def split_name(name: str) -> tuple[str, str, str]:
    parts = name.split("_")
    if len(parts) != 4 or parts[0] != "ROW":
        raise ValueError(f"unexpected generator name: {name}")
    return parts[1], parts[2], parts[3]


def suffix(name: str) -> str:
    return name.removeprefix("ROW_")


def lean_source_polynomial(text: str) -> str:
    return text.replace("**", "^")


def unsigned_term(
    monomial: Monomial,
    coefficient: Fraction,
    variables: Sequence[str],
) -> str:
    if coefficient <= 0:
        raise ValueError("unsigned_term requires a positive coefficient")
    factors = []
    for variable, exponent in zip(variables, monomial):
        if exponent == 1:
            factors.append(variable)
        elif exponent > 1:
            factors.append(f"{variable}^{exponent}")
    monomial_text = "*".join(factors)
    if coefficient.denominator == 1:
        coefficient_text = str(coefficient.numerator)
    else:
        coefficient_text = (
            f"{coefficient.numerator}/{coefficient.denominator}"
        )
    if not monomial_text:
        return coefficient_text
    if coefficient == 1:
        return monomial_text
    return f"{coefficient_text}*{monomial_text}"


def sorted_terms(
    polynomial: SparsePolynomial,
) -> list[tuple[Monomial, Fraction]]:
    return sorted(
        polynomial.items(),
        key=lambda item: (sum(item[0]), tuple(item[0])),
        reverse=True,
    )


def signed_sum(
    terms: Sequence[tuple[Monomial, Fraction]], variables: Sequence[str]
) -> str:
    pieces: list[str] = []
    for position, (monomial, coefficient) in enumerate(terms):
        negative = coefficient < 0
        term = unsigned_term(monomial, abs(coefficient), variables)
        if position == 0:
            pieces.append(("-" if negative else "") + term)
        else:
            pieces.append((" - " if negative else " + ") + term)
    return "".join(pieces)


def lean_sparse(
    polynomial: SparsePolynomial,
    variables: Sequence[str],
    indent: str,
) -> str:
    terms = sorted_terms(polynomial)
    if not terms:
        return "0"
    chunks = [
        terms[start : start + CHUNK_TERMS]
        for start in range(0, len(terms), CHUNK_TERMS)
    ]
    rendered = [f"({signed_sum(chunk, variables)})" for chunk in chunks]
    return (f"\n{indent}+ ").join(rendered)


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
    answer = lean_source_polynomial(text)
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
        "    congrArg (fun r : ℝ => r ^ 2) "
        f"h{relation_suffix}",
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


def theorem_call(
    node_id: int,
    variables: Sequence[str],
    leaves: Sequence[int],
    names: Sequence[str],
) -> str:
    arguments = [*variables, *(f"p{suffix(names[index])}" for index in leaves)]
    return f"weightedRelation{node_id} " + " ".join(arguments)


def emit_internal_theorem(
    merge: Mapping[str, object],
    polynomial: SparsePolynomial,
    variables: Sequence[str],
    names: Sequence[str],
    generators: Sequence[str],
    multipliers: Sequence[SparsePolynomial],
    leaves_by_node: Mapping[int, tuple[int, ...]],
) -> list[str]:
    node_id = int(merge["node_id"])
    left_id = int(merge["left_node_id"])
    right_id = int(merge["right_node_id"])
    leaves = leaves_by_node[node_id]
    lines = [
        f"private theorem weightedRelation{node_id}",
        f"    ({' '.join(variables)} : ℝ)",
    ]
    for index in leaves:
        lines.append(
            f"    (p{suffix(names[index])} : "
            f"{lean_source_polynomial(generators[index])} = 0)"
        )
    lines.extend(
        (
            "    : ((",
            "      " + lean_sparse(polynomial, variables, "      "),
            "    ) : ℝ) = 0 := by",
        )
    )

    tactic_terms: list[str] = []
    for side, child_id in (("left", left_id), ("right", right_id)):
        if child_id < len(names):
            relation_name = f"p{suffix(names[child_id])}"
            multiplier = lean_sparse(
                multipliers[child_id], variables, "          "
            )
            tactic_terms.append(
                "(" + multiplier + f") * {relation_name}"
            )
        else:
            child_leaves = leaves_by_node[child_id]
            local_name = f"h{side}"
            lines.append(
                f"  have {local_name} := "
                f"{theorem_call(child_id, variables, child_leaves, names)}"
            )
            tactic_terms.append(local_name)
    lines.append("  linear_combination")
    for position, term in enumerate(tactic_terms):
        prefix = "    " if position == 0 else "    + "
        lines.append(prefix + term)
    lines.append("")
    return lines


def emit_source(
    certificate: Mapping[str, object],
    analysis: Mapping[str, object],
    products: Sequence[SparsePolynomial],
    nodes: Mapping[int, SparsePolynomial],
    leaves_by_node: Mapping[int, tuple[int, ...]],
) -> str:
    variables = [str(value) for value in certificate["variables"]]
    names = [str(value) for value in certificate["generator_names"]]
    generators = [str(value) for value in certificate["generators"]]
    raw_multipliers = [str(value) for value in certificate["multipliers"]]
    variable_index = {name: index for index, name in enumerate(variables)}
    multipliers = [
        parse_sparse(text, variables, variable_index)
        for text in raw_multipliers
    ]
    merge_plan = analysis["balanced_merge"]
    merges = merge_plan["merges"]
    points = active_points(names)
    lines = [
        "import Erdos9796Proof.P97.Census554.EqualityCore",
        "",
        "/-! Staged kernel replay of the exact fifteen-relation metric certificate. -/",
        "",
        "open scoped EuclideanGeometry",
        "",
        "namespace Problem97.ATailBankClean15Staged",
        "",
        f"-- Certificate SHA256: {EXPECTED_CERTIFICATE_SHA256}",
        f"-- Merge analysis SHA256: {EXPECTED_MERGE_ANALYSIS_SHA256}",
        f"-- Core SHA256: {EXPECTED_CORE_SHA256}",
        f"-- Tree height: {EXPECTED_TREE_HEIGHT}",
        f"-- Peak exact support, including leaves: {EXPECTED_PEAK_SUPPORT}",
        "",
        "set_option maxHeartbeats 80000000",
        "set_option maxRecDepth 100000",
        "",
    ]
    for merge in merges:
        node_id = int(merge["node_id"])
        lines.extend(
            emit_internal_theorem(
                merge,
                nodes[node_id],
                variables,
                names,
                generators,
                multipliers,
                leaves_by_node,
            )
        )

    root_id = int(merges[-1]["node_id"])
    scalar_hypotheses = [
        f"    (p{suffix(name)} : {lean_source_polynomial(generator)} = 0)"
        for name, generator in zip(names, generators)
    ]
    root_call = theorem_call(
        root_id, variables, leaves_by_node[root_id], names
    )
    lines.extend(
        (
            "private theorem normalized_bankClean15_scalar",
            f"    ({' '.join(variables)} : ℝ)",
            *scalar_hypotheses,
            "    : False := by",
            f"  have impossible := {root_call}",
            "  norm_num at impossible",
            "",
            "private theorem bankClean15_dist_sq_coord (x y : ℝ²) :",
            "    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by",
            "  rw [EuclideanSpace.dist_sq_eq]",
            "  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]",
            "",
            "private theorem normalized_bankClean15_incompatible",
            f"    {{{' '.join(points)} : ℝ²}}",
        )
    )
    for name in names:
        lines.append(
            f"    (h{suffix(name)} : "
            f"{distance_hypothesis(name, normalized=True)})"
        )
    lines.append("    : False := by")
    for name, generator in zip(names, generators):
        lines.extend(mapping_steps(name, generator))
    scalar_arguments = " ".join(
        f"({variable} := {variable[:-1]} "
        f"{0 if variable[-1] == 'x' else 1})"
        for variable in variables
    )
    polynomial_arguments = " ".join(f"p{suffix(name)}" for name in names)
    lines.extend(
        (
            "  exact normalized_bankClean15_scalar",
            f"    {scalar_arguments}",
            f"    {polynomial_arguments}",
            "",
            "theorem bank_clean15_anchor_collision",
            f"    {{O A {' '.join(points)} : ℝ²}}",
        )
    )
    for name in names:
        lines.append(
            f"    (h{suffix(name)} : "
            f"{distance_hypothesis(name, normalized=False)})"
        )
    lines.extend(
        (
            "    : O = A := by",
            "  by_contra hOA",
            "  let T : ℝ² → ℝ² := normSim O A",
        )
    )
    for name in points:
        lines.append(f"  let {name.lower()} := T {name}")
    lines.extend(
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
    named_points = " ".join(f"({name} := {name.lower()})" for name in points)
    lines.append(f"  apply normalized_bankClean15_incompatible {named_points}")
    simpa_names = ", ".join(
        (*[name.lower() for name in points], "hT0", "hT1")
    )
    for name in names:
        lines.append(
            f"  · simpa [{simpa_names}] using map_dist_eq h{suffix(name)}"
        )
    lines.extend(
        (
            "",
            "theorem false_of_bank_clean15_rows",
            f"    {{O A {' '.join(points)} : ℝ²}}",
            "    (hOA : O ≠ A)",
        )
    )
    for name in names:
        lines.append(
            f"    (h{suffix(name)} : "
            f"{distance_hypothesis(name, normalized=False)})"
        )
    raw_arguments = " ".join(f"h{suffix(name)}" for name in names)
    lines.extend(
        (
            "    : False := by",
            "  exact hOA (bank_clean15_anchor_collision "
            f"{raw_arguments})",
            "",
            "#print axioms bank_clean15_anchor_collision",
            "#print axioms false_of_bank_clean15_rows",
            "",
            "end Problem97.ATailBankClean15Staged",
            "",
        )
    )
    return "\n".join(lines)


def build() -> tuple[bytes, dict[str, object]]:
    require_hash(CERTIFICATE, EXPECTED_CERTIFICATE_SHA256, "certificate")
    require_hash(MERGE_ANALYSIS, EXPECTED_MERGE_ANALYSIS_SHA256, "merge analysis")
    require_hash(CORE, EXPECTED_CORE_SHA256, "fifteen-core record")
    certificate = json.loads(CERTIFICATE.read_text(encoding="utf-8"))
    analysis = json.loads(MERGE_ANALYSIS.read_text(encoding="utf-8"))
    if certificate["schema"] != EXPECTED_SCHEMA:
        raise ValueError("unexpected certificate schema")
    if analysis["schema"] != EXPECTED_MERGE_SCHEMA:
        raise ValueError("unexpected merge-analysis schema")
    variables = [str(value) for value in certificate["variables"]]
    names = [str(value) for value in certificate["generator_names"]]
    generators = [str(value) for value in certificate["generators"]]
    raw_multipliers = [str(value) for value in certificate["multipliers"]]
    if not (len(names) == len(generators) == len(raw_multipliers) == 15):
        raise ValueError("expected fifteen aligned certificate relations")
    if analysis["variables"] != variables:
        raise ValueError("merge-analysis variable stream drift")
    if analysis["generator_names"] != names:
        raise ValueError("merge-analysis relation stream drift")
    merge_plan = analysis["balanced_merge"]
    if merge_plan["strategy"] != EXPECTED_TREE_STRATEGY:
        raise ValueError("wrong merge strategy")
    if int(merge_plan["height"]) != EXPECTED_TREE_HEIGHT:
        raise ValueError("merge-tree height drift")
    if int(merge_plan["peak_support_including_leaves"]) != EXPECTED_PEAK_SUPPORT:
        raise ValueError("merge-tree peak drift")

    variable_index = {name: index for index, name in enumerate(variables)}
    generator_polynomials = [
        parse_sparse(text, variables, variable_index) for text in generators
    ]
    multiplier_polynomials = [
        parse_sparse(text, variables, variable_index)
        for text in raw_multipliers
    ]
    products = [
        multiply_sparse(multiplier, generator)
        for multiplier, generator in zip(
            multiplier_polynomials, generator_polynomials
        )
    ]
    supports = [len(product) for product in products]
    if supports != analysis["product_support_sizes"]:
        raise ValueError("exact leaf support stream drift")
    if max(supports) != EXPECTED_PEAK_SUPPORT:
        raise ValueError("tree no longer attains the leaf-support lower bound")

    nodes: dict[int, SparsePolynomial] = {
        index: product for index, product in enumerate(products)
    }
    leaves_by_node: dict[int, tuple[int, ...]] = {
        index: (index,) for index in range(len(products))
    }
    node_records: list[dict[str, object]] = []
    for merge in merge_plan["merges"]:
        node_id = int(merge["node_id"])
        left_id = int(merge["left_node_id"])
        right_id = int(merge["right_node_id"])
        if node_id in nodes or left_id not in nodes or right_id not in nodes:
            raise ValueError(f"malformed merge node {node_id}")
        polynomial = add_sparse(nodes[left_id], nodes[right_id])
        leaves = tuple(sorted(leaves_by_node[left_id] + leaves_by_node[right_id]))
        if list(leaves_by_node[left_id]) != merge["left_leaves"]:
            raise ValueError(f"left-leaf drift at node {node_id}")
        if list(leaves_by_node[right_id]) != merge["right_leaves"]:
            raise ValueError(f"right-leaf drift at node {node_id}")
        if len(polynomial) != int(merge["support_size"]):
            raise ValueError(f"support drift at node {node_id}")
        nodes[node_id] = polynomial
        leaves_by_node[node_id] = leaves
        node_records.append(
            {
                "node_id": node_id,
                "left_node_id": left_id,
                "right_node_id": right_id,
                "leaves": list(leaves),
                "support_size": len(polynomial),
                "polynomial_sha256": polynomial_sha256(polynomial),
            }
        )
    root_id = int(merge_plan["merges"][-1]["node_id"])
    if not is_one(nodes[root_id], len(variables)):
        raise ValueError("exact staged replay did not finish at one")
    if leaves_by_node[root_id] != tuple(range(15)):
        raise ValueError("root does not consume all fifteen relations")

    source = emit_source(
        certificate, analysis, products, nodes, leaves_by_node
    ).encode("utf-8")
    manifest: dict[str, object] = {
        "schema": "p97-bank-clean-15-staged-lean-emission-v1",
        "certificate": str(CERTIFICATE.relative_to(REPO)),
        "certificate_sha256": EXPECTED_CERTIFICATE_SHA256,
        "merge_analysis": str(MERGE_ANALYSIS.relative_to(REPO)),
        "merge_analysis_sha256": EXPECTED_MERGE_ANALYSIS_SHA256,
        "core": str(CORE.relative_to(REPO)),
        "core_sha256": EXPECTED_CORE_SHA256,
        "generator": str(Path(__file__).resolve().relative_to(REPO)),
        "variables": variables,
        "generator_names": names,
        "tree_strategy": EXPECTED_TREE_STRATEGY,
        "tree_height": EXPECTED_TREE_HEIGHT,
        "peak_support_including_leaves": EXPECTED_PEAK_SUPPORT,
        "peak_optimality_reason": (
            "the tree peak equals the maximum exact leaf support"
        ),
        "exact_final_identity_replayed": True,
        "root_node_id": root_id,
        "root_polynomial_sha256": polynomial_sha256(nodes[root_id]),
        "nodes": node_records,
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
                "exact_final_identity_replayed": True,
                "manifest": str(args.manifest),
                "output": str(args.output),
                "output_bytes": len(source),
                "output_sha256": bytes_sha256(source),
                "peak_support_including_leaves": EXPECTED_PEAK_SUPPORT,
                "tree_height": EXPECTED_TREE_HEIGHT,
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
