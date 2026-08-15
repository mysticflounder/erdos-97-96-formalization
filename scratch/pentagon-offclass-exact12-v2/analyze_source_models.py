#!/usr/bin/env python3
"""Aggregate source/blocker patterns mined by source_sensitive_cegar.py."""

from __future__ import annotations

import argparse
import json
from collections import Counter
from pathlib import Path


HERE = Path(__file__).resolve().parent
FAN_SOURCES = (0, 2, 7, 9)
FIXED_C = 7
PHYSICAL_APEX = 1


def fan_feeding_witnesses(blockers, fibers):
    """Return maximal fibers fed by every fan source in one or two steps.

    For a fiber ``F = {source | blocker(source) = center}``, the source-level
    predicate says ``blocker(q) ∈ F`` or ``blocker(blocker(q)) ∈ F`` for each
    ``q`` in the second-cap fan.  This function only measures that predicate;
    it does not turn it into a learned clause.
    """
    witnesses = []
    for center, fiber_tuple in sorted(fibers.items()):
        if len(fiber_tuple) != 4:
            continue
        fiber = set(fiber_tuple)
        fan_steps = {}
        for source in FAN_SOURCES:
            first = blockers[source]
            second = blockers[first]
            if first in fiber:
                fan_steps[source] = 1
            elif second in fiber:
                fan_steps[source] = 2
            else:
                break
        else:
            witnesses.append(
                {
                    "blocker_center": center,
                    "fiber": list(fiber_tuple),
                    "anchor_source": min(fiber_tuple),
                    "fan_steps": {
                        str(source): fan_steps[source] for source in FAN_SOURCES
                    },
                }
            )
    return witnesses


def functional_cycles(blockers):
    cycles = set()
    for start in sorted(blockers):
        path = []
        positions = {}
        current = start
        while current not in positions and current in blockers:
            positions[current] = len(path)
            path.append(current)
            current = blockers[current]
        if current not in positions:
            continue
        cycle = path[positions[current] :]
        rotations = [tuple(cycle[index:] + cycle[:index]) for index in range(len(cycle))]
        cycles.add(min(rotations))
    return sorted(cycles)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "journal",
        nargs="?",
        type=Path,
        default=HERE / "cegar-d0-v2-source-v3" / "journal.jsonl",
    )
    args = parser.parse_args()

    records = []
    for line in args.journal.read_text().splitlines():
        if not line.strip():
            continue
        record = json.loads(line)
        if record.get("source_model") is not None:
            records.append(record)

    max_fiber_sizes = Counter()
    fiber_signatures = Counter()
    fan_distinct_counts = Counter()
    cycle_length_profiles = Counter()
    saturated = []
    reciprocal_counts = Counter()
    saturated_model_count = 0
    fan_feeding_saturated_fiber_count = 0
    fan_feeding_witness_records = []
    cube_records = 0
    membership_failures = []
    saturated_support_failures = []

    for record in records:
        source_model = record["source_model"]
        blockers = {int(q): int(a) for q, a in source_model["blockers"].items()}
        fibers = {
            int(a): tuple(map(int, sources))
            for a, sources in source_model["blocker_fibers"].items()
        }
        sizes = tuple(sorted((len(fiber) for fiber in fibers.values()), reverse=True))
        max_fiber_sizes[max(sizes)] += 1
        fiber_signatures[sizes] += 1
        fan_blockers = {blockers[source] for source in FAN_SOURCES}
        fan_distinct_counts[len(fan_blockers)] += 1
        reciprocal = sum(
            1
            for source, blocker in blockers.items()
            if source < blocker and blockers.get(blocker) == source
        )
        reciprocal_counts[reciprocal] += 1
        cycles = functional_cycles(blockers)
        cycle_length_profiles[tuple(sorted(map(len, cycles)))] += 1
        has_saturated_fiber = any(len(fiber) == 4 for fiber in fibers.values())
        saturated_model_count += int(has_saturated_fiber)
        feeding_witnesses = fan_feeding_witnesses(blockers, fibers)
        if feeding_witnesses:
            fan_feeding_saturated_fiber_count += 1
            fan_feeding_witness_records.append(
                {
                    "iteration": record["iteration"],
                    "witnesses": feeding_witnesses,
                }
            )

        cube_json = source_model.get("cube")
        if cube_json is None:
            continue
        cube_records += 1
        cube = {int(center): set(row) for center, row in cube_json.items()}
        for source, blocker in blockers.items():
            if source not in cube[blocker]:
                membership_failures.append(
                    {"iteration": record["iteration"], "source": source, "blocker": blocker}
                )
        for blocker, fiber in fibers.items():
            if len(fiber) == 4:
                saturated.append(
                    {"iteration": record["iteration"], "blocker": blocker, "fiber": fiber}
                )
                if set(fiber) != cube[blocker]:
                    saturated_support_failures.append(
                        {"iteration": record["iteration"], "blocker": blocker}
                    )

    summary = {
        "schema": "p97_pentagon_offclass_source_model_mining.v2",
        "scope": "empirical SAT-model statistics; not a producer or proof",
        "journal": str(args.journal),
        "source_models": len(records),
        "source_models_with_cube": cube_records,
        "max_fiber_size_counts": {
            str(size): count for size, count in sorted(max_fiber_sizes.items())
        },
        "fan_distinct_blocker_counts": {
            str(size): count for size, count in sorted(fan_distinct_counts.items())
        },
        "reciprocal_pair_counts": {
            str(size): count for size, count in sorted(reciprocal_counts.items())
        },
        "cycle_length_profiles": {
            ",".join(map(str, profile)) or "acyclic": count
            for profile, count in sorted(cycle_length_profiles.items())
        },
        "distinct_fiber_signatures": len(fiber_signatures),
        "saturated_model_count": saturated_model_count,
        "fan_feeding_saturated_fiber_count":
            fan_feeding_saturated_fiber_count,
        "saturated_without_full_fan_feeding_count":
            saturated_model_count - fan_feeding_saturated_fiber_count,
        "fan_feeding_saturated_fiber_witnesses": fan_feeding_witness_records,
        "saturated_fibers": saturated,
        "membership_failures": membership_failures,
        "saturated_support_failures": saturated_support_failures,
        "forbidden_fan_blocker_hits": sum(
            1
            for record in records
            if all(
                int(record["source_model"]["blockers"][str(source)])
                in (FIXED_C, PHYSICAL_APEX)
                for source in FAN_SOURCES
            )
        ),
    }
    output_path = args.journal.parent / "source-model-analysis.json"
    output_path.write_text(json.dumps(summary, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(output_path),
                "source_models": len(records),
                "with_cube": cube_records,
                "max_fiber_size_counts": summary["max_fiber_size_counts"],
                "fan_distinct_blocker_counts": summary["fan_distinct_blocker_counts"],
                "saturated_fibers": len(saturated),
                "saturated_models": saturated_model_count,
                "fan_feeding_saturated_fibers":
                    fan_feeding_saturated_fiber_count,
                "membership_failures": len(membership_failures),
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
