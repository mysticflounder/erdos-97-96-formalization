#!/usr/bin/env python3
"""ERASE-P3-MAP gate 1: encoding validation against the stored row-truth
witnesses (scratch/erased-pin-row-truth/results/witness_*.json).

Per witness:
  1. extract features (relabel into the census frame),
  2. cross-check the computed ordered row against the stored row_mslr and
     against the census's own q2_token.type_of on the relabeled class
     (both must agree -- any mismatch is an encoding bug),
  3. map to (class code, orientation),
  4. LOCAL aliveness in the census cut vocabulary (hard gate:
     m<=2 + not PROVEN-killed for rows; C1+H1 for the apex),
  5. EMPIRICAL engine aliveness: multi_center_census.solve_global at the
     mapped profile with the witness class fixed, PROVEN tier (and PLUS
     tier, informative).

Output: witness_validation.json + a console table. Exit 1 on any hard-gate
failure.
"""
from __future__ import annotations

import glob
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.normpath(os.path.join(HERE, "..", ".."))
sys.path.insert(0, HERE)

import ep3map as ep  # noqa: E402
import q2_token as qt  # noqa: E402

WITNESS_GLOB = os.path.join(
    ROOT, "scratch", "erased-pin-row-truth", "results", "witness_*.json"
)


def main() -> int:
    files = sorted(glob.glob(WITNESS_GLOB))
    if not files:
        print("no witness files found", file=sys.stderr)
        return 1
    rows = []
    hard_fail = 0
    for path in files:
        with open(path) as f:
            w = json.load(f)
        F = ep.features_of_witness(w)
        rec = {
            "witness": os.path.basename(path),
            "tag": w.get("tag"),
            "model_n": w["model_n"],
            "center": w["center"],
            "class": w["class"],
            "site": F["site"],
            "ordered_sig": list(F["sig"]),
        }
        # cross-check stored row_mslr (row witnesses only)
        stored = w.get("row_mslr")
        if stored is not None:
            rec["row_mslr_match"] = list(F["sig"]) == list(stored)
        else:
            rec["row_mslr_match"] = None  # surplus probes store no row
        # cross-check against the census's own type function (non-Moser only)
        if F["site"] != "U":
            caps_int, cap_of_int = ep.frame_data(w["model_n"])
            census_canon = qt.type_of(F["_center"], F["_class"], caps_int, cap_of_int)
            expect = min(tuple(F["sig"]), ep.reflect_row(F["sig"]))
            rec["census_type_of_match"] = census_canon == expect
        else:
            rec["census_type_of_match"] = None
        code = ep.map_features(F)
        rec["class_code"] = code["class_code"]
        rec["code_kind"] = code["code_kind"]
        rec["orientation"] = code["orientation"]
        # round-trip on this witness's features
        back = ep.unmap(code)
        rec["roundtrip_ok"] = (
            back["profile_card"] == F["profile_card"]
            and back["site"] == F["site"]
            and tuple(back["sig"]) == tuple(F["sig"])
        )
        # LOCAL aliveness (hard gate)
        rec["local"] = ep.local_checks(F)
        # engine aliveness (EMPIRICAL)
        got_proven = ep.engine_alive(F, tier="proven")
        rec["engine_proven"] = {"status": got_proven["status"], "nodes": got_proven["nodes"]}
        got_plus = ep.engine_alive(F, tier="conjectured")
        rec["engine_plus"] = {"status": got_plus["status"], "nodes": got_plus["nodes"]}

        ok = (
            rec["row_mslr_match"] in (True, None)
            and rec["census_type_of_match"] in (True, None)
            and rec["roundtrip_ok"]
            and rec["local"]["local_ok"]
            and rec["engine_proven"]["status"] == "SAT"
        )
        rec["gate_ok"] = ok
        if not ok:
            hard_fail += 1
        rows.append(rec)
        print(
            f"{rec['tag']:32s} n={rec['model_n']} site={rec['site']:6s} "
            f"sig={tuple(F['sig'])!s:18s} code={rec['class_code']:44s} "
            f"chi={rec['orientation']['chi']:9s} "
            f"local={'ok' if rec['local']['local_ok'] else 'FAIL'} "
            f"engine={rec['engine_proven']['status']}"
            f"/{rec['engine_plus']['status']} "
            f"rt={'ok' if rec['roundtrip_ok'] else 'FAIL'} "
            f"gate={'PASS' if ok else 'FAIL'}"
        )

    # profile base feasibility (context lines, EMPIRICAL)
    base = {}
    for card, profile in ep.PROFILES.items():
        import multi_center_census as mcc

        for tier in ("proven", "conjectured"):
            got = mcc.solve_global(profile, mcc.killed_rows_for(tier))
            base[f"n{card}_{tier}"] = {"status": got["status"], "nodes": got["nodes"]}
    out = {
        "schema": "erase_p3_map_witness_validation.v1",
        "witness_count": len(rows),
        "hard_fail": hard_fail,
        "base_feasibility": base,
        "witnesses": rows,
    }
    out_path = os.path.join(HERE, "witness_validation.json")
    with open(out_path, "w") as f:
        json.dump(out, f, indent=1)
        f.write("\n")
    print(f"\nwitnesses: {len(rows)}  hard_fail: {hard_fail}")
    print(f"base feasibility: {json.dumps(base)}")
    print(f"wrote {out_path}")
    return 1 if hard_fail else 0


if __name__ == "__main__":
    raise SystemExit(main())
