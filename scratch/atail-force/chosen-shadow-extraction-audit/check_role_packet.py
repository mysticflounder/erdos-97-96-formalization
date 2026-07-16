#!/usr/bin/env python3
"""Audit the bank-clean fifteen-equality packet against the chosen three rows.

This is a scratch theorem-discovery check.  It reuses the pinned matcher
implementation, but reconstructs the corrected-stream census and the three
chosen-row smoke cases here.  A passing run is not a Lean proof and does not
produce the packet from the live parent.
"""

from __future__ import annotations

import hashlib
import json
from pathlib import Path
import runpy
from typing import Any, Callable, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
MATCHER = HERE.parent / "bank-clean-pattern-matcher" / "check.py"
CHECKPOINT = (
    HERE.parent / "robust-all-center-marco" / "bank_cegar_checkpoint.json"
)
CORE_SOURCE = (
    HERE.parent
    / "bank-clean-lean-certificate"
    / "compact-fallback"
    / "BankCleanFifteenCollisionCore.lean"
)
SURFACE_SOURCE = HERE.parent / "robust-all-center-cegar" / "search.py"
FRONTIER_SOURCE = (
    ROOT
    / "lean"
    / "Erdos9796Proof"
    / "P97"
    / "ATail"
    / "CriticalPairFrontier.lean"
)

EXPECTED_SHA256 = {
    MATCHER: "b5326e5a758879b199643ed59d2940fbc13dc0a881d1a97e7b005e3b7e16195f",
    CHECKPOINT: "b307fed8cf6c30508a615553f5a1caf8a836859f3d70f1907eb3f34b9196c8b9",
    CORE_SOURCE: "c84c9ba4808423e0a6a7b68bbf3e042c4945b23505683a68f7efa30de3394c56",
    SURFACE_SOURCE: "54edd2c3ed92ef6d0d55f5f5196d9ec84d2d04cabc40a3ecc04cabbcb4a16d02",
    FRONTIER_SOURCE: "b28a17ec26598429192347ef5581114ee88cb4fc7287314925b2c3559317f919",
}

EXPECTED_HIT_INDICES = (13, 18, 47, 61, 62, 98, 100)
EXPECTED_TERMINAL_MAPPING = {
    "O": "O",
    "A": "A",
    "E": "E",
    "G": "G",
    "K": "K",
    "X": "X",
    "Z": "Z",
    "Y": "Y",
    "F": "F",
}


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def assert_pins() -> None:
    for path, expected in EXPECTED_SHA256.items():
        actual = sha256(path)
        if actual != expected:
            relative = path.relative_to(ROOT)
            raise RuntimeError(
                f"pinned input drift for {relative}: expected {expected}, got {actual}"
            )


def load_matcher() -> dict[str, Any]:
    # Do not execute the matcher's ``main``.  This audit independently rebuilds
    # the relevant census and cases from its pinned matching primitives.
    return runpy.run_path(str(MATCHER), run_name="p97_role_packet_matcher")


def corrected_stream_audit(namespace: dict[str, Any]) -> dict[str, Any]:
    payload = json.loads(CHECKPOINT.read_text(encoding="utf-8"))
    survivors = payload["structural_survivors"]
    if payload["status"] != "SAT_PRODUCER_BANK_CLEAN_CORRECTED_SHADOW":
        raise RuntimeError("corrected-stream checkpoint status drift")
    if len(survivors) != 101:
        raise RuntimeError(f"corrected survivor count drift: {len(survivors)}")

    load_module: Callable[..., Any] = namespace["load_module"]
    rows_from_record: Callable[..., Any] = namespace["rows_from_record"]
    closure_matcher: Callable[..., Any] = namespace["bank_clean_15_core"]
    direct_matcher: Callable[..., Any] = namespace["bank_clean_15_core_z3_direct"]

    surface_module = load_module(
        namespace["SURFACE_SOURCE"], "p97_chosen_role_packet_surface"
    )
    if Path(namespace["SURFACE_SOURCE"]).resolve() != SURFACE_SOURCE.resolve():
        raise RuntimeError("matcher surface-source path drift")
    fixed_identity = {
        "profile": tuple(surface_module.PROFILE),
        "first_apex": surface_module.FIRST_APEX,
        "second_apex": surface_module.SECOND_APEX,
        "q": surface_module.Q,
        "first_apex_class": frozenset(surface_module.FIRST_APEX_CLASS),
    }
    expected_fixed_identity = {
        "profile": (8, 4, 5),
        "first_apex": "O",
        "second_apex": "A",
        "q": "E",
        "first_apex_class": frozenset({"A", "C", "D", "E", "J"}),
    }
    if fixed_identity != expected_fixed_identity:
        raise RuntimeError(f"fixed terminal identity surface drift: {fixed_identity}")
    surface = surface_module.Surface()
    by_name = {str(name): int(label) for name, label in surface.by_name.items()}
    by_label = {int(label): str(name) for label, name in surface.by_label.items()}

    hits: list[dict[str, Any]] = []
    for index, survivor in enumerate(survivors):
        rows = rows_from_record(survivor, by_name)
        match = closure_matcher(rows, 14)
        if match is not None:
            hits.append(
                {
                    "survivor_index": index,
                    "mapping": {
                        role: by_label[label] for role, label in match.items()
                    },
                }
            )

    hit_indices = tuple(hit["survivor_index"] for hit in hits)
    if hit_indices != EXPECTED_HIT_INDICES:
        raise RuntimeError(f"fifteen-equality hit set drift: {hit_indices}")

    terminal_hits = [hit for hit in hits if hit["survivor_index"] == 100]
    if len(terminal_hits) != 1:
        raise RuntimeError(f"terminal hit multiplicity drift: {terminal_hits}")
    if terminal_hits[0]["mapping"] != EXPECTED_TERMINAL_MAPPING:
        raise RuntimeError(f"terminal identity map drift: {terminal_hits[0]}")

    terminal_rows = rows_from_record(survivors[100], by_name)
    negative_rows = rows_from_record(survivors[0], by_name)
    if direct_matcher(terminal_rows, 14) is None:
        raise RuntimeError("direct Z3 matcher missed terminal survivor 100")
    if direct_matcher(negative_rows, 14) is not None:
        raise RuntimeError("direct Z3 matcher unexpectedly hit survivor 0")

    return {
        "survivors_checked": len(survivors),
        "hit_count": len(hits),
        "miss_count": len(survivors) - len(hits),
        "hit_indices": list(hit_indices),
        "terminal_100_mapping": EXPECTED_TERMINAL_MAPPING,
        "direct_z3_smoke": {
            "terminal_100": "MATCH",
            "survivor_0": "NO_MATCH",
        },
        "fixed_terminal_identity_surface": {
            "profile": list(fixed_identity["profile"]),
            "first_apex": fixed_identity["first_apex"],
            "second_apex": fixed_identity["second_apex"],
            "q": fixed_identity["q"],
            "first_apex_class": sorted(fixed_identity["first_apex_class"]),
        },
    }


def chosen_three_row_smoke(namespace: dict[str, Any]) -> dict[str, Any]:
    """Check three progressively stronger F/K/P row abstractions.

    Label 0 is the chosen second apex and labels 1 and 2 are the two
    continuation centers.  The first row is the apex-centered row ``K``;
    the other two rows are centered at the continuation points.  The latter
    two cases add exactly the cross-membership facts carried by the two
    residual arms, and then the common-apex memberships carried only by the
    equilateral arm.
    """

    metric = namespace["metric"]
    closure_matcher: Callable[..., Any] = namespace["bank_clean_15_core"]
    direct_matcher: Callable[..., Any] = namespace["bank_clean_15_core_z3_direct"]

    raw_cases: dict[str, Sequence[tuple[int, Sequence[int]]]] = {
        "bare_three_rows": (
            (0, (1, 2, 3, 4)),
            (1, (5, 6, 7, 8)),
            (2, (7, 8, 9, 10)),
        ),
        "non_equilateral_cross_membership": (
            (0, (1, 2, 3, 4)),
            (1, (2, 5, 6, 7)),
            (2, (1, 8, 9, 10)),
        ),
        "equilateral_cross_and_apex_membership": (
            (0, (1, 2, 3, 4)),
            (1, (0, 2, 5, 6)),
            (2, (0, 1, 7, 8)),
        ),
    }

    results: dict[str, Any] = {}
    for name, raw_rows in raw_cases.items():
        rows = tuple(
            metric.MetricRow(center, tuple(support), exact=False)
            for center, support in raw_rows
        )
        closure_match = closure_matcher(rows, 11)
        direct_match = direct_matcher(rows, 11)
        if closure_match is not None or direct_match is not None:
            raise RuntimeError(
                f"synthetic case {name} unexpectedly matched: "
                f"closure={closure_match}, direct={direct_match}"
            )
        results[name] = {
            "rows": [
                {"center": center, "support": list(support)}
                for center, support in raw_rows
            ],
            "closure_matcher": "NO_MATCH",
            "direct_z3_matcher": "NO_MATCH",
        }
    return results


def main() -> int:
    assert_pins()
    namespace = load_matcher()
    output = {
        "status": "PASS",
        "epistemic_status": "EXACT_WITHIN_PINNED_FINITE_ROW_ABSTRACTIONS",
        "pins": {
            str(path.relative_to(ROOT)): digest
            for path, digest in EXPECTED_SHA256.items()
        },
        "corrected_stream": corrected_stream_audit(namespace),
        "chosen_three_row_smoke": chosen_three_row_smoke(namespace),
        "interpretation": (
            "NO_DIRECT_MATCH_FROM_THE_THREE_CARRIED_ROWS_IN_THE_TESTED_ABSTRACTIONS"
        ),
    }
    print(json.dumps(output, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
