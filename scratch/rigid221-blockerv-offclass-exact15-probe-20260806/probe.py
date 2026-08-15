"""Exact-15 necessary-incidence probe for the active Rigid221 BlockerV leaf.

This is a theorem-discovery probe, not a Euclidean realization checker.  It
adds only source-entitled consequences: the exact cap profile, full deletion
cover, selected-row cap bounds, ordered-cap localization, exact physical
five-class pair capacity, and the named blocker-row traces.
"""

from __future__ import annotations

import json
import subprocess
import sys
from itertools import combinations
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[2]))

from census.card_head.candidate_surface import build_model
from census.card_head.sat_encoding import CoverInstance

N = 15
# candidate_surface order is (surplus, theorem opp2, theorem opp1).
PROFILE = (5, 9, 4)
PHYS = 1
LEFT_ENDPOINT, RIGHT_ENDPOINT = 0, 2

# The seven strict theorem-opp2-cap points exhaust that interior at n = 15.
U, XU, V, XV, DELETED, C, E = range(6, 13)
CLASS = frozenset((U, XU, DELETED, V, XV))
INTERIOR = frozenset((U, XU, V, XV, DELETED, C, E))
CAP = frozenset((LEFT_ENDPOINT, RIGHT_ENDPOINT, *INTERIOR))

# The five source-proved bisections leave two cyclic orders up to reversal.
ORDERS = (
    (U, V, C, DELETED, XV, E, XU),
    (U, V, C, DELETED, E, XV, XU),
)


def choices(instance: CoverInstance, center: int, pred) -> list[int]:
    return [
        instance.choice_variables[(center, index)]
        for index, row in enumerate(instance.candidates[center])
        if pred(set(row))
    ]


def require_some(instance: CoverInstance, variables: list[int], label: str) -> None:
    if not variables:
        raise RuntimeError(f"empty allowed choices: {label}")
    instance.cnf.add_clause(variables)


def require_one(instance: CoverInstance, variables: list[int], label: str) -> None:
    require_some(instance, variables, label)
    instance.cnf.at_most_sinz(variables, 1)


def between(order: tuple[int, ...], center: int, left: int, right: int) -> bool:
    pos = {point: index for index, point in enumerate(order)}
    return (pos[left] < pos[center] < pos[right]) or (
        pos[right] < pos[center] < pos[left]
    )


def build(order: tuple[int, ...]):
    model = build_model(N, PROFILE)
    if tuple(model.interiors[1]) != tuple(range(6, 13)):
        raise RuntimeError(f"unexpected theorem-opp2 labels: {model.interiors[1]}")
    if model.caps[1] != CAP:
        raise RuntimeError(f"unexpected theorem-opp2 cap: {model.caps[1]}")
    instance = CoverInstance(model)

    # Minimality supplies an actual blocker for every deleted source.  The
    # physical apex is excluded because its displayed radius has five hits.
    for source in range(N):
        require_some(
            instance,
            [
                instance.choice_variables[(center, index)]
                for center in range(N)
                if center != PHYS
                for index, row in enumerate(instance.candidates[center])
                if source in row
            ],
            f"deletion cover for source {source}",
        )

    # A selected four-subclass witnesses the physical five-class, while the
    # full class consumes one of the two possible centers for every class pair.
    require_some(
        instance,
        choices(instance, PHYS, lambda row: row <= CLASS),
        "physical-apex four-subclass",
    )
    for center in range(N):
        if center == PHYS:
            continue
        for index, row in enumerate(instance.candidates[center]):
            if len(set(row) & CLASS) > 2:
                instance.cnf.add_clause(
                    (-instance.choice_variables[(center, index)],)
                )
    for pair in combinations(sorted(CLASS), 2):
        hits: list[int] = []
        required = set(pair)
        for center in range(N):
            if center != PHYS:
                hits.extend(
                    choices(instance, center, lambda row, p=required: p <= row)
                )
        instance.cnf.at_most_sinz(hits, 1)

    # Every selected row centered in a cap has at most two cap hits.  On the
    # exact ordered opp2 cap, two hits must straddle their center.
    full_order = (LEFT_ENDPOINT, *order, RIGHT_ENDPOINT)
    for cap in model.caps:
        for center in cap:
            for index, row in enumerate(instance.candidates[center]):
                if len(set(row) & cap) > 2:
                    instance.cnf.add_clause(
                        (-instance.choice_variables[(center, index)],)
                    )
    for center in CAP:
        for index, row in enumerate(instance.candidates[center]):
            hits = tuple(sorted(set(row) & CAP, key=full_order.index))
            if len(hits) == 2 and not between(full_order, center, hits[0], hits[1]):
                instance.cnf.add_clause(
                    (-instance.choice_variables[(center, index)],)
                )

    traces = {
        U: {U, XU},
        XV: {U, XV},
        V: {V, XV},
        XU: {XU, DELETED},
        DELETED: {DELETED, V},
        C: None,
    }
    blocker: dict[tuple[int, int], int] = {}
    for source in traces:
        variables: list[int] = []
        for center in range(N):
            if center in (source, PHYS):
                continue
            variable = instance.cnf.new_variable()
            blocker[(source, center)] = variable
            variables.append(variable)
            rows = choices(instance, center, lambda row, q=source: q in row)
            if rows:
                instance.cnf.add_clause((-variable, *rows))
            else:
                instance.cnf.add_clause((-variable,))
        require_one(instance, variables, f"blocker of source {source}")

    fixed = ((U, XV), (XV, V), (V, DELETED), (DELETED, C), (XU, E))
    for source, center in fixed:
        instance.cnf.add_clause((blocker[(source, center)],))

    for source, wanted in traces.items():
        for center in range(N):
            variable = blocker.get((source, center))
            if variable is None:
                continue
            for index, row in enumerate(instance.candidates[center]):
                class_hits = set(row) & CLASS
                trace_ok = len(class_hits) <= 1 if wanted is None else class_hits == wanted
                if source not in row or not trace_ok:
                    instance.cnf.add_clause(
                        (-variable, -instance.choice_variables[(center, index)])
                    )
    return model, instance, blocker, full_order


def parse_assignment(stdout: str, n_variables: int) -> tuple[set[int], dict[int, bool]]:
    signed = [
        int(token)
        for line in stdout.splitlines()
        if line.startswith("v ")
        for token in line[2:].split()
        if int(token) != 0
    ]
    values: dict[int, bool] = {}
    for literal in signed:
        variable = abs(literal)
        value = literal > 0
        if variable in values and values[variable] != value:
            raise RuntimeError(f"contradictory assignment for variable {variable}")
        values[variable] = value
    expected = set(range(1, n_variables + 1))
    if set(values) != expected:
        missing = sorted(expected - set(values))[:10]
        raise RuntimeError(f"incomplete assignment; first missing variables: {missing}")
    return {variable for variable, value in values.items() if value}, values


def validate_sat(
    instance: CoverInstance,
    blocker: dict[tuple[int, int], int],
    full_order: tuple[int, ...],
    stdout: str,
):
    positive, values = parse_assignment(stdout, instance.cnf.n_variables)
    for clause_index, clause in enumerate(instance.cnf.clauses):
        if not any(values[abs(literal)] == (literal > 0) for literal in clause):
            raise RuntimeError(f"SAT assignment falsifies clause {clause_index}")
    rows = instance.decode_model(positive)
    for source in range(N):
        if not any(source in row for center, row in rows.items() if center != PHYS):
            raise RuntimeError(f"decoded rows do not cover source {source}")
    for center in CAP:
        hits = sorted(set(rows[center]) & CAP, key=full_order.index)
        if len(hits) > 2:
            raise RuntimeError(f"center {center} has too many opp2-cap hits")
        if len(hits) == 2 and not between(full_order, center, hits[0], hits[1]):
            raise RuntimeError(f"center {center} violates ordered-cap localization")
    decoded_blockers = {
        source: next(
            center
            for center in range(N)
            if blocker.get((source, center)) in positive
        )
        for source in (U, XU, V, XV, DELETED, C)
    }
    return rows, decoded_blockers


def solve(order_index: int, order: tuple[int, ...]) -> dict[str, object]:
    _model, instance, blocker, full_order = build(order)
    base = Path(__file__).with_name(f"order{order_index}")
    cnf_path = base.with_suffix(".cnf")
    clauses = instance.cnf.clauses
    cnf_path.write_text(
        f"p cnf {instance.cnf.n_variables} {len(clauses)}\n"
        + "\n".join(" ".join(map(str, clause)) + " 0" for clause in clauses)
        + "\n",
        encoding="utf-8",
    )
    run = subprocess.run(
        ["cadical", "-q", "-t", "120", str(cnf_path)],
        capture_output=True,
        text=True,
        timeout=150,
        check=False,
    )
    base.with_suffix(".solver.log").write_text(
        run.stdout + run.stderr, encoding="utf-8"
    )
    status = "SAT" if run.returncode == 10 else "UNSAT" if run.returncode == 20 else f"ERR{run.returncode}"
    result: dict[str, object] = {
        "status": status,
        "order_index": order_index,
        "strict_interior_order": list(order),
        "variables": instance.cnf.n_variables,
        "clauses": len(clauses),
    }
    if status == "SAT":
        rows, decoded_blockers = validate_sat(instance, blocker, full_order, run.stdout)
        result["rows"] = {str(center): row for center, row in rows.items()}
        result["blockers"] = {
            str(source): center for source, center in decoded_blockers.items()
        }
    return result


def main() -> int:
    results = [solve(index, order) for index, order in enumerate(ORDERS)]
    document = {
        "scope": "exact-15 necessary incidence and ordered-cap consequences; not Euclidean realizability or universal closure",
        "cardinality": N,
        "profile": list(PROFILE),
        "physical_apex": PHYS,
        "roles": {
            "u": U,
            "xu": XU,
            "v": V,
            "xv": XV,
            "deleted": DELETED,
            "c": C,
            "e": E,
        },
        "results": results,
    }
    Path(__file__).with_suffix(".json").write_text(
        json.dumps(document, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps(document, sort_keys=True))
    return 0 if all(result["status"] in ("SAT", "UNSAT") for result in results) else 1


if __name__ == "__main__":
    raise SystemExit(main())
