"""Independent differential check of the O6 realizability filter.

Builds on orbit_crosscheck.py (my own orbit enumeration, already in exact
agreement with the probe figures).  The candidate surface is read through
the live-instance path (SourceFaithfulCoverInstance(build_model(...))
.candidates), NOT through the bank's candidate_rows()/_covered_row_subsets
helpers, and the containment test is a direct set.issubset scan over the
candidate rows.  Agreement with the bank's post-filter figures is therefore
a differential validation, not a re-run.

Expected (O6 agent's figures):
  post-filter realizable sub-orbit: 11,052 roles (4,536 dropped)
  post-filter rows: 603 pair + 1,627 triple = 2,230
  dominant core (a,b,c,x,y) = (1, 7, 6, 9, 11) survives
"""

from __future__ import annotations

import sys

sys.path.insert(0, "/Users/adam/projects/math-projects/erdos-97-96-formalization")

import orbit_crosscheck  # noqa: E402  (runs my orbit enumeration on import)

from census.card_head.candidate_surface import build_model  # noqa: E402
from census.card_head.source_faithful_candidate_surface import (  # noqa: E402
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SourceFaithfulCoverInstance,
)

instance = SourceFaithfulCoverInstance(
    build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
)
CANDIDATES = {
    center: tuple(frozenset(row) for row in instance.candidates[center])
    for center in range(12)
}


def row_realizable(center: int, required: frozenset) -> bool:
    return any(required <= row for row in CANDIDATES[center])


# orbit_crosscheck.unordered holds (a, lo, b, c, hi) in certificate
# argument order (a, x, b, c, y) with x < y.  Realizability is symmetric
# in the two centers, so the canonical choice of assignment cannot
# change the filtered count.
survivors = set()
dropped = []
for a, x, b, c, y in orbit_crosscheck.unordered:
    pair = frozenset((a, b))
    ok = (
        row_realizable(x, pair)
        and row_realizable(y, pair)
        and row_realizable(c, frozenset((b, x, y)))
    )
    if ok:
        survivors.add((a, x, b, c, y))
    else:
        dropped.append((a, x, b, c, y))

pair_rows = set()
triple_rows = set()
for a, x, b, c, y in survivors:
    pair_rows.add((x, frozenset((a, b))))
    pair_rows.add((y, frozenset((a, b))))
    triple_rows.add((c, frozenset((b, x, y))))

print(f"pre-filter unordered orbit:  {len(orbit_crosscheck.unordered)}")
print(f"post-filter survivors:       {len(survivors)}  (expect 11052)")
print(f"dropped:                     {len(dropped)}  (expect 4536)")
print(f"post-filter pair rows:       {len(pair_rows)}  (expect 603)")
print(f"post-filter triple rows:     {len(triple_rows)}  (expect 1627)")
print(
    f"post-filter total rows:      {len(pair_rows) + len(triple_rows)}"
    "  (expect 2230)"
)

dominant = (1, 9, 7, 6, 11)  # (a, x, b, c, y)
print(f"dominant core survives:      {dominant in survivors}  (expect True)")

# Spot-check one dropped role end to end: show the first failing row.
example = sorted(dropped)[0]
a, x, b, c, y = example
pair = frozenset((a, b))
detail = (
    f"pair@{x}={row_realizable(x, pair)} "
    f"pair@{y}={row_realizable(y, pair)} "
    f"triple@{c}={row_realizable(c, frozenset((b, x, y)))}"
)
print(f"example dropped (a,x,b,c,y)={example}: {detail}")
