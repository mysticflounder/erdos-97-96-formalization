#!/usr/bin/env python3
"""Emit the finite U3 audit frame as piqd's LeanSatIr JSON.

This is the finite normal-form exporter for the already-explicit U3 audit
frame.  It intentionally does not encode Euclidean realizability, metric
equalities, classAt, or the universal source theorem.  Those are ingress
obligations, not Boolean guesses.

The output is a closed formula over the finite domain ``I = Fin n``.  It uses
the same-index dangerous-circle distribution and the outside-support witness
as the corrected v10 emitter, but lets piqd-encoder perform the CNF lowering.
"""

from __future__ import annotations

import argparse
import json
from itertools import combinations
from pathlib import Path
from typing import Any

DOMAIN = "I"
POINTS = ("q", "p", "t1", "t2", "t3", "u", "a0", "a1")
CENTERS = ("u", "a0", "a1", "t1", "t2", "t3")


def atom(name: str, index: int) -> dict[str, Any]:
    return {"Pred": {"name": name, "args": [{"Lit": {"domain": DOMAIN, "value": index}}]}}


def neg(expr: dict[str, Any]) -> dict[str, Any]:
    return {"Not": expr}


def conjunction(expressions: list[dict[str, Any]]) -> dict[str, Any]:
    if not expressions:
        return {"Const": True}
    if len(expressions) == 1:
        return expressions[0]
    midpoint = len(expressions) // 2
    return {
        "And": [
            conjunction(expressions[:midpoint]),
            conjunction(expressions[midpoint:]),
        ]
    }


def disjunction(expressions: list[dict[str, Any]]) -> dict[str, Any]:
    if not expressions:
        return {"Const": False}
    if len(expressions) == 1:
        return expressions[0]
    midpoint = len(expressions) // 2
    return {
        "Or": [
            disjunction(expressions[:midpoint]),
            disjunction(expressions[midpoint:]),
        ]
    }


def exactly(name: str, cardinality: int, n: int) -> dict[str, Any]:
    """Finite cardinality formula, expanded over the declared Fin n domain."""
    at_least = []
    for subset in combinations(range(n), cardinality):
        at_least.append(conjunction([atom(name, index) for index in subset]))
    at_most = []
    for subset in combinations(range(n), cardinality + 1):
        at_most.append(disjunction([neg(atom(name, index)) for index in subset]))
    return conjunction([disjunction(at_least), conjunction(at_most)])


def variable(name: str) -> dict[str, Any]:
    return {"Var": name}


def literal(index: int) -> dict[str, Any]:
    return {"Lit": {"domain": DOMAIN, "value": index}}


def application(function: str, arguments: list[dict[str, Any]]) -> dict[str, Any]:
    return {"App": {"fn": function, "args": arguments}}


def equality(left: dict[str, Any], right: dict[str, Any]) -> dict[str, Any]:
    return {"Eq": [left, right]}


def forall(name: str, domain: str, body: dict[str, Any]) -> dict[str, Any]:
    return {"Forall": {"var": name, "domain": domain, "body": body}}


def member(selector: str, slot_domain: str, slot_card: int, point: dict[str, Any]) -> dict[str, Any]:
    return disjunction(
        [
            equality(
                application(selector, [{"Lit": {"domain": slot_domain, "value": slot}}]),
                point,
            )
            for slot in range(slot_card)
        ]
    )


def selector_constraints(
    selector: str,
    slot_domain: str,
    slot_card: int,
    allowed_points: list[dict[str, Any]],
) -> list[dict[str, Any]]:
    slot = variable(f"{selector}_slot")
    left = variable(f"{selector}_left")
    right = variable(f"{selector}_right")
    image = application(selector, [slot])
    subset = forall(
        f"{selector}_slot",
        slot_domain,
        disjunction([equality(image, point) for point in allowed_points]),
    )
    injective = forall(
        f"{selector}_left",
        slot_domain,
        forall(
            f"{selector}_right",
            slot_domain,
            {"Imp": [
                neg(equality(left, right)),
                neg(equality(application(selector, [left]), application(selector, [right]))),
            ]},
        ),
    )
    return [subset, injective]


def selector_ir(n: int) -> dict[str, Any]:
    point_functions = [f"point_{name}" for name in POINTS]
    row_functions = {center: f"row_{center}" for center in CENTERS}
    selector_specs = {
        "dangerous_base": ("S4", 4),
        "bounded_support": ("S8", 8),
        **{name: ("S4", 4) for name in row_functions.values()},
    }
    functions = [
        {"name": name, "args": [], "codomain": DOMAIN} for name in point_functions
    ]
    functions.extend(
        {"name": name, "args": [slot_domain], "codomain": DOMAIN}
        for name, (slot_domain, _slot_card) in selector_specs.items()
    )
    point_terms = {
        name: application(f"point_{name}", []) for name in POINTS
    }
    clauses: list[dict[str, Any]] = []

    for left, right in combinations(POINTS, 2):
        clauses.append(neg(equality(point_terms[left], point_terms[right])))

    dangerous = "dangerous_base"
    bounded = "bounded_support"
    clauses.extend(
        selector_constraints(
            dangerous,
            "S4",
            4,
            [point_terms[name] for name in ("q", "t1", "t2", "t3")],
        )
    )
    clauses.extend(selector_constraints(bounded, "S8", 8, [literal(i) for i in range(n)]))

    # Each q-deleted row is an injective four-point selector, omits q and its
    # own center, and has no three points in the same dangerous base.
    for center, row in row_functions.items():
        clauses.extend(selector_constraints(row, "S4", 4, [literal(i) for i in range(n)]))
        clauses.append(neg(member(row, "S4", 4, point_terms["q"])))
        clauses.append(neg(member(row, "S4", 4, point_terms[center])))
        i = variable(f"{row}_i")
        j = variable(f"{row}_j")
        k = variable(f"{row}_k")
        distinct = conjunction(
            [
                neg(equality(i, j)),
                neg(equality(i, k)),
                neg(equality(j, k)),
            ]
        )
        overlap = conjunction(
            [
                member(row, "S4", 4, i),
                member(row, "S4", 4, j),
                member(row, "S4", 4, k),
                member(dangerous, "S4", 4, i),
                member(dangerous, "S4", 4, j),
                member(dangerous, "S4", 4, k),
            ]
        )
        clauses.append(
            forall(
                f"{row}_i",
                DOMAIN,
                forall(
                    f"{row}_j",
                    DOMAIN,
                    forall(f"{row}_k", DOMAIN, neg(conjunction([distinct, overlap]))),
                ),
            )
        )

    outside = []
    for center, row in row_functions.items():
        outside.extend(
            conjunction(
                [
                    member(row, "S4", 4, literal(index)),
                    neg(member(bounded, "S8", 8, literal(index))),
                ]
            )
            for index in range(n)
        )
    clauses.append(disjunction(outside))

    return {
        "ir_version": 1,
        "source": {
            "module": "Erdos9796Proof.P97.ATail.TwoSourceFreshThirdU3",
            "decl": "SixSurvivorU3ExactRadiusAuditObstruction",
        },
        "query": "FindModel",
        "domains": [
            {"name": DOMAIN, "card": n},
            {"name": "S4", "card": 4},
            {"name": "S8", "card": 8},
        ],
        "functions": functions,
        "predicates": [],
        "bool_atoms": [],
        "formula": conjunction(clauses),
    }


def ir(n: int) -> dict[str, Any]:
    predicates = [{"name": f"point_{name}", "args": [DOMAIN]} for name in POINTS]
    predicates += [
        {"name": "dangerous_base", "args": [DOMAIN]},
        {"name": "bounded_support", "args": [DOMAIN]},
    ]
    predicates += [
        {"name": f"row_{center}", "args": [DOMAIN]} for center in CENTERS
    ]

    clauses: list[dict[str, Any]] = []
    clauses.extend(exactly(f"point_{name}", 1, n) for name in POINTS)
    clauses.append(exactly("dangerous_base", 4, n))
    clauses.append(exactly("bounded_support", 8, n))
    clauses.extend(exactly(f"row_{center}", 4, n) for center in CENTERS)

    # The eight named carrier roles are distinct.  This is the finite
    # membership form of the U3 audit frame's distinctness field.
    for left, right in combinations(POINTS, 2):
        clauses.extend(
            neg(conjunction([atom(f"point_{left}", index), atom(f"point_{right}", index)]))
            for index in range(n)
        )

    # q's dangerous base is exactly q ∪ {t1,t2,t3}; no alias or fresh class is
    # invented here.
    for index in range(n):
        clauses.append(
            disjunction(
                [
                    neg(atom("dangerous_base", index)),
                    atom("point_q", index),
                    atom("point_t1", index),
                    atom("point_t2", index),
                    atom("point_t3", index),
                ]
            )
        )
        clauses.append(
            conjunction(
                [
                    disjunction([neg(atom(f"point_{name}", index)), atom("dangerous_base", index)])
                    for name in ("q", "t1", "t2", "t3")
                ]
            )
        )

    # Every audit row is q-deleted and omits its own center.  The dangerous
    # distribution uses the same three indices on both sides.
    for center in CENTERS:
        for index in range(n):
            clauses.append(
                disjunction([neg(atom("point_q", index)), neg(atom(f"row_{center}", index))])
            )
            clauses.append(
                disjunction(
                    [neg(atom(f"point_{center}", index)), neg(atom(f"row_{center}", index))]
                )
            )
        for triple in combinations(range(n), 3):
            clauses.append(
                disjunction(
                    [
                        *[neg(atom(f"row_{center}", index)) for index in triple],
                        *[neg(atom("dangerous_base", index)) for index in triple],
                    ]
                )
            )

    # At least one of the six q-deleted exact-four rows escapes the bounded
    # eight-point support.  This is the U3 obstruction arm, not a theorem that
    # the arm is always realized in Euclidean space.
    outside_rows = []
    for center in CENTERS:
        outside_rows.append(
            [
                conjunction(
                    [
                        atom(f"row_{center}", index),
                        neg(atom("bounded_support", index)),
                    ]
                )
                for index in range(n)
            ]
        )
    clauses.append(disjunction([disjunction(row) for row in outside_rows]))

    return {
        "ir_version": 1,
        "source": {
            "module": "Erdos9796Proof.P97.ATail.TwoSourceFreshThirdU3",
            "decl": "SixSurvivorU3ExactRadiusAuditObstruction",
        },
        "query": "FindModel",
        "domains": [{"name": DOMAIN, "card": n}],
        "functions": [],
        "predicates": predicates,
        "bool_atoms": [],
        "formula": conjunction(clauses),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--n", type=int, default=17)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--mode", choices=("selector", "explicit"), default="selector")
    args = parser.parse_args()
    if args.n < 8:
        raise SystemExit("n must be at least 8 for the named U3 frame")
    args.output.parent.mkdir(parents=True, exist_ok=True)
    exported = selector_ir(args.n) if args.mode == "selector" else ir(args.n)
    args.output.write_text(json.dumps(exported, sort_keys=True, separators=(",", ":")) + "\n")


if __name__ == "__main__":
    main()
