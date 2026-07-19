#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Audit the source-indexed Lemma 81 normalization in the n=14 fixture.

This is an exact check inside the finite incidence/order abstraction.  It is
not a Euclidean realization and does not decide the live Lean proposition.
"""

from collections import defaultdict
from itertools import permutations
from pathlib import Path
from runpy import run_path


ROOT = Path(__file__).resolve().parents[3]
FIXTURE = ROOT / "scratch/atail-force/lemma81-n14-occurrence-audit/check_ordered_incidence_model.py"
DATA = run_path(str(FIXTURE))

rows = DATA["rows"]
blocker = DATA["blocker"]
cyclic_between = DATA["cyclic_between"]


def main() -> None:
    fibers: dict[int, list[int]] = defaultdict(list)
    for source, center in blocker.items():
        fibers[center].append(source)
    repeated = {center: sorted(sources) for center, sources in fibers.items() if len(sources) >= 2}
    assert repeated == {2: [3, 5], 3: [4, 6]}

    return_hits: dict[int, list[int]] = {}
    candidates: list[tuple[int, int, int, int, int]] = []
    ordered: list[tuple[int, int, int, int, int]] = []
    for z, sources in repeated.items():
        w = blocker[z]
        assert z in rows[w]
        hits = sorted(set(sources) & rows[w])
        return_hits[z] = hits
        for role_p, role_x in permutations(sources, 2):
            if role_x not in rows[w]:
                continue
            for role_f in rows[w] - {w, role_p, role_x, z}:
                candidate = (w, role_f, role_p, role_x, z)
                candidates.append(candidate)
                if cyclic_between(*candidate):
                    ordered.append(candidate)

    assert return_hits == {2: [], 3: [6]}
    assert sorted(candidates) == [(2, 5, 4, 6, 3), (2, 13, 4, 6, 3)]
    assert ordered == []

    print("PASS: source-indexed repeated-fiber normalization")
    print(f"repeated_fibers={repeated}")
    print(f"fiber_parent_return_hits={return_hits}")
    print(f"return_hit_F_candidates={sorted(candidates)}")
    print("ordered_W_F_P_X_Z_occurrences=[]")


if __name__ == "__main__":
    main()
