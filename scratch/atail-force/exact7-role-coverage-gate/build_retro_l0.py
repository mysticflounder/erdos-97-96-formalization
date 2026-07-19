#!/usr/bin/env python3
"""Retro-L0 schema builder (DESIGN-L1.md step 2).

Takes the identification-layer SAT survivors (744 all-fresh from
l0_ledger.jsonl + 1008 single p0~p1 merges from merge_ledger.jsonl.gz),
augments each with the newly pinned families:

- one-hit region rad_ne at EA and O (regions.onehit_rad_ne), and
- the production-terminal outside-pair disequalities at EA
  (regions.outside_pair_rad_ne — sound on the all-reverse arm, which is
  the arm the L0 base system encodes),

and writes retro_schemas.json for census_runner.py.  Dead schemas stay
dead under added constraints, so only SAT survivors are re-run.
"""

from __future__ import annotations

import gzip
import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

from regions import onehit_rad_ne, outside_pair_rad_ne  # noqa: E402

NAMED_SITES = {p: p for p in ("EA", "O", "W", "s0", "b0", "s1", "b1", "s2")}


def sat_ids(ledger_lines) -> set[str]:
    ids = set()
    for line in ledger_lines:
        if line.strip():
            row = json.loads(line)
            if row["verdict"] == "sat":
                ids.add(row["schema_id"])
    return ids


def placement_of(schema: dict) -> dict[str, str]:
    blocks = schema["blocks"]
    assert blocks[0]["points"] == ["EA"] and blocks[2]["points"] == ["O"]
    assert blocks[4]["points"] == ["W"]
    placement = dict(NAMED_SITES)
    for point in blocks[1]["points"]:
        placement[point] = "S"
    for point in blocks[3]["points"]:
        placement[point] = "O1"
    assert set(placement) == set(schema["points"])
    return placement


def resolve(points: list[str], role: str) -> str:
    for point in points:
        if role in point.split("+"):
            return point
    raise KeyError(role)


def outside_pairs(schema: dict) -> list[tuple[str, str]]:
    row_specs = [
        part
        for part in schema["id"].split(".")
        if part.startswith("r") and part[1].isdigit()
    ]
    assert len(row_specs) == 3, schema["id"]
    pairs = []
    for index, spec in enumerate(row_specs):
        site_a, site_b = spec[2:].split("-")
        pair = []
        for role, site in zip((f"p{index}a", f"p{index}b"), (site_a, site_b)):
            if site in ("EA", "W", "O"):
                pair.append(site)
            else:
                pair.append(resolve(schema["points"], role))
        assert pair[0] != pair[1], schema["id"]
        pairs.append((pair[0], pair[1]))
    return pairs


def augment(schema: dict) -> dict:
    specs = onehit_rad_ne(placement_of(schema)) + outside_pair_rad_ne(
        outside_pairs(schema)
    )
    seen = set()
    rad_ne = list(schema.get("rad_ne", []))
    for spec in rad_ne:
        seen.add((spec["center"], spec["a"], spec["b"]))
    for spec in specs:
        key = (spec["center"], spec["a"], spec["b"])
        if key not in seen:
            seen.add(key)
            rad_ne.append(spec)
    return {**schema, "id": "retro." + schema["id"], "rad_ne": rad_ne}


def main() -> None:
    l0 = json.loads((HERE / "l0_schemas.json").read_text())
    merges = json.loads((HERE / "merge_schemas.json").read_text())

    l0_sat = sat_ids((HERE / "l0_ledger.jsonl").read_text().splitlines())
    with gzip.open(HERE / "merge_ledger.jsonl.gz", "rt") as handle:
        merge_sat = sat_ids(handle)

    survivors = [s for s in l0 if s["id"] in l0_sat] + [
        s for s in merges if s["id"] in merge_sat
    ]
    assert len(survivors) == len(l0_sat) + len(merge_sat)
    print(f"survivors: {len(l0_sat)} all-fresh + {len(merge_sat)} merged")

    retro = [augment(s) for s in survivors]
    output = HERE / "retro_schemas.json"
    output.write_text(json.dumps(retro, indent=1))
    print(f"output={output} n={len(retro)}")


if __name__ == "__main__":
    main()
