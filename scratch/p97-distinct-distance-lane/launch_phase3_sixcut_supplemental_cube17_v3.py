"""Launch the third supplemental 17-worker six-cut Phase-3 cube miner."""

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
    "phase3_sixcut_supplemental_cube17_v2_20260729/"
    "learned-certificates.jsonl"
)
OUTPUT = (
    ROOT
    / "scratch/p97-distinct-distance-lane/"
    "phase3_sixcut_supplemental_cube17_v3_20260729"
)
LOG = OUTPUT.with_suffix(".console.log")
LAUNCH = OUTPUT.with_suffix(".launch.json")
EXPECTED_SOURCE_SHA256 = (
    "af87693d1ff05f556c967237704edd447d3800486bdb530e4b1ebefd5897e33a"
)
EXPECTED_BANK_SHA256 = (
    "56adde13292eadb91e5a783443c6b56b2f1952e1ffbf51f9fceb24d085bbd62a"
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
    for path in (OUTPUT, LOG, LAUNCH):
        if path.exists():
            raise SystemExit(f"refusing to reuse existing artifact: {path}")

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
    command = [
        nice,
        "-n",
        "10",
        sys.executable,
        str(SOURCE),
        "--out",
        str(OUTPUT),
        "--timeout",
        "300",
        "--learned-core-limit",
        "100000",
        "--survivor-limit",
        "1000",
        "--workers",
        "17",
        "--parallel-mode",
        "cube-batch",
        "--cube-depth",
        "5",
        "--cube-artifact-mode",
        "compact",
        "--max-new-raw",
        "10000",
        "--bootstrap-results",
        str(BANK),
    ]
    with LOG.open("xb") as log_handle:
        process = subprocess.Popen(
            command,
            cwd=ROOT,
            env=environment,
            stdin=subprocess.DEVNULL,
            stdout=log_handle,
            stderr=subprocess.STDOUT,
            start_new_session=True,
        )
    launch_record = {
        "schema": "p97-phase3-sixcut-supplemental-cube17-launch-v3",
        "launched_at": datetime.now(UTC).isoformat(),
        "pid": process.pid,
        "output": str(OUTPUT.relative_to(ROOT)),
        "console_log": str(LOG.relative_to(ROOT)),
        "source": str(SOURCE.relative_to(ROOT)),
        "source_sha256": source_sha256,
        "bootstrap_bank": str(BANK.relative_to(ROOT)),
        "bootstrap_bank_sha256": bank_sha256,
        "algebraic_bootstrap_mode": (
            "default ordered old-UNIT2, new-UNIT3, "
            "REAL_DISTINCTNESS_CONTRADICTION1"
        ),
        "parallel_mode": "cube-batch",
        "workers": 17,
        "cube_depth": 5,
        "cube_artifact_mode": "compact",
        "max_new_raw": 10000,
        "command": command,
    }
    LAUNCH.write_text(
        json.dumps(launch_record, indent=2, sort_keys=True) + "\n"
    )
    print(
        json.dumps(
            {
                "pid": process.pid,
                "output": str(OUTPUT.relative_to(ROOT)),
                "launch": str(LAUNCH.relative_to(ROOT)),
                "source_sha256": source_sha256,
                "bootstrap_bank_sha256": bank_sha256,
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
