#!/usr/bin/env python3
"""Emit a bounded Lean replay of the exact QQ lambda-system Kx certificate.

Every expanded polynomial payload is split into reducible definitions with at
most 192 signed monomial atoms and at most 16 KB of expression text.  A sparse
cancellation-greedy merge tree replays the twelve multiplier-generator
products.  The two root branches are aligned by monomial and checked in local
part pairs, so the terminal proof never unfolds the complete certificate.

This is scratch-only generated source.  Fix this generator, not its output.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import re
import sys
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path
from typing import Mapping, Sequence

import sympy


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[3]
CERTIFICATE = HERE / "lambda_kx_qq_lift_certificate.json"
MICRO_GENERATOR = HERE.parent / "microsharded/generate_microsharded_lean.py"
OUTPUT = HERE / "LambdaKxMicroshardedCertificate.lean"
MANIFEST = HERE / "LambdaKxMicroshardedCertificate.manifest.json"

EXPECTED_CERTIFICATE_SHA256 = (
    "6ac034ee5a2c04e6077fef30aee3652cc4172338e406cccb0e7ddbed6660de2a"
)
EXPECTED_CONTENT_SHA256 = (
    "30a745220716e8ccdfcec2b70d5a83228c70bdab5fd66b085a201a571cd2cec3"
)
EXPECTED_MICRO_GENERATOR_SHA256 = (
    "46e6a3686a68e8fe75497475027309ee60583b82fb0c8e51c08c4eb187d354c5"
)
EXPECTED_SCHEMA = "p97-bank-clean-lambda-kx-qq-lift-v1"
EXPECTED_NAMES = [
    "AOK", "FAK", "FKZ", "GXK", "XZ", "XF",
    "YOX", "YOZ", "ZAG", "LDEF", "REFLECT_X", "REFLECT_Y",
]


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
        raise ValueError(f"{label} drift: expected {expected}, found {actual}")


def load_micro_helpers():
    require_hash(
        MICRO_GENERATOR, EXPECTED_MICRO_GENERATOR_SHA256,
        "microsharded helper generator",
    )
    spec = importlib.util.spec_from_file_location(
        "bank_clean_micro_helpers_for_lambda", MICRO_GENERATOR
    )
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load helpers from {MICRO_GENERATOR}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


MICRO = load_micro_helpers()
STAGED = MICRO.STAGED
Monomial = bytes
SparsePolynomial = dict[Monomial, Fraction]


def parse_flat_polynomial(
    text: str, variables: Sequence[str], variable_index: Mapping[str, int]
) -> SparsePolynomial:
    """Parse Singular's flat no-whitespace cofactor syntax exactly."""

    polynomial: SparsePolynomial = {}
    normalized = text.replace("**", "^").replace("\n", "").strip()
    terms = re.findall(r"[+-]?[^+-]+", normalized)
    if not terms:
        raise ValueError("empty flat polynomial")
    for raw_term in terms:
        sign = -1 if raw_term.startswith("-") else 1
        term = raw_term[1:] if raw_term[:1] in {"+", "-"} else raw_term
        coefficient = Fraction(sign)
        exponents = bytearray(len(variables))
        for factor in term.split("*"):
            if re.fullmatch(r"\d+(?:/\d+)?", factor):
                coefficient *= Fraction(factor)
                continue
            if "^" in factor:
                name, raw_exponent = factor.split("^", 1)
                exponent = int(raw_exponent)
            else:
                name = factor
                exponent = 1
            if name not in variable_index:
                raise ValueError(f"unknown flat-polynomial factor {factor!r}")
            exponents[variable_index[name]] += exponent
        monomial = bytes(exponents)
        updated = polynomial.get(monomial, Fraction(0)) + coefficient
        if updated:
            polynomial[monomial] = updated
        else:
            polynomial.pop(monomial, None)
    return polynomial


def parse_source_polynomial(
    text: str, variables: Sequence[str]
) -> SparsePolynomial:
    symbols = sympy.symbols(" ".join(variables))
    locals_map = dict(zip(variables, symbols, strict=True))
    expression = sympy.sympify(text.replace("^", "**"), locals=locals_map)
    polynomial = sympy.Poly(sympy.expand(expression), *symbols, domain=sympy.QQ)
    answer: SparsePolynomial = {}
    for exponents, coefficient in polynomial.terms():
        answer[bytes(exponents)] = Fraction(
            int(coefficient.p), int(coefficient.q)
        )
    return answer


def sum_support_size(left: SparsePolynomial, right: SparsePolynomial) -> int:
    if len(left) > len(right):
        left, right = right, left
    overlap = 0
    cancellation = 0
    for monomial, coefficient in left.items():
        other = right.get(monomial)
        if other is not None:
            overlap += 1
            if coefficient + other == 0:
                cancellation += 1
    return len(left) + len(right) - overlap - cancellation


@dataclass
class MergeNode:
    node_id: int
    leaves: tuple[int, ...]
    polynomial: SparsePolynomial
    height: int
    peak: int


def greedy_merge(products: Sequence[SparsePolynomial]) -> dict[str, object]:
    next_id = len(products)
    nodes = [
        MergeNode(i, (i,), dict(product), 0, len(product))
        for i, product in enumerate(products)
    ]
    merges: list[dict[str, object]] = []
    def merge_pair(left: MergeNode, right: MergeNode) -> MergeNode:
        nonlocal next_id
        polynomial = STAGED.add_sparse(left.polynomial, right.polynomial)
        node = MergeNode(
            next_id,
            tuple(sorted(left.leaves + right.leaves)),
            polynomial,
            max(left.height, right.height) + 1,
            max(left.peak, right.peak, len(polynomial)),
        )
        merges.append(
            {
                "node_id": next_id,
                "left_node_id": left.node_id,
                "right_node_id": right.node_id,
                "left_leaves": list(left.leaves),
                "right_leaves": list(right.leaves),
                "support_size": len(polynomial),
                "subtree_peak_support": node.peak,
                "height": node.height,
            }
        )
        next_id += 1
        return node

    # Stop at four live nodes.  Pairing those into two internal branches makes
    # the final aligned-cancellation proof available even when unconstrained
    # greedy merging would leave a single leaf directly below the root.
    while len(nodes) > 4:
        ranked = []
        for left_position, left in enumerate(nodes):
            for right_position in range(left_position + 1, len(nodes)):
                right = nodes[right_position]
                support = sum_support_size(left.polynomial, right.polynomial)
                subtree_peak = max(left.peak, right.peak, support)
                rank = (
                    subtree_peak,
                    support,
                    abs(left.height - right.height),
                    abs(len(left.leaves) - len(right.leaves)),
                    len(left.leaves) + len(right.leaves),
                )
                ranked.append((rank, left_position, right_position, support))
        _, left_position, right_position, predicted = min(ranked)
        left = nodes[left_position]
        right = nodes[right_position]
        node = merge_pair(left, right)
        if len(node.polynomial) != predicted:
            raise AssertionError("merge support prediction drift")
        for position in sorted((left_position, right_position), reverse=True):
            nodes.pop(position)
        nodes.append(node)

    if len(nodes) != 4:
        raise ValueError("terminal pairing requires exactly four live nodes")
    pairings = (
        ((0, 1), (2, 3)),
        ((0, 2), (1, 3)),
        ((0, 3), (1, 2)),
    )
    ranked_pairings = []
    for first, second in pairings:
        left_a, right_a = nodes[first[0]], nodes[first[1]]
        left_b, right_b = nodes[second[0]], nodes[second[1]]
        support_a = sum_support_size(left_a.polynomial, right_a.polynomial)
        support_b = sum_support_size(left_b.polynomial, right_b.polynomial)
        peak_a = max(left_a.peak, right_a.peak, support_a)
        peak_b = max(left_b.peak, right_b.peak, support_b)
        rank = (
            max(peak_a, peak_b),
            max(support_a, support_b),
            support_a + support_b,
            abs(support_a - support_b),
        )
        ranked_pairings.append((rank, first, second))
    _, first, second = min(ranked_pairings)
    branch_left = merge_pair(nodes[first[0]], nodes[first[1]])
    branch_right = merge_pair(nodes[second[0]], nodes[second[1]])
    root = merge_pair(branch_left, branch_right)
    return {
        "strategy": "greedy_min_subtree_peak_then_support_with_balance_tiebreaks",
        "peak_support_including_leaves": root.peak,
        "height": root.height,
        "merges": merges,
    }


def target_polynomial(variables: Sequence[str]) -> SparsePolynomial:
    exponents = bytearray(len(variables))
    exponents[variables.index("Kx")] = 1
    return {bytes(exponents): Fraction(1)}


def render_polynomial(polynomial: SparsePolynomial, variables: Sequence[str]) -> str:
    if not polynomial:
        return "0"
    atoms = []
    for monomial, coefficient in STAGED.sorted_terms(polynomial):
        body = MICRO.lean_term(monomial, abs(coefficient), variables)
        atoms.append(f"(-{body})" if coefficient < 0 else body)
    return MICRO.balanced_sum(atoms)


def split_aligned_target(
    left: SparsePolynomial,
    right: SparsePolynomial,
    target: SparsePolynomial,
    variables: Sequence[str],
) -> tuple[list[tuple[str, int]], list[tuple[str, int]], list[SparsePolynomial]]:
    if STAGED.add_sparse(left, right) != target:
        raise ValueError("terminal branches do not sum to Kx")
    monomials = sorted(
        set(left) | set(right) | set(target),
        key=lambda monomial: (sum(monomial), tuple(monomial)),
        reverse=True,
    )
    left_parts: list[tuple[str, int]] = []
    right_parts: list[tuple[str, int]] = []
    target_parts: list[SparsePolynomial] = []
    current: list[Monomial] = []

    def side_metrics(side: SparsePolynomial, candidates: Sequence[Monomial]) -> tuple[int, int]:
        atoms = []
        for monomial in candidates:
            coefficient = side.get(monomial, Fraction(0))
            if not coefficient:
                continue
            body = MICRO.lean_term(monomial, abs(coefficient), variables)
            atoms.append(f"(-{body})" if coefficient < 0 else body)
        expression = MICRO.balanced_sum(atoms)
        return len(atoms), len(expression.encode("utf-8"))

    def flush() -> None:
        nonlocal current
        if not current:
            return
        left_piece = {m: left[m] for m in current if m in left}
        right_piece = {m: right[m] for m in current if m in right}
        target_piece = {m: target[m] for m in current if m in target}
        left_parts.append((render_polynomial(left_piece, variables), len(left_piece)))
        right_parts.append((render_polynomial(right_piece, variables), len(right_piece)))
        target_parts.append(target_piece)
        if STAGED.add_sparse(left_piece, right_piece) != target_piece:
            raise ValueError("terminal aligned part identity drift")
        current = []

    for monomial in monomials:
        candidate = [*current, monomial]
        left_atoms, left_bytes = side_metrics(left, candidate)
        right_atoms, right_bytes = side_metrics(right, candidate)
        if current and (
            left_atoms > MICRO.MAX_POLYNOMIAL_ATOMS
            or right_atoms > MICRO.MAX_POLYNOMIAL_ATOMS
            or left_bytes > MICRO.MAX_POLYNOMIAL_EXPRESSION_BYTES
            or right_bytes > MICRO.MAX_POLYNOMIAL_EXPRESSION_BYTES
        ):
            flush()
            candidate = [monomial]
            left_atoms, left_bytes = side_metrics(left, candidate)
            right_atoms, right_bytes = side_metrics(right, candidate)
        if (
            left_atoms > MICRO.MAX_POLYNOMIAL_ATOMS
            or right_atoms > MICRO.MAX_POLYNOMIAL_ATOMS
            or left_bytes > MICRO.MAX_POLYNOMIAL_EXPRESSION_BYTES
            or right_bytes > MICRO.MAX_POLYNOMIAL_EXPRESSION_BYTES
        ):
            raise ValueError("single aligned terminal monomial exceeds budget")
        current.append(monomial)
    flush()
    return left_parts, right_parts, target_parts


def theorem_call(
    node_id: int,
    variables: Sequence[str],
    leaves: Sequence[int],
    names: Sequence[str],
) -> str:
    arguments = [*variables, *(f"h{names[index]}" for index in leaves)]
    return f"weightedRelation{node_id} " + " ".join(arguments)


def family_call(family, variables: Sequence[str]) -> str:
    return MICRO.declaration_call(family.aggregate, variables)


def emit_terminal_cancellation(
    writer,
    *,
    left_family,
    right_family,
    target_parts: Sequence[SparsePolynomial],
    variables: Sequence[str],
) -> tuple[str, list[dict[str, object]]]:
    if not (
        len(left_family.parts) == len(right_family.parts) == len(target_parts)
    ):
        raise ValueError("terminal part-count drift")
    arguments = " ".join(variables)
    binder = f"({arguments} : ℝ)"
    facts: dict[tuple[str, str], tuple[str, SparsePolynomial]] = {}
    records: list[dict[str, object]] = []
    for index, (left_name, right_name, target) in enumerate(
        zip(left_family.parts, right_family.parts, target_parts, strict=True)
    ):
        theorem_name = f"terminalPairPart{index}"
        rhs = render_polynomial(target, variables)
        writer.command(
            f"theorem:{theorem_name}",
            "\n".join(
                (
                    f"private theorem {theorem_name} {binder} :",
                    f"    {MICRO.declaration_call(left_name, variables)} +",
                    f"      {MICRO.declaration_call(right_name, variables)} = {rhs} := by",
                    f"  simp only [{left_name}, {right_name}]",
                    "  ring",
                )
            ),
        )
        facts[(left_name, right_name)] = (theorem_name, target)
        records.append(
            {"kind": "part", "theorem": theorem_name, "target": rhs}
        )

    for index, (left_node, right_node) in enumerate(
        zip(left_family.aggregate_nodes, right_family.aggregate_nodes, strict=True)
    ):
        child_facts = []
        target: SparsePolynomial = {}
        for left_child, right_child in zip(
            left_node.children, right_node.children, strict=True
        ):
            theorem_name, child_target = facts[(left_child, right_child)]
            child_facts.append(theorem_name)
            target = STAGED.add_sparse(target, child_target)
        theorem_name = f"terminalPairAggregate{index}"
        rhs = render_polynomial(target, variables)
        lines = [
            f"private theorem {theorem_name} {binder} :",
            f"    {MICRO.declaration_call(left_node.name, variables)} +",
            f"      {MICRO.declaration_call(right_node.name, variables)} = {rhs} := by",
        ]
        for child_index, child_theorem in enumerate(child_facts):
            lines.append(f"  have h{child_index} := {child_theorem} {arguments}")
        lines.append(f"  simp only [{left_node.name}, {right_node.name}]")
        lines.append("  linear_combination")
        for child_index in range(len(child_facts)):
            lines.append(("    " if child_index == 0 else "    + ") + f"h{child_index}")
        writer.command(f"theorem:{theorem_name}", "\n".join(lines))
        facts[(left_node.name, right_node.name)] = (theorem_name, target)
        records.append(
            {"kind": "aggregate", "theorem": theorem_name, "target": rhs}
        )
    final_name, final_target = facts[(left_family.aggregate, right_family.aggregate)]
    if final_target != target_polynomial(variables):
        raise ValueError("terminal aggregate target is not Kx")
    return final_name, records


def emit_weighted_relation(
    writer,
    *,
    merge: Mapping[str, object],
    variables: Sequence[str],
    names: Sequence[str],
    generators: Sequence[str],
    leaves_by_node: Mapping[int, tuple[int, ...]],
    node_families: Mapping[int, object],
    cofactor_families: Mapping[int, object],
    terminal_pair_theorem: str | None,
) -> None:
    node_id = int(merge["node_id"])
    left_id = int(merge["left_node_id"])
    right_id = int(merge["right_node_id"])
    leaves = leaves_by_node[node_id]
    node_family = node_families[node_id]
    lines = [
        f"private theorem weightedRelation{node_id}",
        f"    ({' '.join(variables)} : ℝ)",
    ]
    for index in leaves:
        lines.append(
            f"    (h{names[index]} : {generators[index]} = 0)"
        )
    lines.append(f"    : {family_call(node_family, variables)} = 0 := by")

    tactic_terms: list[str] = []
    simp_names: list[str] = [node_family.aggregate]
    for side, child_id in (("left", left_id), ("right", right_id)):
        if child_id < len(names):
            family = cofactor_families[child_id]
            simp_names.append(family.aggregate)
            tactic_terms.append(
                f"({family_call(family, variables)}) * h{names[child_id]}"
            )
        else:
            family = node_families[child_id]
            simp_names.append(family.aggregate)
            local = f"h{side}"
            lines.append(
                f"  have {local} := {theorem_call(child_id, variables, leaves_by_node[child_id], names)}"
            )
            tactic_terms.append(local)

    if terminal_pair_theorem is not None:
        if left_id < len(names) or right_id < len(names):
            raise ValueError("terminal shortcut requires two internal children")
        left_call = family_call(node_families[left_id], variables)
        right_call = family_call(node_families[right_id], variables)
        lines.extend(
            (
                f"  have hpair := {terminal_pair_theorem} {' '.join(variables)}",
                f"  have hzero : {left_call} + {right_call} = 0 := by",
                "    rw [hleft, hright]",
                "    norm_num",
                "  have hKx : Kx = 0 := hpair.symm.trans hzero",
                "  simpa only [" + ", ".join(node_family.simp_names) + "] using hKx",
            )
        )
        writer.command(f"theorem:weightedRelation{node_id}", "\n".join(lines))
        return

    ordered_simp = tuple(dict.fromkeys(simp_names))
    lines.append("  linear_combination")
    lines.append("    (norm := (simp [" + ", ".join(ordered_simp) + "]; ring))")
    for index, term in enumerate(tactic_terms):
        lines.append(("    " if index == 0 else "    + ") + term)
    writer.command(f"theorem:weightedRelation{node_id}", "\n".join(lines))


def source_scan(source: bytes) -> None:
    text = source.decode("utf-8")
    for label, pattern in {
        "sorry": r"\bsorry\b",
        "admit": r"\badmit\b",
        "native_decide": r"\bnative_decide\b",
        "axiom declaration": r"(?m)^\s*axiom\s+",
    }.items():
        if re.search(pattern, text):
            raise ValueError(f"generated source contains prohibited {label}")


def build() -> tuple[bytes, dict[str, object]]:
    require_hash(CERTIFICATE, EXPECTED_CERTIFICATE_SHA256, "QQ certificate")
    certificate = json.loads(CERTIFICATE.read_text(encoding="utf-8"))
    if certificate["schema"] != EXPECTED_SCHEMA:
        raise ValueError("certificate schema drift")
    if certificate["content_sha256"] != EXPECTED_CONTENT_SHA256:
        raise ValueError("certificate content hash drift")
    variables = [str(value) for value in certificate["variable_order"]]
    names = [str(value) for value in certificate["generator_names"]]
    generators = [str(value) for value in certificate["generators"]]
    cofactors_raw = [str(value) for value in certificate["cofactors"]]
    if names != EXPECTED_NAMES or len(generators) != 12 or len(cofactors_raw) != 12:
        raise ValueError("twelve-relation stream drift")
    variable_index = {name: index for index, name in enumerate(variables)}
    cofactors = [
        parse_flat_polynomial(text, variables, variable_index)
        for text in cofactors_raw
    ]
    generator_polynomials = [
        parse_source_polynomial(text, variables) for text in generators
    ]
    products = [
        STAGED.multiply_sparse(cofactor, generator)
        for cofactor, generator in zip(cofactors, generator_polynomials, strict=True)
    ]
    total: SparsePolynomial = {}
    for product in products:
        total = STAGED.add_sparse(total, product)
    target = target_polynomial(variables)
    if total != target:
        raise ValueError(f"exact QQ replay has {len(total)} residual terms")

    merge_plan = greedy_merge(products)
    nodes: dict[int, SparsePolynomial] = {
        index: product for index, product in enumerate(products)
    }
    leaves_by_node: dict[int, tuple[int, ...]] = {
        index: (index,) for index in range(12)
    }
    for merge in merge_plan["merges"]:
        node_id = int(merge["node_id"])
        left_id = int(merge["left_node_id"])
        right_id = int(merge["right_node_id"])
        nodes[node_id] = STAGED.add_sparse(nodes[left_id], nodes[right_id])
        leaves_by_node[node_id] = tuple(
            sorted(leaves_by_node[left_id] + leaves_by_node[right_id])
        )
        if len(nodes[node_id]) != int(merge["support_size"]):
            raise ValueError(f"node support drift at {node_id}")
    root_merge = merge_plan["merges"][-1]
    root_id = int(root_merge["node_id"])
    if nodes[root_id] != target:
        raise ValueError("merge root is not Kx")
    terminal_left_id = int(root_merge["left_node_id"])
    terminal_right_id = int(root_merge["right_node_id"])
    if terminal_left_id < 12 or terminal_right_id < 12:
        raise ValueError("greedy root does not expose two internal branches")
    left_parts, right_parts, target_parts = split_aligned_target(
        nodes[terminal_left_id], nodes[terminal_right_id], target, variables
    )

    writer = MICRO.CommandWriter()
    writer.command("import", "import Mathlib")
    writer.prose(
        "/-! Microsharded kernel replay of the exact generic-reflection Kx certificate. -/"
    )
    writer.command(
        "namespace", "namespace Problem97.ATailBankCleanLambdaKxMicrosharded"
    )
    writer.prose(
        "\n".join(
            (
                f"-- Exact QQ certificate SHA256: {EXPECTED_CERTIFICATE_SHA256}",
                f"-- Exact content SHA256: {EXPECTED_CONTENT_SHA256}",
                f"-- Merge height: {merge_plan['height']}",
                f"-- Peak exact support: {merge_plan['peak_support_including_leaves']}",
                f"-- Per-definition atom limit: {MICRO.MAX_POLYNOMIAL_ATOMS}",
                f"-- Per-definition expression budget: {MICRO.MAX_POLYNOMIAL_EXPRESSION_BYTES} bytes",
            )
        )
    )
    writer.command("option:maxHeartbeats", "set_option maxHeartbeats 80000000")
    writer.command("option:maxRecDepth", "set_option maxRecDepth 100000")
    writer.command("option:unused", "set_option linter.unusedVariables false")
    writer.command("noncomputable", "noncomputable section")

    family_records = []
    cofactor_families = {}
    for index, polynomial in enumerate(cofactors):
        family = MICRO.emit_polynomial_family(
            writer,
            prefix=f"lambdaKxCofactor{index}",
            polynomial=polynomial,
            variables=variables,
        )
        cofactor_families[index] = family
        family_records.append(
            {
                "kind": "cofactor",
                "id": index,
                "part_count": len(family.parts),
                "support_size": len(polynomial),
                "max_part_atoms": max(family.term_counts),
                "max_expression_bytes": max(family.expression_bytes),
            }
        )
        writer.command("progress:cofactor" + str(index), f"#check {family.aggregate}")

    aligned_parts_by_node = {
        terminal_left_id: left_parts,
        terminal_right_id: right_parts,
    }
    node_families = {}
    terminal_pair_theorem = None
    terminal_records = []
    for merge in merge_plan["merges"]:
        node_id = int(merge["node_id"])
        family = MICRO.emit_polynomial_family(
            writer,
            prefix=f"lambdaKxRelation{node_id}",
            polynomial=nodes[node_id],
            variables=variables,
            rendered_parts=aligned_parts_by_node.get(node_id),
        )
        node_families[node_id] = family
        family_records.append(
            {
                "kind": "relation",
                "id": node_id,
                "part_count": len(family.parts),
                "support_size": len(nodes[node_id]),
                "max_part_atoms": max(family.term_counts),
                "max_expression_bytes": max(family.expression_bytes),
            }
        )
        if node_id == root_id:
            terminal_pair_theorem, terminal_records = emit_terminal_cancellation(
                writer,
                left_family=node_families[terminal_left_id],
                right_family=node_families[terminal_right_id],
                target_parts=target_parts,
                variables=variables,
            )
        emit_weighted_relation(
            writer,
            merge=merge,
            variables=variables,
            names=names,
            generators=generators,
            leaves_by_node=leaves_by_node,
            node_families=node_families,
            cofactor_families=cofactor_families,
            terminal_pair_theorem=(terminal_pair_theorem if node_id == root_id else None),
        )
        writer.command(f"progress:relation{node_id}", f"#check weightedRelation{node_id}")

    hypotheses = [
        f"    (h{name} : {generator} = 0)"
        for name, generator in zip(names, generators, strict=True)
    ]
    root_call = theorem_call(root_id, variables, leaves_by_node[root_id], names)
    writer.command(
        "theorem:lambda_kx_zero",
        "\n".join(
            (
                "theorem lambda_kx_zero",
                f"    ({' '.join(variables)} : ℝ)",
                *hypotheses,
                "    : Kx = 0 := by",
                f"  have hroot := {root_call}",
                "  simpa only [" + ", ".join(node_families[root_id].simp_names) + "] using hroot",
            )
        ),
    )
    arguments = " ".join(variables)
    hypothesis_arguments = " ".join(f"h{name}" for name in names)
    writer.command(
        "theorem:lambda_incompatible",
        "\n".join(
            (
                "theorem generic_double_reflection_lambda_incompatible",
                f"    ({arguments} : ℝ)",
                *hypotheses,
                "    : False := by",
                f"  have hKx : Kx = 0 := lambda_kx_zero {arguments} {hypothesis_arguments}",
                "  have hKy : Ky = 0 := by",
                "    nlinarith [sq_nonneg Ky]",
                "  have hGXK0 : Xx ^ 2 + Xy ^ 2 = 0 := by",
                "    simpa [hKx, hKy] using hGXK",
                "  have hXx : Xx = 0 := by",
                "    nlinarith [sq_nonneg Xx, sq_nonneg Xy]",
                "  have hXy : Xy = 0 := by",
                "    nlinarith [sq_nonneg Xx, sq_nonneg Xy]",
                "  have hXZ0 : Zx ^ 2 + Zy ^ 2 = 0 := by",
                "    simpa [hKx, hXx, hXy] using hXZ",
                "  have hZx : Zx = 0 := by",
                "    nlinarith [sq_nonneg Zx, sq_nonneg Zy]",
                "  have hZAG0 : -2 * Zx + 1 = 0 := by",
                "    simpa [hKx, hKy] using hZAG",
                "  nlinarith",
            )
        ),
    )
    writer.command("axioms:kx", "#print axioms lambda_kx_zero")
    writer.command(
        "axioms:incompatible", "#print axioms generic_double_reflection_lambda_incompatible"
    )
    writer.command("end", "end Problem97.ATailBankCleanLambdaKxMicrosharded")

    source = writer.source()
    source_scan(source)
    max_command = max(writer.commands, key=lambda record: int(record["bytes"]))
    if int(max_command["bytes"]) > MICRO.MAX_EMITTED_COMMAND_BYTES:
        raise ValueError(f"command exceeds byte limit: {max_command}")
    manifest = {
        "schema": "p97-bank-clean-lambda-kx-microsharded-lean-v1",
        "certificate": str(CERTIFICATE.relative_to(REPO)),
        "certificate_sha256": EXPECTED_CERTIFICATE_SHA256,
        "certificate_content_sha256": EXPECTED_CONTENT_SHA256,
        "generator": str(Path(__file__).resolve().relative_to(REPO)),
        "variables": variables,
        "generator_names": names,
        "product_support_sizes": [len(product) for product in products],
        "merge_plan": merge_plan,
        "root_id": root_id,
        "root_polynomial_sha256": STAGED.polynomial_sha256(nodes[root_id]),
        "exact_qq_identity_replayed": True,
        "family_count": len(family_records),
        "families": family_records,
        "terminal_part_count": len(target_parts),
        "terminal_records": terminal_records,
        "command_count": len(writer.commands),
        "max_command": max_command,
        "atom_limit": MICRO.MAX_POLYNOMIAL_ATOMS,
        "expression_byte_limit": MICRO.MAX_POLYNOMIAL_EXPRESSION_BYTES,
        "aggregate_child_limit": MICRO.MAX_AGGREGATE_ATOMS,
        "output": str(OUTPUT.relative_to(REPO)),
        "output_bytes": len(source),
        "output_sha256": bytes_sha256(source),
        "lean_validation": "pending",
        "source_scan": {
            "sorry": False,
            "admit": False,
            "native_decide": False,
            "axiom_declaration": False,
        },
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
    manifest_bytes = (json.dumps(manifest, indent=2, sort_keys=True) + "\n").encode()
    if check:
        if not output.exists() or output.read_bytes() != source:
            raise RuntimeError(f"generated Lean source drift: {output}")
        if not manifest_path.exists() or manifest_path.read_bytes() != manifest_bytes:
            raise RuntimeError(f"generated manifest drift: {manifest_path}")
        return
    output.write_bytes(source)
    manifest_path.write_bytes(manifest_bytes)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=OUTPUT)
    parser.add_argument("--manifest", type=Path, default=MANIFEST)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    source, manifest = build()
    check_or_write(args.output, args.manifest, source, manifest, check=args.check)
    print(
        json.dumps(
            {
                "check": args.check,
                "output": str(args.output),
                "output_bytes": len(source),
                "output_sha256": bytes_sha256(source),
                "merge_peak": manifest["merge_plan"]["peak_support_including_leaves"],
                "merge_height": manifest["merge_plan"]["height"],
                "terminal_part_count": manifest["terminal_part_count"],
                "max_command": manifest["max_command"],
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
