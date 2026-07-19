#!/usr/bin/env python3
"""Read-only dihedral-orbit profile for a product-box CEGAR checkpoint."""

from __future__ import annotations

import argparse
import collections
import json
from pathlib import Path


Arc = tuple[int, int]
Support = tuple[Arc, ...]


def transform_support(support: Support, n: int, shift: int, sign: int) -> Support:
    def transform(vertex: int) -> int:
        return (shift + sign * vertex) % n

    return tuple(
        sorted((transform(center), transform(target)) for center, target in support)
    )


def orbit(support: Support, n: int) -> frozenset[Support]:
    return frozenset(
        transform_support(support, n, shift, sign)
        for shift in range(n)
        for sign in (-1, 1)
    )


def percentile(values: list[int], numerator: int, denominator: int) -> int | None:
    if not values:
        return None
    ordered = sorted(values)
    index = (len(ordered) - 1) * numerator // denominator
    return ordered[index]


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("checkpoint", type=Path)
    parser.add_argument("--resume-iterations", type=int, default=0)
    args = parser.parse_args()

    payload = json.loads(args.checkpoint.read_text(encoding="utf-8"))
    n = int(payload["n"])
    certificates = payload["cut_certificates"]
    iterations = payload["iteration_log"]
    supports: list[Support] = []
    changed_rows: list[int] = []
    for certificate in certificates:
        support = tuple(
            sorted((int(center), int(target)) for center, target in certificate["support"])
        )
        supports.append(support)
        changed_rows.append(len(certificate["changed_rows"]))

    exact_counts = collections.Counter(supports)
    posting: dict[Arc, int] = collections.defaultdict(int)
    for index, support in enumerate(supports):
        bit = 1 << index
        for arc in support:
            posting[arc] |= bit
    cut_batches: list[int] = []
    for record in iterations:
        cut_batches.extend([int(record["iteration"])] * int(record["cuts_added"]))
    assert len(cut_batches) == len(supports)
    batch_masks: dict[int, int] = collections.defaultdict(int)
    for index, batch in enumerate(cut_batches):
        batch_masks[batch] |= 1 << index

    strictly_subsumed = 0
    subsumed_by_later_cut = 0
    subsumed_by_earlier_cut = 0
    subsumed_within_same_batch = 0
    subsumed_by_future_batch = 0
    for index, support in enumerate(supports):
        supersets = (1 << len(supports)) - 1
        for arc in support:
            supersets &= posting[arc]
        supersets &= ~(1 << index)
        # The live bank has exact-unique supports, so every other superset is
        # strict.  Keep the exact-duplicate count beside this measurement.
        strictly_subsumed |= supersets
        earlier_mask = (1 << index) - 1
        subsumed_by_later_cut |= supersets & earlier_mask
        subsumed_by_earlier_cut |= supersets & ~((1 << (index + 1)) - 1)
        same_batch = batch_masks[cut_batches[index]]
        subsumed_within_same_batch |= supersets & same_batch
        future_batch_mask = ~((1 << (max(same_batch.bit_length(), index + 1))) - 1)
        subsumed_by_future_batch |= supersets & future_batch_mask
    minimal_support_sizes = [
        len(support)
        for index, support in enumerate(supports)
        if not (strictly_subsumed & (1 << index))
    ]
    canonical = [min(orbit(support, n)) for support in supports]
    orbit_counts = collections.Counter(canonical)
    orbit_sizes = {key: len(orbit(key, n)) for key in orbit_counts}
    full_orbit_union = sum(orbit_sizes.values())
    orbit_occupancies = list(orbit_counts.values())

    prefix_cut_count = sum(
        int(record["cuts_added"])
        for record in iterations
        if int(record["iteration"]) <= args.resume_iterations
    )
    prefix_keys = set(canonical[:prefix_cut_count])
    suffix_keys = canonical[prefix_cut_count:]
    suffix_new_orbits = sum(key not in prefix_keys for key in set(suffix_keys))

    outer_elapsed = [
        float(record.get("outer_oracle", {}).get("elapsed_seconds", 0.0))
        for record in iterations
        if int(record["iteration"]) > args.resume_iterations
    ]
    outer_wall_ms = [
        int(record.get("outer_oracle", {}).get("piqd_wall_ms", 0))
        for record in iterations
        if int(record["iteration"]) > args.resume_iterations
    ]
    result = {
        "checkpoint": str(args.checkpoint),
        "n": n,
        "iterations_completed": int(payload["iterations_completed"]),
        "cuts": len(supports),
        "exact_duplicate_supports": len(supports) - len(exact_counts),
        "strictly_subsumed_supports": strictly_subsumed.bit_count(),
        "subsumed_by_later_cut": subsumed_by_later_cut.bit_count(),
        "subsumed_by_earlier_cut": subsumed_by_earlier_cut.bit_count(),
        "subsumed_within_same_batch": subsumed_within_same_batch.bit_count(),
        "subsumed_by_future_batch": subsumed_by_future_batch.bit_count(),
        "subsumption_minimal_supports": len(supports) - strictly_subsumed.bit_count(),
        "subsumption_minimal_support_size_histogram": dict(
            sorted(collections.Counter(minimal_support_sizes).items())
        ),
        "dihedral_orbits": len(orbit_counts),
        "dihedral_duplicate_supports": len(supports) - len(orbit_counts),
        "bank_fraction_of_its_full_dihedral_orbit_union": (
            len(supports) / full_orbit_union if full_orbit_union else None
        ),
        "full_dihedral_orbit_union_size": full_orbit_union,
        "orbit_occupancy": {
            "min": min(orbit_occupancies, default=None),
            "p50": percentile(orbit_occupancies, 1, 2),
            "p90": percentile(orbit_occupancies, 9, 10),
            "max": max(orbit_occupancies, default=None),
            "fully_populated": sum(
                count == orbit_sizes[key] for key, count in orbit_counts.items()
            ),
        },
        "support_size_histogram": dict(
            sorted(collections.Counter(map(len, supports)).items())
        ),
        "changed_row_histogram": dict(
            sorted(collections.Counter(changed_rows).items())
        ),
        "resumed_prefix": {
            "iterations": args.resume_iterations,
            "cuts": prefix_cut_count,
            "dihedral_orbits": len(prefix_keys),
        },
        "current_suffix": {
            "cuts": len(suffix_keys),
            "dihedral_orbits": len(set(suffix_keys)),
            "orbits_new_relative_to_prefix": suffix_new_orbits,
        },
        "current_run_elapsed_seconds": payload.get("elapsed_seconds_current_run"),
        "current_run_outer_elapsed_seconds_sum": sum(outer_elapsed),
        "current_run_outer_solver_wall_seconds_sum": sum(outer_wall_ms) / 1000,
        "current_run_outer_call_count": len(outer_elapsed),
        "current_run_outer_elapsed_seconds_min": min(outer_elapsed, default=None),
        "current_run_outer_elapsed_seconds_max": max(outer_elapsed, default=None),
    }
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
