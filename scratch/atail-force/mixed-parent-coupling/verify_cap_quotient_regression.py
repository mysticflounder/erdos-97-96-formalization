#!/usr/bin/env python3
"""Regression for the cap-quotiented reverse-mixed parent boundary.

The exact Q(sqrt(3)) geometry is delegated to, and pinned against, the
reverse-mixed regression.  This wrapper exhausts the four locally possible
choices for the retained apex blocker: the two known bisector centers in
each prescribed-failure orientation.

The cap-side layer records exactly the facts carried by JointTransitionPacket:
``x,y`` are in ``oppCap2`` and ``u,v`` are outside it.  It is not a full MEC
cap packet, global-K4 model, or total CriticalShellSystem model.
"""

from __future__ import annotations

from hashlib import sha256
import json
from pathlib import Path
import subprocess
import sys


ROOT = Path(__file__).resolve().parents[3]
BASE_CHECKER = (
    ROOT
    / "scratch/atail-force/mixed-profile-eliminator/verify_reverse_mixed_regression.py"
)
PINNED = {
    "scratch/atail-force/mixed-profile-eliminator/MixedProfileEliminator.lean":
        "34308a3a8e4d6b3da16a65e0cdc605ecb47a6f8ff8f15e2eb79bfbffcb57fdb4",
    "scratch/atail-force/mixed-profile-eliminator/verify_reverse_mixed_regression.py":
        "0b83fb5dc6752b21e2e47fa401013a0d673e85e3e7d84fc35a7667204df29b25",
    "scratch/atail-force/mixed-parent-coupling/MixedParentCoupling.lean":
        "99e1719c496c99a4f8499a6e6eb71a2b1f45a74917ca52352407d84b4b033300",
}


def check_pins() -> None:
    for relative, expected in PINNED.items():
        actual = sha256((ROOT / relative).read_bytes()).hexdigest()
        assert actual == expected, (relative, expected, actual)


def cap_quotiented_separation(
    cap: set[str], blocker: str, inside: str, outside: str
) -> bool:
    return ((blocker in cap and blocker != inside)
            or (blocker not in cap and blocker != outside))


def main() -> None:
    check_pins()
    base = subprocess.run(
        [sys.executable, str(BASE_CHECKER)],
        cwd=ROOT,
        check=True,
        capture_output=True,
        text=True,
    )
    base_result = json.loads(base.stdout)
    assert base_result["named_pair_bisector_centers"]["{y,a}"] == ["u", "x"]
    assert base_result["named_pair_bisector_centers"]["{x,a}"] == ["v", "y"]

    # Partial exact-support incidences from the reverse-mixed geometry.  They
    # are sufficient to decide deletion survival for x and y at each of the
    # four possible aligned blockers.
    supports = {
        "x": {"y", "a", "u"},
        "y": {"x", "a", "v"},
        "u": {"y", "a"},
        "v": {"x", "a"},
    }
    opp_cap2 = {"x", "y"}
    assert {"u", "v"}.isdisjoint(opp_cap2)

    def survives(blocker: str, deleted: str) -> bool:
        return deleted not in supports[blocker]

    cases = [
        # deletion, blocker, known inside center, known outside center
        ("y", "x", "x", "u"),
        ("y", "u", "x", "u"),
        ("x", "y", "y", "v"),
        ("x", "v", "y", "v"),
    ]
    checked: list[dict[str, object]] = []
    for deleted, blocker, inside, outside in cases:
        # The prescribed deletion fails because the deleted point is in the
        # displayed blocker support.
        assert not survives(blocker, deleted)

        # Both retained apex endpoint outcomes still hold.  A failure may
        # align with one of its two known centers, while the other deletion
        # survives.
        y_outcome = survives(blocker, "y") or blocker in {"u", "x"}
        x_outcome = survives(blocker, "x") or blocker in {"v", "y"}
        assert y_outcome and x_outcome

        # Cap membership automatically separates the blocker from the known
        # center on the opposite side.  The only remaining inequality is the
        # one against the candidate on the same side, and every aligned case
        # falsifies precisely that inequality.
        opposite_side_separated = (
            blocker != outside if blocker in opp_cap2 else blocker != inside
        )
        assert opposite_side_separated
        assert not cap_quotiented_separation(
            opp_cap2, blocker, inside, outside
        )
        checked.append(
            {
                "deleted": deleted,
                "blocker": blocker,
                "blocker_in_oppCap2": blocker in opp_cap2,
                "automatic_opposite_side_separation": True,
                "same_side_candidate": blocker,
                "cap_quotiented_separation": False,
            }
        )

    print(json.dumps({
        "rigor": (
            "exact pinned Q(sqrt(3)) geometry plus exhaustive finite "
            "incidence and oppCap2-side shadow"
        ),
        "scope": (
            "not CounterexampleData; no full MEC packet, global K4, or "
            "total CriticalShellSystem"
        ),
        "checked_aligned_blocker_cases": checked,
        "conclusion": (
            "cap side alone supplies only the opposite-side inequality; "
            "the same-side inequality is the minimal remaining separation field"
        ),
        "pins": PINNED,
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
