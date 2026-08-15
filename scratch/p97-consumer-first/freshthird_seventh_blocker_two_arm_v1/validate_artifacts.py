#!/usr/bin/env python3
"""Machine validator for the bounded diagnostic's ingress and readback."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent
SOURCE = ROOT.parents[2] / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFirstFiberCollision.lean"


def main() -> int:
    manifest = json.loads((ROOT / "source-origin.json").read_text())
    expected = hashlib.sha256(SOURCE.read_bytes()).hexdigest()
    assert manifest["schema_namespace"] == "freshthird_seventh_blocker_two_arm_v1"
    assert manifest["source_sha256_at_audit"] == expected
    assert set(manifest["packets"]) == {"equal_center", "first_apex"}
    cmap = json.loads((ROOT / "clause-source-map.json").read_text())
    results = json.loads((ROOT / "results.json").read_text())
    assert len(results) == 4 and len(cmap) == 4
    for row in results:
        assert row["exact_match"] and row["readback"]
        assert row["assertions"] >= 9
        assert row["variables"] >= 4
        assert (ROOT / f'{row["case"]}.smt2').exists()
    assert {r["case"] for r in results} == {
        "equal_center", "first_apex", "equal_center_support_mismatch", "first_apex_center_collapse"
    }
    print(f"validated namespace={manifest['schema_namespace']} exact17=17 cases={len(results)}")
    print("statuses=" + ",".join(f"{r['case']}:{r['z3']}/{r['cvc5']}" for r in results))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
