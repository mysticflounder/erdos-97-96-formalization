#!/usr/bin/env python3
"""Run one Schema-13 construction self-check and optional short diagnostic."""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import freshthird_schema13_universal_escape_probe as probe  # noqa: E402

CONTRACT = HERE / "schema-v13-contract.md"
SCRIPT = HERE / "freshthird_schema13_universal_escape_probe.py"
METADATA = HERE / "schema_v13_freshthird_universal_escape.json"
OUT_DEFAULT = HERE / "artifacts-schema-v13"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--diagnostic", action="store_true", help="run one 100ms solver case")
    parser.add_argument("--out-dir", type=Path, default=OUT_DEFAULT)
    args = parser.parse_args()
    check = probe.self_check()
    if check.get("status") != "PASS":
        return 1
    result = dict(check)
    if args.diagnostic:
        result["diagnostic"] = probe.run_one(probe._args(timeout_ms=100))
    result.update(
        {
            "script_sha256": sha256(SCRIPT),
            "contract_sha256": sha256(CONTRACT),
            "metadata_sha256": sha256(METADATA),
            "metadata": METADATA.name,
            "trust_boundary": "finite integrated Schema-11/13 evidence only; no universal lift",
        }
    )
    args.out_dir.mkdir(parents=True, exist_ok=True)
    path = args.out_dir / "schema-v13-summary.json"
    path.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps({"summary": str(path), "status": result["status"]}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
