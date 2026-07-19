#!/usr/bin/env python3
"""Build the L2n census: retro survivors + the three no_qfree families.

Every retro schema commits (Round 188 aligned normal form) to the reverse
rows being the critical shells H.selectedAt(s_i) with named centers:
r0 = shell of s0 at b0, r1 = shell of s1 at b1, r2 = shell of s2 at s1
(uniform across all 1752 schemas, checked here).  The shell system field
``no_qfree`` (U1CarrierInjection.lean:1022-1024, exposed as
``CriticalShellSystem.no_qfree_at``) then gives, for each source, that NO
four carrier points avoiding that source are co-radial at its blocker
center at any radius.  The retro layer never encoded this; ``no_k4`` adds
it.  Provenance: DESIGN-L2.md.
"""

import copy
import gzip
import json


def survivors() -> list[str]:
    out = []
    with gzip.open("retro_ledger.jsonl.gz", "rt") as fh:
        for line in fh:
            row = json.loads(line)
            if row["verdict"] == "sat":
                out.append(row["schema_id"])
    return out


def with_no_qfree(schema: dict) -> dict:
    out = copy.deepcopy(schema)
    specs = []
    for cls in out["exact_classes"]:
        if cls["center"] == "O":
            continue
        specs.append({"center": cls["center"], "avoid": [cls["members"][0]]})
    assert [(s["center"], s["avoid"][0]) for s in specs] == [
        ("b0", "s0"),
        ("b1", "s1"),
        ("s1", "s2"),
    ], out["id"]
    out["no_k4"] = specs
    out["id"] = "l2n." + out["id"]
    return out


def main() -> None:
    schemas = {s["id"]: s for s in json.load(open("retro_schemas.json"))}
    built = [with_no_qfree(schemas[sid]) for sid in survivors()]
    json.dump(built, open("l2n_schemas.json", "w"))
    print(f"built {len(built)} l2n schemas")


if __name__ == "__main__":
    main()
