# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Exhaust a validator-compatible fixed-core family, without a solver.

The three-chain S row is T and D is G10. This is finite-interface coverage,
not a theorem projecting the live source into that interface or this family.
"""

import argparse
import hashlib
import itertools
import json
import math
from collections import Counter
from pathlib import Path

import cardge13_exact13_global_source_cell_csp_piqd as base
import check_exact13_three_chain_cell as chain

POSITION_TO_RAW = (0, 5, 4, 3, 1, 12, 11, 10, 9, 8, 2, 7, 6)
CORE = {"K": (1, 10, 11, 12), "L": (2, 3, 8, 9), "T": (0, 6, 7, 9)}
G10 = (2, 3, 4, 5)


def check_transport(mapping=POSITION_TO_RAW):
    """Replay all nine transported strict links in the actual direct chart."""
    chain.require(sorted(mapping) == list(range(13)), "invalid transport")
    rows = (("K", 0, CORE["K"]), ("L", 0, CORE["L"]),
            ("T", 1, CORE["T"]), ("G10", 10, G10))
    expected = {"S": "T", "D": "G10", "K": "K", "L": "L"}
    row_dict = {name: (center, set(support)) for name, center, support in rows}
    for name, center, support in chain.MINIMAL_ROWS:
        target_center, target_support = row_dict[expected[name]]
        chain.require(mapping[center] == target_center and
                      {mapping[i] for i in support} <= target_support, "provider transport fails")
    roots = base.edge_roots_for_rows(rows)
    direct = {tuple(sorted(chain.form_vector(f).items())) for f in base.kalmanson_forms(base.DIRECT_ORDER)}
    old_forms = {f["form"]: f for f in base.kalmanson_forms(chain.ORDER)}
    pairs = [(a, b) for values in chain.CHAINS for a, b in itertools.pairwise(values)]
    for (left, right), ids in zip(pairs, chain.LINK_FORMS, strict=True):
        total = Counter()
        for form_id in ids:
            mapped = {base.distance_edge(mapping[a], mapping[b]): value
                      for (a, b), value in chain.form_vector(old_forms[form_id]).items()}
            chain.require(tuple(sorted(mapped.items())) in direct, "transported gap not in direct chart")
            total.update(mapped)
        target = {base.distance_edge(mapping[10], mapping[right]): 1,
                  base.distance_edge(mapping[10], mapping[left]): -1}
        chain.require(chain.project(total, roots) == chain.project(target, roots), "transported link fails")
    chain.require(sorted(mapping[i] for values in chain.CHAINS for i in values) ==
                  [i for i in range(13) if i != mapping[10]], "transported cover fails")
    return rows


def primitive_ray(vector):
    """Normalize positive integer multiples without identifying opposite rays."""
    divisor = math.gcd(*(abs(value) for _, value in vector))
    return tuple((edge, value // divisor) for edge, value in vector) if divisor else ()


def enumerate_family(require_g10=True, *, core=None, on_record=None, rational_pairs=False):
    """Enumerate every base/blocker record; count all source-witness choices.

    Global supports other than a required G10 are independent arbitrary
    four-subsets avoiding their center. With require_g10=False all nine active
    globals are free. Each base record is validated using canonical representatives;
    only their cardinality and center avoidance enter validate_cell.
    """
    core = CORE if core is None else core
    counts = Counter({"baseline_one_form": 0, "baseline_two_form": 0,
                      "baseline_no_one_or_two_form": 0})
    digest = hashlib.sha256()
    representative = None
    vectors = [chain.form_vector(f) for f in base.kalmanson_forms(base.DIRECT_ORDER)]
    for z in sorted(base.I2 & set(core["L"])):
        deletions = sorted(set(core["T"]) & (set(core["K"]) | {z}))
        if not deletions:
            continue
        remaining = set(base.LABELS) - set(core["K"]) - {z}
        for chosen in itertools.combinations(sorted(remaining), 4):
            c0, c1 = set(chosen), remaining - set(chosen)
            if any(len(c & set(core["L"])) > 2 for c in (c0, c1)):
                continue
            s0s, s1s = sorted(c0 - set(core["T"])), sorted(c1 - set(core["T"]))
            if not s0s or not s1s:
                continue
            counts["support_partitions"] += 1
            for b0, b1 in itertools.permutations(base.GLOBAL_CENTERS, 2):
                if b0 in c0 or b1 in c1 or (require_g10 and 10 in (b0, b1)):
                    continue
                cell = {
                    "roles": {"b0": b0, "b1": b1, "s0": s0s[0], "s1": s1s[0], "d": deletions[0], "z": z},
                    "base_rows": {**core, "C0": sorted(c0), "C1": sorted(c1)},
                    "global_rows": {str(i): ([j for j in base.LABELS if j != i][:4]
                                             if i != 10 or not require_g10 else list(G10))
                                    for i in base.GLOBAL_CENTERS if i not in (b0, b1)},
                }
                base.validate_cell(cell)
                counts["base_blocker_records"] += 1
                # Compare against short cancellations using base rows and G10
                # only, never arbitrary filler rows from the representative.
                fixed_rows = tuple(row for row in base.cell_rows(cell)
                                   if row[0] in base.BASE_ROWS or (require_g10 and row[0] == "G10"))
                roots = base.edge_roots_for_rows(fixed_rows)
                seen = set()
                exit_kind = "no_one_or_two_form"
                for vector in vectors:
                    projected = chain.project(vector, roots)
                    if not projected:
                        exit_kind = "one_form"
                        break
                    if rational_pairs:
                        projected = primitive_ray(projected)
                    if tuple((edge, -value) for edge, value in projected) in seen:
                        exit_kind = "two_form"
                        # Still scan for a one-form certificate before labeling.
                    seen.add(projected)
                counts["baseline_" + exit_kind] += 1
                if on_record is not None:
                    on_record(cell, exit_kind)
                counts["weighted_" + exit_kind] += len(s0s) * len(s1s) * len(deletions)
                counts["role_records"] += len(s0s) * len(s1s) * len(deletions)
                digest.update(json.dumps(cell, sort_keys=True, separators=(",", ":")).encode() + b"\n")
                if representative is None:
                    representative = cell
    chain.require(representative is not None, "empty family")
    return dict(counts), digest.hexdigest(), representative


def build_report():
    """Retain a reproducible finite-family count and uniform chain certificate."""
    check_transport()
    counts, digest, cell = enumerate_family()
    expanded, expanded_digest, _ = enumerate_family(require_g10=False)
    return {
        "schema": "exact13-reassigned-chain-family/v1",
        "scope": "Fixed core, direct chart, finite validator only; no live-source projection or Euclidean realization claim",
        "core": CORE, "G10": G10, "position_to_raw": POSITION_TO_RAW,
        "pivot": 2, "chains": [[POSITION_TO_RAW[i] for i in values] for values in chain.CHAINS],
        "checked_links": 9, "gap_instances": 10, "pivot_supports_excluded": 495,
        **counts, "free_global_rows": 8,
        "complete_validator_tables": counts["role_records"] * 495**8,
        "canonical_enumeration_sha256": digest, "representative": cell,
        "live_source_leaves_eliminated": 0,
        "baseline_scope": "All five base rows plus G10; complete one/two-form vector scan; no filler globals",
        "incremental_over_existing_cancellation_bank": "No claim about published bank membership; compare baseline counts above",
        "without_G10": {**expanded, "canonical_enumeration_sha256": expanded_digest,
                        "free_global_rows": 9,
                        "complete_validator_tables": expanded["role_records"] * 495**9,
                        "scope": "Same K/L/T, blockers may include10, only five base rows used in cancellation"},
    }


def verify_report(report):
    """Recompute coverage and transport rather than trusting retained counts."""
    chain.require(report == json.loads(json.dumps(build_report())), "retained report mismatch")
    return True


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--verify", type=Path)
    args = parser.parse_args()
    chain.require(not (args.output and args.verify), "choose output or verify")
    report = json.loads(json.dumps(build_report()))
    if args.verify:
        verify_report(json.loads(args.verify.read_text()))
    if args.output:
        chain.require(not args.output.exists(), "refusing overwrite")
        args.output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(json.dumps({k: report[k] for k in ("support_partitions", "base_blocker_records", "role_records", "complete_validator_tables")}))


if __name__ == "__main__":
    main()
