"""Measure the shared-five-label core-pair orbit (22nd-bank design orbit).

The unrestricted two-core orbit is measured by
``measure_two_core_disjunction_orbit.py``.  This script measures the
restricted family the v25 witness actually inhabits: BOTH core assignments
draw their five roles from ONE five-label set, so the blocking clause lives
on at most five centers.  That restriction is what makes the family
encodable at the scale of the installed banks, and it is label-general — the
quantified data is a five-label set plus two role assignments on it.

Reported for the design decision:

* how many shared-five core pairs are two-core admissible with neither core
  admissible alone,
* how many of those have every union row realizable on the frozen candidate
  surface,
* how many DISTINCT blocking clauses that is (the bank's clause count),
* how many of those clauses are not already dominated by an installed
  21st-bank pattern, and
* whether the authenticated v25 witness pair is one of them.

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


def core_labels(core: tuple[int, int, int, int, int]) -> frozenset[int]:
    return frozenset(core)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--json-out", type=Path, default=None)
    args = parser.parse_args()

    report: dict[str, object] = {"harness": base.validate_harness()}
    print(f"harness: {report['harness']}", flush=True)

    partial: list[tuple[int, int, int, int, int]] = []
    for core in base.enumerate_cores():
        if base.coverage_mask(core) == base.FULL_MASK:
            continue
        if not base.rows_realizable(base.core_rows(core)):
            continue
        partial.append(core)
    masks = {core: base.coverage_mask(core) for core in partial}
    print(f"realizable partial cores: {len(partial)}", flush=True)

    by_labels: dict[frozenset[int], list[tuple[int, int, int, int, int]]] = (
        collections.defaultdict(list)
    )
    for core in partial:
        by_labels[core_labels(core)].append(core)
    label_sizes = collections.Counter(len(labels) for labels in by_labels)
    print(
        "partial core label-set sizes: " + json.dumps(dict(sorted(label_sizes.items()))),
        flush=True,
    )

    admissible = 0
    realizable = 0
    clauses: dict[
        tuple[tuple[int, tuple[int, ...]], ...],
        tuple[tuple[int, int, int, int, int], tuple[int, int, int, int, int]],
    ] = {}
    seen_pairs: set[
        tuple[tuple[int, int, int, int, int], tuple[int, int, int, int, int]]
    ] = set()
    for five in itertools.combinations(range(12), 5):
        pool: list[tuple[int, int, int, int, int]] = []
        subset = frozenset(five)
        for labels, cores in by_labels.items():
            if labels <= subset:
                pool.extend(cores)
        for left, right in itertools.combinations(sorted(pool), 2):
            key = (left, right)
            if key in seen_pairs:
                continue
            seen_pairs.add(key)
            if masks[left] | masks[right] != base.FULL_MASK:
                continue
            admissible += 1
            rows = base.union_rows(left, right)
            if not base.rows_realizable(rows):
                continue
            realizable += 1
            clauses.setdefault(base.clause_key(rows), key)
    print(
        f"shared-five pairs checked: {len(seen_pairs)}; "
        f"two-core admissible: {admissible}; union-realizable: {realizable}; "
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

    fresh = {clause: pair for clause, pair in clauses.items() if not dominated(clause)}
    print(
        f"clauses dominated by the installed 21st bank: {len(clauses) - len(fresh)}; "
        f"fresh clauses: {len(fresh)}",
        flush=True,
    )

    witness_clause = base.clause_key(base.union_rows(base.V25_CORE_A, base.V25_CORE_B))
    supports = base.v25_survivor_supports()
    row_universe: set[tuple[int, tuple[int, ...]]] = set()
    for clause in fresh:
        row_universe.update(clause)
    row_sizes = collections.Counter(len(req) for _center, req in row_universe)
    clause_widths = collections.Counter(len(clause) for clause in fresh)
    realized_in_v25 = sum(
        1
        for clause in fresh
        if all(frozenset(req) <= supports[center] for center, req in clause)
    )

    report["shared_five"] = {
        "realizable_partial_cores": len(partial),
        "pairs_checked": len(seen_pairs),
        "two_core_admissible_pairs": admissible,
        "union_realizable_pairs": realizable,
        "distinct_clauses": len(clauses),
        "clauses_dominated_by_installed_bank": len(clauses) - len(fresh),
        "fresh_clauses": len(fresh),
        "distinct_rows": len(row_universe),
        "row_size_histogram": dict(sorted(row_sizes.items())),
        "clause_width_histogram": dict(sorted(clause_widths.items())),
        "v25_clause_present": witness_clause in clauses,
        "v25_clause_fresh": witness_clause in fresh,
        "fresh_clauses_realized_in_v25_survivor": realized_in_v25,
    }
    print(json.dumps(report["shared_five"], sort_keys=True), flush=True)

    if args.json_out is not None:
        args.json_out.write_text(
            json.dumps(report, indent=2, sort_keys=True) + "\n", encoding="utf-8"
        )
        print(f"wrote {args.json_out}", flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
