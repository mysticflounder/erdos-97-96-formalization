"""Measure the rotated-partner core-pair orbit (22nd-bank design orbit).

The unrestricted two-core orbit and the shared-five-label orbit are both far
too large to install as a bank (415,522 fresh shared-five clauses, of which
exactly one is realized in the authenticated v25 survivor).  This script
measures the tight family the v25 witness actually inhabits.

The two mined v25 cores are not an arbitrary pair: the second is the first
with the three labels in the ``a``, ``x`` and ``c`` slots rotated, and ``b``
and ``y`` fixed.  Writing a core as ``(a, b, c, x, y)``, the partner is

    partner(a, b, c, x, y) = (x, b, a, c, y)

so the family is parametrized by ONE five-label assignment, exactly like the
installed banks, and the pair is derived rather than quantified.  Its union
rows are

    (x, {a, b}), (y, {a, b, x}), (c, {b, x, y}), (a, {b, c, y})

— one pair and three triples, every arity at or below three, so the installed
membership-requirement machinery needs no new arity.

Reported: the admissible orbit, the delta against the installed 21st bank,
the realizable sub-orbit, and the v25 witness check.

Measurement only.  Nothing is proved or frozen here.
"""

from __future__ import annotations

import argparse
import collections
import itertools
import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))

import measure_two_core_disjunction_orbit as base  # noqa: E402


def partner(core: tuple[int, int, int, int, int]) -> tuple[int, int, int, int, int]:
    """The rotated partner core: labels in the a, x and c slots rotate."""

    a, b, c, x, y = core
    return (x, b, a, c, y)


def side_conditions(core: tuple[int, int, int, int, int]) -> bool:
    a, b, c, x, y = core
    return bank_side(a, x, b, c, y)


def bank_side(a: int, x: int, b: int, c: int, y: int) -> bool:
    return base.bank._side_conditions(a, x, b, c, y)


def pair_mask(core: tuple[int, int, int, int, int]) -> int:
    return base.coverage_mask(core) | base.coverage_mask(partner(core))


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--json-out", type=Path, default=None)
    args = parser.parse_args()

    report: dict[str, object] = {"harness": base.validate_harness()}
    print(f"harness: {report['harness']}", flush=True)

    # The rotation identity on the authenticated v25 witness.
    if partner(base.V25_CORE_A) != base.V25_CORE_B:
        raise SystemExit(
            "rotation identity fails on the v25 witness: "
            f"partner{base.V25_CORE_A} = {partner(base.V25_CORE_A)} "
            f"!= {base.V25_CORE_B}"
        )
    print("rotation identity holds on the v25 witness pair", flush=True)

    # Enumerate every core whose own AND whose partner's side conditions hold.
    # No x < y canonicalization here: the rotation is not symmetric in x and y,
    # so both serializations are distinct family members.
    candidates: list[tuple[int, int, int, int, int]] = []
    for a, b, c, x, y in itertools.product(range(12), repeat=5):
        core = (a, b, c, x, y)
        if not side_conditions(core):
            continue
        if not side_conditions(partner(core)):
            continue
        candidates.append(core)
    print(f"cores with both side-condition sets: {len(candidates)}", flush=True)

    admissible: list[tuple[int, int, int, int, int]] = []
    single_already = 0
    for core in candidates:
        if pair_mask(core) != base.FULL_MASK:
            continue
        a, b, c, x, y = core
        pa, pb, pc, px, py = partner(core)
        if base.bank._admissible_center_exchange(
            a, x, b, c, y
        ) or base.bank._admissible_center_exchange(pa, px, pb, pc, py):
            single_already += 1
            continue
        admissible.append(core)
    print(
        f"pair-admissible cores: {len(admissible) + single_already}; "
        f"already admitted by the installed single-core rule: {single_already}; "
        f"delta cores: {len(admissible)}",
        flush=True,
    )

    realizable: list[tuple[int, int, int, int, int]] = []
    clauses: dict[tuple[tuple[int, tuple[int, ...]], ...], tuple[int, ...]] = {}
    for core in admissible:
        rows = base.union_rows(core, partner(core))
        if not base.rows_realizable(rows):
            continue
        realizable.append(core)
        clauses.setdefault(base.clause_key(rows), core)
    print(
        f"realizable delta cores: {len(realizable)}; "
        f"distinct clauses: {len(clauses)}",
        flush=True,
    )

    installed_index: dict[
        tuple[int, ...], list[dict[int, frozenset[int]]]
    ] = collections.defaultdict(list)
    for role in base.bank.family_roles():
        rows = base.core_rows(role)
        installed_index[tuple(sorted(rows))].append(rows)

    def dominated(clause: tuple[tuple[int, tuple[int, ...]], ...]) -> bool:
        rows = {center: frozenset(req) for center, req in clause}
        for triple in itertools.combinations(sorted(rows), 3):
            for installed_rows in installed_index.get(triple, ()):
                if all(req <= rows[center] for center, req in installed_rows.items()):
                    return True
        return False

    fresh = {clause: core for clause, core in clauses.items() if not dominated(clause)}
    print(
        f"clauses dominated by the installed 21st bank: {len(clauses) - len(fresh)}; "
        f"fresh clauses: {len(fresh)}",
        flush=True,
    )

    supports = base.v25_survivor_supports()
    witness_rows = base.union_rows(base.V25_CORE_A, partner(base.V25_CORE_A))
    witness_clause = base.clause_key(witness_rows)
    row_universe: set[tuple[int, tuple[int, ...]]] = set()
    for clause in fresh:
        row_universe.update(clause)
    realized = [
        core
        for clause, core in fresh.items()
        if all(frozenset(req) <= supports[center] for center, req in clause)
    ]

    report["rotated_partner"] = {
        "both_side_condition_cores": len(candidates),
        "already_admitted_single_core": single_already,
        "delta_cores": len(admissible),
        "realizable_delta_cores": len(realizable),
        "distinct_clauses": len(clauses),
        "clauses_dominated_by_installed_bank": len(clauses) - len(fresh),
        "fresh_clauses": len(fresh),
        "distinct_rows": len(row_universe),
        "row_size_histogram": dict(
            sorted(collections.Counter(len(req) for _c, req in row_universe).items())
        ),
        "clause_width_histogram": dict(
            sorted(collections.Counter(len(clause) for clause in fresh).items())
        ),
        "v25_clause_present": witness_clause in clauses,
        "v25_clause_fresh": witness_clause in fresh,
        "v25_union_rows": {str(k): sorted(v) for k, v in witness_rows.items()},
        "fresh_clauses_realized_in_v25_survivor": len(realized),
        "realized_cores": [list(core) for core in sorted(realized)],
    }
    print(json.dumps(report["rotated_partner"], sort_keys=True), flush=True)

    if args.json_out is not None:
        args.json_out.write_text(
            json.dumps(report, indent=2, sort_keys=True) + "\n", encoding="utf-8"
        )
        print(f"wrote {args.json_out}", flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
