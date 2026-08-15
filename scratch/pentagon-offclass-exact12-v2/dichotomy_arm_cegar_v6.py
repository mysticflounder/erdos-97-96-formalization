#!/usr/bin/env python3
"""Arm-specific exact-12 CEGAR after the checked xu next-row dichotomy.

This theorem-mining driver refines one v5 source/deletion branch by fixing one
arm of ``pentagonOffClassBlocker_xu_commonDeletionFans_or_nextRow_onlyHit``.
It replays the v2--v5 row journals before continuing the existing exact metric
and ordered-cover detector.  The result is not a Lean proof or a promotable
certificate: the frozen finite source-to-CNF adapter remains unformalized.
"""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

import source_constraint_cegar_v4 as base
import source_role_deletion_cegar_v5 as branch
import source_sensitive_cegar as source
import structural_cegar as structural
from probe import CARDINALITY, C, SOURCE_ROLE_LABELS, U, XV, XU


HERE = Path(__file__).resolve().parent
SCHEMA = "p97_pentagon_offclass_exact12_dichotomy_arm_cegar.v6"
SCOPE = (
    "one encoded exact-12 source-role/deletion/dichotomy arm with finite "
    "incidence and metric/order consequences only; not a kernel proof and "
    "not universal-cardinality closure"
)
TARGET_THEOREM = branch.TARGET_THEOREM
DICHOTOMY_THEOREM = (
    "Problem97.ATailFrontierLiveClosure."
    "pentagonOffClassBlocker_xu_commonDeletionFans_or_nextRow_onlyHit"
)
ARMS = ("common_deletion", "next_row_only_hit")


def add_dichotomy_arm_constraints(
    instance,
    blocker_variables,
    *,
    source_role: str,
    deletion_role: str,
    arm: str,
):
    """Fix whether xu misses or hits the selected row at blocker(c)."""

    ingress = branch.add_branch_constraints(
        instance,
        blocker_variables,
        source_role=source_role,
        deletion_role=deletion_role,
    )
    before = len(instance.cnf.clauses)
    arm_clauses = 0
    for center in range(CARDINALITY):
        blocker = blocker_variables.get((C, center))
        if blocker is None:
            continue
        if arm == "next_row_only_hit":
            hit_choices = tuple(
                instance.choice_variables[(center, index)]
                for index, candidate in enumerate(instance.candidates[center])
                if XU in candidate
            )
            instance.cnf.add_clause((-blocker, *hit_choices))
            arm_clauses += 1
        elif arm == "common_deletion":
            for index, candidate in enumerate(instance.candidates[center]):
                if XU in candidate:
                    instance.cnf.add_clause(
                        (-blocker, -instance.choice_variables[(center, index)])
                    )
                    arm_clauses += 1
        else:
            raise ValueError(f"unknown dichotomy arm: {arm}")

    hit_arm = arm == "next_row_only_hit"
    arm_ingress = {
        "schema": f"{SCHEMA}.arm_ingress.v1",
        "semantic_class": "Class C: checked exact-12 dichotomy arm",
        "target_theorem": TARGET_THEOREM,
        "dichotomy_theorem": DICHOTOMY_THEOREM,
        "arm": arm,
        "predicate": (
            "xu notin selectedAt(centerAt(c)).support"
            if arm == "common_deletion"
            else "xu in selectedAt(centerAt(c)).support"
        ),
        "arm_clauses": arm_clauses,
        "added_clauses": len(instance.cnf.clauses) - before,
        "producer_consequence": (
            "two common-deletion two-center packets"
            if arm == "common_deletion"
            else "the next row hits {u,xu,xv} exactly at xu"
        ),
        "producer_consequence_encoding": (
            "condition only: auxiliary q-deleted packet rows are not present "
            "in the selected-row cube"
            if arm == "common_deletion"
            else "complete: xu hit encoded here; u/xv omissions encoded by "
            "the inherited v4 strict-triple clauses"
        ),
        "producer_consequence_fully_encoded": hit_arm,
        "kernel_status": (
            "Lean dichotomy producer checked; Python source-to-CNF adapter "
            "not kernel checked"
        ),
    }
    combined = dict(ingress)
    combined["dichotomy_arm"] = arm_ingress
    combined["schema"] = f"{SCHEMA}.combined_ingress.v1"
    return combined


def validate_dichotomy_arm_model(
    instance,
    blockers,
    cube,
    *,
    source_role: str,
    deletion_role: str,
    arm: str,
):
    replay = branch.validate_branch_model(
        instance,
        blockers,
        cube,
        source_role=source_role,
        deletion_role=deletion_role,
    )
    next_center = blockers[C]
    next_row = set(cube[next_center])
    xu_hit = XU in next_row
    if arm == "common_deletion" and xu_hit:
        raise RuntimeError("common-deletion arm replay found xu in the next row")
    if arm == "next_row_only_hit":
        if not xu_hit:
            raise RuntimeError("next-row-only-hit replay omitted xu")
        if U in next_row or XV in next_row:
            raise RuntimeError("next-row-only-hit replay also hit u or xv")
    replay.update(
        {
            "dichotomy_arm": arm,
            "c_actual_blocker": next_center,
            "next_row": sorted(next_row),
            "xu_in_next_row": xu_hit,
            "next_row_strict_triple_hits": sorted(next_row & {U, XU, XV}),
        }
    )
    return replay


def inherited_journal_paths(
    d: int,
    v: int,
    source_role: str,
    deletion_role: str,
):
    return (
        HERE / f"cegar-d{d}-v{v}" / "journal.jsonl",
        HERE / f"cegar-d{d}-v{v}-source-v3" / "journal.jsonl",
        HERE / f"cegar-d{d}-v{v}-source-constraints-v4" / "journal.jsonl",
        HERE
        / (
            f"cegar-d{d}-v{v}-source-role-deletion-v5-"
            f"{source_role}-{deletion_role}"
        )
        / "journal.jsonl",
    )


def replay_all_inherited(
    instance,
    d: int,
    v: int,
    *,
    source_role: str,
    deletion_role: str,
):
    v2_path, v3_path, v4_path, v5_path = inherited_journal_paths(
        d, v, source_role, deletion_role
    )
    missing = [
        str(path)
        for path in (v2_path, v3_path, v4_path, v5_path)
        if not path.is_file()
    ]
    if missing:
        raise RuntimeError(f"missing inherited journal(s): {missing}")
    v2_records, v2_keys = structural.replay_journal(instance, v2_path)
    v3_records, v3_keys = source.replay_new_journal(instance, v3_path, v2_keys)
    v4_records, v4_keys = source.replay_new_journal(
        instance, v4_path, v2_keys | v3_keys
    )
    v5_records, v5_keys = source.replay_new_journal(
        instance, v5_path, v2_keys | v3_keys | v4_keys
    )
    later_records = v3_records + v4_records + v5_records
    later_keys = v3_keys | v4_keys | v5_keys
    return (
        v2_records,
        v2_keys,
        later_records,
        later_keys,
        v2_path,
        v5_path,
    )


def contract_self_test() -> int:
    cases = []
    for source_role in SOURCE_ROLE_LABELS:
        for deletion_role in branch.DELETION_ROLE_LABELS:
            for arm in ARMS:
                _model, instance, blockers, metadata = base.build_case(0, 2)
                instance.metadata = metadata
                ingress = add_dichotomy_arm_constraints(
                    instance,
                    blockers,
                    source_role=source_role,
                    deletion_role=deletion_role,
                    arm=arm,
                )
                arm_ingress = ingress["dichotomy_arm"]
                if arm_ingress["arm_clauses"] <= 0:
                    raise RuntimeError("dichotomy arm generated no clauses")
                cases.append(
                    {
                        "source_role": source_role,
                        "deletion_role": deletion_role,
                        "arm": arm,
                        "added_clauses": arm_ingress["added_clauses"],
                        "status": "PASS",
                    }
                )
    print(json.dumps({"schema": f"{SCHEMA}.self_test.v1", "cases": cases}))
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument("--d", type=int, default=0)
    parser.add_argument("--v", type=int, default=2)
    parser.add_argument("--source-role", choices=tuple(SOURCE_ROLE_LABELS), default="u")
    parser.add_argument(
        "--deletion", choices=tuple(branch.DELETION_ROLE_LABELS), default="q"
    )
    parser.add_argument("--arm", choices=ARMS, required=False, default="common_deletion")
    parser.add_argument("--contract-self-test", action="store_true")
    args, remaining = parser.parse_known_args()
    if args.contract_self_test:
        return contract_self_test()

    default_out = HERE / (
        f"cegar-d{args.d}-v{args.v}-source-role-deletion-dichotomy-v6-"
        f"{args.source_role}-{args.deletion}-{args.arm}"
    )
    run_out = default_out
    if "--out" not in remaining:
        remaining.extend(("--out", str(default_out)))
    else:
        out_index = remaining.index("--out")
        run_out = Path(remaining[out_index + 1])
    remaining.extend(("--d", str(args.d), "--v", str(args.v)))
    sys.argv = [sys.argv[0], *remaining]

    original_write_manifest = base.write_manifest
    original_build_case = base.build_case

    def patched_add(instance, blocker_variables):
        return add_dichotomy_arm_constraints(
            instance,
            blocker_variables,
            source_role=args.source_role,
            deletion_role=args.deletion,
            arm=args.arm,
        )

    def patched_validate(instance, blockers, cube):
        return validate_dichotomy_arm_model(
            instance,
            blockers,
            cube,
            source_role=args.source_role,
            deletion_role=args.deletion,
            arm=args.arm,
        )

    def patched_replay(instance, d: int, v: int):
        return replay_all_inherited(
            instance,
            d,
            v,
            source_role=args.source_role,
            deletion_role=args.deletion,
        )

    def patched_manifest(out, run_args, instance, ingress, _paths, status):
        paths = inherited_journal_paths(
            run_args.d, run_args.v, args.source_role, args.deletion
        )
        original_write_manifest(out, run_args, instance, ingress, paths, status)
        path = out / "manifest.json"
        manifest = json.loads(path.read_text(encoding="utf-8"))
        manifest["schema"] = f"{SCHEMA}.manifest.v1"
        manifest["source_deletion_branch"] = ingress["branch"]
        manifest["dichotomy_arm"] = ingress["dichotomy_arm"]
        manifest["implementation"] = {
            "path": str(Path(__file__).resolve()),
            "sha256": branch._sha256(Path(__file__).resolve()),
        }
        manifest["publication"] = {
            "bankable": False,
            "reason": (
                "scratch exact-12 theorem-mining run; frozen-label and "
                "source-to-CNF Lean ingress absent"
            ),
        }
        path.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")

    def patched_build_case(d: int, v: int):
        model, instance, blockers, metadata = original_build_case(d, v)
        instance.metadata = metadata
        return model, instance, blockers, metadata

    base.SCHEMA = SCHEMA
    base.SCOPE = SCOPE
    base.add_source_constraints = patched_add
    base.validate_source_model = patched_validate
    base.replay_inherited_journals = patched_replay
    base.write_manifest = patched_manifest
    base.build_case = patched_build_case
    exit_code = base.main()
    summary_path = run_out.resolve() / "summary.json"
    if summary_path.is_file():
        summary = json.loads(summary_path.read_text(encoding="utf-8"))
        if "v4_records_total" in summary:
            summary["v6_records_total"] = summary.pop("v4_records_total")
        summary_path.write_text(
            json.dumps(summary, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
    return exit_code


if __name__ == "__main__":
    raise SystemExit(main())
