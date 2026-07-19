#!/usr/bin/env python3
"""L1c joint-crossing sample (DESIGN-L1.md step 5).

Crosses retro-L0 survivors (p and e roles, all families) with L1b row
patterns (retained + double row + radius arm) into single joint schemas —
all-fresh, full constraint set, one-hit and outside-pair families over
the union placement.  A deterministic stratified sample: joint UNSAT
anywhere would show cross-layer teeth the per-layer censuses missed and
trigger a full product census; all-SAT supports (does not prove) that
the vocabulary is jointly inert on the residual.
"""

from __future__ import annotations

import json
import random
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

from build_retro_l0 import outside_pairs, placement_of  # noqa: E402
from gate_encoder import check_schema  # noqa: E402
from regions import onehit_rad_ne, outside_pair_rad_ne  # noqa: E402

SAMPLES = 40
TIMEOUT_MS = 600_000


def join(retro: dict, l1b: dict) -> dict:
    row_points = [p for p in l1b["points"] if p in {"q", "w", "c1", "c2"}
                  or p.startswith("g")]
    points = list(retro["points"]) + row_points
    assert len(set(points)) == len(points)

    blocks = [dict(b, points=list(b["points"])) for b in retro["blocks"]]
    l1b_placement = placement_of(l1b)
    for point in row_points:
        site = l1b_placement[point]
        if site == "S":
            blocks[1]["points"].append(point)
        else:
            assert site == "O1", (point, site)
            blocks[3]["points"].append(point)

    point_set = set(points)
    exact_classes = [
        dict(cls, exclude=sorted(point_set - {cls["center"]} - set(cls["members"])))
        for cls in retro["exact_classes"]
    ]

    placement = placement_of(retro) | l1b_placement
    rad_ne = onehit_rad_ne(placement)
    seen = {(s["center"], s["a"], s["b"]) for s in rad_ne}
    for spec in outside_pair_rad_ne(outside_pairs(retro)):
        if (spec["center"], spec["a"], spec["b"]) not in seen:
            seen.add((spec["center"], spec["a"], spec["b"]))
            rad_ne.append(spec)

    return {
        "id": f"l1c.{retro['id']}.X.{l1b['id']}",
        "points": points,
        "blocks": blocks,
        "exact_classes": exact_classes,
        "row_eqs": l1b["row_eqs"],
        "radius_rel": l1b["radius_rel"],
        "rad_ne": rad_ne,
        "unique_class": retro["unique_class"],
        "timeout_ms": TIMEOUT_MS,
    }


def main() -> None:
    retro_all = json.loads((HERE / "retro_schemas.json").read_text())
    retro_sat_ids = {
        json.loads(line)["schema_id"]
        for path in HERE.glob("retro_ledger_shard*.jsonl")
        for line in path.read_text().splitlines()
        if line.strip() and json.loads(line)["verdict"] == "sat"
    }
    retro_sat = [s for s in retro_all if s["id"] in retro_sat_ids]
    l1b_all = json.loads((HERE / "l1b_schemas.json").read_text())

    rng = random.Random(97)
    results = {}
    kills = []
    for index in range(SAMPLES):
        retro = rng.choice(retro_sat)
        l1b = rng.choice(l1b_all)
        schema = join(retro, l1b)
        verdict = check_schema(schema)
        results[schema["id"]] = verdict
        print(f"[{index + 1}/{SAMPLES}] {verdict['verdict']} {schema['id']}")
        if verdict["verdict"] != "sat":
            kills.append((schema["id"], verdict.get("core")))

    (HERE / "l1c_sample_results.json").write_text(json.dumps(results, indent=1))
    print(f"output={HERE / 'l1c_sample_results.json'}")
    if kills:
        print(f"JOINT KILLS FOUND ({len(kills)}):")
        for schema_id, core in kills:
            print(f"  {schema_id} core={core}")
    else:
        print("ALL JOINT SAMPLES SAT")


if __name__ == "__main__":
    main()
