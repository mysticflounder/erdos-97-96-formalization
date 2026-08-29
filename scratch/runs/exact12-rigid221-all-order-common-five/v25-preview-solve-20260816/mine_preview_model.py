"""Preview-mine the unauthenticated v25 cadical model.

Diagnostic only (agreed action 2, docs/exact12-v24-survivor-structural-
analysis-2026-08-16.md).  Decodes the cadical witness with the same
SourceFaithfulCoverInstance the canary materializes, prints the cube, and
classifies every common-five row-instance the cube realizes:

- installed strict (20th bank)      -> must be absent (clause violation)
- installed center-exchange (21st)  -> must be absent (clause violation)
- Klein a<->b union instance        -> the measured gap class
- oriented by NO Klein variant      -> a new shape

Nothing here authenticates anything.  The canary pipeline is the only
authentication path.
"""

from __future__ import annotations

import itertools
import sys
from pathlib import Path

RUN_DIR = Path(__file__).resolve().parent
REPO_ROOT = RUN_DIR.parents[3]
sys.path.insert(0, str(REPO_ROOT))

from census.card_head.candidate_surface import build_model  # noqa: E402
from census.card_head.exact12_center_exchange_all_order_common_five_membership_family_bank import (  # noqa: E402
    _admissible_center_exchange,
    _admissible_strict,
    _common_five,
    _positions,
    _side_conditions,
)
from census.card_head.source_faithful_candidate_surface import (  # noqa: E402
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SourceFaithfulCoverInstance,
)


def _klein_admissible(a: int, x: int, b: int, c: int, y: int) -> bool:
    variants = [
        variant
        for variant in (
            (a, x, b, c, y),
            (a, y, b, c, x),
            (b, x, a, c, y),
            (b, y, a, c, x),
        )
        if _side_conditions(*variant)
    ]
    if not variants:
        return False
    return all(
        any(_common_five(position, *variant) for variant in variants)
        for position in _positions()
    )


def main() -> None:
    log_path = RUN_DIR / "cadical_v25_final.log"
    positives: set[int] = set()
    for line in log_path.read_text().splitlines():
        if line.startswith("v "):
            for token in line[2:].split():
                literal = int(token)
                if literal > 0:
                    positives.add(literal)
    print(f"positive literals: {len(positives)}")

    instance = SourceFaithfulCoverInstance(
        build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
    )
    cube = instance.decode_model(positives)
    print("decoded cube (center -> support):")
    for center in sorted(cube):
        print(f"  {center}: {sorted(cube[center])}")

    supports = {center: set(rows) for center, rows in cube.items()}

    strict_hits = []
    exchange_hits = []
    klein_hits = []
    unoriented = []
    for x, y in itertools.permutations(range(12), 2):
        if x > y:
            continue
        common = supports[x] & supports[y]
        for a, b in itertools.permutations(sorted(common), 2):
            for c in range(12):
                if c in (a, b, x, y):
                    continue
                has_b_row = {b, x, y} <= supports[c]
                has_a_row = {a, x, y} <= supports[c]
                if not (has_b_row or has_a_row):
                    continue
                # Serialize on the ordered (a, b) whose c-row is present;
                # (a, b) with b-row present is the certificate orientation.
                if not has_b_row:
                    continue
                instance_tuple = (a, b, c, x, y)
                if _admissible_strict(a, x, b, c, y) or _admissible_strict(
                    a, y, b, c, x
                ):
                    strict_hits.append(instance_tuple)
                elif _admissible_center_exchange(a, x, b, c, y):
                    exchange_hits.append(instance_tuple)
                elif has_a_row and _klein_admissible(a, x, b, c, y):
                    klein_hits.append(instance_tuple)
                else:
                    unoriented.append(
                        (instance_tuple, "union" if has_a_row else "single")
                    )

    print(f"installed strict instances (MUST be 0): {len(strict_hits)}")
    for hit in strict_hits:
        print(f"  VIOLATION strict: {hit}")
    print(f"installed center-exchange instances (MUST be 0): {len(exchange_hits)}")
    for hit in exchange_hits:
        print(f"  VIOLATION exchange: {hit}")
    print(f"klein a<->b union instances (gap class): {len(klein_hits)}")
    for hit in klein_hits:
        print(f"  KLEIN GAP (a, b, c, x, y) = {hit}")
    print(f"row-instances oriented by no Klein variant: {len(unoriented)}")
    for hit, kind in unoriented[:40]:
        print(f"  UNORIENTED ({kind} c-row) (a, b, c, x, y) = {hit}")


if __name__ == "__main__":
    main()
