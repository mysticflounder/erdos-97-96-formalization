#!/usr/bin/env python3
"""Find small direct-core covers for the three ordered-v4 residual records.

This is a finite-artifact diagnostic.  It neither proves that the records
cover source models nor supplies the Lean arithmetic replay of a proposed
cover.
"""

from __future__ import annotations

import importlib.util
import itertools
import json
from pathlib import Path


HERE = Path(__file__).parent
BASE_PATH = HERE / "analyze_universal_three_row_cores.py"
SPEC = importlib.util.spec_from_file_location("three_row", BASE_PATH)
assert SPEC is not None and SPEC.loader is not None
BASE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(BASE)

TARGETS = {7808, 8077, 8556}


def minimal_cover(cores: list[tuple[int, int, int, int, int]], universe):
    full = (1 << len(universe)) - 1
    mask_to_core: dict[int, tuple[int, int, int, int, int]] = {}
    for core in cores:
        mask = sum(
            1 << index
            for index, order in enumerate(universe)
            if BASE.common(order, core)
        )
        if mask:
            mask_to_core.setdefault(mask, core)
    entries = sorted(mask_to_core.items(), key=lambda item: (-item[0].bit_count(), item[1]))
    for size in range(1, 7):
        for chosen in itertools.combinations(entries, size):
            covered = 0
            for mask, _core in chosen:
                covered |= mask
            if covered == full:
                return [core for _mask, core in chosen], len(entries)
    return None, len(entries)


def main() -> None:
    forced_universe = BASE.orders(forced_second=True)
    unrestricted_universe = BASE.orders(forced_second=False)
    reports = []
    with BASE.CUTS.open(encoding="utf-8") as stream:
        for line in stream:
            record = json.loads(line)
            iteration = record.get("iteration")
            if iteration not in TARGETS:
                continue
            rows = {
                entry["center"]: set(entry["support"])
                for entry in record["rows"]
            }
            cores = sorted(BASE.direct_cores(rows))
            cover, mask_count = minimal_cover(cores, forced_universe)
            unrestricted_cover, unrestricted_mask_count = minimal_cover(
                cores, unrestricted_universe
            )
            reports.append(
                {
                    "iteration": iteration,
                    "direct_core_count": len(cores),
                    "distinct_nonempty_masks": mask_count,
                    "cover": [
                        {"core": core, "requirements": BASE.requirements(core)}
                        for core in (cover or [])
                    ],
                    "unrestricted_distinct_nonempty_masks": unrestricted_mask_count,
                    "unrestricted_cover": [
                        {"core": core, "requirements": BASE.requirements(core)}
                        for core in (unrestricted_cover or [])
                    ],
                }
            )
    print(json.dumps(sorted(reports, key=lambda item: item["iteration"]), indent=2))


if __name__ == "__main__":
    main()
