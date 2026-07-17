#!/usr/bin/env python3
"""Read-only audit of the stored fixed-profile shadows against the live target.

This does not invoke a solver.  It pins and scans existing checkpoints only.
"""

from __future__ import annotations

import hashlib
import json
from collections import defaultdict
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]

PREFIX = ROOT / "scratch/atail-force/robust-all-center-marco/bank_cegar_checkpoint.json"
DIRECT = ROOT / "scratch/atail-force/kalmanson-bank-cegar/direct_schema_coverage_checkpoint.json"
CONTINUATION = (
    ROOT
    / "scratch/atail-force/global-minimality-connectivity-audit/"
    "kalmanson-consumer/continuation_checkpoint.json"
)

EXPECTED_SHA256 = {
    PREFIX: "b307fed8cf6c30508a615553f5a1caf8a836859f3d70f1907eb3f34b9196c8b9",
    DIRECT: "f3d36762c63be39b77aaaae2d2de34199eeffca4cbc5cdad8e919e8f444d182a",
    CONTINUATION: "fedd033e8eabea54e0134a0ac73eaf75855e83f3d071d4e4179ab4961b8362de",
}

ORDER = ("O", "t1", "I", "F", "A", "X", "Y", "Z", "D", "J", "E", "C", "G", "K")
AMBIENT_O_SUPPORT = frozenset(("A", "C", "D", "E", "J"))
CAPS = (
    frozenset(("O", "t1", "I", "F", "A")),
    frozenset(("A", "X", "Y", "Z", "D", "J", "E", "C")),
    frozenset(("C", "G", "K", "O")),
)


def load_pinned(path: Path) -> dict[str, object]:
    raw = path.read_bytes()
    actual = hashlib.sha256(raw).hexdigest()
    expected = EXPECTED_SHA256[path]
    if actual != expected:
        raise SystemExit(f"checkpoint drift: {path}: expected {expected}, got {actual}")
    return json.loads(raw)


def rows_of(witness: dict[str, object]) -> dict[str, frozenset[str]]:
    return {
        str(row["center"]): frozenset(map(str, row["support"]))
        for row in witness["rows"]
    }


def forward_from_o(*labels: str) -> bool:
    """The roles are strictly increasing after the distinguished O cut."""

    positions = [ORDER.index(label) for label in labels]
    return labels[0] == "O" and all(a < b for a, b in zip(positions, positions[1:]))


def cross_row_embeddings(witness: dict[str, object]) -> list[dict[str, str]]:
    """Find the exact critical-fiber/cross-row terminal, scanning both source roles."""

    blockers = {str(source): str(center) for source, center in witness["blockers"].items()}
    rows = rows_of(witness)
    fibers: dict[str, list[str]] = defaultdict(list)
    for source, center in blockers.items():
        fibers[center].append(source)

    found: list[dict[str, str]] = []
    for common_blocker, sources in fibers.items():
        for c in sources:
            for k in sources:
                if c == k:
                    continue
                for j in AMBIENT_O_SUPPORT:
                    if j in {"O", common_blocker, c, k}:
                        continue
                    x = blockers[j]
                    roles = ("O", common_blocker, x, j, c, k)
                    if len(set(roles)) != 6 or not forward_from_o(*roles):
                        continue
                    if c not in AMBIENT_O_SUPPORT or k not in rows[x] or j not in rows[x]:
                        continue
                    found.append({"A": common_blocker, "C": c, "K": k, "J": j, "X": x})
    return found


def literal_embedding(witness: dict[str, object]) -> bool:
    blockers = witness["blockers"]
    rows = rows_of(witness)
    return (
        blockers["C"] == "A"
        and blockers["K"] == "A"
        and blockers["J"] == "X"
        and {"J", "K"} <= rows["X"]
        and {"C", "J"} <= AMBIENT_O_SUPPORT
        and forward_from_o("O", "A", "X", "J", "C", "K")
    )


def same_cap_embeddings(witness: dict[str, object]) -> list[dict[str, object]]:
    """Find collision-source outside pairs with a second source-faithful bisector.

    The second center is either the robust ambient O class or a blocker-image
    center.  Arbitrary global rows are deliberately excluded.
    """

    blockers = {str(source): str(center) for source, center in witness["blockers"].items()}
    rows = rows_of(witness)
    image = set(blockers.values())
    fibers: dict[str, list[str]] = defaultdict(list)
    for source, center in blockers.items():
        fibers[center].append(source)

    found: list[dict[str, object]] = []
    for a, sources in fibers.items():
        for index, c in enumerate(sources):
            for k in sources[index + 1 :]:
                for cap_index, cap in enumerate(CAPS):
                    if a not in cap or c in cap or k in cap:
                        continue
                    for b in ORDER:
                        if b == a or b not in cap:
                            continue
                        support = AMBIENT_O_SUPPORT if b == "O" else rows[b]
                        if {c, k} <= support and (b == "O" or b in image):
                            found.append(
                                {
                                    "A": a,
                                    "B": b,
                                    "C": c,
                                    "K": k,
                                    "cap_index": cap_index,
                                    "second_center_kind": "robust_apex" if b == "O" else "critical_blocker",
                                }
                            )
    return found


def summarize(witnesses: list[dict[str, object]]) -> dict[str, object]:
    cross_counts = [len(cross_row_embeddings(witness)) for witness in witnesses]
    same_cap_counts = [len(same_cap_embeddings(witness)) for witness in witnesses]
    return {
        "witnesses": len(witnesses),
        "literal_CK_A_JX_cross_row_witnesses": sum(map(literal_embedding, witnesses)),
        "any_cross_row_witnesses": sum(count > 0 for count in cross_counts),
        "any_cross_row_embeddings": sum(cross_counts),
        "any_source_faithful_same_cap_witnesses": sum(count > 0 for count in same_cap_counts),
        "any_source_faithful_same_cap_embeddings": sum(same_cap_counts),
        "neither_terminal_witnesses": sum(
            cross == 0 and cap == 0 for cross, cap in zip(cross_counts, same_cap_counts)
        ),
    }


def main() -> int:
    prefix = load_pinned(PREFIX)
    direct = load_pinned(DIRECT)
    continuation = load_pinned(CONTINUATION)
    result = {
        "stored_101_prefix": summarize(prefix["structural_survivors"]),
        "direct_schema_avoider": summarize([direct["last_event"]]),
        "continuation": {
            "status": continuation["status"],
            "base_survivor_prefix_count": continuation["base_survivor_prefix_count"],
            "nodes": continuation["last_event"]["nodes"],
            "zero_singleton_domain_centers": continuation["last_event"][
                "zero_singleton_domain_centers"
            ],
        },
        "scope": "READ_ONLY_FIXED_14_ROLE_PROFILE_8_4_5_REPLAY_NOT_LIVE_COVERAGE",
    }
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
