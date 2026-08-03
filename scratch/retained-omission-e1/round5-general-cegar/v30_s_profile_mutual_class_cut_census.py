"""Audit the new exact-n15 S-profile mutual-class Boolean cut family.

The input is a live or terminal v30 journal tree.  Every journal is first
validated through ``AssignmentJournal.recover``.  This census asks how many
complete Boolean proposals violate the Lean-banked implication

    k4[C,P] ∧ k4[C,M] ∧ k4[M,C] → k4[M,P]

for distinct strict-interior points ``C,M`` of an S-profile cap with apex
``P``.  It is a read-only efficiency diagnostic, not a closure certificate.
"""

from __future__ import annotations

import argparse
import json
from collections import Counter
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Any

import round5_cegar_v8 as v8
import round5_cegar_v19 as v19


@dataclass(frozen=True, order=True)
class SProfileMutualClassCut:
    apex_index: int
    apex: int
    first_center: int
    second_center: int

    def signed_antecedent(self) -> tuple[tuple[str, bool], ...]:
        c = self.first_center
        m = self.second_center
        p = self.apex
        return (
            (f"k4_{c}_{p}", True),
            (f"k4_{c}_{m}", True),
            (f"k4_{m}_{c}", True),
            (f"k4_{m}_{p}", False),
        )

    def violated_by(self, assignment: dict[str, bool]) -> bool:
        return all(
            assignment.get(name) is value
            for name, value in self.signed_antecedent()
        )

    def record(self) -> dict[str, Any]:
        return {
            **asdict(self),
            "signed_antecedent": [
                {"bool": name, "value": value}
                for name, value in self.signed_antecedent()
            ],
        }


def cuts_for_profiles(profiles: str) -> tuple[SProfileMutualClassCut, ...]:
    if len(profiles) != 3 or any(profile not in "SD" for profile in profiles):
        raise ValueError(f"invalid rich profile word: {profiles}")
    cuts = tuple(
        SProfileMutualClassCut(apex_index, apex, c, m)
        for apex_index, (apex, profile, interior) in enumerate(
            zip(v8.APICES, profiles, v8.INTERIORS, strict=True)
        )
        if profile == "S"
        for c in interior
        for m in interior
        if c != m
    )
    expected = 12 * profiles.count("S")
    if len(cuts) != expected or len(set(cuts)) != expected:
        raise RuntimeError("S-profile mutual-class cut enumeration is incomplete")
    return cuts


def assignment_map(payload: dict[str, Any]) -> dict[str, bool]:
    raw = payload.get("assignment")
    if not isinstance(raw, list):
        raise TypeError("proposal has no assignment list")
    assignment = {str(item["bool"]): bool(item["value"]) for item in raw}
    if len(assignment) != len(raw):
        raise RuntimeError("proposal contains duplicate Boolean names")
    return assignment


def profiles_from_case_id(case_id: str) -> str:
    fields = case_id.split("_")
    if len(fields) < 2:
        raise ValueError(f"cannot parse profile word from case id: {case_id}")
    profiles = fields[1]
    cuts_for_profiles(profiles)
    return profiles


def census(run_dir: Path) -> dict[str, Any]:
    journals = sorted(run_dir.glob("*/assignment-journal-v19"))
    if not journals:
        raise RuntimeError(f"no assignment journals under {run_dir}")

    total_proposals = 0
    total_completed = 0
    total_violating = 0
    completed_violating = 0
    status_counts: Counter[str] = Counter()
    violation_multiplicity: Counter[int] = Counter()
    cut_hits: Counter[SProfileMutualClassCut] = Counter()
    cases: list[dict[str, Any]] = []

    for journal in journals:
        state = v19.AssignmentJournal(journal).recover()
        case_id = journal.parent.name
        profiles = profiles_from_case_id(case_id)
        cuts = cuts_for_profiles(profiles)
        outcomes = {
            str(payload["assignment_sha256"]): str(payload["status"])
            for payload in state["completed"]
        }
        case_proposals = 0
        case_completed = 0
        case_violating = 0
        case_completed_violating = 0
        for record in state["records"]:
            payload = record["payload"]
            if payload.get("phase") != "proposed":
                continue
            case_proposals += 1
            total_proposals += 1
            assignment = assignment_map(payload)
            assignment_sha = str(payload["assignment_sha256"])
            status = outcomes.get(assignment_sha)
            if status is not None:
                case_completed += 1
                total_completed += 1
                status_counts[status] += 1
            hits = tuple(cut for cut in cuts if cut.violated_by(assignment))
            violation_multiplicity[len(hits)] += 1
            if not hits:
                continue
            case_violating += 1
            total_violating += 1
            cut_hits.update(hits)
            if status is not None:
                case_completed_violating += 1
                completed_violating += 1
        cases.append(
            {
                "case_id": case_id,
                "profiles": profiles,
                "cut_count": len(cuts),
                "proposal_count": case_proposals,
                "completed_count": case_completed,
                "violating_count": case_violating,
                "completed_violating_count": case_completed_violating,
            }
        )

    return {
        "kind": "v30_s_profile_mutual_class_cut_census",
        "claim_scope": "validated live-prefix efficiency census; not closure",
        "run_dir": str(run_dir.resolve()),
        "journal_count": len(journals),
        "proposal_count": total_proposals,
        "completed_count": total_completed,
        "completed_status_distribution": dict(sorted(status_counts.items())),
        "violating_proposal_count": total_violating,
        "completed_violating_count": completed_violating,
        "violation_multiplicity_distribution": {
            str(count): occurrences
            for count, occurrences in sorted(violation_multiplicity.items())
        },
        "distinct_cut_hit_count": len(cut_hits),
        "most_frequent_cuts": [
            {"occurrences": count, **cut.record()}
            for cut, count in cut_hits.most_common(20)
        ],
        "cases": cases,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("run_dir", type=Path)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    report = census(args.run_dir)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(args.output),
                "journals": report["journal_count"],
                "proposals": report["proposal_count"],
                "completed": report["completed_count"],
                "violating": report["violating_proposal_count"],
                "completed_violating": report["completed_violating_count"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
