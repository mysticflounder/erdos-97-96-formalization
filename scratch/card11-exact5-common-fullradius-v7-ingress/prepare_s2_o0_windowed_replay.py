#!/usr/bin/env python3
"""Adapt the frozen exact-11 s2_o0 pure-RUP ingress to bounded Lean windows.

This script does not run a solver or claim a source-to-valuation bridge.  It
hash-checks the frozen core and independently verified zero-RAT certificate,
then delegates structural replay materialization to the audited
checkpoint/window package tools.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import sys
import tempfile
from typing import Any


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
P5_TOOLS = REPO / "scratch/atail-force/unique4-exact-two-lrat-ingress"
DEFAULT_INGRESS = HERE / "s2_o0-ingress"
DEFAULT_PROOF_DIR = HERE / "s2_o0-pure-rup"
DEFAULT_OUTPUT = HERE / "s2_o0-windowed-replay"

EXPECTED_CORE_SHA256 = (
    "ee65de56f8b1f733957bd17b939efae63dbc9afbab21c0837af35f3cdae8b24c"
)
EXPECTED_DRAT_SHA256 = (
    "8d4280e69918c269338ab4fd3280108f5d35d770fa0b7c56b483fbee79d4211f"
)
EXPECTED_RAW_LRAT_SHA256 = (
    "86965c1513a4879dcf16604d56328e2c6b86d9f2966169091d8b1f306bb6eafa"
)
EXPECTED_DENSE_LRAT_SHA256 = (
    "9475c3f9923546a16bd5ebdc01cc538b77cbd6d4f9d1119ef01c93f5fe399350"
)
EXPECTED_VERIFY_LOG_SHA256 = (
    "74db18e164f9250d8d0a4dbbdd0c882a56723f17b022fb5e9aea2a4cbde2ce5a"
)
EXPECTED_CORE_VARIABLES = 49_357
EXPECTED_CORE_CLAUSES = 81_253
CHECKER_VARIABLES = EXPECTED_CORE_VARIABLES
CHECKER_BASE_CLAUSES = EXPECTED_CORE_CLAUSES
EXPECTED_ADDITIONS = 6_611
EXPECTED_FIRST_ADDITION = 81_254
EXPECTED_LAST_ADDITION = 87_864


class AdapterError(ValueError):
    """A frozen ingress or adapter invariant failed."""


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise AdapterError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


sys.path.insert(0, str(P5_TOOLS))
checkpointed = load_module(
    "materialize_checkpointed_rup",
    P5_TOOLS / "materialize_checkpointed_rup.py",
)
windowed = load_module(
    "materialize_windowed_rup",
    P5_TOOLS / "materialize_windowed_rup.py",
)
compact = load_module(
    "emit_compact_windowed_rup_replay_package",
    P5_TOOLS / "emit_compact_windowed_rup_replay_package.py",
)


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def artifact(path: Path, *, relative_to: Path | None = None) -> dict[str, Any]:
    rendered = os.path.relpath(path, relative_to) if relative_to else str(path)
    return {
        "path": rendered,
        "byte_count": path.stat().st_size,
        "sha256": sha256(path),
    }


def atomic_json(path: Path, payload: dict[str, Any]) -> None:
    text = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    path.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.NamedTemporaryFile(
        "w", encoding="utf-8", dir=path.parent, delete=False
    ) as stream:
        stream.write(text)
        staged = Path(stream.name)
    os.replace(staged, path)


def check_ingress(
    ingress: Path, proof_dir: Path
) -> tuple[Path, Path, Path, Path, Path, Path]:
    report_path = ingress / "ingress-report.json"
    report = json.loads(report_path.read_text(encoding="utf-8"))
    if report.get("status") != "LRAT_MATERIALIZED_LEAN_REPLAY_PENDING":
        raise AdapterError("unexpected s2_o0 ingress status")
    artifacts = report.get("artifacts")
    if not isinstance(artifacts, dict):
        raise AdapterError("ingress report has no artifacts object")
    core = ingress / "core.cnf"
    record = artifacts.get("core.cnf")
    if not isinstance(record, dict):
        raise AdapterError("ingress report lacks core.cnf")
    actual_core_hash = sha256(core)
    if (
        actual_core_hash != EXPECTED_CORE_SHA256
        or actual_core_hash != record.get("sha256")
        or core.stat().st_size != int(record.get("bytes", -1))
    ):
        raise AdapterError(f"hash or byte-count drift for {core}")
    with core.open("r", encoding="ascii", newline="") as stream:
        if stream.readline() != (
            f"p cnf {EXPECTED_CORE_VARIABLES} {EXPECTED_CORE_CLAUSES}\n"
        ):
            raise AdapterError("unexpected core DIMACS header")

    drat = proof_dir / "core.plain.drat"
    raw_lrat = proof_dir / "core.plain.lrat"
    dense_lrat = proof_dir / "core.plain.dense.lrat"
    verify_log = proof_dir / "drat-trim-verify.log"
    for path, expected_hash in (
        (drat, EXPECTED_DRAT_SHA256),
        (raw_lrat, EXPECTED_RAW_LRAT_SHA256),
        (dense_lrat, EXPECTED_DENSE_LRAT_SHA256),
        (verify_log, EXPECTED_VERIFY_LOG_SHA256),
    ):
        if sha256(path) != expected_hash:
            raise AdapterError(f"hash drift for {path}")
    verification = verify_log.read_text(encoding="utf-8")
    if "\ns VERIFIED\n" not in f"\n{verification}" or "0 RAT lemmas" not in verification:
        raise AdapterError("plain proof log lacks VERIFIED or zero-RAT evidence")
    return report_path, core, drat, raw_lrat, dense_lrat, verify_log


def inspect_lrat(lrat: Path) -> dict[str, int]:
    additions = 0
    first_addition: int | None = None
    last_addition: int | None = None
    terminal_empty: int | None = None
    with lrat.open("r", encoding="ascii", newline="") as stream:
        for line in stream:
            fields = line.split()
            if len(fields) >= 2 and fields[1] == "d":
                continue
            if not fields:
                raise AdapterError("blank LRAT line")
            addition_id = int(fields[0])
            clause_end = fields.index("0", 1)
            additions += 1
            first_addition = addition_id if first_addition is None else first_addition
            last_addition = addition_id
            if clause_end == 1:
                terminal_empty = addition_id
    if (
        additions != EXPECTED_ADDITIONS
        or first_addition != EXPECTED_FIRST_ADDITION
        or last_addition != EXPECTED_LAST_ADDITION
        or terminal_empty != EXPECTED_LAST_ADDITION
    ):
        raise AdapterError("normalized LRAT count/id/terminal drift")
    return {
        "additions": additions,
        "first_addition": first_addition,
        "last_addition": last_addition,
        "terminal_empty_addition": terminal_empty,
    }


def prepare(
    ingress: Path,
    proof_dir: Path,
    output: Path,
    *,
    max_actions: int,
    max_lrat_bytes: int,
) -> dict[str, Any]:
    ingress = ingress.resolve()
    proof_dir = proof_dir.resolve()
    output = output.resolve()
    if output.exists():
        raise AdapterError(f"refusing to overwrite existing output: {output}")
    output.mkdir(parents=True)
    report_path, core, drat, raw_lrat, lrat, verify_log = check_ingress(
        ingress, proof_dir
    )
    lrat_counts = inspect_lrat(lrat)
    source_manifest_path = output / "source-manifest.json"
    source_manifest: dict[str, Any] = {
        "schema": "card11-exact5-common-fullradius-v7-s2-o0-windowed-source-v2",
        "epistemic_status": (
            "EXTERNALLY VERIFIED PURE-RUP CORE; LEAN REPLAY AND "
            "SOURCE-VALUATION BRIDGE NOT YET COMPLETE"
        ),
        "claim_scope": (
            "Hash-bound adaptation of the fixed s2_o0 core only; this is not "
            "the exact-eleven closure theorem or its source semantic bridge."
        ),
        "source_ingress_report": artifact(report_path, relative_to=output),
        "source_core": artifact(core, relative_to=output),
        "plain_drat": artifact(drat, relative_to=output),
        "plain_raw_lrat": artifact(raw_lrat, relative_to=output),
        "normalized_dense_lrat": artifact(lrat, relative_to=output),
        "drat_trim_verification_log": artifact(verify_log, relative_to=output),
        "counts": {
            "source_variables": EXPECTED_CORE_VARIABLES,
            "source_clauses": EXPECTED_CORE_CLAUSES,
            "checker_variables": CHECKER_VARIABLES,
            "checker_base_clauses": CHECKER_BASE_CLAUSES,
            **lrat_counts,
        },
    }
    atomic_json(source_manifest_path, source_manifest)
    checkpointed_dir = output / "checkpointed"
    second_start = EXPECTED_FIRST_ADDITION + EXPECTED_ADDITIONS // 2
    checkpointed_manifest = checkpointed.materialize(
        cnf_path=core,
        lrat_path=lrat,
        output_dir=checkpointed_dir,
        second_shard_first_addition=second_start,
        source_certificate=source_manifest,
        source_certificate_record=checkpointed.artifact_record(
            source_manifest_path
        ),
    )
    windowed_dir = output / "windowed"
    windowed_manifest = windowed.materialize_windows(
        package_dir=checkpointed_dir,
        output_dir=windowed_dir,
        max_actions=max_actions,
        max_lrat_bytes=max_lrat_bytes,
    )
    compact_dir = output / "compact"
    compact_manifest = compact.emit(windowed_dir, compact_dir)
    report = {
        "schema": "card11-exact5-common-fullradius-v7-s2-o0-windowed-adapter-v1",
        "status": "STRUCTURALLY_MATERIALIZED_LEAN_REPLAY_PENDING",
        "second_shard_first_addition": second_start,
        "checkpointed_package_sha256": checkpointed_manifest["package_sha256"],
        "windowed_package_sha256": windowed_manifest["package_sha256"],
        "compact_replay_package_sha256": compact_manifest[
            "compact_replay_package_sha256"
        ],
        "counts": compact_manifest["counts"],
    }
    atomic_json(output / "adapter-report.json", report)
    return report


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--ingress", type=Path, default=DEFAULT_INGRESS)
    parser.add_argument("--proof-dir", type=Path, default=DEFAULT_PROOF_DIR)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--max-actions", type=int, default=4_000)
    parser.add_argument("--max-lrat-bytes", type=int, default=4 * 1024 * 1024)
    args = parser.parse_args()
    try:
        report = prepare(
            args.ingress,
            args.proof_dir,
            args.output,
            max_actions=args.max_actions,
            max_lrat_bytes=args.max_lrat_bytes,
        )
    except (
        AdapterError,
        checkpointed.MaterializationError,
        windowed.MaterializationError,
        compact.CompactReplayPackageError,
        OSError,
        ValueError,
    ) as exc:
        parser.exit(1, f"error: {exc}\n")
    print(json.dumps(report, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
