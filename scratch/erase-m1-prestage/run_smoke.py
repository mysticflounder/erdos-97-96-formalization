"""Encoding validation for the M1 pre-stage replica (mandatory gate).

Reproduces committed, kernel-checked (native_decide) results:

  S1  pairCodes/tripleCodes regeneration == the Lean literals in
      Census554/CapSelectedBVRoleBank.lean (parsed from source).
  S2  candidateRows sizes match the DESIGN.md section 2.2 figures
      (center 0: 79 pre-gate; centers 1-2: 15; 3-6: 96; 7-10: 203).
  S3  literal vs optimized detector cores agree on randomly sampled closures.
  S4  the endpoint 64-placement gate (EndpointPlacementDispatch.lean):
      all 64 endpointLeft/RightPlacementCheck seeds return true (killed).
  S5  the pinned 12-placement gate (CapSelectedNativePlacements.lean):
      all 12 placementCheck seeds return true (killed).

S4 exercises the parametric replica at c0 = 1 (committed hasPrefixCore) and
c0 = 2 (committed hasPrefixCoreRight); S5 exercises c0 = 1 with the pinned
fixed row.  A replica failing any check produces NO conclusions about ERASE.

Usage: uv run python run_smoke.py            (from this directory)
"""

from __future__ import annotations

import json
import random
import re
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))

import replica as R

HERE = Path(__file__).resolve().parent
REPO = HERE.parent.parent
BANK = (
    REPO
    / "lean/Erdos9796Proof/P97/Census554/CapSelectedBVRoleBank.lean"
)

results: dict = {"checks": {}}


def check(name: str, ok: bool, detail):
    results["checks"][name] = {"pass": bool(ok), "detail": detail}
    print(f"[{'PASS' if ok else 'FAIL'}] {name}: {detail}")
    return ok


# --- S1: role-bank code lists ------------------------------------------------


def parse_lean_list(source: str, name: str):
    m = re.search(rf"def {name} : List Nat :=\s*\[(.*?)\]", source, re.DOTALL)
    assert m, f"could not locate {name} in {BANK}"
    return [int(tok) for tok in m.group(1).replace("\n", " ").split(",")]


src = BANK.read_text()
lean_pairs = parse_lean_list(src, "pairCodes")
lean_triples = parse_lean_list(src, "tripleCodes")
ok1 = (
    sorted(lean_pairs) == sorted(R.PAIR_CODES)
    and len(lean_pairs) == 55
    and sorted(lean_triples) == sorted(R.TRIPLE_CODES)
    and len(lean_triples) == 165
)
check(
    "S1_role_bank_codes",
    ok1,
    f"pairCodes {len(lean_pairs)} (55 expected), tripleCodes {len(lean_triples)} (165 expected), sets equal",
)

# --- S2: candidateRows sizes --------------------------------------------------

sizes = {c: len(R.candidate_rows(c, 3)) for c in range(11)}
size0_pre_gate = sum(
    1
    for s in range(2048)
    if R.count_points(s, R.LABELS) == 4
    and not R.has(s, 0)
    and R.moser_one_hit_ok(0, s)
)
expected = {1: 15, 2: 15, 3: 96, 4: 96, 5: 96, 6: 96, 7: 203, 8: 203, 9: 203, 10: 203}
ok2 = all(sizes[c] == n for c, n in expected.items()) and size0_pre_gate == 79
check(
    "S2_candidate_row_sizes",
    ok2,
    {"sizes_deleted3": sizes, "center0_pre_deleted_gate": size0_pre_gate},
)

# --- S3: literal vs optimized detectors --------------------------------------

rng = random.Random(9796)
mismatch = 0
samples = 2000
for _ in range(samples):
    deleted = rng.choice([3, 4, 5, 6])
    k = rng.randint(1, 8)
    centers = rng.sample(R.LABELS, k)
    rows = []
    for c in centers:
        cand = R.candidate_rows_cached(c, deleted)
        if cand:
            rows.append(rng.choice(cand))
    if not rows:
        continue
    roots = R.normalized_roots(R.equality_closure(rows))
    c0 = rng.choice(R.LABELS)
    pinned_mask = rows[0][1]
    bis = R.bisector_lists(roots)
    checks = [
        R.duplicate_center_core(roots) == R.duplicate_center_core_literal(roots),
        R.exact_off_circle_core_at(roots, c0, pinned_mask)
        == R.exact_off_circle_core_at_literal(roots, c0, pinned_mask),
        R.perpendicular_bisector_core(bis)
        == R.perpendicular_bisector_core_literal(roots),
        R.convex_five_point_core(roots, bis)
        == R.convex_five_point_core_literal(roots),
    ]
    if not all(checks):
        mismatch += 1
ok3 = mismatch == 0
check("S3_detector_crosscheck", ok3, f"{samples} sampled closures, {mismatch} mismatches")

# --- S4: endpoint 64-placement gate -------------------------------------------

INTS = [3, 4, 5, 6]
endpoint_runs = []
t0 = time.monotonic()
for family, escapees, fourths, fn in (
    ("left", (9, 10), (2, 3, 4, 5, 6), R.endpoint_left_placement_check),
    ("right", (7, 8), (1, 3, 4, 5, 6), R.endpoint_right_placement_check),
):
    for e in escapees:
        for f in fourths:
            for d in INTS:
                if f == d:
                    continue
                verdict, stats, secs = fn(e, f, d, debug_checks=True)
                endpoint_runs.append(
                    {
                        "family": family,
                        "escapee": e,
                        "fourth": f,
                        "deleted": d,
                        "verdict": verdict,
                        "nodes": stats.nodes,
                        "max_depth": stats.max_depth,
                        "kills_by_detector": stats.kills_by_detector,
                        "empty_prunes": stats.empty_prunes,
                        "secs": round(secs, 3),
                    }
                )
endpoint_secs = time.monotonic() - t0
n_killed = sum(1 for r in endpoint_runs if r["verdict"] == "killed")
ok4 = len(endpoint_runs) == 64 and n_killed == 64
check(
    "S4_endpoint_64_gate",
    ok4,
    f"{n_killed}/{len(endpoint_runs)} killed (64/64 expected), "
    f"total nodes {sum(r['nodes'] for r in endpoint_runs)}, {endpoint_secs:.1f}s",
)
results["endpoint_runs"] = endpoint_runs

# --- S5: pinned 12-placement gate ---------------------------------------------

pinned_runs = []
t0 = time.monotonic()
for p in INTS:
    for d in INTS:
        if p == d:
            continue
        verdict, stats, secs = R.placement_check(p, d, debug_checks=True)
        pinned_runs.append(
            {
                "pinSource": p,
                "deleted": d,
                "verdict": verdict,
                "nodes": stats.nodes,
                "max_depth": stats.max_depth,
                "kills_by_detector": stats.kills_by_detector,
                "empty_prunes": stats.empty_prunes,
                "secs": round(secs, 3),
            }
        )
pinned_secs = time.monotonic() - t0
n_killed = sum(1 for r in pinned_runs if r["verdict"] == "killed")
ok5 = len(pinned_runs) == 12 and n_killed == 12
check(
    "S5_pinned_12_gate",
    ok5,
    f"{n_killed}/{len(pinned_runs)} killed (12/12 expected), "
    f"total nodes {sum(r['nodes'] for r in pinned_runs)}, {pinned_secs:.1f}s",
)
results["pinned_runs"] = pinned_runs

# --- verdict -------------------------------------------------------------------

all_ok = all(c["pass"] for c in results["checks"].values())
results["smoke_verdict"] = "PASS" if all_ok else "FAIL"
results["note"] = (
    "EMPIRICAL replica validation only; licenses no Lean claim. "
    "S4/S5 reproduce committed native_decide theorems "
    "(EndpointPlacementDispatch.lean 64-seed gate, "
    "CapSelectedNativePlacements.lean 12-seed gate)."
)
(HERE / "smoke_test_results.json").write_text(json.dumps(results, indent=2))
print(f"\nSMOKE {results['smoke_verdict']} -> smoke_test_results.json")
sys.exit(0 if all_ok else 1)
