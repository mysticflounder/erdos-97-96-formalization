#!/usr/bin/env python3
"""Audit the direct five-point three-row Kalmanson bank schema.

This is a scratch copy of the proposed matcher, not an edit to
``census/atail_force/producer_bank.py``.  It intentionally recognizes only
direct support-pair memberships justified by the Lean adapter in this lane;
arbitrary transitive distance-closure matches would require a stronger Lean
adapter.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from pathlib import Path
from typing import Iterable, Mapping, Sequence


ROOT = Path(__file__).resolve().parents[3]
DEFAULT_CHECKPOINT = ROOT / (
    "scratch/atail-force/robust-all-center-marco/bank_cegar_checkpoint.json"
)
HULL_ORDER = (
    "O",
    "t1",
    "I",
    "F",
    "A",
    "X",
    "Y",
    "Z",
    "D",
    "J",
    "E",
    "C",
    "G",
    "K",
)
EXPECTED_CHECKPOINT_SHA256 = (
    "b307fed8cf6c30508a615553f5a1caf8a836859f3d70f1907eb3f34b9196c8b9"
)


def direct_five_point_matches(
    rows: Iterable[Mapping[str, object]], order: Sequence[str]
) -> tuple[dict[str, str], ...]:
    """Return every direct-row embedding in the given cyclic orientation."""

    cyclic_order = tuple(order)
    if len(set(cyclic_order)) != len(cyclic_order):
        raise ValueError("cyclic order repeats a label")
    supports_by_center: dict[str, list[frozenset[str]]] = {}
    for row in rows:
        center = str(row["center"])
        support = frozenset(str(label) for label in row["support"])
        if center in support:
            raise ValueError("row support contains its center")
        supports_by_center.setdefault(center, []).append(support)

    def contains_pair(center: str, left: str, right: str) -> bool:
        pair = {left, right}
        return any(pair <= support for support in supports_by_center.get(center, ()))

    matches: list[dict[str, str]] = []
    for start in range(len(cyclic_order)):
        rotated = cyclic_order[start:] + cyclic_order[:start]
        point_o = rotated[0]
        for positions in itertools.combinations(range(1, len(rotated)), 4):
            point_a, point_y, point_e, point_c = (
                rotated[position] for position in positions
            )
            if not contains_pair(point_y, point_o, point_e):
                continue
            if not contains_pair(point_o, point_e, point_c):
                continue
            if not contains_pair(point_a, point_c, point_o):
                continue
            matches.append(
                {
                    "O": point_o,
                    "A": point_a,
                    "Y": point_y,
                    "E": point_e,
                    "C": point_c,
                }
            )
    return tuple(matches)


def _self_test() -> None:
    order = ("O", "A", "Y", "E", "C")
    rows = (
        {"center": "Y", "support": ("O", "E", "u", "v")},
        {"center": "O", "support": ("E", "C", "u", "v")},
        {"center": "A", "support": ("C", "O", "u", "v")},
    )
    assert direct_five_point_matches(rows, order) == (
        {"O": "O", "A": "A", "Y": "Y", "E": "E", "C": "C"},
    )
    for omitted in range(3):
        prefix = tuple(row for index, row in enumerate(rows) if index != omitted)
        assert not direct_five_point_matches(prefix, order)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--checkpoint", type=Path, default=DEFAULT_CHECKPOINT)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--summary", action="store_true")
    args = parser.parse_args()

    _self_test()
    checkpoint_bytes = args.checkpoint.read_bytes()
    checkpoint_sha256 = hashlib.sha256(checkpoint_bytes).hexdigest()
    payload = json.loads(checkpoint_bytes)
    survivors = payload["structural_survivors"]
    forward = []
    reverse = []
    for ordinal, survivor in enumerate(survivors, start=1):
        forward_matches = direct_five_point_matches(survivor["rows"], HULL_ORDER)
        reverse_matches = direct_five_point_matches(
            survivor["rows"], tuple(reversed(HULL_ORDER))
        )
        if forward_matches:
            forward.append({"survivor": ordinal, "matches": forward_matches})
        if reverse_matches:
            reverse.append({"survivor": ordinal, "matches": reverse_matches})

    summary = {
        "checkpoint": str(args.checkpoint.relative_to(ROOT)),
        "checkpoint_sha256": checkpoint_sha256,
        "stored_survivors": len(survivors),
        "forward_direct_schema_survivors": len(forward),
        "reverse_direct_schema_survivors": len(reverse),
        "forward_direct_schema_embeddings": sum(
            len(record["matches"]) for record in forward
        ),
        "reverse_direct_schema_embeddings": sum(
            len(record["matches"]) for record in reverse
        ),
        "forward_terminal_match": bool(forward and forward[-1]["survivor"] == 101),
        "reverse_terminal_match": bool(reverse and reverse[-1]["survivor"] == 101),
    }
    if not args.summary:
        summary["forward_matches"] = forward
        summary["reverse_matches"] = reverse
    if args.check:
        if len(survivors) != 101:
            raise AssertionError("corrected survivor count drift")
        if payload.get("schema") != "p97-atail-robust-all-center-bank-cegar-v1":
            raise AssertionError("checkpoint schema drift")
        if checkpoint_sha256 != EXPECTED_CHECKPOINT_SHA256:
            raise AssertionError("corrected checkpoint hash drift")
        forward_embeddings = sum(len(record["matches"]) for record in forward)
        reverse_embeddings = sum(len(record["matches"]) for record in reverse)
        if len(forward) != 101 or forward_embeddings != 383:
            raise AssertionError("forward direct-schema coverage drift")
        if len(reverse) != 101 or reverse_embeddings != 418:
            raise AssertionError("reverse direct-schema coverage drift")
        canonical_terminal = {
            "O": "O",
            "A": "A",
            "Y": "Y",
            "E": "E",
            "C": "C",
        }
        if canonical_terminal not in forward[-1]["matches"]:
            raise AssertionError("canonical terminal embedding drift")
    print(json.dumps(summary, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
