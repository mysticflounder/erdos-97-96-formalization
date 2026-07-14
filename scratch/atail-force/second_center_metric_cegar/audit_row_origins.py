#!/usr/bin/env python3
"""Audit the named-row provenance of saved metric CEGAR cuts.

The metric layer deliberately deduplicates rows by ``(center, support)``.
That is correct for equality ideals, but it hides whether a retained row came
from one of the five source-indexed exact rows available on the live K-A-PAIR
surface or only from the finite shadow's stronger global-row-at-every-center
inventory.  This replay recovers that distinction without invoking a CAS.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from collections import Counter, defaultdict
from pathlib import Path
from typing import Any, Mapping


HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import cegar  # noqa: E402


DEFAULT_CHECKPOINT = HERE / "checkpoint-round64.json"
DEFAULT_OUTPUT = HERE / "row_origin_audit.json"
SCHEMA = "p97-atail-second-center-metric-cegar-row-origin-audit-v1"


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _profile(record: Mapping[str, object]) -> tuple[int, int, int]:
    return tuple(int(value) for value in record["profile"])


def _row_name_kind(name: str) -> str:
    return name.split(":", maxsplit=1)[0]


def audit_case(
    problem: cegar.Problem, saved_case: Mapping[str, object]
) -> dict[str, Any]:
    bootstrap = cegar.cut_from_rows(cegar.bootstrap_rows(problem.profile))
    cuts: list[cegar.Cut] = [bootstrap]
    rounds: list[dict[str, Any]] = []
    all_kind_counts: Counter[str] = Counter()
    all_name_counts: Counter[str] = Counter()
    source_only_cut_count = 0
    cut_with_source_alias_for_every_row_count = 0
    cut_with_eligible_system_source_for_every_row_count = 0
    cut_with_source_or_eligible_system_for_every_row_count = 0

    for saved_round in saved_case["rounds"]:
        result = cegar.solve_incidence(problem, cuts)
        if result["status"] != "SAT":
            raise AssertionError(
                f"round {saved_round['round']} replayed {result['status']}, not SAT"
            )
        rows = cegar.assignment_rows(result)
        cegar.validate_assignment(problem, rows, cuts)
        assignment = cegar.assignment_document(rows)
        if cegar.canonical_sha256(assignment) != saved_round["assignment_sha256"]:
            raise AssertionError(
                f"round {saved_round['round']} assignment hash drift"
            )

        names_by_key: dict[cegar.MetricKey, list[str]] = defaultdict(list)
        for row in rows:
            names_by_key[cegar.metric_key(row)].append(row.name)
        eligible_sources_by_center: dict[int, list[int]] = defaultdict(list)
        for source in range(problem.frame.n):
            for center in cegar.metric_oracle.source_query._eligible_blockers(
                problem.frame, rows, source
            ):
                eligible_sources_by_center[center].append(source)

        accepted_rows = tuple(
            cegar.decode_metric_row(encoded)
            for encoded in saved_round["accepted_cut"]["rows"]
        )
        accepted_cut = cegar.cut_from_rows(accepted_rows)
        if cegar.canonical_sha256(cegar.encode_metric_rows(accepted_rows)) != (
            saved_round["accepted_cut"]["row_set_sha256"]
        ):
            raise AssertionError(
                f"round {saved_round['round']} accepted-cut hash drift"
            )

        row_origins: list[dict[str, Any]] = []
        source_alias_for_every_row = True
        eligible_system_source_for_every_row = True
        source_or_eligible_system_for_every_row = True
        only_source_names = True
        for key in sorted(accepted_cut):
            names = sorted(names_by_key[key])
            if not names:
                raise AssertionError(
                    f"round {saved_round['round']} cut row has no named origin: {key}"
                )
            kinds = sorted({_row_name_kind(name) for name in names})
            has_source_alias = "supplied" in kinds
            eligible_system_sources = sorted(set(eligible_sources_by_center[key[0]]))
            has_eligible_system_source = bool(eligible_system_sources)
            source_alias_for_every_row &= has_source_alias
            eligible_system_source_for_every_row &= has_eligible_system_source
            source_or_eligible_system_for_every_row &= (
                has_source_alias or has_eligible_system_source
            )
            only_source_names &= kinds == ["supplied"]
            all_kind_counts.update(kinds)
            all_name_counts.update(names)
            row_origins.append(
                {
                    "center": key[0],
                    "support": list(key[1]),
                    "names": names,
                    "kinds": kinds,
                    "has_source_alias": has_source_alias,
                    "eligible_system_sources": eligible_system_sources,
                    "has_eligible_system_source": has_eligible_system_source,
                }
            )

        if source_alias_for_every_row:
            cut_with_source_alias_for_every_row_count += 1
        if eligible_system_source_for_every_row:
            cut_with_eligible_system_source_for_every_row_count += 1
        if source_or_eligible_system_for_every_row:
            cut_with_source_or_eligible_system_for_every_row_count += 1
        if only_source_names:
            source_only_cut_count += 1

        rounds.append(
            {
                "round": int(saved_round["round"]),
                "row_count": len(accepted_cut),
                "source_alias_for_every_row": source_alias_for_every_row,
                "eligible_system_source_for_every_row": (
                    eligible_system_source_for_every_row
                ),
                "source_or_eligible_system_for_every_row": (
                    source_or_eligible_system_for_every_row
                ),
                "only_source_names": only_source_names,
                "row_origins": row_origins,
            }
        )
        cuts.append(accepted_cut)

    return {
        "profile": list(problem.profile),
        "round_count": len(rounds),
        "cut_with_source_alias_for_every_row_count": (
            cut_with_source_alias_for_every_row_count
        ),
        "cut_with_eligible_system_source_for_every_row_count": (
            cut_with_eligible_system_source_for_every_row_count
        ),
        "cut_with_source_or_eligible_system_for_every_row_count": (
            cut_with_source_or_eligible_system_for_every_row_count
        ),
        "source_only_cut_count": source_only_cut_count,
        "accepted_row_kind_occurrences": dict(sorted(all_kind_counts.items())),
        "accepted_named_row_occurrences": dict(sorted(all_name_counts.items())),
        "five_row_rounds": [
            record for record in rounds if record["row_count"] == 5
        ],
        "rounds": rounds,
    }


def build_audit(checkpoint_path: Path) -> dict[str, Any]:
    checkpoint = json.loads(checkpoint_path.read_text(encoding="utf-8"))
    saved_by_profile = {_profile(case): case for case in checkpoint["cases"]}
    problems = [
        cegar.build_problem(seed)
        for seed in cegar.metric_oracle.source_query.CASE_SEEDS
    ]
    cases = [audit_case(problem, saved_by_profile[problem.profile]) for problem in problems]
    return {
        "schema": SCHEMA,
        "checkpoint": str(checkpoint_path.relative_to(cegar.ROOT)),
        "checkpoint_sha256": file_sha256(checkpoint_path),
        "scope": {
            "cas_replayed": False,
            "incidence_assignments_replayed": True,
            "eligible_system_sources_are_finite_shadow_only": True,
            "common_critical_shell_system_constructed": False,
            "producer_proved": False,
            "target_faithful": False,
            "purpose": (
                "separate live source-row provenance from the stronger finite "
                "global-row-at-every-center inventory"
            ),
        },
        "cases": cases,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--checkpoint", type=Path, default=DEFAULT_CHECKPOINT)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    audit = build_audit(args.checkpoint.resolve())
    rendered = json.dumps(audit, indent=2, sort_keys=True) + "\n"
    if args.check:
        if not args.output.exists():
            raise AssertionError(f"missing saved audit: {args.output}")
        if args.output.read_text(encoding="utf-8") != rendered:
            raise AssertionError("saved row-origin audit is stale")
    else:
        args.output.write_text(rendered, encoding="utf-8")

    summary = {
        "checkpoint_sha256": audit["checkpoint_sha256"],
        "cases": [
            {
                "profile": case["profile"],
                "round_count": case["round_count"],
                "source_alias_for_every_row": (
                    case["cut_with_source_alias_for_every_row_count"]
                ),
                "eligible_system_source_for_every_row": (
                    case[
                        "cut_with_eligible_system_source_for_every_row_count"
                    ]
                ),
                "source_or_eligible_system_for_every_row": (
                    case[
                        "cut_with_source_or_eligible_system_for_every_row_count"
                    ]
                ),
                "source_only": case["source_only_cut_count"],
                "five_row_rounds": [
                    record["round"] for record in case["five_row_rounds"]
                ],
            }
            for case in audit["cases"]
        ],
    }
    print(json.dumps(summary, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
