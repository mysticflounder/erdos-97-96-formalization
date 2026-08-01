#!/usr/bin/env python3
"""Launch one bounded fixed-depth Phase-3 shared-pair shard wave."""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import sys
from datetime import UTC, datetime
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
DRIVER = ROOT / "census/p97_search/phase3_structural_cegar.py"
SHARED_PAIR_DETECTOR = (
    ROOT / "census/p97_search/phase3_shared_pair_separation.py"
)
SHARED_PAIR_THEOREM = (
    ROOT / "lean/Erdos9796Proof/P97/Phase3SharedPairSeparation.lean"
)


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("output_root", type=Path)
    parser.add_argument("indices", type=int, nargs="+")
    parser.add_argument("--shard-depth", type=int, required=True)
    bootstrap_group = parser.add_mutually_exclusive_group(required=True)
    bootstrap_group.add_argument("--bootstrap", type=Path)
    bootstrap_group.add_argument("--no-bootstrap", action="store_true")
    args = parser.parse_args()

    output_root = args.output_root.resolve()
    indices = tuple(args.indices)
    depth = args.shard_depth
    bootstrap = args.bootstrap.resolve() if args.bootstrap is not None else None
    if not 1 <= depth <= 20:
        raise SystemExit("shard depth must be in [1, 20]")
    if not indices or len(indices) != len(set(indices)):
        raise SystemExit("indices must be a nonempty duplicate-free list")
    if any(index < 0 or index >= 1 << depth for index in indices):
        raise SystemExit(f"every index must be in [0, {1 << depth})")
    if len(indices) > 24:
        raise SystemExit("one launch wave may use at most 24 solver workers")
    if output_root.exists():
        raise SystemExit(f"refusing to reuse output root: {output_root}")
    dependencies = (DRIVER, SHARED_PAIR_DETECTOR, SHARED_PAIR_THEOREM)
    if any(not path.is_file() for path in dependencies):
        raise SystemExit("driver or shared-pair dependency is missing")
    if bootstrap is not None and not bootstrap.is_file():
        raise SystemExit(f"bootstrap is missing: {bootstrap}")

    output_root.mkdir(parents=True)
    launched: list[dict[str, object]] = []
    width = max(2, len(str((1 << depth) - 1)))
    for index in indices:
        shard = output_root / f"shard-{index:0{width}d}"
        log_path = output_root / f"shard-{index:0{width}d}.driver.log"
        command = [
            sys.executable,
            str(DRIVER),
            "--out",
            str(shard),
            "--projected-static-v2",
            "--timeout",
            "86400",
            "--learned-core-limit",
            "100000",
            "--survivor-limit",
            "1000",
            "--workers",
            "1",
            "--parallel-mode",
            "sequential",
            "--shard-depth",
            str(depth),
            "--shard-index",
            str(index),
        ]
        if bootstrap is None:
            command.append("--no-bootstrap")
        else:
            command.extend(("--bootstrap-results", str(bootstrap)))
        with log_path.open("wb") as log_handle:
            process = subprocess.Popen(
                command,
                cwd=ROOT,
                stdin=subprocess.DEVNULL,
                stdout=log_handle,
                stderr=subprocess.STDOUT,
                start_new_session=True,
            )
        launched.append(
            {
                "shard_index": index,
                "pid": process.pid,
                "pgid": process.pid,
                "output": str(shard.relative_to(ROOT)),
                "log": str(log_path.relative_to(ROOT)),
                "command": command,
            }
        )

    manifest = {
        "schema": "p97-phase3-shared-pair-fixed-depth-launch-wave-v1",
        "created_at": datetime.now(UTC).isoformat(),
        "python": sys.executable,
        "dependency_sha256": {
            str(path.relative_to(ROOT)): sha256_file(path)
            for path in dependencies
        },
        "bootstrap": (
            {"mode": "none"}
            if bootstrap is None
            else {
                "mode": "authenticated-bank",
                "path": str(bootstrap.relative_to(ROOT)),
                "sha256": sha256_file(bootstrap),
            }
        ),
        "configured_solver_workers": len(indices),
        "shard_depth": depth,
        "launched": launched,
    }
    (output_root / "launch-manifest.json").write_text(
        json.dumps(manifest, indent=2, sort_keys=True) + "\n"
    )
    print(json.dumps(manifest, sort_keys=True))


if __name__ == "__main__":
    main()
