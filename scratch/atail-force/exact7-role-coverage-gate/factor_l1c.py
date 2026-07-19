#!/usr/bin/env python3
"""Factor the L1c joint census through named EA-coradiality constraints.

The two sample joint kills (REPORT Finding 9 addendum) both factor
through a single mechanism: an L1 row whose members include the second
apex ``O`` together with a named interior point forces
``dist(EA, O) = dist(EA, x)``, and that one equation feeds the retro-L0
Kalmanson/class system.  The fresh row content is inert (L1b census: all
746 all-fresh patterns SAT), so the joint verdict of
``join(retro, l1b)`` is determined by ``retro`` plus the *named*
equality/disequality constraints the row pattern implies:

- every pair of named points in one row's member list is EA-coradial;
- the ``eq`` radius arm makes ret-named and dbl-named jointly coradial;
- the ``ne`` arm asserts the two base radii differ, which becomes a
  named disequality only when both rows carry a named point.

UNSAT of ``retro + implied(l1b)`` transfers a fortiori to the full joint
schema (its constraint set is a superset).  This module computes the
implied constraint set for every l1b pattern, dedupes, and emits the
factored census ``retro survivors x distinct non-empty constraint
sets`` as ``l1f_schemas.json`` for ``census_runner.py``.

The SAT direction is NOT a proof of joint SAT — patterns whose factored
system survives keep their sample-supported (not certified) status.
"""

from __future__ import annotations

import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

NAMED7 = ("O", "W", "s0", "b0", "s1", "b1", "s2")
TIMEOUT_MS = 600_000


def implied_constraints(l1b: dict) -> frozenset:
    """Named EA-radius constraints implied by an l1b row pattern."""
    named = {}
    for row in l1b["row_eqs"]:
        assert row["center"] == "EA", row
        named[row["name"]] = [m for m in row["members"] if m in NAMED7]

    constraints = set()

    def add(kind: str, a: str, b: str) -> None:
        if a == b:
            # A shared landing paired with itself (eq arm) is vacuous;
            # the ne arm never duplicates a named landing across rows.
            assert kind == "eq", (l1b["id"], kind, a)
            return
        lo, hi = sorted((a, b))
        constraints.add((kind, lo, hi))

    for members in named.values():
        for i, a in enumerate(members):
            for b in members[i + 1:]:
                add("eq", a, b)

    for spec in l1b.get("radius_rel", []):
        n1, n2 = spec["rows"]
        for a in named[n1]:
            for b in named[n2]:
                add(spec["relation"], a, b)

    return frozenset(constraints)


def constraint_id(constraints: frozenset) -> str:
    parts = [f"{kind}{a}-{b}" for kind, a, b in sorted(constraints)]
    return ".".join(parts)


def factored_schema(retro: dict, constraints: frozenset) -> dict:
    """Retro schema + implied named constraints, encoder-ready.

    Disequalities already asserted by the retro one-hit families (all
    NAMED6 pairs sit in the closed physical region at EA) are skipped —
    adding them would collide with the existing ``rad_ne`` labels and
    change nothing.
    """
    schema = json.loads(json.dumps(retro))
    row_eqs = list(schema.get("row_eqs", []))
    rad_ne = list(schema.get("rad_ne", []))
    present = {(s["center"], s["a"], s["b"]) for s in rad_ne}
    for index, (kind, a, b) in enumerate(sorted(constraints)):
        if kind == "eq":
            row_eqs.append(
                {"name": f"feq{index}", "center": "EA", "members": [a, b]})
        elif ("EA", a, b) not in present:
            rad_ne.append({"center": "EA", "a": a, "b": b})
    schema["row_eqs"] = row_eqs
    schema["rad_ne"] = rad_ne
    schema["id"] = f"l1f.{retro['id']}.X.{constraint_id(constraints)}"
    schema["timeout_ms"] = TIMEOUT_MS
    return schema


def main() -> None:
    l1b_all = json.loads((HERE / "l1b_schemas.json").read_text())
    retro_all = json.loads((HERE / "retro_schemas.json").read_text())
    retro_sat_ids = {
        json.loads(line)["schema_id"]
        for path in HERE.glob("retro_ledger_shard*.jsonl")
        for line in path.read_text().splitlines()
        if line.strip() and json.loads(line)["verdict"] == "sat"
    }
    retro_sat = [s for s in retro_all if s["id"] in retro_sat_ids]

    pattern_map = {}
    for l1b in l1b_all:
        pattern_map[l1b["id"]] = implied_constraints(l1b)

    distinct = {}
    for l1b_id, constraints in pattern_map.items():
        distinct.setdefault(constraints, []).append(l1b_id)

    empty = distinct.pop(frozenset(), [])
    print(f"l1b patterns: {len(pattern_map)}")
    print(f"empty implied set (factored = retro alone, known SAT): "
          f"{len(empty)}")
    print(f"distinct non-empty implied sets: {len(distinct)}")
    for constraints in sorted(distinct, key=constraint_id):
        print(f"  {constraint_id(constraints)}  "
              f"[{len(distinct[constraints])} patterns]")

    (HERE / "l1f_pattern_map.json").write_text(json.dumps(
        {l1b_id: constraint_id(c) if c else ""
         for l1b_id, c in sorted(pattern_map.items())}, indent=1))

    # Phase 1: bare-equality sets.  Every genuine implied equality pairs O
    # with one named point, and UNSAT at a bare {eqO-x} transfers to every
    # superset (all ne-decorated variants), so the bare sets carry the
    # whole kill signature.  Phase 2 (ne-bearing sets) only matters where
    # phase 1 leaves SAT.  Sets whose disequalities are all NAMED6 pairs
    # add nothing beyond the retro one-hit families — factored system =
    # retro alone = SAT by the retro census; skip them.
    def genuine(c: frozenset) -> bool:
        return any(kind == "eq" or "O" in (a, b) for kind, a, b in c)

    retro_equal = [c for c in distinct if not genuine(c)]
    print(f"retro-equal sets (all nes already one-hit asserted, SAT by "
          f"retro census): {len(retro_equal)}")
    phase1 = [c for c in distinct
              if c and all(kind == "eq" for kind, _, _ in c)]
    phase2 = [c for c in distinct
              if c not in phase1 and genuine(c)]
    for label, sets in (("phase1-eq", phase1), ("phase2-ne", phase2)):
        schemas = [
            factored_schema(retro, constraints)
            for constraints in sorted(sets, key=constraint_id)
            for retro in retro_sat
        ]
        print(f"{label}: {len(retro_sat)} retro survivors x "
              f"{len(sets)} sets = {len(schemas)} schemas")
        (HERE / f"l1f_{label.split('-')[0]}_schemas.json").write_text(
            json.dumps(schemas))
    print("wrote l1f_phase1_schemas.json, l1f_phase2_schemas.json, "
          "l1f_pattern_map.json")


if __name__ == "__main__":
    main()
