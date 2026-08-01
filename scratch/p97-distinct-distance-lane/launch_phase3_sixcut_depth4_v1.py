"""Launch the authenticated six-cut Phase-3 depth-4 shard fleet."""

from __future__ import annotations

import hashlib
import json
import os
import shutil
import subprocess
import sys
from datetime import UTC, datetime
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SOURCE = ROOT / "census/p97_search/phase3_structural_cegar.py"
BANK = (
    ROOT
    / "scratch/p97-distinct-distance-lane/"
    "phase3_projected_sequential_frozen_learned_20260729/"
    "learned-certificates.jsonl"
)
RUN_ROOT = (
    ROOT
    / "scratch/p97-distinct-distance-lane/"
    "phase3_sixcut_depth4_shards_v1_20260729"
)
EXPECTED_SOURCE_SHA256 = (
    "af87693d1ff05f556c967237704edd447d3800486bdb530e4b1ebefd5897e33a"
)
EXPECTED_BANK_SHA256 = (
    "dd3855e39757a6128d2ee92de2c4256aa133e7fdbab0916b6f375ea64aa1420c"
)


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def main() -> int:
    source_sha256 = sha256_file(SOURCE)
    bank_sha256 = sha256_file(BANK)
    if source_sha256 != EXPECTED_SOURCE_SHA256:
        raise SystemExit(
            f"source hash mismatch: {source_sha256} != {EXPECTED_SOURCE_SHA256}"
        )
    if bank_sha256 != EXPECTED_BANK_SHA256:
        raise SystemExit(
            f"bank hash mismatch: {bank_sha256} != {EXPECTED_BANK_SHA256}"
        )
    if RUN_ROOT.exists():
        raise SystemExit(f"refusing to reuse existing run root: {RUN_ROOT}")
    RUN_ROOT.mkdir(parents=True)

    nice = shutil.which("nice")
    if nice is None:
        raise SystemExit("nice executable not found")

    environment = os.environ.copy()
    environment.update(
        {
            "OMP_NUM_THREADS": "1",
            "OPENBLAS_NUM_THREADS": "1",
            "MKL_NUM_THREADS": "1",
        }
    )
    launches: list[dict[str, object]] = []
    for shard_index in range(16):
        output = RUN_ROOT / f"shard-{shard_index:02d}"
        log_path = RUN_ROOT / f"shard-{shard_index:02d}.console.log"
        command = [
            nice,
            "-n",
            "10",
            sys.executable,
            str(SOURCE),
            "--out",
            str(output),
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
            "4",
            "--shard-index",
            str(shard_index),
            "--bootstrap-results",
            str(BANK),
        ]
        with log_path.open("xb") as log_handle:
            process = subprocess.Popen(
                command,
                cwd=ROOT,
                env=environment,
                stdin=subprocess.DEVNULL,
                stdout=log_handle,
                stderr=subprocess.STDOUT,
                start_new_session=True,
            )
        launches.append(
            {
                "shard_index": shard_index,
                "pid": process.pid,
                "output": str(output.relative_to(ROOT)),
                "console_log": str(log_path.relative_to(ROOT)),
                "command": command,
            }
        )

    launch_record = {
        "schema": "p97-phase3-sixcut-depth4-external-launch-v1",
        "launched_at": datetime.now(UTC).isoformat(),
        "source": str(SOURCE.relative_to(ROOT)),
        "source_sha256": source_sha256,
        "bootstrap_bank": str(BANK.relative_to(ROOT)),
        "bootstrap_bank_sha256": bank_sha256,
        "algebraic_bootstrap_mode": (
            "default ordered old-UNIT2, new-UNIT3, "
            "REAL_DISTINCTNESS_CONTRADICTION1"
        ),
        "shard_depth": 4,
        "shard_count": 16,
        "parallel_mode": "sequential",
        "workers_per_shard": 1,
        "launches": launches,
    }
    launch_path = RUN_ROOT / "launch.json"
    launch_path.write_text(
        json.dumps(launch_record, indent=2, sort_keys=True) + "\n"
    )
    print(
        json.dumps(
            {
                "run_root": str(RUN_ROOT.relative_to(ROOT)),
                "source_sha256": source_sha256,
                "bootstrap_bank_sha256": bank_sha256,
                "pids": [entry["pid"] for entry in launches],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
