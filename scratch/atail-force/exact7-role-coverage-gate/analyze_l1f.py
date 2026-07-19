#!/usr/bin/env python3
"""Coverage analysis for the factored L1c census (factor_l1c.py).

Reads the l1f phase ledgers, groups verdicts by (retro survivor,
constraint set), and maps kills back through ``l1f_pattern_map.json``:
a joint schema join(retro, l1b) is DEAD when retro + implied(l1b) is
UNSAT (constraint-subset transfer; also dead when a bare-eq subset of
implied(l1b) already kills retro).  Reports:

- per-constraint-set kill counts over the 876 survivors;
- joint-product coverage: dead / total over 876 retro x 746 l1b;
- the per-retro-survivor profile: which survivors die under EVERY
  eq-bearing implied set (row-coupled kills) vs. which survive some;
- core family histogram for the kills.
"""

from __future__ import annotations

import json
from collections import Counter, defaultdict
from pathlib import Path

HERE = Path(__file__).resolve().parent


def main() -> None:
    ledger = {}
    for path in sorted(HERE.glob("l1f_phase*_ledger_shard*.jsonl")):
        for line in path.read_text().splitlines():
            if not line.strip():
                continue
            rec = json.loads(line)
            ledger[rec["schema_id"]] = rec

    # l1f.<retro_id>.X.<set_id>
    by_pair = {}
    for schema_id, rec in ledger.items():
        body = schema_id[len("l1f."):]
        retro_id, set_id = body.rsplit(".X.", 1)
        by_pair[(retro_id, set_id)] = rec["verdict"]

    retro_ids = sorted({r for r, _ in by_pair})
    set_ids = sorted({s for _, s in by_pair})
    print(f"ledger: {len(ledger)} runs over {len(retro_ids)} retro "
          f"survivors x {len(set_ids)} sets")

    kill_by_set = Counter()
    nonsat = defaultdict(list)
    for (retro_id, set_id), verdict in by_pair.items():
        if verdict == "unsat":
            kill_by_set[set_id] += 1
            nonsat[retro_id].append(set_id)
        elif verdict != "sat":
            print(f"  NON-VERDICT {verdict}: {retro_id} x {set_id}")

    print("\nkills per constraint set (of {} survivors):".format(
        len(retro_ids)))
    for set_id in set_ids:
        print(f"  {set_id}: {kill_by_set[set_id]}")

    # Joint-product coverage via the pattern map.  A pattern's implied
    # set kills retro if the full set is UNSAT in the ledger, or a
    # bare-eq subset of it is (constraint-subset transfer).
    pattern_map = json.loads((HERE / "l1f_pattern_map.json").read_text())

    def dead(retro_id: str, implied_id: str) -> bool:
        if not implied_id:
            return False
        if by_pair.get((retro_id, implied_id)) == "unsat":
            return True
        eq_parts = [p for p in implied_id.split(".") if p.startswith("eq")]
        return any(by_pair.get((retro_id, p)) == "unsat" for p in eq_parts)

    total = dead_count = 0
    fully_covered_retro = []
    for retro_id in retro_ids:
        row_dead = sum(dead(retro_id, implied)
                       for implied in pattern_map.values())
        total += len(pattern_map)
        dead_count += row_dead
        eq_sets = [s for s in set_ids
                   if all(p.startswith("eq") for p in s.split("."))]
        if all(by_pair.get((retro_id, s)) == "unsat" for s in eq_sets):
            fully_covered_retro.append(retro_id)

    print(f"\njoint-product coverage: {dead_count}/{total} "
          f"({dead_count / total:.1%}) of retro x l1b pairs dead "
          f"via factored kills")
    print(f"retro survivors dead under ALL bare-eq sets: "
          f"{len(fully_covered_retro)}/{len(retro_ids)}")

    survivors_all_sat = [r for r in retro_ids if not nonsat[r]]
    print(f"retro survivors with NO factored kill at all: "
          f"{len(survivors_all_sat)}")

    summary = {
        "runs": len(ledger),
        "kills_per_set": dict(kill_by_set),
        "joint_dead": dead_count,
        "joint_total": total,
        "retro_dead_all_eq_sets": fully_covered_retro,
        "retro_no_factored_kill": survivors_all_sat,
    }
    (HERE / "l1f_coverage_summary.json").write_text(
        json.dumps(summary, indent=1))
    print("wrote l1f_coverage_summary.json")


if __name__ == "__main__":
    main()
