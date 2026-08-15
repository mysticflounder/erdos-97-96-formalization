#!/usr/bin/env python3
"""Run the short Schema-12 self-check and write authenticated provenance."""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import freshthird_schema12_pinned_center_universal_escape as probe

CONTRACT = HERE / "schema-v12-contract.md"
SCRIPT = HERE / "freshthird_schema12_pinned_center_universal_escape.py"
OUT_DEFAULT = HERE / "artifacts-schema-v12"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser(description="Run Schema-12 finite self-check")
    parser.add_argument("--out-dir", type=Path, default=OUT_DEFAULT)
    args = parser.parse_args()
    result = probe.self_check()
    if result.get("status") != "PASS":
        return 1
    args.out_dir.mkdir(parents=True, exist_ok=True)
    summary = {
        **result,
        "script_sha256": sha256(SCRIPT),
        "contract_sha256": sha256(CONTRACT),
        "trust_boundary": "finite abstract evidence only; no universal lift or Lean closure",
    }
    path = args.out_dir / "schema-v12-summary.json"
    path.write_text(json.dumps(summary, indent=2, sort_keys=True) + "\n")
    print(json.dumps({"summary": str(path), "status": result["status"]}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
