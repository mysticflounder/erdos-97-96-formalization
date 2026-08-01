#!/usr/bin/env python3
"""Normalize and attest the externally verified frozen-G3 pure-RUP proof.

This is a one-shot, fail-closed ingress finalizer.  It authenticates the exact
raw DRAT/LRAT pair and drat-trim verification log reported for the frozen
273017-clause core, shifts the dense LRAT addition base over the checker padding
clause, and writes ``pure-rup-report.json`` atomically.  It does not run Lean.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys
import tempfile


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
NORMALIZER = (
    REPO
    / "scratch/card11-exact5-common-fullradius-v7-ingress"
    / "normalize_lrat_for_padded_core.py"
)
SCHEMA = "card11_exact5_common_fullradius.v7.g3.pure-rup.v1"
CORE_SHA256 = "310b30d0b9ad2787599ee9b0edce999edfb333934901ca578734182076771683"
RAW_DRAT_SHA256 = "85d5fde40d58a64e58daac312933c38b26cc027b1b60289bde6204434d55ae69"
RAW_LRAT_SHA256 = "6c9d62e8a3b46054f61bcd17b6faf8695604f8e9635231c3dc9eef2e5fd61c4f"
SOURCE_BASE = 273_017
CHECKER_BASE = 273_018
ADDITIONS = 421_331


class FinalizeError(RuntimeError):
    pass


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def artifact(path: Path, relative_to: Path) -> dict[str, object]:
    if path.is_symlink() or not path.is_file():
        raise FinalizeError(f"missing non-symlink artifact: {path}")
    return {
        "path": path.relative_to(relative_to).as_posix(),
        "byte_count": path.stat().st_size,
        "sha256": sha256_file(path),
    }


def exact_verification(log_text: str) -> None:
    required = (
        r"^s VERIFIED\s*$",
        r"^c 0 RAT lemmas in core; 1 redundant literals in core lemmas\s*$",
        rf"^c parsing input formula with 49360 variables and {SOURCE_BASE} clauses\s*$",
    )
    for pattern in required:
        if re.search(pattern, log_text, re.MULTILINE) is None:
            raise FinalizeError(f"verification log lacks required line: {pattern}")
    if re.search(r"^c [1-9]\d* RAT lemmas in core;", log_text, re.MULTILINE):
        raise FinalizeError("verification log reports nonzero RAT lemmas")


def atomic_json(path: Path, value: dict[str, object]) -> None:
    fd, temporary = tempfile.mkstemp(prefix=f".{path.name}.", dir=path.parent)
    try:
        with os.fdopen(fd, "w", encoding="utf-8") as stream:
            json.dump(value, stream, indent=2, sort_keys=True)
            stream.write("\n")
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary, path)
    except BaseException:
        try:
            os.unlink(temporary)
        except FileNotFoundError:
            pass
        raise


def finalize(directory: Path) -> dict[str, object]:
    directory = directory.resolve()
    raw_drat = directory / "proof.drat"
    raw_lrat = directory / "proof.lrat"
    verify_log = directory / "drat-trim.log"
    normalized = directory / "proof.normalized.lrat"
    normalize_log = directory / "normalize-lrat.log"
    report_path = directory / "pure-rup-report.json"
    for path in (normalized, normalize_log, report_path):
        if path.exists():
            raise FinalizeError(f"refusing to overwrite: {path}")

    drat = artifact(raw_drat, directory)
    lrat = artifact(raw_lrat, directory)
    if drat["sha256"] != RAW_DRAT_SHA256:
        raise FinalizeError("raw DRAT SHA-256 drift")
    if lrat["sha256"] != RAW_LRAT_SHA256:
        raise FinalizeError("raw LRAT SHA-256 drift")
    verify = artifact(verify_log, directory)
    exact_verification(verify_log.read_text(encoding="utf-8", errors="strict"))

    command = [
        sys.executable,
        str(NORMALIZER),
        str(raw_lrat),
        str(normalized),
        "--source-base-clauses",
        str(SOURCE_BASE),
        "--checker-base-clauses",
        str(CHECKER_BASE),
    ]
    completed = subprocess.run(
        command,
        cwd=REPO,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        check=False,
    )
    normalize_text = completed.stdout
    expected_summary = (
        f"kept_additions={ADDITIONS} "
        f"retained_deletions=191522 "
        f"source_base_clauses={SOURCE_BASE} "
        f"checker_base_clauses={CHECKER_BASE} "
        f"dense_id_range={CHECKER_BASE + 1}..{CHECKER_BASE + ADDITIONS} "
    )
    if completed.returncode != 0 or not normalize_text.startswith(expected_summary):
        normalized.unlink(missing_ok=True)
        raise FinalizeError(
            f"LRAT normalization failed ({completed.returncode}): "
            f"{normalize_text[:500]!r}"
        )
    max_match = re.search(r"max_certificate_variable=(\d+)\s*$", normalize_text)
    if max_match is None or int(max_match.group(1)) >= 96_418:
        normalized.unlink(missing_ok=True)
        raise FinalizeError(
            "normalized certificate does not preserve fresh padding variable 96418"
        )
    normalize_log.write_text(normalize_text, encoding="utf-8")
    normalized_record = artifact(normalized, directory)
    normalize_record = artifact(normalize_log, directory)
    report: dict[str, object] = {
        "schema": SCHEMA,
        "status": "EXTERNALLY_VERIFIED",
        "epistemic_status": (
            "drat-trim independently verified this exact raw proof with zero "
            "RAT lemmas; Lean replay has not been run"
        ),
        "source_core_sha256": CORE_SHA256,
        "source_base_clauses": SOURCE_BASE,
        "checker_base_clauses": CHECKER_BASE,
        "proof_kind": "PURE_RUP",
        "rat_lemmas": 0,
        "redundant_literals": 1,
        "additions": ADDITIONS,
        "artifacts": {
            "raw_drat": drat,
            "raw_lrat": lrat,
            "verification_log": verify,
            "normalized_lrat": normalized_record,
            "normalization_log": normalize_record,
        },
    }
    atomic_json(report_path, report)
    return {
        "status": "PURE_RUP_INGRESS_FINALIZED_LEAN_NOT_RUN",
        "report": str(report_path),
        "normalized_lrat": normalized_record,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--pure-rup-dir",
        type=Path,
        default=REPO / "scratch/card11-exact5-common-fullradius-v7-g3-pure-rup",
    )
    args = parser.parse_args()
    try:
        result = finalize(args.pure_rup_dir)
    except (FinalizeError, OSError, UnicodeDecodeError, ValueError) as exc:
        parser.exit(1, f"error: {exc}\n")
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
