#!/usr/bin/env python3
"""Fail-closed integrity summary for direct exact-SMT portfolio packages."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def atomic_json(path: Path, payload: object) -> None:
    temporary = path.with_name(path.name + ".tmp")
    temporary.write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    temporary.replace(path)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--directory", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--expected-count", required=True, type=int)
    args = parser.parse_args()

    manifests = sorted(args.directory.glob("*.json.manifest.json"))
    if len(manifests) != args.expected_count:
        raise SystemExit(
            f"expected {args.expected_count} manifests, found {len(manifests)}"
        )
    records = []
    seen_orbits: set[str] = set()
    for manifest_path in manifests:
        result_path = Path(str(manifest_path).removesuffix(".manifest.json"))
        events_path = Path(str(result_path) + ".events.jsonl")
        lock_path = Path(str(result_path) + ".lock")
        alive_path = Path(str(result_path) + ".alive.json")
        if lock_path.exists():
            raise SystemExit(f"active/stale lock remains: {lock_path}")
        if not result_path.is_file() or not events_path.is_file():
            raise SystemExit(f"incomplete result package for {result_path}")

        manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
        result = json.loads(result_path.read_text(encoding="utf-8"))
        events = [
            json.loads(line)
            for line in events_path.read_text(encoding="utf-8").splitlines()
            if line
        ]
        if manifest.get("schema") != "p97-exact6-integrated-direct-exact-smt-manifest-v1":
            raise SystemExit(f"bad manifest schema: {manifest_path}")
        if result.get("schema") != "p97-exact6-integrated-direct-exact-smt-result-v1":
            raise SystemExit(f"bad result schema: {result_path}")
        if manifest.get("profile") != "kalmanson" or result.get("profile") != "kalmanson":
            raise SystemExit(f"non-Kalmanson portfolio member: {result_path}")
        if manifest.get("orbit") != result.get("orbit"):
            raise SystemExit(f"orbit drift: {result_path}")
        orbit = manifest["orbit"]
        if orbit in seen_orbits:
            raise SystemExit(f"duplicate orbit: {orbit}")
        seen_orbits.add(orbit)
        if result.get("run_manifest_sha256") != sha256(manifest_path):
            raise SystemExit(f"manifest hash drift: {result_path}")
        if len(events) != 2 or [item.get("phase") for item in events] != ["start", "done"]:
            raise SystemExit(f"event package is not exactly start/done: {events_path}")
        if events[0].get("manifest_sha256") != sha256(manifest_path):
            raise SystemExit(f"start event manifest hash drift: {events_path}")
        if events[1].get("result_sha256") != sha256(result_path):
            raise SystemExit(f"done event result hash drift: {events_path}")

        status = result.get("solver", {}).get("status")
        if status == "sat":
            if not alive_path.is_file() or result.get("alive_sha256") != sha256(alive_path):
                raise SystemExit(f"SAT result lacks a hash-pinned ALIVE: {result_path}")
        elif alive_path.exists():
            raise SystemExit(f"non-SAT result has an ALIVE sidecar: {result_path}")

        records.append(
            {
                "orbit": orbit,
                "random_seed": manifest.get("random_seed"),
                "timeout_ms": manifest.get("timeout_ms"),
                "seed_count": len(manifest.get("seed_inputs", [])),
                "imports": result.get("import_records"),
                "solver": result.get("solver"),
                "epistemic_status": result.get("epistemic_status"),
                "manifest_path": str(manifest_path),
                "manifest_sha256": sha256(manifest_path),
                "events_path": str(events_path),
                "events_sha256": sha256(events_path),
                "result_path": str(result_path),
                "result_sha256": sha256(result_path),
                "alive_path": str(alive_path) if alive_path.exists() else None,
            }
        )

    statuses = sorted({record["solver"]["status"] for record in records})
    payload = {
        "schema": "p97-exact6-integrated-direct-portfolio-summary-v1",
        "epistemic_status": (
            "EXACT_DIRECT_PORTFOLIO_COMPLETE_NO_ALIVE_NO_UNSAT_PROOF"
            if statuses == ["unknown"]
            else "EXACT_DIRECT_PORTFOLIO_COMPLETE_MIXED_RESULTS_REVIEW_REQUIRED"
        ),
        "directory": str(args.directory),
        "member_count": len(records),
        "orbits": sorted(seen_orbits),
        "statuses": statuses,
        "members": records,
    }
    atomic_json(args.output, payload)
    print(json.dumps(payload, sort_keys=True))


if __name__ == "__main__":
    main()
