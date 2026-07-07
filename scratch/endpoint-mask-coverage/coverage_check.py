#!/usr/bin/env python3
"""Endpoint bank mask-coverage feasibility check.

REQUIRED side (from Lean, see STATE.md citations):
  xLabel in {Q1, Q2}            -- IsEndpointEscapeeLabel   (Geometry.lean:61-62)
  aLabel in {w, s1, s2, s3}     -- IsEndpointVSurplusHitLabel (Geometry.lean:65-66)
  bLabel in {v, s1, s2, s3}     -- IsEndpointWSurplusHitLabel (Geometry.lean:69-70)
  demand: exists bank row with escapee = xLabel,
     centerMask .v = maskOfLabels [Pw, Pu, xLabel, aLabel]   (masks[1], since v.index = 1)
     centerMask .w = maskOfLabels [Q1, Q2, bLabel, u]        (masks[2], since w.index = 2)
  Left and right residuals demand the same label ranges (ResidualCoreData.lean
  599-601 vs 700-702), so one table answers both sides.

AVAILABLE side: parsed from ShadowBank.lean endpointRowsQ1/endpointRowsQ2.
"""

import json
import re
import sys
from pathlib import Path

REPO = Path("/Users/adam/projects/math-projects/erdos-97-96-formalization")
BANK = REPO / "lean/Erdos9796Proof/P97/EndpointCertificate/ShadowBank.lean"
OUT = REPO / "scratch/endpoint-mask-coverage"

LABELS = ["u", "v", "w", "s1", "s2", "s3", "Pw", "Pu", "Q1", "Q2"]
INDEX = {l: i for i, l in enumerate(LABELS)}


def bit(label: str) -> int:
    return 1 << INDEX[label]


def mask_of(labels: list[str]) -> int:
    # matches SurplusCOMPGBank.maskOfLabels: sum of bits, NO dedup
    return sum(bit(l) for l in labels)


def parse_rows(text: str) -> list[dict]:
    rows = []
    # each row block: { id := "...", escapee := .Q1|.Q2, masks := [ ... ] }
    row_re = re.compile(
        r'\{\s*id\s*:=\s*"([^"]+)",\s*escapee\s*:=\s*\.(Q1|Q2),\s*masks\s*:=\s*\[(.*?)\]\s*\}',
        re.DOTALL,
    )
    mask_re = re.compile(r"SurplusCOMPGBank\.maskOfLabels\s*\[([^\]]*)\]")
    for m in row_re.finditer(text):
        rid, escapee, masks_blob = m.group(1), m.group(2), m.group(3)
        mask_lists = []
        for mm in mask_re.finditer(masks_blob):
            labs = [x.strip().lstrip(".") for x in mm.group(1).split(",") if x.strip()]
            mask_lists.append(labs)
        rows.append({"id": rid, "escapee": escapee, "mask_labels": mask_lists})
    return rows


def main() -> int:
    text = BANK.read_text()
    rows = parse_rows(text)

    problems = []

    # sanity: counts
    q1 = [r for r in rows if r["id"].startswith("ep_Q1")]
    q2 = [r for r in rows if r["id"].startswith("ep_Q2")]
    if len(rows) != 117:
        problems.append(f"row count {len(rows)} != 117")
    if len(q1) != 33 or len(q2) != 84:
        problems.append(f"Q1/Q2 split {len(q1)}/{len(q2)} != 33/84")
    if len({r["id"] for r in rows}) != len(rows):
        problems.append("duplicate row ids")

    # sanity: escapee field matches id prefix
    for r in rows:
        if not r["id"].startswith(f"ep_{r['escapee']}"):
            problems.append(f"{r['id']}: escapee field {r['escapee']} mismatches id")

    # sanity: 10 masks per row, each 4 distinct labels
    for r in rows:
        if len(r["mask_labels"]) != 10:
            problems.append(f"{r['id']}: {len(r['mask_labels'])} masks != 10")
            continue
        for i, labs in enumerate(r["mask_labels"]):
            if len(labs) != 4 or len(set(labs)) != 4:
                problems.append(f"{r['id']}: mask[{i}] not 4 distinct labels: {labs}")
            for l in labs:
                if l not in INDEX:
                    problems.append(f"{r['id']}: unknown label {l}")

    # extract v-class (masks[1]) and w-class (masks[2]) shapes
    v_hit_range = ["w", "s1", "s2", "s3"]
    w_hit_range = ["v", "s1", "s2", "s3"]
    covered = {}  # (x, a, b) -> [row ids]
    row_shapes = []
    for r in rows:
        x = r["escapee"]
        vset = set(r["mask_labels"][1])
        wset = set(r["mask_labels"][2])
        # v-class must be {Pw, Pu, x, a}
        a_cands = vset - {"Pw", "Pu", x}
        if not ({"Pw", "Pu", x} <= vset) or len(a_cands) != 1:
            problems.append(f"{r['id']}: v-mask {sorted(vset)} lacks Pw/Pu/{x}+1 shape")
            continue
        a = next(iter(a_cands))
        if a not in v_hit_range:
            problems.append(f"{r['id']}: v-hit {a} outside {v_hit_range}")
            continue
        b_cands = wset - {"Q1", "Q2", "u"}
        if not ({"Q1", "Q2", "u"} <= wset) or len(b_cands) != 1:
            problems.append(f"{r['id']}: w-mask {sorted(wset)} lacks Q1/Q2/u+1 shape")
            continue
        b = next(iter(b_cands))
        if b not in w_hit_range:
            problems.append(f"{r['id']}: w-hit {b} outside {w_hit_range}")
            continue
        covered.setdefault((x, a, b), []).append(r["id"])
        row_shapes.append({"id": r["id"], "xLabel": x, "aLabel": a, "bLabel": b,
                           "v_mask": sorted(vset, key=lambda l: INDEX[l]),
                           "w_mask": sorted(wset, key=lambda l: INDEX[l])})

    # numeric cross-check: recompute integer masks and confirm demand equation
    for r, s in zip([r for r in rows if any(rs["id"] == r["id"] for rs in row_shapes)], row_shapes):
        pass  # shape check above already used exact sets; numeric identity below
    for s in row_shapes:
        v_num_row = mask_of(s["v_mask"])
        v_num_demand = mask_of(["Pw", "Pu", s["xLabel"], s["aLabel"]])
        w_num_row = mask_of(s["w_mask"])
        w_num_demand = mask_of(["Q1", "Q2", s["bLabel"], "u"])
        if v_num_row != v_num_demand or w_num_row != w_num_demand:
            problems.append(f"{s['id']}: numeric mask mismatch")

    # coverage table over full demand range
    table = []
    gaps = []
    for x in ["Q1", "Q2"]:
        for a in v_hit_range:
            for b in w_hit_range:
                ids = covered.get((x, a, b), [])
                table.append({"xLabel": x, "aLabel": a, "bLabel": b,
                              "covered": bool(ids), "rows": ids})
                if not ids:
                    gaps.append({"xLabel": x, "aLabel": a, "bLabel": b})

    verdict = "FULL-COVERAGE" if not gaps and not problems else "GAPS" if gaps else "PARSE-PROBLEMS"

    out = {
        "verdict": verdict,
        "demand_range": {
            "xLabel": ["Q1", "Q2"],
            "aLabel": v_hit_range,
            "bLabel": w_hit_range,
            "note": "identical for left and right residuals; "
                    "demand: row.escapee = xLabel AND masks[1] = {Pw,Pu,xLabel,aLabel} "
                    "AND masks[2] = {Q1,Q2,bLabel,u}",
        },
        "bank": {"rows": len(rows), "Q1": len(q1), "Q2": len(q2)},
        "distinct_covered_triples": len(covered),
        "total_demand_triples": 32,
        "coverage_table": table,
        "gaps": gaps,
        "sanity_problems": problems,
        "row_shapes": row_shapes,
    }
    (OUT / "coverage.json").write_text(json.dumps(out, indent=2))

    print(f"rows parsed: {len(rows)} (Q1={len(q1)}, Q2={len(q2)})")
    print(f"distinct (x,a,b) triples covered: {len(covered)} / 32 demandable")
    print(f"verdict: {verdict}")
    if problems:
        print("SANITY PROBLEMS:")
        for p in problems:
            print("  -", p)
    if gaps:
        print("GAPS:")
        for g in gaps:
            print(f"  - ({g['xLabel']}, {g['aLabel']}, {g['bLabel']})")
    # per-triple multiplicity summary
    print("\ntriple -> row count:")
    for x in ["Q1", "Q2"]:
        for a in v_hit_range:
            line = []
            for b in w_hit_range:
                n = len(covered.get((x, a, b), []))
                line.append(f"b={b}:{n:3d}")
            print(f"  x={x} a={a:2s}  " + "  ".join(line))
    return 0


if __name__ == "__main__":
    sys.exit(main())
