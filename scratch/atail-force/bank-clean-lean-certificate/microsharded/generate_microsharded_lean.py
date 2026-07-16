#!/usr/bin/env python3
"""Emit a parser-microsharded Lean replay of the exact fifteen-row certificate.

This is the third scratch-only replay of the pinned Groebner.jl certificate.
It preserves the cancellation-greedy merge tree used by the staged replay, but
never places an expanded cofactor or expanded node polynomial in a theorem
header or tactic command.  Every such polynomial is stored in many small
reducible, simp-tagged definitions.  ``linear_combination`` names only the
relevant family aggregates; the generated simp rules unfold their bounded
descendants recursively before ``ring`` checks the exact identity.

Fix generation defects here; never hand-edit the generated Lean payload.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import re
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path
from typing import Iterable, Mapping, Sequence


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[3]
STAGED_GENERATOR = HERE.parent / "staged/generate_staged_lean.py"
CERTIFICATE = HERE.parent / "unit_certificate_groebner_jl_15.json"
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
OUTPUT = HERE / "BankClean15MicroshardedCertificate.lean"
MANIFEST = HERE / "BankClean15MicroshardedCertificate.manifest.json"

EXPECTED_CERTIFICATE_SHA256 = (
    "afb111002531a20ca1301afe6d05d8e0184f08183c4b2a7c0acaa0b69d834935"
)
EXPECTED_MERGE_ANALYSIS_SHA256 = (
    "936540291da3f1c1fc2b4bc0e355af50660a4d7eac4ce0ef9e1e1a5217569a37"
)
EXPECTED_CORE_SHA256 = (
    "24f08887ccdc6c07a19b447352b40dc1ec2bf4facf50752e13708386cfdde165"
)
EXPECTED_STAGED_GENERATOR_SHA256 = (
    "77c9eb0c7f5d66c6966fcfdf1423d2352eb7d757afbd540b6b4f70894ed05734"
)
EXPECTED_SCHEMA = "p97-atail-bank-clean-15-groebner-jl-certificate-v1"
EXPECTED_MERGE_SCHEMA = "p97-bank-clean-15-certificate-merge-analysis-v1"
EXPECTED_TREE_STRATEGY = (
    "greedy_min_subtree_peak_then_support_with_balance_tiebreaks"
)
EXPECTED_PEAK_SUPPORT = 132_499
EXPECTED_TREE_HEIGHT = 8
EXPECTED_MULTIPLIER_TERM_COUNT = 275_588
EXPECTED_RAW_IDENTITY_SHA256 = (
    "dfbd38fb29cd9feceee945b68339c2a64723573db95219a20d030630c37a6c14"
)
EXPECTED_SOURCE_POLYNOMIAL_SHA256 = (
    "b0efd512be125e72cc1847f56bac68149e0b95c002587efce23375ef72d7dbaf"
)

# These are hard syntax-shape bounds, not just target sizes.  The v2 replay
# overflowed Lean's native stack while elaborating one balanced 1,532-atom
# definition: logarithmic parenthesis depth alone was not enough.  V3 limits
# both the number of overloaded arithmetic atoms and the rendered bytes in
# every polynomial leaf.  Aggregates are independently bounded and layered.
MAX_POLYNOMIAL_ATOMS = 192
MAX_POLYNOMIAL_EXPRESSION_BYTES = 16_000
MAX_AGGREGATE_ATOMS = 32
MAX_EMITTED_COMMAND_BYTES = 16_384


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


def load_staged_helpers():
    require_hash(
        STAGED_GENERATOR,
        EXPECTED_STAGED_GENERATOR_SHA256,
        "staged helper generator",
    )
    spec = importlib.util.spec_from_file_location(
        "bank_clean_staged_helpers", STAGED_GENERATOR
    )
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load staged helpers from {STAGED_GENERATOR}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


STAGED = load_staged_helpers()
Monomial = bytes
SparsePolynomial = dict[Monomial, Fraction]


def polynomial_sha256(polynomial: SparsePolynomial) -> str:
    return STAGED.polynomial_sha256(polynomial)


def balanced_sum(expressions: Sequence[str]) -> str:
    if not expressions:
        return "0"
    if len(expressions) == 1:
        return expressions[0]
    midpoint = len(expressions) // 2
    return (
        f"({balanced_sum(expressions[:midpoint])} + "
        f"{balanced_sum(expressions[midpoint:])})"
    )


def lean_term(
    monomial: Monomial,
    coefficient: Fraction,
    variables: Sequence[str],
) -> str:
    return STAGED.unsigned_term(monomial, coefficient, variables)


def split_polynomial(
    polynomial: SparsePolynomial,
    variables: Sequence[str],
    *,
    max_expression_bytes: int,
) -> list[tuple[str, int]]:
    """Render into byte-bounded pieces with logarithmic addition depth."""

    terms = STAGED.sorted_terms(polynomial)
    if not terms:
        return [("0", 0)]
    pieces: list[tuple[str, int]] = []
    current: list[str] = []
    current_bytes = 0
    for monomial, coefficient in terms:
        body = lean_term(monomial, abs(coefficient), variables)
        # Every leaf is a signed atom.  All internal nodes use addition, so the
        # exact byte cost is sum(atom bytes) + 5 * (atom count - 1), independent
        # of the balanced tree's shape.
        atom = f"(-{body})" if coefficient < 0 else body
        candidate_bytes = len(atom.encode("utf-8")) + (5 if current else 0)
        if current and (
            len(current) >= MAX_POLYNOMIAL_ATOMS
            or current_bytes + candidate_bytes > max_expression_bytes
        ):
            rendered = balanced_sum(current)
            if len(rendered.encode("utf-8")) != current_bytes:
                raise ValueError("balanced polynomial byte accounting drift")
            pieces.append((rendered, len(current)))
            current = [atom]
            current_bytes = len(atom.encode("utf-8"))
        else:
            current.append(atom)
            current_bytes += candidate_bytes
        if current_bytes > max_expression_bytes:
            raise ValueError("single polynomial term exceeded its byte budget")
    if current:
        rendered = balanced_sum(current)
        if len(rendered.encode("utf-8")) != current_bytes:
            raise ValueError("balanced polynomial byte accounting drift")
        pieces.append((rendered, len(current)))
    return pieces


def split_aligned_polynomials(
    left: SparsePolynomial,
    right: SparsePolynomial,
    variables: Sequence[str],
    *,
    max_expression_bytes: int,
) -> tuple[list[tuple[str, int]], list[tuple[str, int]], tuple[int, ...]]:
    """Split complementary polynomials at identical monomial boundaries.

    The two terminal branches have the same support and sum exactly to one.
    Identical boundaries let Lean certify the final cancellation one small
    part-pair at a time instead of unfolding both 120k-term branches together.
    The returned integer is the exact constant contributed by each pair; all
    other monomial coefficients must cancel inside that pair.
    """

    left_terms = STAGED.sorted_terms(left)
    right_terms = STAGED.sorted_terms(right)
    if [monomial for monomial, _ in left_terms] != [
        monomial for monomial, _ in right_terms
    ]:
        raise ValueError("terminal branch supports are not aligned")

    left_pieces: list[tuple[str, int]] = []
    right_pieces: list[tuple[str, int]] = []
    pair_constants: list[int] = []
    current_left: list[str] = []
    current_right: list[str] = []
    current_left_bytes = 0
    current_right_bytes = 0
    current_coefficients: list[tuple[Monomial, Fraction]] = []

    def flush() -> None:
        nonlocal current_left, current_right
        nonlocal current_left_bytes, current_right_bytes, current_coefficients
        if not current_left:
            return
        rendered_left = balanced_sum(current_left)
        rendered_right = balanced_sum(current_right)
        if len(rendered_left.encode("utf-8")) != current_left_bytes:
            raise ValueError("left aligned-part byte accounting drift")
        if len(rendered_right.encode("utf-8")) != current_right_bytes:
            raise ValueError("right aligned-part byte accounting drift")
        residual: SparsePolynomial = {}
        for monomial, coefficient in current_coefficients:
            if coefficient:
                residual[monomial] = coefficient
        constant = 0
        if residual:
            zero_monomial = bytes(len(variables))
            if set(residual) != {zero_monomial}:
                raise ValueError("aligned terminal part has nonconstant residual")
            value = residual[zero_monomial]
            if value.denominator != 1 or value.numerator not in {0, 1}:
                raise ValueError("aligned terminal part has unexpected constant")
            constant = value.numerator
        left_pieces.append((rendered_left, len(current_left)))
        right_pieces.append((rendered_right, len(current_right)))
        pair_constants.append(constant)
        current_left = []
        current_right = []
        current_left_bytes = 0
        current_right_bytes = 0
        current_coefficients = []

    for (left_monomial, left_coefficient), (
        right_monomial,
        right_coefficient,
    ) in zip(left_terms, right_terms, strict=True):
        if left_monomial != right_monomial:
            raise ValueError("terminal branch monomial alignment drift")
        left_body = lean_term(left_monomial, abs(left_coefficient), variables)
        right_body = lean_term(right_monomial, abs(right_coefficient), variables)
        left_atom = f"(-{left_body})" if left_coefficient < 0 else left_body
        right_atom = f"(-{right_body})" if right_coefficient < 0 else right_body
        left_addition = len(left_atom.encode("utf-8")) + (
            5 if current_left else 0
        )
        right_addition = len(right_atom.encode("utf-8")) + (
            5 if current_right else 0
        )
        if current_left and (
            len(current_left) >= MAX_POLYNOMIAL_ATOMS
            or current_left_bytes + left_addition > max_expression_bytes
            or current_right_bytes + right_addition > max_expression_bytes
        ):
            flush()
            left_addition = len(left_atom.encode("utf-8"))
            right_addition = len(right_atom.encode("utf-8"))
        current_left.append(left_atom)
        current_right.append(right_atom)
        current_left_bytes += left_addition
        current_right_bytes += right_addition
        current_coefficients.append(
            (left_monomial, left_coefficient + right_coefficient)
        )
        if (
            current_left_bytes > max_expression_bytes
            or current_right_bytes > max_expression_bytes
        ):
            raise ValueError("single aligned polynomial atom exceeded byte budget")
    flush()
    if sum(pair_constants) != 1:
        raise ValueError("aligned terminal parts do not sum to one")
    return left_pieces, right_pieces, tuple(pair_constants)


def declaration_call(name: str, variables: Sequence[str]) -> str:
    return f"{name} {' '.join(variables)}"


@dataclass(frozen=True)
class AggregateNode:
    name: str
    children: tuple[str, ...]
    level: int


@dataclass(frozen=True)
class DefinitionFamily:
    aggregate: str
    parts: tuple[str, ...]
    aggregate_nodes: tuple[AggregateNode, ...]
    expression_bytes: tuple[int, ...]
    term_counts: tuple[int, ...]

    @property
    def simp_names(self) -> tuple[str, ...]:
        intermediate = tuple(
            node.name
            for node in self.aggregate_nodes
            if node.name != self.aggregate
        )
        return (self.aggregate, *reversed(intermediate), *self.parts)


class CommandWriter:
    """Build source while retaining exact top-level command byte accounting."""

    def __init__(self) -> None:
        self.blocks: list[str] = []
        self.commands: list[dict[str, object]] = []

    def prose(self, text: str) -> None:
        self.blocks.append(text.rstrip())

    def command(self, label: str, command: str) -> None:
        normalized = command.rstrip()
        size = len((normalized + "\n").encode("utf-8"))
        self.blocks.append(normalized)
        self.commands.append({"label": label, "bytes": size})

    def source(self) -> bytes:
        return ("\n\n".join(self.blocks) + "\n").encode("utf-8")


def emit_polynomial_family(
    writer: CommandWriter,
    *,
    prefix: str,
    polynomial: SparsePolynomial,
    variables: Sequence[str],
    rendered_parts: Sequence[tuple[str, int]] | None = None,
) -> DefinitionFamily:
    if rendered_parts is None:
        rendered_parts = split_polynomial(
            polynomial,
            variables,
            max_expression_bytes=MAX_POLYNOMIAL_EXPRESSION_BYTES,
        )
    part_names: list[str] = []
    expression_bytes: list[int] = []
    term_counts: list[int] = []
    binder = f"({' '.join(variables)} : ℝ)"
    for index, (expression, term_count) in enumerate(rendered_parts):
        name = f"{prefix}Part{index}"
        part_names.append(name)
        expression_bytes.append(len(expression.encode("utf-8")))
        term_counts.append(term_count)
        writer.command(
            f"definition:{name}",
            f"@[simp] private def {name} {binder} : ℝ :=\n  {expression}",
        )

    # Do not replace one safe leaf layer with a giant aggregate declaration.
    # Each aggregate command references at most MAX_AGGREGATE_ATOMS children;
    # additional levels are emitted until the public family value is small.
    aggregate_nodes: list[AggregateNode] = []
    current_names = list(part_names)
    level = 0
    while len(current_names) > MAX_AGGREGATE_ATOMS:
        next_names: list[str] = []
        for index in range(0, len(current_names), MAX_AGGREGATE_ATOMS):
            children = tuple(current_names[index : index + MAX_AGGREGATE_ATOMS])
            name = f"{prefix}AggL{level}Part{index // MAX_AGGREGATE_ATOMS}"
            calls = [declaration_call(child, variables) for child in children]
            writer.command(
                f"definition:{name}",
                f"@[simp] private def {name} {binder} : ℝ :=\n  {balanced_sum(calls)}",
            )
            aggregate_nodes.append(
                AggregateNode(name=name, children=children, level=level)
            )
            next_names.append(name)
        current_names = next_names
        level += 1

    aggregate = f"{prefix}Value"
    final_children = tuple(current_names)
    calls = [declaration_call(name, variables) for name in final_children]
    writer.command(
        f"definition:{aggregate}",
        f"@[simp] private def {aggregate} {binder} : ℝ :=\n  {balanced_sum(calls)}",
    )
    aggregate_nodes.append(
        AggregateNode(name=aggregate, children=final_children, level=level)
    )
    return DefinitionFamily(
        aggregate=aggregate,
        parts=tuple(part_names),
        aggregate_nodes=tuple(aggregate_nodes),
        expression_bytes=tuple(expression_bytes),
        term_counts=tuple(term_counts),
    )


def theorem_call(
    node_id: int,
    variables: Sequence[str],
    leaves: Sequence[int],
    names: Sequence[str],
) -> str:
    arguments = [*variables, *(f"p{STAGED.suffix(names[i])}" for i in leaves)]
    return f"weightedRelation{node_id} " + " ".join(arguments)


def emit_terminal_pair_cancellation(
    writer: CommandWriter,
    *,
    left_family: DefinitionFamily,
    right_family: DefinitionFamily,
    part_constants: Sequence[int],
    variables: Sequence[str],
) -> tuple[str, list[dict[str, object]]]:
    """Certify the complementary terminal branches in bounded local steps."""

    if not (
        len(left_family.parts)
        == len(right_family.parts)
        == len(part_constants)
    ):
        raise ValueError("terminal pair part-count drift")
    arguments = " ".join(variables)
    binder = f"({arguments} : ℝ)"
    facts: dict[tuple[str, str], tuple[str, int]] = {}
    records: list[dict[str, object]] = []

    for index, (left_name, right_name, constant) in enumerate(
        zip(
            left_family.parts,
            right_family.parts,
            part_constants,
            strict=True,
        )
    ):
        if constant not in {0, 1}:
            raise ValueError("terminal leaf-pair constant is not zero or one")
        theorem_name = f"terminalPairPart{index}"
        writer.command(
            f"theorem:{theorem_name}",
            "\n".join(
                (
                    f"private theorem {theorem_name} {binder} :",
                    f"    {declaration_call(left_name, variables)} +",
                    f"      {declaration_call(right_name, variables)} = {constant} := by",
                    f"  simp only [{left_name}, {right_name}]",
                    "  ring",
                )
            ),
        )
        facts[(left_name, right_name)] = (theorem_name, constant)
        records.append(
            {
                "kind": "part",
                "index": index,
                "theorem": theorem_name,
                "left": left_name,
                "right": right_name,
                "child_count": 0,
                "constant": constant,
            }
        )

    if len(left_family.aggregate_nodes) != len(right_family.aggregate_nodes):
        raise ValueError("terminal pair aggregate-level drift")
    for index, (left_node, right_node) in enumerate(
        zip(
            left_family.aggregate_nodes,
            right_family.aggregate_nodes,
            strict=True,
        )
    ):
        if len(left_node.children) != len(right_node.children):
            raise ValueError("terminal pair aggregate arity drift")
        child_facts: list[tuple[str, int]] = []
        for left_child, right_child in zip(
            left_node.children, right_node.children, strict=True
        ):
            key = (left_child, right_child)
            if key not in facts:
                raise ValueError(f"missing terminal child cancellation for {key}")
            child_facts.append(facts[key])
        constant = sum(value for _name, value in child_facts)
        if constant not in {0, 1}:
            raise ValueError("terminal aggregate has unexpected constant")
        theorem_name = f"terminalPairAggregate{index}"
        lines = [
            f"private theorem {theorem_name} {binder} :",
            f"    {declaration_call(left_node.name, variables)} +",
            f"      {declaration_call(right_node.name, variables)} = {constant} := by",
        ]
        for child_index, (child_theorem, _value) in enumerate(child_facts):
            lines.append(
                f"  have h{child_index} := {child_theorem} {arguments}"
            )
        lines.append(f"  simp only [{left_node.name}, {right_node.name}]")
        lines.append("  linear_combination")
        for child_index in range(len(child_facts)):
            lines.append(("    " if child_index == 0 else "    + ") + f"h{child_index}")
        writer.command(f"theorem:{theorem_name}", "\n".join(lines))
        facts[(left_node.name, right_node.name)] = (theorem_name, constant)
        records.append(
            {
                "kind": "aggregate",
                "index": index,
                "level": left_node.level,
                "theorem": theorem_name,
                "left": left_node.name,
                "right": right_node.name,
                "child_count": len(child_facts),
                "constant": constant,
            }
        )

    final_key = (left_family.aggregate, right_family.aggregate)
    final_theorem, final_constant = facts[final_key]
    if final_constant != 1:
        raise ValueError("terminal aggregate cancellation does not yield one")
    return final_theorem, records


def emit_weighted_relation(
    writer: CommandWriter,
    *,
    merge: Mapping[str, object],
    variables: Sequence[str],
    names: Sequence[str],
    generators: Sequence[str],
    leaves_by_node: Mapping[int, tuple[int, ...]],
    node_families: Mapping[int, DefinitionFamily],
    cofactor_families: Mapping[int, DefinitionFamily],
    terminal_pair_theorem: str | None = None,
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
            f"    (p{STAGED.suffix(names[index])} : "
            f"{STAGED.lean_source_polynomial(generators[index])} = 0)"
        )
    lines.append(
        f"    : {declaration_call(node_family.aggregate, variables)} = 0 := by"
    )

    tactic_terms: list[str] = []
    # Every generated payload definition is a one-way simp rule.  Naming only
    # each family's aggregate keeps this theorem command bounded; `simp`
    # recursively unfolds precisely the generated descendants it encounters.
    simp_names: list[str] = [node_family.aggregate]
    for side, child_id in (("left", left_id), ("right", right_id)):
        if child_id < len(names):
            family = cofactor_families[child_id]
            simp_names.append(family.aggregate)
            tactic_terms.append(
                f"({declaration_call(family.aggregate, variables)}) * "
                f"p{STAGED.suffix(names[child_id])}"
            )
        else:
            family = node_families[child_id]
            simp_names.append(family.aggregate)
            local_name = f"h{side}"
            lines.append(
                f"  have {local_name} := "
                f"{theorem_call(child_id, variables, leaves_by_node[child_id], names)}"
            )
            tactic_terms.append(local_name)

    if terminal_pair_theorem is not None:
        if left_id < len(names) or right_id < len(names):
            raise ValueError("terminal pair shortcut requires two internal children")
        if tactic_terms != ["hleft", "hright"]:
            raise ValueError("terminal pair child theorem shape drift")
        left_call = declaration_call(node_families[left_id].aggregate, variables)
        right_call = declaration_call(node_families[right_id].aggregate, variables)
        lines.extend(
            (
                f"  have hpair := {terminal_pair_theorem} {' '.join(variables)}",
                f"  have hzero : {left_call} + {right_call} = 0 := by",
                "    rw [hleft, hright]",
                "    norm_num",
                "  have honeZero : (1 : ℝ) = 0 := hpair.symm.trans hzero",
                "  simpa only ["
                + ", ".join(node_family.simp_names)
                + "] using honeZero",
            )
        )
        writer.command(f"theorem:weightedRelation{node_id}", "\n".join(lines))
        return

    # Preserve order while rejecting accidental duplicate unfolding entries.
    ordered_simp_names = tuple(dict.fromkeys(simp_names))
    lines.append("  linear_combination")
    lines.append(
        "    (norm := (simp ["
        + ", ".join(ordered_simp_names)
        + "]; ring))"
    )
    for index, term in enumerate(tactic_terms):
        lines.append(("    " if index == 0 else "    + ") + term)
    writer.command(f"theorem:weightedRelation{node_id}", "\n".join(lines))


def source_scan(source: bytes) -> None:
    text = source.decode("utf-8")
    prohibited = {
        "sorry": r"\bsorry\b",
        "admit": r"\badmit\b",
        "native_decide": r"\bnative_decide\b",
        "axiom declaration": r"(?m)^\s*axiom\s+",
    }
    for label, pattern in prohibited.items():
        if re.search(pattern, text):
            raise ValueError(f"generated source contains prohibited {label}")


def emit_source(
    certificate: Mapping[str, object],
    analysis: Mapping[str, object],
    nodes: Mapping[int, SparsePolynomial],
    leaves_by_node: Mapping[int, tuple[int, ...]],
) -> tuple[bytes, dict[str, object]]:
    variables = [str(value) for value in certificate["variables"]]
    names = [str(value) for value in certificate["generator_names"]]
    generators = [str(value) for value in certificate["generators"]]
    raw_multipliers = [str(value) for value in certificate["multipliers"]]
    variable_index = {name: index for index, name in enumerate(variables)}
    multiplier_polynomials = [
        STAGED.parse_sparse(text, variables, variable_index)
        for text in raw_multipliers
    ]
    merge_plan = analysis["balanced_merge"]
    merges = merge_plan["merges"]
    points = STAGED.active_points(names)
    root_merge = merges[-1]
    terminal_left_id = int(root_merge["left_node_id"])
    terminal_right_id = int(root_merge["right_node_id"])
    if terminal_left_id < len(names) or terminal_right_id < len(names):
        raise ValueError("root merge does not have two internal branches")
    (
        terminal_left_parts,
        terminal_right_parts,
        terminal_part_constants,
    ) = split_aligned_polynomials(
        nodes[terminal_left_id],
        nodes[terminal_right_id],
        variables,
        max_expression_bytes=MAX_POLYNOMIAL_EXPRESSION_BYTES,
    )
    aligned_parts_by_node = {
        terminal_left_id: terminal_left_parts,
        terminal_right_id: terminal_right_parts,
    }

    writer = CommandWriter()
    writer.command(
        "import",
        "import Erdos9796Proof.P97.Census554.EqualityCore",
    )
    writer.prose(
        "/-! Parser-microsharded kernel replay of the exact fifteen-relation "
        "metric certificate. -/"
    )
    writer.command("open", "open scoped EuclideanGeometry")
    writer.command(
        "namespace", "namespace Problem97.ATailBankClean15Microsharded"
    )
    writer.prose(
        "\n".join(
            (
                f"-- Certificate SHA256: {EXPECTED_CERTIFICATE_SHA256}",
                f"-- Merge analysis SHA256: {EXPECTED_MERGE_ANALYSIS_SHA256}",
                f"-- Core SHA256: {EXPECTED_CORE_SHA256}",
                f"-- Tree height: {EXPECTED_TREE_HEIGHT}",
                f"-- Peak exact support, including leaves: {EXPECTED_PEAK_SUPPORT}",
                f"-- Per-definition atom limit: {MAX_POLYNOMIAL_ATOMS}",
                f"-- Per-definition expression budget: {MAX_POLYNOMIAL_EXPRESSION_BYTES} bytes",
                f"-- Per-aggregate child limit: {MAX_AGGREGATE_ATOMS}",
            )
        )
    )
    writer.command("option:maxHeartbeats", "set_option maxHeartbeats 80000000")
    writer.command("option:maxRecDepth", "set_option maxRecDepth 100000")
    writer.command(
        "option:unusedVariables",
        "set_option linter.unusedVariables false",
    )
    writer.command("noncomputable", "noncomputable section")
    writer.command(
        "progress:start",
        '#eval IO.println "bank-clean microshard: header elaborated"',
    )

    node_families: dict[int, DefinitionFamily] = {}
    cofactor_families: dict[int, DefinitionFamily] = {}
    family_records: list[dict[str, object]] = []
    terminal_pair_records: list[dict[str, object]] = []
    terminal_pair_theorem: str | None = None

    for merge in merges:
        node_id = int(merge["node_id"])
        left_id = int(merge["left_node_id"])
        right_id = int(merge["right_node_id"])
        for child_id in (left_id, right_id):
            if child_id < len(names):
                if child_id in cofactor_families:
                    raise ValueError(f"leaf {child_id} introduced twice")
                family = emit_polynomial_family(
                    writer,
                    prefix=f"cofactor{child_id}",
                    polynomial=multiplier_polynomials[child_id],
                    variables=variables,
                )
                cofactor_families[child_id] = family
                family_records.append(
                    {
                        "kind": "cofactor",
                        "id": child_id,
                        "aggregate": family.aggregate,
                        "part_count": len(family.parts),
                        "max_expression_bytes": max(family.expression_bytes),
                        "max_part_term_count": max(family.term_counts),
                        "max_part_tree_depth": max(
                            (count - 1).bit_length()
                            for count in family.term_counts
                        ),
                        "aggregate_node_count": len(family.aggregate_nodes),
                        "aggregate_level_count": 1
                        + max(node.level for node in family.aggregate_nodes),
                        "max_aggregate_child_count": max(
                            len(node.children) for node in family.aggregate_nodes
                        ),
                        "aggregate_tree_depth": max(
                            (len(node.children) - 1).bit_length()
                            for node in family.aggregate_nodes
                        ),
                    }
                )
        node_family = emit_polynomial_family(
            writer,
            prefix=f"relation{node_id}",
            polynomial=nodes[node_id],
            variables=variables,
            rendered_parts=aligned_parts_by_node.get(node_id),
        )
        node_families[node_id] = node_family
        family_records.append(
            {
                "kind": "relation",
                "id": node_id,
                "aggregate": node_family.aggregate,
                "part_count": len(node_family.parts),
                "max_expression_bytes": max(node_family.expression_bytes),
                "max_part_term_count": max(node_family.term_counts),
                "max_part_tree_depth": max(
                    (count - 1).bit_length()
                    for count in node_family.term_counts
                ),
                "aggregate_node_count": len(node_family.aggregate_nodes),
                "aggregate_level_count": 1
                + max(node.level for node in node_family.aggregate_nodes),
                "max_aggregate_child_count": max(
                    len(node.children) for node in node_family.aggregate_nodes
                ),
                "aggregate_tree_depth": max(
                    (len(node.children) - 1).bit_length()
                    for node in node_family.aggregate_nodes
                ),
                "support_size": len(nodes[node_id]),
                "polynomial_sha256": polynomial_sha256(nodes[node_id]),
            }
        )
        writer.command(
            f"progress:relation{node_id}:payload",
            f'#eval IO.println "bank-clean microshard: relation {node_id} payload ready"',
        )
        if node_id == int(root_merge["node_id"]):
            (
                terminal_pair_theorem,
                terminal_pair_records,
            ) = emit_terminal_pair_cancellation(
                writer,
                left_family=node_families[terminal_left_id],
                right_family=node_families[terminal_right_id],
                part_constants=terminal_part_constants,
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
            terminal_pair_theorem=(
                terminal_pair_theorem
                if node_id == int(root_merge["node_id"])
                else None
            ),
        )
        writer.command(
            f"progress:relation{node_id}:checked",
            f"#check weightedRelation{node_id}",
        )

    if set(cofactor_families) != set(range(15)):
        raise ValueError("merge tree did not introduce every cofactor exactly once")

    root_id = int(merges[-1]["node_id"])
    root_family = node_families[root_id]
    scalar_hypotheses = [
        f"    (p{STAGED.suffix(name)} : "
        f"{STAGED.lean_source_polynomial(generator)} = 0)"
        for name, generator in zip(names, generators)
    ]
    root_call = theorem_call(root_id, variables, leaves_by_node[root_id], names)
    writer.command(
        "theorem:normalized_bankClean15_scalar",
        "\n".join(
            (
                "private theorem normalized_bankClean15_scalar",
                f"    ({' '.join(variables)} : ℝ)",
                *scalar_hypotheses,
                "    : False := by",
                f"  have impossible := {root_call}",
                "  norm_num ["
                + ", ".join(root_family.simp_names)
                + "] at impossible",
            )
        ),
    )
    writer.command(
        "progress:scalar",
        "#check normalized_bankClean15_scalar",
    )

    writer.command(
        "theorem:bankClean15_dist_sq_coord",
        "\n".join(
            (
                "private theorem bankClean15_dist_sq_coord (x y : ℝ²) :",
                "    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by",
                "  rw [EuclideanSpace.dist_sq_eq]",
                "  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]",
            )
        ),
    )

    incompatible_lines = [
        "private theorem normalized_bankClean15_incompatible",
        f"    {{{' '.join(points)} : ℝ²}}",
    ]
    for name in names:
        incompatible_lines.append(
            f"    (h{STAGED.suffix(name)} : "
            f"{STAGED.distance_hypothesis(name, normalized=True)})"
        )
    incompatible_lines.append("    : False := by")
    for name, generator in zip(names, generators):
        incompatible_lines.extend(STAGED.mapping_steps(name, generator))
    scalar_arguments = " ".join(
        f"({variable} := {variable[:-1]} "
        f"{0 if variable[-1] == 'x' else 1})"
        for variable in variables
    )
    polynomial_arguments = " ".join(
        f"p{STAGED.suffix(name)}" for name in names
    )
    incompatible_lines.extend(
        (
            "  exact normalized_bankClean15_scalar",
            f"    {scalar_arguments}",
            f"    {polynomial_arguments}",
        )
    )
    writer.command(
        "theorem:normalized_bankClean15_incompatible",
        "\n".join(incompatible_lines),
    )
    writer.command(
        "progress:geometry_mapping",
        "#check normalized_bankClean15_incompatible",
    )

    anchor_lines = [
        "theorem bank_clean15_anchor_collision",
        f"    {{O A {' '.join(points)} : ℝ²}}",
    ]
    for name in names:
        anchor_lines.append(
            f"    (h{STAGED.suffix(name)} : "
            f"{STAGED.distance_hypothesis(name, normalized=False)})"
        )
    anchor_statement_sha256 = bytes_sha256(
        ("\n".join((*anchor_lines, "    : O = A")) + "\n").encode("utf-8")
    )
    anchor_lines.extend(
        (
            "    : O = A := by",
            "  by_contra hOA",
            "  let T : ℝ² → ℝ² := normSim O A",
        )
    )
    for name in points:
        anchor_lines.append(f"  let {name.lower()} := T {name}")
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
    named_points = " ".join(f"({name} := {name.lower()})" for name in points)
    anchor_lines.append(
        f"  apply normalized_bankClean15_incompatible {named_points}"
    )
    simpa_names = ", ".join(
        (*[name.lower() for name in points], "hT0", "hT1")
    )
    for name in names:
        anchor_lines.append(
            f"  · simpa [{simpa_names}] using "
            f"map_dist_eq h{STAGED.suffix(name)}"
        )
    writer.command(
        "theorem:bank_clean15_anchor_collision",
        "\n".join(anchor_lines),
    )
    writer.command(
        "progress:anchor_collision",
        "#check bank_clean15_anchor_collision",
    )

    false_lines = [
        "theorem false_of_bank_clean15_rows",
        f"    {{O A {' '.join(points)} : ℝ²}}",
        "    (hOA : O ≠ A)",
    ]
    for name in names:
        false_lines.append(
            f"    (h{STAGED.suffix(name)} : "
            f"{STAGED.distance_hypothesis(name, normalized=False)})"
        )
    false_statement_sha256 = bytes_sha256(
        ("\n".join((*false_lines, "    : False")) + "\n").encode("utf-8")
    )
    raw_arguments = " ".join(f"h{STAGED.suffix(name)}" for name in names)
    false_lines.extend(
        (
            "    : False := by",
            "  exact hOA (bank_clean15_anchor_collision "
            f"{raw_arguments})",
        )
    )
    writer.command(
        "theorem:false_of_bank_clean15_rows", "\n".join(false_lines)
    )
    writer.command(
        "axiom_audit:anchor",
        "#print axioms bank_clean15_anchor_collision",
    )
    writer.command(
        "axiom_audit:false",
        "#print axioms false_of_bank_clean15_rows",
    )
    writer.command(
        "progress:done",
        '#eval IO.println "bank-clean microshard: geometry consumers elaborated"',
    )
    writer.command("end", "end Problem97.ATailBankClean15Microsharded")

    source = writer.source()
    source_scan(source)
    max_command = max(writer.commands, key=lambda record: int(record["bytes"]))
    if int(max_command["bytes"]) > MAX_EMITTED_COMMAND_BYTES:
        raise ValueError(
            f"emitted command {max_command['label']} has {max_command['bytes']} "
            f"bytes, above hard limit {MAX_EMITTED_COMMAND_BYTES}"
        )
    command_sizes = sorted(int(record["bytes"]) for record in writer.commands)
    p95_index = max(0, (95 * len(command_sizes) + 99) // 100 - 1)
    metadata: dict[str, object] = {
        "commands": writer.commands,
        "command_count": len(writer.commands),
        "max_command": max_command,
        "max_command_bytes": int(max_command["bytes"]),
        "max_command_bytes_limit": MAX_EMITTED_COMMAND_BYTES,
        "p95_command_bytes": command_sizes[p95_index],
        "families": family_records,
        "family_count": len(family_records),
        "definition_part_count": sum(
            int(record["part_count"]) for record in family_records
        ),
        "max_polynomial_expression_bytes": max(
            int(record["max_expression_bytes"]) for record in family_records
        ),
        "max_polynomial_part_term_count": max(
            int(record["max_part_term_count"]) for record in family_records
        ),
        "max_polynomial_part_tree_depth": max(
            int(record["max_part_tree_depth"]) for record in family_records
        ),
        "max_aggregate_tree_depth": max(
            int(record["aggregate_tree_depth"]) for record in family_records
        ),
        "max_aggregate_child_count": max(
            int(record["max_aggregate_child_count"])
            for record in family_records
        ),
        "max_aggregate_level_count": max(
            int(record["aggregate_level_count"]) for record in family_records
        ),
        "balanced_expression_trees": True,
        "polynomial_atom_limit": MAX_POLYNOMIAL_ATOMS,
        "aggregate_atom_limit": MAX_AGGREGATE_ATOMS,
        "terminal_pair_cancellation": {
            "left_node_id": terminal_left_id,
            "right_node_id": terminal_right_id,
            "aligned_part_count": len(terminal_part_constants),
            "constant_part_count": sum(terminal_part_constants),
            "final_theorem": terminal_pair_theorem,
            "records": terminal_pair_records,
            "largest_child_count": max(
                int(record["child_count"]) for record in terminal_pair_records
            ),
        },
        "progress_marker_count": sum(
            1
            for record in writer.commands
            if str(record["label"]).startswith("progress:")
        ),
        "geometry_statement_sha256": {
            "bank_clean15_anchor_collision": anchor_statement_sha256,
            "false_of_bank_clean15_rows": false_statement_sha256,
        },
    }
    return source, metadata


def build() -> tuple[bytes, dict[str, object]]:
    require_hash(CERTIFICATE, EXPECTED_CERTIFICATE_SHA256, "certificate")
    require_hash(
        MERGE_ANALYSIS, EXPECTED_MERGE_ANALYSIS_SHA256, "merge analysis"
    )
    require_hash(CORE, EXPECTED_CORE_SHA256, "fifteen-core record")
    certificate = json.loads(CERTIFICATE.read_text(encoding="utf-8"))
    analysis = json.loads(MERGE_ANALYSIS.read_text(encoding="utf-8"))
    if certificate["schema"] != EXPECTED_SCHEMA:
        raise ValueError("unexpected certificate schema")
    if analysis["schema"] != EXPECTED_MERGE_SCHEMA:
        raise ValueError("unexpected merge-analysis schema")
    if certificate["raw_identity_sha256"] != EXPECTED_RAW_IDENTITY_SHA256:
        raise ValueError("certificate identity hash drift")
    if (
        certificate["source_polynomial_sha256"]
        != EXPECTED_SOURCE_POLYNOMIAL_SHA256
    ):
        raise ValueError("source polynomial hash drift")
    if int(certificate["multiplier_term_count"]) != EXPECTED_MULTIPLIER_TERM_COUNT:
        raise ValueError("multiplier term count drift")

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
        STAGED.parse_sparse(text, variables, variable_index)
        for text in generators
    ]
    multiplier_polynomials = [
        STAGED.parse_sparse(text, variables, variable_index)
        for text in raw_multipliers
    ]
    products = [
        STAGED.multiply_sparse(multiplier, generator)
        for multiplier, generator in zip(
            multiplier_polynomials, generator_polynomials
        )
    ]
    if [len(product) for product in products] != analysis["product_support_sizes"]:
        raise ValueError("exact product support stream drift")

    nodes: dict[int, SparsePolynomial] = {
        index: product for index, product in enumerate(products)
    }
    leaves_by_node: dict[int, tuple[int, ...]] = {
        index: (index,) for index in range(15)
    }
    node_records: list[dict[str, object]] = []
    for merge in merge_plan["merges"]:
        node_id = int(merge["node_id"])
        left_id = int(merge["left_node_id"])
        right_id = int(merge["right_node_id"])
        if node_id in nodes or left_id not in nodes or right_id not in nodes:
            raise ValueError(f"malformed merge node {node_id}")
        polynomial = STAGED.add_sparse(nodes[left_id], nodes[right_id])
        leaves = tuple(
            sorted(leaves_by_node[left_id] + leaves_by_node[right_id])
        )
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
    if not STAGED.is_one(nodes[root_id], len(variables)):
        raise ValueError("exact microsharded replay did not finish at one")
    if leaves_by_node[root_id] != tuple(range(15)):
        raise ValueError("root does not consume all fifteen relations")

    source, emission = emit_source(certificate, analysis, nodes, leaves_by_node)
    manifest: dict[str, object] = {
        "schema": "p97-bank-clean-15-microsharded-lean-emission-v3",
        "certificate": str(CERTIFICATE.relative_to(REPO)),
        "certificate_sha256": EXPECTED_CERTIFICATE_SHA256,
        "certificate_raw_identity_sha256": EXPECTED_RAW_IDENTITY_SHA256,
        "certificate_source_polynomial_sha256": (
            EXPECTED_SOURCE_POLYNOMIAL_SHA256
        ),
        "merge_analysis": str(MERGE_ANALYSIS.relative_to(REPO)),
        "merge_analysis_sha256": EXPECTED_MERGE_ANALYSIS_SHA256,
        "core": str(CORE.relative_to(REPO)),
        "core_sha256": EXPECTED_CORE_SHA256,
        "staged_helper_generator": str(STAGED_GENERATOR.relative_to(REPO)),
        "staged_helper_generator_sha256": EXPECTED_STAGED_GENERATOR_SHA256,
        "generator": str(Path(__file__).resolve().relative_to(REPO)),
        "generator_sha256": file_sha256(Path(__file__).resolve()),
        "variables": variables,
        "generator_names": names,
        "tree_strategy": EXPECTED_TREE_STRATEGY,
        "tree_height": EXPECTED_TREE_HEIGHT,
        "peak_support_including_leaves": EXPECTED_PEAK_SUPPORT,
        "exact_final_identity_replayed": True,
        "root_node_id": root_id,
        "root_polynomial_sha256": polynomial_sha256(nodes[root_id]),
        "nodes": node_records,
        "polynomial_expression_budget_bytes": MAX_POLYNOMIAL_EXPRESSION_BYTES,
        "polynomial_atom_limit": MAX_POLYNOMIAL_ATOMS,
        "aggregate_atom_limit": MAX_AGGREGATE_ATOMS,
        "emission": emission,
        "output": str(OUTPUT.relative_to(REPO)),
        "output_bytes": len(source),
        "output_sha256": bytes_sha256(source),
        "source_scan": {
            "sorry": False,
            "admit": False,
            "native_decide": False,
            "axiom_declaration": False,
        },
        "proof_shape": (
            "pinned staged merge tree with atom-and-byte-bounded balanced "
            "polynomial leaves, bounded multilevel aggregates, paired local "
            "terminal cancellation, explicit simp-only normalizers, and "
            "geometry adapters"
        ),
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
    emission = manifest["emission"]
    print(
        json.dumps(
            {
                "check": args.check,
                "exact_final_identity_replayed": True,
                "manifest": str(args.manifest),
                "max_command": emission["max_command"],
                "max_command_bytes": emission["max_command_bytes"],
                "output": str(args.output),
                "output_bytes": len(source),
                "output_sha256": bytes_sha256(source),
                "progress_marker_count": emission["progress_marker_count"],
                "tree_height": EXPECTED_TREE_HEIGHT,
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
