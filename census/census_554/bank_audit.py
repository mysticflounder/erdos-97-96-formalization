"""Normalized structural and optional exact audit for a Census554 bank."""

from __future__ import annotations

import argparse
import hashlib
import importlib
import json
import sys
from collections import defaultdict
from pathlib import Path

from .combinatorics import canonical_pattern
from .io_protocol import atomic_write_json, resolve_under, row_sha256, snapshot_bank


def _stable_bytes(value) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode()


def _digest(value) -> str:
    return hashlib.sha256(_stable_bytes(value)).hexdigest()


def _proof_identity(row):
    """Fields that identify one banked proof, excluding run bookkeeping."""

    return {
        key: row.get(key)
        for key in ("pid", "pattern", "kill", "n_orbit", "cert")
    }


def _percentile(sorted_values, numerator, denominator):
    if not sorted_values:
        return None
    index = min(
        len(sorted_values) - 1,
        (len(sorted_values) * numerator + denominator - 1) // denominator - 1,
    )
    return sorted_values[index]


def audit_bank(root: Path, *, exact: bool = False):
    rows, raw = snapshot_bank(root)

    by_pid = defaultdict(list)
    by_motif = defaultdict(list)
    by_proof = defaultdict(list)
    for index, row in enumerate(rows, 1):
        digest = row_sha256(row)
        by_pid[str(row.get("pid"))].append((index, digest))
        by_proof[_digest(_proof_identity(row))].append((index, row))
        motif_digest = _digest(canonical_pattern(row["pattern"]))
        by_motif[motif_digest].append((index, digest, str(row.get("pid"))))

    selected = {
        proof_digest: max(
            candidates,
            key=lambda item: (len(item[1]), _stable_bytes(item[1])),
        )[1]
        for proof_digest, candidates in by_proof.items()
    }
    normalized_rows = []
    seen_proofs = set()
    for row in rows:
        proof_digest = _digest(_proof_identity(row))
        if proof_digest not in seen_proofs:
            normalized_rows.append(selected[proof_digest])
            seen_proofs.add(proof_digest)
    normalized = b"".join(_stable_bytes(row) + b"\n" for row in normalized_rows)

    duplicate_ids = {
        pid: {
            "rows": [index for index, _ in occurrences],
            "content_identical": len({digest for _, digest in occurrences}) == 1,
            "proof_identical": len({
                _digest(_proof_identity(rows[index - 1]))
                for index, _ in occurrences
            }) == 1,
        }
        for pid, occurrences in by_pid.items()
        if len(occurrences) > 1
    }
    duplicate_motifs = {
        motif: {
            "rows": [index for index, _, _ in occurrences],
            "pids": [pid for _, _, pid in occurrences],
            "content_identical": len({digest for _, digest, _ in occurrences}) == 1,
            "proof_identical": len({
                _digest(_proof_identity(rows[index - 1]))
                for index, _, _ in occurrences
            }) == 1,
        }
        for motif, occurrences in by_motif.items()
        if len(occurrences) > 1
    }

    referenced = set()
    missing = []
    cert_size_by_path = {}
    for index, row in enumerate(rows, 1):
        relative = row.get("cert")
        if not isinstance(relative, str):
            missing.append({"row": index, "path": relative})
            continue
        referenced.add(relative)
        try:
            path = resolve_under(root, relative)
        except ValueError:
            missing.append({"row": index, "path": relative, "error": "path escape"})
            continue
        if not path.is_file():
            missing.append({"row": index, "path": relative})
            continue
        cert_size_by_path[relative] = path.stat().st_size
    cert_sizes = sorted(cert_size_by_path.values())
    cert_files = {
        str(path.relative_to(root))
        for path in (root / "certs").glob("pat_*.json")
        if path.is_file()
    }
    orphans = sorted(cert_files - referenced)

    exact_report = {"status": "NOT_RUN", "verified": 0, "failures": []}
    if exact:
        sys.path.insert(0, str(root))
        verifier = importlib.import_module("verify_certs")
        exact_report["status"] = "PASS"
        for row in normalized_rows:
            try:
                with open(resolve_under(root, row["cert"]), encoding="utf-8") as handle:
                    certificate = json.load(handle)
                verifier.verify_cert(row, certificate)
                exact_report["verified"] += 1
            except BaseException as exc:
                exact_report["status"] = "FAIL"
                exact_report["failures"].append({
                    "pid": row.get("pid"),
                    "error": f"{type(exc).__name__}: {exc}",
                })

    unexplained_id_duplicates = [
        pid for pid, info in duplicate_ids.items() if not info["proof_identical"]
    ]
    unexplained_motif_duplicates = [
        motif for motif, info in duplicate_motifs.items()
        if not info["proof_identical"]
    ]
    structural_pass = not (
        unexplained_id_duplicates
        or unexplained_motif_duplicates
        or missing
        or orphans
    )
    if not structural_pass or exact_report["status"] == "FAIL":
        status = "FAIL"
    elif exact_report["status"] == "PASS":
        status = "PASS"
    else:
        status = "STRUCTURAL_PASS"
    return {
        "schema": "census554_bank_audit.v1",
        "status": status,
        "root": str(root),
        "bank": {
            "raw_rows": len(rows),
            "raw_sha256": hashlib.sha256(raw).hexdigest(),
            "normalized_rows": len(normalized_rows),
            "normalized_sha256": hashlib.sha256(normalized).hexdigest(),
        },
        "duplicates": {
            "ids": duplicate_ids,
            "canonical_motifs": duplicate_motifs,
            "unexplained_ids": unexplained_id_duplicates,
            "unexplained_canonical_motifs": unexplained_motif_duplicates,
        },
        "certificates": {
            "referenced_paths": len(referenced),
            "files": len(cert_files),
            "missing": missing,
            "orphans": orphans,
            "bytes": {
                "total": sum(cert_sizes),
                "p50": _percentile(cert_sizes, 1, 2),
                "p90": _percentile(cert_sizes, 9, 10),
                "p99": _percentile(cert_sizes, 99, 100),
                "maximum": max(cert_sizes, default=None),
                "over_100_mib": sum(size > 100 * 1024 * 1024 for size in cert_sizes),
            },
            "largest": [
                {"path": path, "bytes": size}
                for path, size in sorted(
                    cert_size_by_path.items(), key=lambda item: (-item[1], item[0])
                )[:20]
            ],
        },
        "exact_identity": exact_report,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, required=True)
    parser.add_argument("--out", type=Path)
    parser.add_argument("--exact", action="store_true")
    args = parser.parse_args()
    report = audit_bank(args.root.resolve(), exact=args.exact)
    if args.out:
        atomic_write_json(args.out, report)
    print(json.dumps(report, sort_keys=True, indent=2))
    return 0 if report["status"] != "FAIL" else 1


if __name__ == "__main__":
    raise SystemExit(main())
