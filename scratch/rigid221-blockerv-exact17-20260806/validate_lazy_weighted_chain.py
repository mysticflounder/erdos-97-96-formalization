#!/usr/bin/env python3
"""Replay every authenticated edge in a lazy weighted-Kalmanson CNF chain."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import tempfile


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
VALIDATOR = HERE / "validate_lazy_weighted_cnf.py"
LAZY_SCHEMA = "p97-rigid221-exact17-lazy-weighted-cnf-v1"
SOURCE_FILES = (
    HERE / "validate_lazy_weighted_chain.py",
    HERE / "validate_lazy_weighted_cnf.py",
    HERE / "append_weighted_kalmanson_cuts.py",
    HERE / "export_source_faithful_boolean_cnf.py",
    HERE / "exact17_source_faithful_cegar.py",
    HERE / "exact17_fullcover_cegar.py",
    HERE / "exact17_kalmanson.py",
    HERE / "export_exact17_boolean_cnf.py",
    HERE / "exact17_two_rows_shared_late_pair.py",
    HERE / "exact17_committed_direct_row_consumers.py",
    REPO / "census/atail_force/producer_bank.py",
    REPO / "lean/Erdos9796Proof/P97/ATail/KalmansonFourEqualitySchemas.lean",
)


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def resolve_repo_path(raw: str) -> Path:
    path = Path(raw)
    return path if path.is_absolute() else REPO / path


def relative(path: Path) -> str:
    return str(path.relative_to(REPO))


def source_hashes() -> dict[str, str]:
    return {relative(path): sha256(path) for path in SOURCE_FILES}


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--uv", type=Path, default=Path("uv"))
    args = parser.parse_args()

    frozen_sources = source_hashes()
    terminal_manifest = args.manifest.resolve()
    chain: list[Path] = []
    current = terminal_manifest
    while True:
        payload = json.loads(current.read_text())
        if payload.get("schema") != LAZY_SCHEMA:
            root_manifest = current
            root_payload = payload
            break
        chain.append(current)
        base = payload.get("lazy_weighted_base")
        if not isinstance(base, dict):
            raise ValueError(f"lazy manifest has no base: {current}")
        parent = resolve_repo_path(base["manifest"])
        if sha256(parent) != base.get("manifest_sha256"):
            raise ValueError(f"parent manifest hash mismatch: {current}")
        current = parent

    reports = []
    args.output.parent.mkdir(parents=True, exist_ok=True)
    for index, manifest in enumerate(reversed(chain)):
        if source_hashes() != frozen_sources:
            raise RuntimeError("validator sources changed during recursive replay")
        descriptor, temporary_name = tempfile.mkstemp(
            prefix=f"lazy-edge-{index:04d}-",
            suffix=".json",
            dir=args.output.parent,
        )
        os.close(descriptor)
        temporary = Path(temporary_name)
        try:
            result = subprocess.run(
                [
                    str(args.uv),
                    "run",
                    "python",
                    str(VALIDATOR),
                    "--manifest",
                    str(manifest),
                    "--output",
                    str(temporary),
                ],
                cwd=REPO,
                stdout=subprocess.DEVNULL,
                stderr=subprocess.PIPE,
                text=True,
                check=False,
            )
            if result.returncode != 0:
                raise RuntimeError(
                    f"edge {index} validation failed: {result.stderr.strip()}"
                )
            report = json.loads(temporary.read_text())
        finally:
            temporary.unlink(missing_ok=True)
        if report.get("status") != "PASS":
            raise ValueError(f"edge {index} did not validate")
        reports.append(report)

    if source_hashes() != frozen_sources:
        raise RuntimeError("validator sources changed during recursive replay")
    terminal_payload = json.loads(terminal_manifest.read_text())
    report = {
        "schema": "p97-rigid221-exact17-lazy-weighted-chain-validation-v1",
        "status": "PASS",
        "terminal_manifest": relative(terminal_manifest),
        "terminal_manifest_sha256": sha256(terminal_manifest),
        "terminal_cnf_sha256": terminal_payload["cnf_sha256"],
        "root_manifest": relative(root_manifest),
        "root_manifest_sha256": sha256(root_manifest),
        "root_cnf_sha256": root_payload["cnf_sha256"],
        "validator": relative(VALIDATOR),
        "validator_sha256": frozen_sources[relative(VALIDATOR)],
        "source_hashes": frozen_sources,
        "validated_edges": len(reports),
        "edges": reports,
    }
    temporary = args.output.with_suffix(args.output.suffix + ".tmp")
    temporary.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    os.replace(temporary, args.output)
    print(
        json.dumps(
            {
                "schema": report["schema"],
                "status": report["status"],
                "validated_edges": report["validated_edges"],
                "terminal_manifest_sha256": report["terminal_manifest_sha256"],
                "terminal_cnf_sha256": report["terminal_cnf_sha256"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
