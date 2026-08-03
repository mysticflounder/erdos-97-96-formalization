"""Audit replay-authenticated projected cores in a v19/v30 journal tree.

This is a read-only diagnostic.  It validates every assignment journal through
``round5_cegar_v19.AssignmentJournal.recover`` before counting its completed
UNSAT blockers.  The resulting census is evidence about reusable Boolean
clauses; it is not a closure certificate.
"""

from __future__ import annotations

import argparse
import json
from collections import Counter, defaultdict
from pathlib import Path
from typing import Any

import round5_cegar_v19 as v19


def variable_family(name: str) -> str:
    for prefix in ("critical_row_", "rich_", "block_", "k4_"):
        if name.startswith(prefix):
            return prefix.removesuffix("_")
    return name.split("_", 1)[0]


def core_signature(core: list[dict[str, Any]]) -> str:
    families = Counter(variable_family(str(item["bool"])) for item in core)
    signs = Counter(bool(item["value"]) for item in core)
    family_part = "+".join(
        f"{family}:{count}" for family, count in sorted(families.items())
    )
    return f"{family_part}|true:{signs[True]}|false:{signs[False]}"


def validate_blocker(blocker: dict[str, Any]) -> tuple[str, list[dict[str, Any]]]:
    core = blocker.get("projected_core")
    if not isinstance(core, list) or not core:
        raise RuntimeError("UNSAT blocker has no nonempty projected core")
    core_hash = v19.canonical_sha256(core)
    if blocker.get("projected_core_sha256") != core_hash:
        raise RuntimeError("projected-core hash mismatch")
    sexpr = blocker.get("blocker")
    if not isinstance(sexpr, str):
        raise TypeError("UNSAT blocker has no Boolean clause")
    import hashlib

    if blocker.get("blocker_sha256") != hashlib.sha256(sexpr.encode()).hexdigest():
        raise RuntimeError("blocker S-expression hash mismatch")
    return core_hash, core


def census(run_dir: Path, top: int) -> dict[str, Any]:
    journals = sorted(run_dir.glob("*/assignment-journal-v19"))
    if not journals:
        raise RuntimeError(f"no assignment-journal-v19 directories under {run_dir}")

    size_counts: Counter[int] = Counter()
    signature_counts: Counter[str] = Counter()
    exact_core_counts: Counter[str] = Counter()
    exact_core_cases: dict[str, set[str]] = defaultdict(set)
    core_meta_by_hash: dict[str, tuple[int, str]] = {}
    short_cores: list[dict[str, Any]] = []
    case_rows: list[dict[str, Any]] = []
    total_unsat = 0
    total_non_unsat = 0

    for journal_path in journals:
        state = v19.AssignmentJournal(journal_path).recover()
        completed = state["completed"]
        if not isinstance(completed, list):
            raise TypeError("journal recovery returned a non-list completed field")
        case_id = journal_path.parent.name
        case_unsat = 0
        case_small = 0
        for payload in completed:
            if not isinstance(payload, dict):
                raise TypeError("journal outcome is not an object")
            if payload.get("status") != "unsat":
                total_non_unsat += 1
                continue
            blocker = payload.get("blocker")
            if not isinstance(blocker, dict):
                raise TypeError("UNSAT journal outcome has no blocker record")
            core_hash, core = validate_blocker(blocker)
            total_unsat += 1
            case_unsat += 1
            size_counts[len(core)] += 1
            signature_counts[core_signature(core)] += 1
            exact_core_counts[core_hash] += 1
            exact_core_cases[core_hash].add(case_id)
            core_meta_by_hash.setdefault(core_hash, (len(core), core_signature(core)))
            if len(core) < 100:
                case_small += 1
                short_cores.append(
                    {
                        "case_id": case_id,
                        "iteration": payload.get("iteration"),
                        "assignment_sha256": payload.get("assignment_sha256"),
                        "projected_core_sha256": core_hash,
                        "size": len(core),
                        "signature": core_signature(core),
                        "core": core,
                    }
                )
        case_rows.append(
            {
                "case_id": case_id,
                "record_count": state["record_count"],
                "journal_head_sha256": state["head_sha256"],
                "inflight_proposal_count": len(state["pending"]),
                "completed_count": len(completed),
                "unsat_count": case_unsat,
                "projected_core_lt_100_count": case_small,
            }
        )

    repeated = [
        {
            "projected_core_sha256": core_hash,
            "occurrences": count,
            "case_count": len(exact_core_cases[core_hash]),
            "cases": sorted(exact_core_cases[core_hash]),
            "size": core_meta_by_hash[core_hash][0],
            "signature": core_meta_by_hash[core_hash][1],
        }
        for core_hash, count in exact_core_counts.most_common()
        if count > 1
    ][:top]
    return {
        "kind": "v30_projected_core_census",
        "claim_scope": "validated journal census; not a case or P97 closure",
        "run_dir": str(run_dir.resolve()),
        "journal_count": len(journals),
        "completed_unsat_count": total_unsat,
        "completed_non_unsat_count": total_non_unsat,
        "unique_exact_core_count": len(exact_core_counts),
        "cross_case_exact_core_count": sum(
            len(cases) > 1 for cases in exact_core_cases.values()
        ),
        "size_distribution": {
            str(size): count for size, count in sorted(size_counts.items())
        },
        "family_signature_distribution": dict(signature_counts.most_common()),
        "most_frequent_exact_cores": repeated,
        "short_cores": short_cores,
        "cases": case_rows,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("run_dir", type=Path)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--top", type=int, default=20)
    args = parser.parse_args()
    if args.top <= 0:
        raise ValueError("--top must be positive")
    report = census(args.run_dir, args.top)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(args.output),
                "journals": report["journal_count"],
                "unsat": report["completed_unsat_count"],
                "unique": report["unique_exact_core_count"],
                "cross_case": report["cross_case_exact_core_count"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
