"""Measure the two-core disjunction orbit for the exact-12 next-row arm lane.

Context.  The installed 21st bank (center-exchange all-order common five)
blocks a membership pattern when ONE core placement ``(a, x, b, c, y)``
orients every one of the forty-eight canonical boundary orders, allowing the
free ``x <-> y`` exchange per order.  The authenticated v25 survivor escapes
that bank: its realized five-point instances are covered by TWO cores on the
single label set ``{5, 7, 8, 10, 11}``, each covering a complementary
twenty-four-order half deck, and no single core covers all forty-eight.

Rule under measurement (two-core disjunction).  For an unordered pair of
cores ``{C1, C2}``, require for every canonical order that at least one of
the four orientations

    common_five(C1), common_five(C1 with x<->y),
    common_five(C2), common_five(C2 with x<->y)

holds.  The blocking clause is the negation of the UNION of both cores'
membership rows.  Soundness: the realized configuration induces one
canonical order; for that order one of the four orientations holds; the rows
of the core it belongs to are contained in the union, so that core's
existing common-five contradiction fires.  The installed bank is exactly the
degenerate case ``C1 = C2``.

This script is measurement only.  It proves nothing and freezes nothing; it
reports the orbit sizes the 22nd-bank design needs, and it first re-derives
the frozen 21st-bank pins from the same live primitives so that a drifted
harness fails closed instead of reporting a new number.
"""

from __future__ import annotations

import argparse
import collections
import hashlib
import itertools
import json
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[3]
if str(REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(REPO_ROOT))

from census.card_head import (  # noqa: E402
    exact12_center_exchange_all_order_common_five_membership_family_bank as bank,
)

FULL_MASK = (1 << 48) - 1

# The two cores read off the authenticated v25 all-order mine
# (summary d9f7557bd441213b5315f0a330963d694f49faddc9d5261fd3679fa836882b1e),
# written in this script's canonical (a, b, c, x, y) form with x < y.
V25_CORE_A = (10, 8, 5, 7, 11)
V25_CORE_B = (7, 8, 10, 5, 11)

# Authenticated v25 canary workdir and the survivor artifact digest recorded
# by that immutable run.  The cube is READ from this artifact rather than
# transcribed, and the digest is checked before the cube is trusted.
V25_WORKDIR = REPO_ROOT / "scratch/arm-static-cell6-v25-live-898fbd78-20260816"
V25_SURVIVOR_SHA256 = (
    "fac5426c504ebf9847911da7891a5795a21486fb6371e62d1d5a302d657914bd"
)


def v25_survivor_supports() -> dict[int, frozenset[int]]:
    """Load the v25 survivor cube from the authenticated run artifact."""

    path = V25_WORKDIR / "survivor.json"
    raw = path.read_bytes()
    digest = hashlib.sha256(raw).hexdigest()
    if digest != V25_SURVIVOR_SHA256:
        raise SystemExit(
            f"v25 survivor artifact digest drift: {digest} at {path}"
        )
    cube = json.loads(raw)["cube"]
    return {int(center): frozenset(support) for center, support in cube.items()}


def core_rows(core: tuple[int, int, int, int, int]) -> dict[int, frozenset[int]]:
    """Membership rows required by one core, keyed by center."""

    a, b, c, x, y = core
    return {
        x: frozenset((a, b)),
        y: frozenset((a, b)),
        c: frozenset((b, x, y)),
    }


def union_rows(
    left: tuple[int, int, int, int, int],
    right: tuple[int, int, int, int, int],
) -> dict[int, frozenset[int]]:
    merged = dict(core_rows(left))
    for center, required in core_rows(right).items():
        merged[center] = merged.get(center, frozenset()) | required
    return merged


def subset_realizable(center: int, required: frozenset[int]) -> bool:
    """True when ``required`` sits inside some frozen candidate row."""

    if not required:
        return True
    if len(required) > 4:
        return False
    return any(
        required <= frozenset(candidate)
        for candidate in bank.candidate_rows(center)
    )


def rows_realizable(rows: dict[int, frozenset[int]]) -> bool:
    return all(subset_realizable(center, req) for center, req in rows.items())


def clause_key(rows: dict[int, frozenset[int]]) -> tuple[tuple[int, tuple[int, ...]], ...]:
    return tuple(
        (center, tuple(sorted(rows[center]))) for center in sorted(rows)
    )


def enumerate_cores() -> list[tuple[int, int, int, int, int]]:
    """Every ``(a, b, c, x, y)`` with ``x < y`` passing the side conditions."""

    cores = []
    for x, y in itertools.combinations(range(12), 2):
        for a in range(12):
            for b in range(12):
                for c in range(12):
                    if bank._side_conditions(a, x, b, c, y):
                        cores.append((a, b, c, x, y))
    return cores


def coverage_mask(core: tuple[int, int, int, int, int]) -> int:
    """Bitmask of canonical orders the core orients, x<->y exchange allowed."""

    a, b, c, x, y = core
    mask = 0
    for index, position in enumerate(bank._positions()):
        if bank._common_five(position, a, x, b, c, y) or bank._common_five(
            position, a, y, b, c, x
        ):
            mask |= 1 << index
    return mask


def validate_harness() -> dict[str, int]:
    """Re-derive the frozen 21st-bank pins from the live primitives."""

    positions = bank._positions()
    if len(positions) != 48:
        raise SystemExit("canonical boundary-order universe is not 48 orders")

    widened = 0
    strict = 0
    for a in range(12):
        for b in range(12):
            for c in range(12):
                for x in range(12):
                    for y in range(x + 1, 12):
                        if not bank._admissible_center_exchange(a, x, b, c, y):
                            continue
                        widened += 1
                        if bank._admissible_strict(
                            a, x, b, c, y
                        ) or bank._admissible_strict(a, y, b, c, x):
                            strict += 1
    if widened != bank.EXPECTED_WIDENED_ORBIT_ROLE_COUNT:
        raise SystemExit(f"widened orbit drift: {widened}")
    if strict != bank.EXPECTED_STRICT_ORBIT_ROLE_COUNT:
        raise SystemExit(f"strict orbit drift: {strict}")

    installed = bank.family_roles()
    if len(installed) != bank.EXPECTED_ROLE_COUNT:
        raise SystemExit(f"installed role drift: {len(installed)}")

    # The general containment predicate must agree with the bank's own
    # pair/triple realizability on every installed role.
    for role in installed:
        a, b, c, x, y = role
        if bank._role_realizable(a, b, c, x, y) != rows_realizable(core_rows(role)):
            raise SystemExit(f"realizability predicates disagree on {role}")

    # The exchange-closed coverage mask must be full exactly on the widened
    # orbit predicate the bank installs.
    for role in installed:
        a, b, c, x, y = role
        if coverage_mask(role) != FULL_MASK:
            raise SystemExit(f"installed role is not full-coverage: {role}")
        if not bank._admissible_center_exchange(a, x, b, c, y):
            raise SystemExit(f"installed role fails bank predicate: {role}")

    return {
        "widened_orbit_roles": widened,
        "strict_orbit_roles": strict,
        "installed_realizable_roles": len(installed),
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--pair-cap",
        type=int,
        default=40_000_000,
        help="hard cap on enumerated core pairs; exceeding it is reported, not silent",
    )
    parser.add_argument("--json-out", type=Path, default=None)
    args = parser.parse_args()

    report: dict[str, object] = {"harness": validate_harness()}
    print(f"harness: {report['harness']}", flush=True)

    cores = enumerate_cores()
    print(f"cores with side conditions (x<y): {len(cores)}", flush=True)

    realizable_cores = []
    installed_full = 0
    for core in cores:
        if coverage_mask(core) == FULL_MASK:
            installed_full += 1
        if rows_realizable(core_rows(core)):
            realizable_cores.append(core)
    print(
        f"full-coverage cores: {installed_full}; "
        f"row-realizable cores: {len(realizable_cores)}",
        flush=True,
    )

    # Delta candidates: realizable cores that are NOT already full coverage.
    partial: list[tuple[int, int, int, int, int]] = []
    full_realizable: list[tuple[int, int, int, int, int]] = []
    masks: dict[tuple[int, int, int, int, int], int] = {}
    for core in realizable_cores:
        mask = coverage_mask(core)
        masks[core] = mask
        if mask == FULL_MASK:
            full_realizable.append(core)
        else:
            partial.append(core)
    print(
        f"realizable partial cores: {len(partial)}; "
        f"realizable full cores: {len(full_realizable)}",
        flush=True,
    )

    # Deduplicate cores by (coverage mask, membership rows).  Two cores that
    # agree on both contribute identical clauses in every pair, so the clause
    # orbit is determined by these classes.
    classes: dict[
        tuple[int, tuple[tuple[int, tuple[int, ...]], ...]],
        tuple[int, int, int, int, int],
    ] = {}
    for core in partial:
        key = (masks[core], clause_key(core_rows(core)))
        classes.setdefault(key, core)
    print(f"distinct (mask, rows) partial classes: {len(classes)}", flush=True)
    report["partial_classes"] = len(classes)

    by_mask: dict[int, list[tuple[int, int, int, int, int]]] = collections.defaultdict(list)
    for (mask, _rows), core in classes.items():
        by_mask[mask].append(core)
    mask_list = sorted(by_mask)
    print(f"distinct partial masks: {len(mask_list)}", flush=True)

    coverage_hist = collections.Counter(bin(mask).count("1") for mask in mask_list)
    print(
        "partial mask popcount histogram: "
        + json.dumps(dict(sorted(coverage_hist.items()))),
        flush=True,
    )

    # Complementary mask pairs.
    compatible: list[tuple[int, int]] = []
    potential_pairs = 0
    for i, left in enumerate(mask_list):
        for right in mask_list[i:]:
            if left | right != FULL_MASK:
                continue
            compatible.append((left, right))
            if left == right:
                count = len(by_mask[left]) * (len(by_mask[left]) - 1) // 2
            else:
                count = len(by_mask[left]) * len(by_mask[right])
            potential_pairs += count
    print(
        f"complementary mask pairs: {len(compatible)}; "
        f"potential core pairs: {potential_pairs}",
        flush=True,
    )
    report["cores"] = {
        "side_condition_cores": len(cores),
        "full_coverage_cores": installed_full,
        "row_realizable_cores": len(realizable_cores),
        "realizable_partial_cores": len(partial),
        "realizable_full_cores": len(full_realizable),
        "distinct_partial_masks": len(mask_list),
        "complementary_mask_pairs": len(compatible),
        "potential_core_pairs": potential_pairs,
    }

    # v25 witness check, independent of the bulk enumeration.
    supports = v25_survivor_supports()
    witness: dict[str, object] = {}
    for name, core in (("core_a", V25_CORE_A), ("core_b", V25_CORE_B)):
        a, b, c, x, y = core
        mask = coverage_mask(core)
        witness[name] = {
            "core_abcxy": list(core),
            "side_conditions": bank._side_conditions(a, x, b, c, y),
            "orders_covered": bin(mask).count("1"),
            "single_core_admissible": mask == FULL_MASK,
            "rows": {str(k): sorted(v) for k, v in core_rows(core).items()},
            "rows_realizable": rows_realizable(core_rows(core)),
        }
    pair_mask = coverage_mask(V25_CORE_A) | coverage_mask(V25_CORE_B)
    merged = union_rows(V25_CORE_A, V25_CORE_B)
    witness["pair"] = {
        "orders_covered": bin(pair_mask).count("1"),
        "two_core_admissible": pair_mask == FULL_MASK,
        "union_rows": {str(k): sorted(v) for k, v in merged.items()},
        "union_rows_realizable": rows_realizable(merged),
        "present_in_v25_survivor": all(
            req <= supports[center] for center, req in merged.items()
        ),
    }
    report["v25_witness"] = witness
    print("v25 witness: " + json.dumps(witness, sort_keys=True), flush=True)

    if potential_pairs > args.pair_cap:
        report["pairs"] = {
            "enumerated": False,
            "reason": f"potential pairs {potential_pairs} exceeds cap {args.pair_cap}",
        }
        print(
            f"NOT enumerating pairs: {potential_pairs} exceeds cap {args.pair_cap}",
            flush=True,
        )
    else:
        admissible_pairs = 0
        realizable_pairs = 0
        clauses: set[tuple[tuple[int, tuple[int, ...]], ...]] = set()
        for left_mask, right_mask in compatible:
            left_cores = by_mask[left_mask]
            right_cores = by_mask[right_mask]
            if left_mask == right_mask:
                pair_iter = itertools.combinations(left_cores, 2)
            else:
                pair_iter = itertools.product(left_cores, right_cores)
            for left_core, right_core in pair_iter:
                admissible_pairs += 1
                merged_rows = union_rows(left_core, right_core)
                if not rows_realizable(merged_rows):
                    continue
                realizable_pairs += 1
                clauses.add(clause_key(merged_rows))
        report["pairs"] = {
            "enumerated": True,
            "two_core_admissible_pairs": admissible_pairs,
            "realizable_union_pairs": realizable_pairs,
            "distinct_realizable_clauses": len(clauses),
        }
        print(json.dumps(report["pairs"], sort_keys=True), flush=True)

        v25_key = clause_key(merged)
        report["pairs"]["v25_clause_present"] = v25_key in clauses
        print(f"v25 clause present in orbit: {v25_key in clauses}", flush=True)

        # Redundancy filter.  A two-core clause is already blocked when some
        # installed 21st-bank pattern sits row-wise inside it: any
        # configuration carrying the union rows then also carries that
        # pattern's three rows.
        installed_index: dict[
            tuple[int, ...], list[dict[int, frozenset[int]]]
        ] = collections.defaultdict(list)
        for role in bank.family_roles():
            rows = core_rows(role)
            installed_index[tuple(sorted(rows))].append(rows)

        def dominated(rows: dict[int, frozenset[int]]) -> bool:
            centers = sorted(rows)
            for triple in itertools.combinations(centers, 3):
                for installed_rows in installed_index.get(triple, ()):
                    if all(
                        req <= rows[center]
                        for center, req in installed_rows.items()
                    ):
                        return True
            return False

        fresh = {clause for clause in clauses if not dominated(dict(
            (center, frozenset(req)) for center, req in clause
        ))}
        report["pairs"]["clauses_dominated_by_installed_bank"] = (
            len(clauses) - len(fresh)
        )
        report["pairs"]["fresh_clauses"] = len(fresh)
        report["pairs"]["v25_clause_fresh"] = v25_key in fresh
        report["pairs"]["minimality_filter_run"] = False
        print(
            f"fresh clauses (not dominated by the installed bank): {len(fresh)}"
            f"; v25 clause fresh: {v25_key in fresh}"
            "; within-set minimality filter NOT run",
            flush=True,
        )
        clauses = fresh

        row_universe: set[tuple[int, tuple[int, ...]]] = set()
        for clause in clauses:
            row_universe.update(clause)
        by_size = collections.Counter(len(req) for _center, req in row_universe)
        report["pairs"]["distinct_rows"] = len(row_universe)
        report["pairs"]["row_size_histogram"] = dict(sorted(by_size.items()))
        clause_widths = collections.Counter(len(clause) for clause in clauses)
        report["pairs"]["clause_width_histogram"] = dict(sorted(clause_widths.items()))
        print(
            f"distinct rows: {len(row_universe)} sizes "
            + json.dumps(dict(sorted(by_size.items())))
            + " clause widths "
            + json.dumps(dict(sorted(clause_widths.items()))),
            flush=True,
        )

    if args.json_out is not None:
        args.json_out.write_text(
            json.dumps(report, indent=2, sort_keys=True) + "\n", encoding="utf-8"
        )
        print(f"wrote {args.json_out}", flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
