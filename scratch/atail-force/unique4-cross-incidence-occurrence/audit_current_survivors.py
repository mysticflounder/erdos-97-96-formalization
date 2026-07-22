#!/usr/bin/env python3
"""Audit actual-row cross incidence in the final exact-four CEGAR survivors.

This script does not search for a Euclidean counterexample.  It reads only the
last replay-verified SAT projection in each completed exact-four CEGAR lane and
checks two source-facing questions:

* whether the smallest kernel-checked four-role cyclic-row schema occurs; and
* how far the actual blocker orbit starting at the first apex progresses using
  only mandatory source membership in complete critical shells.

The result is exact within the documented finite projections.  A surviving
model is not a model of ``OriginalUniqueFourResidual``.
"""

from __future__ import annotations

import hashlib
import itertools
import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
OUTER = ROOT / "scratch/atail-force/unique-arm-whole-carrier-source-audit"
LANES = ("cegar", "cegar-minimality", "cegar-pair-minimality")


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load(path: Path) -> dict[str, object]:
    return json.loads(path.read_text(encoding="utf-8"))


def direct_schema_occurrences(rows: dict[int, set[int]], n: int) -> list[tuple[int, ...]]:
    """Occurrences of false_of_one_k1_three_cyclic_selected_rows."""
    found: list[tuple[int, ...]] = []
    for i0, i1, i2, i3 in itertools.combinations(range(n), 4):
        if (
            {i0, i2} <= rows[i1]
            and {i0, i1} <= rows[i2]
            and {i1, i2} <= rows[i3]
        ):
            found.append((i0, i1, i2, i3))
    return found


def reflected_schema_occurrences(
    rows: dict[int, set[int]], n: int
) -> list[tuple[int, ...]]:
    """Occurrences after reflecting the four roles in the fixed boundary cut."""
    found: list[tuple[int, ...]] = []
    for i0, i1, i2, i3 in itertools.combinations(range(n), 4):
        if (
            {i1, i2} <= rows[i0]
            and {i1, i3} <= rows[i1]
            and {i2, i3} <= rows[i2]
        ):
            found.append((i0, i1, i2, i3))
    return found


def final_survivors() -> list[tuple[str, Path, Path]]:
    answer: list[tuple[str, Path, Path]] = []
    for lane in LANES:
        manifest_path = OUTER / lane / "manifest.json"
        manifest = load(manifest_path)
        rounds = manifest.get("rounds")
        assert isinstance(rounds, list) and rounds, manifest_path
        final_round = rounds[-1]
        profiles = final_round.get("profiles")
        assert isinstance(profiles, list) and profiles, manifest_path
        for profile in profiles:
            assert isinstance(profile, dict)
            result_path = ROOT / str(profile["result"])
            replay_path = result_path.with_name(result_path.name.replace(".result.", ".replay."))
            answer.append((lane, result_path, replay_path))
    return answer


def audit_one(lane: str, result_path: Path, replay_path: Path) -> dict[str, object]:
    result = load(result_path)
    replay = load(replay_path)
    assert result["solver_status"] == "SAT"
    assert result["cnf_model_checked"] is True
    assert replay["status"] == "VERIFIED_SAT_PROJECTION"
    assert replay["all_encoded_semantic_constraints_replayed"] is True
    assert replay["source_result_sha256"] == sha256(result_path)

    n = int(result["n"])
    rows = {int(center): set(points) for center, points in result["rows"].items()}
    blockers = {int(source): int(center) for source, center in result["blockers"].items()}
    critical = {
        int(source): set(points) for source, points in result["critical_supports"].items()
    }
    actual_centers = set(blockers.values())

    for source, center in blockers.items():
        assert source in critical[source]
        assert critical[source] == rows[center]

    direct = direct_schema_occurrences(rows, n)
    reflected = reflected_schema_occurrences(rows, n)
    actual_direct = [q for q in direct if set(q[1:]) <= actual_centers]
    actual_reflected = [q for q in reflected if set(q[:3]) <= actual_centers]

    apex = int(result["first_apex"])
    exact_class = set(result["first_apex_exact_class"])
    successor = blockers[apex]
    next_successor = blockers[successor]
    assert rows[apex] == exact_class
    assert apex in rows[successor]
    if successor in exact_class:
        orbit_mode = "mutual_first_step"
        assert blockers[successor] == apex
        assert successor in rows[apex]
    else:
        orbit_mode = "three_distinct_path"
        assert len({apex, successor, next_successor}) == 3
        assert successor in rows[next_successor]

    return {
        "lane": lane,
        "profile": int(result["opp1_card"]),
        "result": str(result_path.relative_to(ROOT)),
        "actual_center_count": len(actual_centers),
        "direct_cyclic_schema_occurrences": direct,
        "reflected_cyclic_schema_occurrences": reflected,
        "actual_direct_cyclic_schema_occurrences": actual_direct,
        "actual_reflected_cyclic_schema_occurrences": actual_reflected,
        "anchored_blocker_orbit": {
            "first_apex": apex,
            "successor": successor,
            "next_successor": next_successor,
            "mode": orbit_mode,
            "successor_row_exact_class_hits": sorted(rows[successor] & exact_class),
        },
    }


def main() -> None:
    audited = [audit_one(*entry) for entry in final_survivors()]
    assert len(audited) == 6
    assert all(not item["direct_cyclic_schema_occurrences"] for item in audited)
    assert all(not item["reflected_cyclic_schema_occurrences"] for item in audited)
    assert all(item["actual_center_count"] >= 3 for item in audited)
    payload = {
        "schema": "p97-unique4-current-survivor-cross-incidence-audit-v1",
        "epistemic_status": "EXACT_WITHIN_REPLAY_VERIFIED_FINITE_PROJECTIONS",
        "claim_scope": (
            "The six records are finite-projection survivors, not Euclidean realizations "
            "or models of every OriginalUniqueFourResidual field."
        ),
        "survivor_count": len(audited),
        "all_avoid_smallest_cyclic_schema_and_reflection": True,
        "all_have_at_least_three_actual_centers": True,
        "survivors": audited,
    }
    print(json.dumps(payload, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
