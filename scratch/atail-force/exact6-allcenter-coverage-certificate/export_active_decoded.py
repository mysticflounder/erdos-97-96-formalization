#!/usr/bin/env python3
"""Export a replayed CNF model to allcenter_gate.py's decoded-model interface."""

from __future__ import annotations

import argparse
import json
from pathlib import Path


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", type=Path, required=True)
    parser.add_argument("--orbit", required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    census = json.loads(args.input.read_text(encoding="utf-8"))
    matches = [row for row in census["results"] if row["orbit"] == args.orbit]
    if len(matches) != 1 or matches[0]["status"] != "SAT_ASSIGNMENT_REPLAYED":
        raise ValueError("requested orbit has no unique replayed SAT model")
    decoded = matches[0]["decoded"]
    if sorted(map(int, decoded["rows"])) != list(range(14)):
        raise ValueError("decoded rows do not cover all carrier centers")
    payload = {
        "schema": "p97-exact6-allcenter-active-decoded-export-v1",
        "epistemic_status": "FINITE_STRUCTURAL_SAT_MODEL_FOR_ACTIVE_ORACLE_INPUT",
        "orbit": args.orbit,
        "source_cnf_sha256": matches[0]["cnf_sha256"],
        "decoded": decoded,
        "python_adapter": {
            "rows": "{int(k): tuple(v) for k, v in decoded['rows'].items()}",
            "blockers": "tuple(decoded['blockers'])",
            "shell": "tuple(decoded['shell'])",
            "roles": "dict(decoded['roles'])",
        },
        "live_closure": False,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "status": "ACTIVE_DECODED_EXPORT_WRITTEN",
        "orbit": args.orbit,
        "output": str(args.output),
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
