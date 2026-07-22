#!/usr/bin/env python3
"""Build both spoke orbits twice, check determinism, and run bounded SAT."""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import sys
from pathlib import Path


HERE = Path(__file__).resolve().parent


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def invoke(command: list[str], log: Path) -> None:
    completed = subprocess.run(command, text=True, capture_output=True, check=False)
    log.write_text(completed.stdout + completed.stderr, encoding="utf-8")
    if completed.returncode != 0:
        raise RuntimeError(
            f"command failed ({completed.returncode}); see {log}: {command}"
        )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output-dir", type=Path, default=HERE / "artifacts")
    parser.add_argument("--timeout-seconds", type=int, default=60)
    parser.add_argument("--seed", type=int, default=0)
    args = parser.parse_args()
    args.output_dir.mkdir(parents=True, exist_ok=True)

    smoke_path = args.output_dir / "smoke.json"
    invoke(
        [sys.executable, str(HERE / "smoke.py"), "--output", str(smoke_path)],
        args.output_dir / "smoke.log",
    )
    source_smoke_path = args.output_dir / "source-smoke.json"
    invoke(
        [
            sys.executable, str(HERE / "source_smoke.py"),
            "--output", str(source_smoke_path),
            "--timeout-seconds", str(args.timeout_seconds),
            "--seed", str(args.seed),
        ],
        args.output_dir / "source-smoke.log",
    )

    summary: dict[str, object] = {
        "schema": "p97-exact5-card13-distinct-aggregate-run-v1",
        "seed": args.seed,
        "timeout_seconds_per_orbit": args.timeout_seconds,
        "pipeline_smoke": json.loads(smoke_path.read_text()),
        "source_smoke": json.loads(source_smoke_path.read_text()),
        "orbits": {},
    }
    for orientation in ("direct", "mirror"):
        cnf = args.output_dir / f"{orientation}.cnf"
        cnf_repeat = args.output_dir / f"{orientation}.repeat.cnf"
        metadata = args.output_dir / f"{orientation}.metadata.json"
        metadata_repeat = args.output_dir / f"{orientation}.repeat.metadata.json"
        common = [
            sys.executable, str(HERE / "export_cnf.py"),
            "--orientation", orientation,
            "--seed", str(args.seed),
        ]
        invoke(
            common + ["--output-cnf", str(cnf),
                      "--output-metadata", str(metadata)],
            args.output_dir / f"{orientation}.build.log",
        )
        invoke(
            common + ["--output-cnf", str(cnf_repeat),
                      "--output-metadata", str(metadata_repeat)],
            args.output_dir / f"{orientation}.repeat.build.log",
        )
        deterministic = cnf.read_bytes() == cnf_repeat.read_bytes()
        if not deterministic:
            raise AssertionError(f"nondeterministic CNF export for {orientation}")

        result_path = args.output_dir / f"{orientation}.result.json"
        invoke(
            [
                sys.executable, str(HERE / "run_solver.py"),
                "--cnf", str(cnf),
                "--proof", str(args.output_dir / f"{orientation}.drat"),
                "--log", str(args.output_dir / f"{orientation}.cadical.log"),
                "--drat-log", str(args.output_dir / f"{orientation}.drat.log"),
                "--output", str(result_path),
                "--timeout-seconds", str(args.timeout_seconds),
            ],
            args.output_dir / f"{orientation}.runner.log",
        )
        result = json.loads(result_path.read_text())
        summary["orbits"][orientation] = {
            "normalized_orbit": {
                "direct": "asymmetricSourceLeft",
                "mirror": "asymmetricSourceRight",
            }[orientation],
            "deterministic_export": deterministic,
            "cnf_sha256": sha256(cnf),
            "metadata": json.loads(metadata.read_text()),
            "solver": result,
        }
        cnf_repeat.unlink()
        metadata_repeat.unlink()

    summary_path = args.output_dir / "run-summary.json"
    summary_path.write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps(summary, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
