#!/usr/bin/env python3
"""L2 exploration: HYPOTHETICAL W-centered one-hit families on the retro
survivors.

The W-centered one-hit analogue is NOT proven (no bank theorem; the
endpoint kernel plausibly permutes to W but the acute hypothesis is
unverified).  Before investing in the Lean question, this census tests
whether it would even pay: each of the 876 retro survivors is re-run
with the W families (rad_ne at W for same-closed-cap pairs in the
physical and opp1 regions) added on top of its existing constraints.

- kills here are CONDITIONAL on the W one-hit being provable — they
  are a payoff estimate, not certificates;
- zero kills would make the Lean question moot for this residual.
"""

from __future__ import annotations

import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

from build_retro_l0 import placement_of  # noqa: E402
from regions import APEX_FAMILIES_WITH_W, onehit_rad_ne  # noqa: E402

TIMEOUT_MS = 600_000


def with_w_families(retro: dict) -> dict:
    schema = json.loads(json.dumps(retro))
    placement = placement_of(schema)
    specs = onehit_rad_ne(placement, APEX_FAMILIES_WITH_W)
    present = {(s["center"], s["a"], s["b"]) for s in schema["rad_ne"]}
    added = [s for s in specs
             if (s["center"], s["a"], s["b"]) not in present]
    assert all(s["center"] == "W" for s in added), added
    schema["rad_ne"] = schema["rad_ne"] + added
    schema["id"] = f"l2w.{retro['id']}"
    schema["timeout_ms"] = TIMEOUT_MS
    return schema


def main() -> None:
    retro_all = json.loads((HERE / "retro_schemas.json").read_text())
    retro_sat_ids = {
        json.loads(line)["schema_id"]
        for path in HERE.glob("retro_ledger_shard*.jsonl")
        for line in path.read_text().splitlines()
        if line.strip() and json.loads(line)["verdict"] == "sat"
    }
    schemas = [with_w_families(s) for s in retro_all
               if s["id"] in retro_sat_ids]
    sample = schemas[0]
    n_w = sum(1 for s in sample["rad_ne"] if s["center"] == "W")
    print(f"{len(schemas)} survivor schemas + W families "
          f"(e.g. {sample['id']}: {n_w} W rad_ne specs)")
    (HERE / "l2w_schemas.json").write_text(json.dumps(schemas))
    print("wrote l2w_schemas.json")


if __name__ == "__main__":
    main()
