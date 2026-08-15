"""Post-process cores.json: add isomorphism-level (anonymous-shape) subsumption.

EMPIRICAL / diagnostic.  Two membership patterns have the same anonymous shape
iff a label bijection maps one onto the other (centers to centers, supports to
supports).  This quotients away both concrete labels AND role vocabulary, so a
candidate role-structure group can be compared with banked families whose role
names differ (e.g. the d/e roles of the three-triad bank).

Canonicalization: partition labels by a refinement invariant, then brute-force
minimal form over permutations consistent with the ordered partition.
"""

from __future__ import annotations

import itertools
import json
import sys
from collections import defaultdict
from pathlib import Path

OUT = Path(
    "/Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/"
    "rigid221-sourceheavy-anchor/cross-wave-audit-20260814"
)
LIVE_V23 = Path(
    "/Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/"
    "arm-static-cell6-v23-live-fc0b0f5d-20260814"
)

Pattern = tuple[tuple[object, tuple[object, ...]], ...]


def _invariant(pattern: Pattern) -> dict[object, tuple]:
    as_center: dict[object, list[int]] = defaultdict(list)
    as_member: dict[object, list[int]] = defaultdict(list)
    for center, support in pattern:
        as_center[center].append(len(support))
        for label in support:
            as_member[label].append(len(support))
    labels = {label for center, support in pattern for label in (center, *support)}
    inv = {}
    for label in labels:
        inv[label] = (
            tuple(sorted(as_center.get(label, ()))),
            tuple(sorted(as_member.get(label, ()))),
        )
    # one refinement round: augment with the invariants of co-members/centers
    inv2 = {}
    for label in labels:
        co = []
        for center, support in pattern:
            if label == center:
                co.append(("C", tuple(sorted(inv[p] for p in support))))
            elif label in support:
                others = tuple(sorted(inv[p] for p in support if p != label))
                co.append(("M", inv[center], others))
        inv2[label] = (inv[label], tuple(sorted(co)))
    return inv2


def canonical_shape(pattern: Pattern) -> tuple:
    """Minimal relabeled form over bijections consistent with the invariant
    partition ordering (exact within the partition; the partition ordering
    itself is invariant-determined, so the result is a true canonical form
    for patterns whose invariant classes are correctly separated; within-class
    permutations are searched exhaustively)."""

    inv = _invariant(pattern)
    classes: dict[tuple, list[object]] = defaultdict(list)
    for label, value in inv.items():
        classes[value].append(label)
    ordered_classes = [
        sorted(classes[key]) for key in sorted(classes, key=repr)
    ]
    best = None
    pools = [list(itertools.permutations(cell)) for cell in ordered_classes]
    total = 1
    for pool in pools:
        total *= len(pool)
    if total > 500000:
        raise RuntimeError(f"canonicalization search too large: {total}")
    for choice in itertools.product(*pools):
        mapping = {}
        index = 0
        for cell in choice:
            for label in cell:
                mapping[label] = index
                index += 1
        relabeled = tuple(
            sorted(
                (mapping[center], tuple(sorted(mapping[p] for p in support)))
                for center, support in pattern
            )
        )
        if best is None or relabeled < best:
            best = relabeled
    return best


def main() -> None:
    cores_path = OUT / "cores.json"
    data = json.loads(cores_path.read_text(encoding="utf-8"))

    # Banked anonymous shapes.
    bank_shapes: dict[tuple, set[str]] = defaultdict(set)
    bank_shape_counts = []
    for path in sorted(LIVE_V23.glob("*_family_bank.json")):
        bank = json.loads(path.read_text(encoding="utf-8"))
        shapes = set()
        for pattern in bank["patterns"]:
            p: Pattern = tuple(
                (entry["center"], tuple(entry["support"])) for entry in pattern
            )
            shape = canonical_shape(p)
            shapes.add(shape)
            bank_shapes[shape].add(bank["family_id"])
        bank_shape_counts.append(
            {
                "family_id": bank["family_id"],
                "n_patterns": len(bank["patterns"]),
                "n_distinct_anonymous_shapes": len(shapes),
            }
        )
    print(f"{len(bank_shapes)} distinct banked anonymous shapes")
    for row in bank_shape_counts:
        print(
            f"  {row['family_id']}: {row['n_patterns']} patterns -> "
            f"{row['n_distinct_anonymous_shapes']} shapes"
        )

    # Candidate groups: canonical shape of the role structure itself.
    n_iso = 0
    for group in data["recurrence_groups"]:
        structure: Pattern = tuple(
            (center, tuple(support)) for center, support in group["role_structure"]
        )
        shape = canonical_shape(structure)
        matches = sorted(bank_shapes.get(shape, ()))
        group["anonymous_shape"] = [list(entry) if isinstance(entry, tuple) else entry for entry in shape]
        group["iso_bank_matches"] = matches
        group["iso_subsumed"] = bool(matches)
        if matches:
            n_iso += 1
    print(
        f"{n_iso} of {len(data['recurrence_groups'])} role-structure groups are "
        "iso-subsumed by banked anonymous shapes"
    )

    data["bank_anonymous_shapes"] = {
        "n_distinct": len(bank_shapes),
        "per_bank": bank_shape_counts,
    }
    cores_path.write_text(
        json.dumps(data, indent=1, sort_keys=False) + "\n", encoding="utf-8"
    )
    print(f"updated {cores_path}")


if __name__ == "__main__":
    sys.exit(main())
