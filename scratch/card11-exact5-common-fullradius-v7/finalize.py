#!/usr/bin/env python3
"""Merge separately resumed v7 cases into one hash-checked summary."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
CASES = ("s2_o0", "s2_o9", "s3_o0", "s3_o9")


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def main() -> int:
    records = []
    for name in CASES:
        case_dir = HERE / "runs" / name
        result_path = case_dir / "result.json"
        verification_path = case_dir / "verification.json"
        result = json.loads(result_path.read_text())
        verification = json.loads(verification_path.read_text())
        for filename, field in (
            ("input.cnf", "cnf_sha256"),
            ("manifest.json", "manifest_sha256"),
            ("proof.drat", "proof_sha256"),
        ):
            if result[field] != sha256(case_dir / filename):
                raise RuntimeError(f"{name}: stale {field}")
        if not verification.get("verified"):
            raise RuntimeError(f"{name}: independent verification is not true")
        if verification["cnf_sha256"] != result["cnf_sha256"]:
            raise RuntimeError(f"{name}: verifier used a different CNF")
        result["independent_verification"] = verification
        result_path.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
        records.append(result)
    summary = {
        "schema": "card11_exact5_common_fullradius.v7",
        "timeout_per_case_seconds": 1800,
        "serial": True,
        "maximum_concurrent_cadical_processes": 1,
        "resume_audit": (
            "s2_o9 verification was resumed against its unchanged persisted "
            "CNF/DRAT; s3_o0 and s3_o9 were then selected explicitly, without "
            "rerunning either s2 case."
        ),
        "results": records,
        "terminal": True,
        "all_independently_verified": True,
        "trust_boundary": (
            "Each UNSAT result is independently replayed by drat-trim against "
            "the exact hashed CNF. The missing theorem-level bridge maps the "
            "geometric exact-five common-center residual and its cap labeling "
            "to every Boolean variable family and one of the four shell cases."
        ),
    }
    (HERE / "summary.json").write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n"
    )
    print(json.dumps({
        "cases": len(records),
        "verdicts": [x["verdict"] for x in records],
        "all_independently_verified": True,
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
