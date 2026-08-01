"""Prepare (or explicitly execute) a provenance-pinned projected-static-v2 run."""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
DRIVER = ROOT / "census/p97_search/phase3_structural_cegar.py"
ENCODER = ROOT / "census/p97_search/sat_generate.py"
LEGACY_SNAPSHOT = (
    ROOT
    / "scratch/p97-distinct-distance-lane"
    / "phase3_legacy_source_snapshot_20260729.json"
)
SCHEMA = "p97-phase3-projected-static-v2-launch-v1"


def _sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--timeout", type=int, default=300)
    parser.add_argument("--workers", type=int, default=1)
    parser.add_argument(
        "--parallel-mode",
        choices=("sequential", "cube-batch"),
        default="sequential",
    )
    parser.add_argument("--cube-depth", type=int, default=5)
    parser.add_argument(
        "--cube-artifact-mode",
        choices=("full", "compact"),
        default="compact",
    )
    parser.add_argument("--max-new-raw", type=int)
    parser.add_argument(
        "--execute",
        action="store_true",
        help="actually run the driver; without this flag only print the launch record",
    )
    args = parser.parse_args()
    if args.workers <= 0:
        parser.error("--workers must be positive")
    if args.cube_depth <= 0:
        parser.error("--cube-depth must be positive")
    command = [
        sys.executable,
        str(DRIVER),
        "--out",
        str(args.out),
        "--timeout",
        str(args.timeout),
        "--projected-static-v2",
        "--no-bootstrap",
        "--workers",
        str(args.workers),
        "--parallel-mode",
        args.parallel_mode,
        "--cube-depth",
        str(args.cube_depth),
        "--cube-artifact-mode",
        args.cube_artifact_mode,
    ]
    if args.max_new_raw is not None:
        if args.max_new_raw <= 0:
            parser.error("--max-new-raw must be positive")
        command.extend(["--max-new-raw", str(args.max_new_raw)])
    launch = {
        "schema": SCHEMA,
        "executed": args.execute,
        "command": command,
        "source_sha256": {
            str(DRIVER.relative_to(ROOT)): _sha256(DRIVER),
            str(ENCODER.relative_to(ROOT)): _sha256(ENCODER),
        },
        "legacy_source_snapshot": {
            "path": str(LEGACY_SNAPSHOT.relative_to(ROOT)),
            "sha256": _sha256(LEGACY_SNAPSHOT),
        },
        "compatibility": (
            "new run directory required; legacy b-bearing learned bootstrap is "
            "explicitly disabled and cannot be resumed into this mode"
        ),
    }
    print(json.dumps(launch, indent=2, sort_keys=True))
    if not args.execute:
        return 0
    if args.out.exists() and any(args.out.iterdir()):
        raise SystemExit(f"refusing nonempty output directory {args.out}")
    return subprocess.run(command, cwd=ROOT, check=False).returncode


if __name__ == "__main__":
    raise SystemExit(main())
