"""Build the exact QF_NRA realizability query for the card-14 survivor.

The input is the authenticated PIQD SAT model for the
``firstOppositeO1Six`` equality pattern.  The output asks only whether all
positive distance equalities in that model can coexist with the recorded
strict cyclic order.  Negative Boolean literals are deliberately omitted:
this is a weaker geometric feasibility test and therefore an UNSAT result is
useful diagnostically, while SAT is not a Problem 97 counterexample.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections.abc import Iterable
from itertools import combinations
from pathlib import Path
from typing import Any

from census.card_head import dr_two_radius_arm_structural as structural

SCHEMA = "p97-dr-card14-positive-equality-qfnra/v1"
PIQD_MODEL_SHA256 = "83ee49add8d665afc6e785ea053aa26dfd25b8230cf23aeeab2acd81939817d5"
MODEL_FILE_SHA256 = "03166e4a947c0b66559edb8732a91828ad5a4e0ff5efb8a90e91e0959c233d84"
SOURCE_RECEIPT_SHA256 = "f36341dd68de5fc605da15ac3f8b393caec9415965ab135f4a2959d2e8e0a2f3"
SOURCE_JOB_ID = "2c036e4c-d8ce-4d0a-a6ed-e4465569207e"
SOURCE_VARIABLE_COUNT = 14_313
PROFILE = structural.profile_for(14, "firstOppositeO1Six")


class MetricRealizabilityError(RuntimeError):
    """The source model or generated query failed a closed check."""


def canonical_json(value: object) -> bytes:
    return json.dumps(
        value, ensure_ascii=True, allow_nan=False, sort_keys=True, separators=(",", ":")
    ).encode("utf-8")


def sha256(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def self_hash(value: dict[str, Any], field: str) -> str:
    return sha256(canonical_json({key: item for key, item in value.items() if key != field}))


def load_assignment(path: Path) -> tuple[int, ...]:
    payload = path.read_bytes()
    if sha256(payload) != MODEL_FILE_SHA256:
        raise MetricRealizabilityError("source model SHA-256 mismatch")
    try:
        record = json.loads(payload)
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise MetricRealizabilityError("source model is not valid JSON") from exc
    if record.get("job_id") != SOURCE_JOB_ID or record.get("result") != "SAT":
        raise MetricRealizabilityError("source model identity or verdict mismatch")
    assignment = record.get("assignment")
    if not isinstance(assignment, list) or not all(type(item) is int for item in assignment):
        raise MetricRealizabilityError("source assignment is not an integer list")
    literals = tuple(assignment)
    if sorted(abs(item) for item in literals) != list(range(1, len(literals) + 1)):
        raise MetricRealizabilityError("source assignment is not total and unique")
    return literals


def positive_equalities(assignment: tuple[int, ...]) -> tuple[tuple[tuple[int, int], tuple[int, int]], ...]:
    if len(assignment) != SOURCE_VARIABLE_COUNT:
        raise MetricRealizabilityError("source assignment length mismatch")
    # ``dr_two_radius_arm_structural.build`` allocates every unordered pair of
    # edges first, in this exact lexicographic order.  Avoid rebuilding its
    # million-clause geometry layer merely to recover that frozen prefix.
    edges = structural.edges_of(PROFILE)
    result = []
    for variable, (left, right) in enumerate(combinations(range(len(edges)), 2), start=1):
        if assignment[variable - 1] > 0:
            result.append((edges[left], edges[right]))
    return tuple(result)


def equality_basis(
    equalities: Iterable[tuple[tuple[int, int], tuple[int, int]]],
) -> tuple[tuple[tuple[int, int], tuple[int, int]], ...]:
    """Replace each equality component by a star, preserving it exactly."""

    adjacency: dict[tuple[int, int], set[tuple[int, int]]] = {}
    for left, right in equalities:
        adjacency.setdefault(left, set()).add(right)
        adjacency.setdefault(right, set()).add(left)
    seen: set[tuple[int, int]] = set()
    basis = []
    for start in sorted(adjacency):
        if start in seen:
            continue
        stack = [start]
        component = []
        seen.add(start)
        while stack:
            current = stack.pop()
            component.append(current)
            for neighbor in adjacency[current]:
                if neighbor not in seen:
                    seen.add(neighbor)
                    stack.append(neighbor)
        anchor, *rest = sorted(component)
        basis.extend((anchor, edge) for edge in rest)
    return tuple(basis)


def squared_distance(edge: tuple[int, int]) -> str:
    left, right = edge
    return f"(+ (* (- x{left} x{right}) (- x{left} x{right})) (* (- y{left} y{right}) (- y{left} y{right})))"


def signed_area(a: int, b: int, c: int) -> str:
    return f"(- (* (- x{b} x{a}) (- y{c} y{a})) (* (- y{b} y{a}) (- x{c} x{a})))"


def build_journal(equalities: Iterable[tuple[tuple[int, int], tuple[int, int]]]) -> tuple[bytes, dict[str, int]]:
    # PIQD owns ``:produce-models`` and rejects clients that override it.
    lines = ["(set-logic QF_NRA)"]
    for label in PROFILE.labels:
        lines.extend((f"(declare-fun x{label} () Real)", f"(declare-fun y{label} () Real)"))
    lines.extend(("(assert (= x0 0))", "(assert (= y0 0))", "(assert (= x1 1))", "(assert (= y1 0))"))
    equality_count = 0
    for first, second in equalities:
        lines.append(f"(assert (= {squared_distance(first)} {squared_distance(second)}))")
        equality_count += 1
    order = PROFILE.cyclic_order
    convexity_count = 0
    for index, a in enumerate(order):
        b = order[(index + 1) % len(order)]
        for c in order:
            if c not in (a, b):
                lines.append(f"(assert (> {signed_area(a, b, c)} 0))")
                convexity_count += 1
    journal = ("\n".join(lines) + "\n").encode("ascii")
    if b"check-sat" in journal or b"get-model" in journal:
        raise MetricRealizabilityError("journal must contain state commands only")
    return journal, {
        "declarations": 2 * PROFILE.card,
        "gauge_equalities": 4,
        "positive_distance_equalities": equality_count,
        "strict_convexity_atoms": convexity_count,
    }


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--model", type=Path, required=True)
    parser.add_argument("--smt2", type=Path, required=True)
    parser.add_argument("--descriptor", type=Path, required=True)
    args = parser.parse_args(argv)
    assignment = load_assignment(args.model)
    raw_equalities = positive_equalities(assignment)
    equalities = equality_basis(raw_equalities)
    journal, counts = build_journal(equalities)
    counts["source_positive_distance_equalities"] = len(raw_equalities)
    args.smt2.parent.mkdir(parents=True, exist_ok=True)
    args.smt2.write_bytes(journal)
    descriptor: dict[str, Any] = {
        "schema": SCHEMA,
        "claim_boundary": {
            "diagnostic_only": True,
            "negative_equalities_asserted": False,
            "problem97_counterexample": False,
            "kernel_checked": False,
        },
        "profile": PROFILE.payload(),
        "source": {
            "job_id": SOURCE_JOB_ID,
            "model_file_sha256": MODEL_FILE_SHA256,
            "piqd_model_sha256": PIQD_MODEL_SHA256,
            "prior_result_receipt_sha256": SOURCE_RECEIPT_SHA256,
        },
        "constraint_counts": counts,
        "smt2": {"bytes": len(journal), "sha256": sha256(journal)},
        "positive_equality_sample": [list(map(list, pair)) for pair in equalities[:20]],
        "descriptor_sha256": "",
    }
    descriptor["descriptor_sha256"] = self_hash(descriptor, "descriptor_sha256")
    args.descriptor.write_bytes(canonical_json(descriptor) + b"\n")
    print(json.dumps({"counts": counts, "descriptor_sha256": descriptor["descriptor_sha256"], "smt2_sha256": sha256(journal)}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
