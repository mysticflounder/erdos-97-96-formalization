"""Differential: bank family_roles() vs the independent orbit crosscheck.

Loads scratch/rigid221-sourceheavy-anchor/cross-wave-audit-20260814/
orbit_crosscheck.py (the validated independent enumeration) and checks:
  1. the unordered orbits agree exactly as sets (15,588);
  2. every kept canonical assignment passes the independent admissibility;
  3. a kept x<y swap never hides an admissible x<y assignment;
  4. the pair/triple row universes agree exactly (641 / 1,944).
"""

from __future__ import annotations

import importlib.util
import sys
import time
from pathlib import Path

REPO_ROOT = Path.cwd().resolve()
sys.path.insert(0, str(REPO_ROOT))

from census.card_head.exact12_all_order_common_five_membership_family_bank import (
    family_roles,
)

start = time.time()
crosscheck_path = (
    REPO_ROOT
    / "scratch/rigid221-sourceheavy-anchor/cross-wave-audit-20260814/orbit_crosscheck.py"
)
spec = importlib.util.spec_from_file_location("orbit_crosscheck", crosscheck_path)
crosscheck = importlib.util.module_from_spec(spec)
spec.loader.exec_module(crosscheck)
print(f"crosscheck enumeration done in {time.time() - start:.0f}s", flush=True)

roles = family_roles()
mine_unordered = {
    (a, min(x, y), b, c, max(x, y)) for a, b, c, x, y in roles
}
assert len(mine_unordered) == len(roles) == 15_588
theirs = crosscheck.unordered
print("unordered orbits agree:", mine_unordered == set(theirs))

kept_pass = all(crosscheck.admissible(a, x, b, c, y) for a, b, c, x, y in roles)
print("every kept assignment independently admissible:", kept_pass)

swap_ok = all(
    crosscheck.admissible(a, min(x, y), b, c, max(x, y))
    or not (x > y)
    for a, b, c, x, y in roles
    if x > y
)
# A swapped canonical (x > y) is only kept when the x < y assignment fails.
swapped = [(a, b, c, x, y) for a, b, c, x, y in roles if x > y]
hidden = [
    role
    for role in swapped
    if crosscheck.admissible(role[0], role[4], role[1], role[2], role[3])
]
print(f"swapped canonicals: {len(swapped)}; hidden x<y admissibles: {len(hidden)}")

mine_pairs = set()
mine_triples = set()
for a, b, c, x, y in roles:
    mine_pairs.add((x, frozenset((a, b))))
    mine_pairs.add((y, frozenset((a, b))))
    mine_triples.add((c, frozenset((b, x, y))))
print("pair rows agree:", mine_pairs == crosscheck.pair_rows, len(mine_pairs))
print("triple rows agree:", mine_triples == crosscheck.triple_rows, len(mine_triples))
print("DIFFERENTIAL COMPLETE")
