#!/usr/bin/env python3
"""Replay and atomically bank the complete shared-pair depth-5 coverage."""

from __future__ import annotations

import json
import os
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search import phase3_structural_cegar as cegar


WAVE1 = (
    ROOT
    / "scratch/p97-distinct-distance-lane/"
    "phase3_projected_static_v2_shared_pair_depth5_wave1_20260729"
)
WAVE2 = (
    ROOT
    / "scratch/p97-distinct-distance-lane/"
    "phase3_projected_static_v2_shared_pair_depth5_wave2_20260729"
)
OUTPUT = (
    ROOT
    / "scratch/p97-distinct-distance-lane/"
    "phase3_projected_static_v2_shared_pair_depth5_coverage_20260729.json"
)


def main() -> None:
    shards = [
        *(WAVE1 / f"shard-{index:02d}" for index in range(24)),
        *(WAVE2 / f"shard-{index:02d}" for index in range(24, 32)),
    ]
    coverage = cegar.verify_shard_coverage(shards)
    if (
        coverage.get("schema") != cegar.SHARD_COVERAGE_SCHEMA
        or coverage.get("status")
        != "STRUCTURAL_SHARD_COVERAGE_UNSAT_VERIFIED"
        or coverage.get("depth") != 5
        or coverage.get("shard_count") != 32
        or [shard.get("index") for shard in coverage.get("shards", [])]
        != list(range(32))
    ):
        raise cegar.StructuralCegarError(
            "aggregate coverage result has an unexpected scope or status"
        )
    unsigned = dict(coverage)
    claimed_hash = unsigned.pop("coverage_sha256", None)
    if claimed_hash != cegar._sha256_value(unsigned):
        raise cegar.StructuralCegarError(
            "aggregate coverage hash does not replay"
        )

    OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    fd, temporary = tempfile.mkstemp(
        dir=str(OUTPUT.parent), prefix=f".{OUTPUT.name}-", suffix=".pending"
    )
    try:
        with os.fdopen(fd, "w", encoding="utf-8") as handle:
            json.dump(coverage, handle, indent=2, sort_keys=True)
            handle.write("\n")
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temporary, OUTPUT)
    except BaseException:
        Path(temporary).unlink(missing_ok=True)
        raise
    print(
        json.dumps(
            {
                "output": str(OUTPUT.relative_to(ROOT)),
                "status": coverage["status"],
                "coverage_sha256": coverage["coverage_sha256"],
                "shard_count": coverage["shard_count"],
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
