#!/usr/bin/env python3
"""Source-role/deletion refinement of the exact-12 pentagon CEGAR lane.

The remaining Lean leaf supplies one source in ``{u,xv,xu}``, outside the
first-apex blocker fibre, together with survival after deleting ``q`` or
``w``.  This driver keeps those six alternatives separate.  It replays all
v2--v4 row certificates, then continues the v4 metric/order detector under
one fixed source/deletion branch.

This is theorem mining only.  The frozen-label adapter and any terminal
certificate still need a checked Lean ingress before promotion.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from pathlib import Path

import source_constraint_cegar_v4 as base
import source_sensitive_cegar as source
import structural_cegar as structural
from probe import (
    CARDINALITY,
    DELETION_ROLE_LABELS,
    FIRST_APEX,
    SOURCE_ROLE_LABELS,
    THEOREM_OPP1_FROZEN_INDEX,
    build_case,
)


HERE = Path(__file__).resolve().parent
SCHEMA = "p97_pentagon_offclass_exact12_source_role_deletion_cegar.v5"
SCOPE = (
    "one encoded exact-12 source-role/deletion branch with finite incidence "
    "and metric/order consequences only; not a kernel proof and not "
    "universal-cardinality closure"
)
CROSS_DELETION_THEOREM = (
    "Problem97.cross_deletion_survives_iff_not_mem_selected_support"
)
TARGET_THEOREM = (
    "Problem97.ATailFrontierLiveClosure."
    "false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_"
    "pentagonOffClassBlocker_exactTwelve_interiorDeletion_physicalRadius"
)
BASE_ADD_SOURCE_CONSTRAINTS = base.add_source_constraints
BASE_VALIDATE_SOURCE_MODEL = base.validate_source_model


def _sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def add_branch_constraints(
    instance,
    blocker_variables,
    *,
    source_role: str,
    deletion_role: str,
):
    """Encode one branch of the live source/deletion disjunction."""

    ingress = BASE_ADD_SOURCE_CONSTRAINTS(instance, blocker_variables)
    before = len(instance.cnf.clauses)
    source_label = SOURCE_ROLE_LABELS[source_role]
    deletion_label = DELETION_ROLE_LABELS[deletion_role]
    physical = set(instance.metadata.get("physical_class", ()))
    if not physical:
        # ``CoverInstance`` does not own probe metadata, so recover the frozen
        # physical class from the source labels and the case-specific model
        # through the already-installed blocker trace constraints.
        physical = set(SOURCE_ROLE_LABELS.values())
    if source_label not in physical:
        raise RuntimeError("selected source role is not in the physical class")
    if tuple(instance.model.interiors[THEOREM_OPP1_FROZEN_INDEX]) != tuple(
        DELETION_ROLE_LABELS.values()
    ):
        raise RuntimeError("q/w labels do not equal the frozen first-cap interior")

    first_apex_blocker = blocker_variables.get((source_label, FIRST_APEX))
    if first_apex_blocker is None:
        raise RuntimeError("selected source lacks a first-apex blocker variable")
    instance.cnf.add_clause((-first_apex_blocker,))

    omission_clauses = 0
    for center in range(CARDINALITY):
        blocker = blocker_variables.get((source_label, center))
        if blocker is None:
            continue
        for index, candidate in enumerate(instance.candidates[center]):
            if deletion_label in candidate:
                instance.cnf.add_clause(
                    (-blocker, -instance.choice_variables[(center, index)])
                )
                omission_clauses += 1

    branch = {
        "schema": f"{SCHEMA}.branch_ingress.v1",
        "semantic_class": "Class C: source-proved branch constraints added",
        "target_theorem": TARGET_THEOREM,
        "source_role": source_role,
        "source_label": source_label,
        "source_radius": "physical",
        "deletion_role": deletion_role,
        "deletion_label": deletion_label,
        "first_apex_label": FIRST_APEX,
        "outside_first_apex_fiber_clause": [-first_apex_blocker],
        "surviving_deletion_clauses": omission_clauses,
        "added_clauses": len(instance.cnf.clauses) - before,
        "lean_theorems": [TARGET_THEOREM, CROSS_DELETION_THEOREM],
        "frozen_adapter": (
            "theorem opp1 is frozen cap index 2 with interior {q,w}={10,11}; "
            "source role is one of physical labels {u,xv,xu}; outside-fibre "
            "means its actual blocker is not the frozen first apex"
        ),
        "kernel_status": "Python source-to-CNF adapter not kernel checked",
    }
    ingress = dict(ingress)
    ingress["branch"] = branch
    ingress["schema"] = f"{SCHEMA}.combined_ingress.v1"
    return ingress


def validate_branch_model(
    instance,
    blockers,
    cube,
    *,
    source_role: str,
    deletion_role: str,
):
    replay = BASE_VALIDATE_SOURCE_MODEL(instance, blockers, cube)
    source_label = SOURCE_ROLE_LABELS[source_role]
    deletion_label = DELETION_ROLE_LABELS[deletion_role]
    actual_blocker = blockers[source_label]
    if actual_blocker == FIRST_APEX:
        raise RuntimeError("selected source remained in the first-apex fibre")
    if deletion_label in cube[actual_blocker]:
        raise RuntimeError("surviving-deletion omission failed model replay")
    replay.update(
        {
            "selected_source_role": source_role,
            "selected_source_label": source_label,
            "selected_source_radius": "physical",
            "selected_source_actual_blocker": actual_blocker,
            "selected_deletion_role": deletion_role,
            "selected_deletion_label": deletion_label,
            "selected_blocker_row": list(cube[actual_blocker]),
            "outside_first_apex_fiber": True,
            "deleted_point_absent_from_selected_blocker_row": True,
        }
    )
    return replay


def replay_all_inherited(instance, d: int, v: int):
    v2_path = HERE / f"cegar-d{d}-v{v}" / "journal.jsonl"
    v2_records, v2_keys = structural.replay_journal(instance, v2_path)
    v3_path = HERE / f"cegar-d{d}-v{v}-source-v3" / "journal.jsonl"
    v3_records, v3_keys = source.replay_new_journal(instance, v3_path, v2_keys)
    v4_path = HERE / f"cegar-d{d}-v{v}-source-constraints-v4" / "journal.jsonl"
    v4_records, v4_keys = source.replay_new_journal(
        instance, v4_path, v2_keys | v3_keys
    )
    return (
        v2_records,
        v2_keys,
        v3_records + v4_records,
        v3_keys | v4_keys,
        v2_path,
        v4_path,
    )


def contract_self_test() -> int:
    results = []
    for source_role in SOURCE_ROLE_LABELS:
        for deletion_role in DELETION_ROLE_LABELS:
            _model, instance, blockers, metadata = build_case(0, 2)
            instance.metadata = metadata
            ingress = add_branch_constraints(
                instance,
                blockers,
                source_role=source_role,
                deletion_role=deletion_role,
            )
            branch = ingress["branch"]
            expected_unit = tuple(branch["outside_first_apex_fiber_clause"])
            if expected_unit not in instance.cnf.clauses:
                raise RuntimeError("outside-fibre unit clause missing")
            if branch["surviving_deletion_clauses"] <= 0:
                raise RuntimeError("surviving-deletion clauses were not generated")
            results.append(
                {
                    "source_role": source_role,
                    "deletion_role": deletion_role,
                    "added_clauses": branch["added_clauses"],
                    "status": "PASS",
                }
            )
    print(json.dumps({"schema": f"{SCHEMA}.self_test.v1", "cases": results}))
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument("--d", type=int, default=0)
    parser.add_argument("--v", type=int, default=2)
    parser.add_argument("--source-role", choices=tuple(SOURCE_ROLE_LABELS), default="u")
    parser.add_argument(
        "--deletion", choices=tuple(DELETION_ROLE_LABELS), default="q"
    )
    parser.add_argument("--contract-self-test", action="store_true")
    branch_args, remaining = parser.parse_known_args()
    if branch_args.contract_self_test:
        return contract_self_test()

    default_out = HERE / (
        f"cegar-d{branch_args.d}-v{branch_args.v}-source-role-deletion-v5-"
        f"{branch_args.source_role}-{branch_args.deletion}"
    )
    if "--out" not in remaining:
        remaining.extend(("--out", str(default_out)))
    # The branch parser consumes the placement arguments so it can construct a
    # collision-free default output path.  Pass them back to the v4 driver.
    remaining.extend(("--d", str(branch_args.d), "--v", str(branch_args.v)))
    sys.argv = [sys.argv[0], *remaining]

    original_write_manifest = base.write_manifest

    def patched_add(instance, blocker_variables):
        return add_branch_constraints(
            instance,
            blocker_variables,
            source_role=branch_args.source_role,
            deletion_role=branch_args.deletion,
        )

    def patched_validate(instance, blockers, cube):
        return validate_branch_model(
            instance,
            blockers,
            cube,
            source_role=branch_args.source_role,
            deletion_role=branch_args.deletion,
        )

    def patched_manifest(out, args, instance, ingress, inherited_paths, status):
        original_write_manifest(out, args, instance, ingress, inherited_paths, status)
        path = out / "manifest.json"
        manifest = json.loads(path.read_text(encoding="utf-8"))
        manifest["branch"] = ingress["branch"]
        manifest["inherited_journals"] = [
            {"path": str(journal), "sha256": _sha256(journal)}
            for journal in (
                HERE / f"cegar-d{args.d}-v{args.v}" / "journal.jsonl",
                HERE / f"cegar-d{args.d}-v{args.v}-source-v3" / "journal.jsonl",
                HERE
                / f"cegar-d{args.d}-v{args.v}-source-constraints-v4"
                / "journal.jsonl",
            )
        ]
        manifest["publication"] = {
            "bankable": False,
            "reason": (
                "scratch branch theorem-mining run; frozen-label and "
                "source-to-CNF Lean ingress absent"
            ),
        }
        path.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")

    original_build_case = base.build_case

    def patched_build_case(d: int, v: int):
        model, instance, blockers, metadata = original_build_case(d, v)
        instance.metadata = metadata
        return model, instance, blockers, metadata

    base.SCHEMA = SCHEMA
    base.SCOPE = SCOPE
    base.add_source_constraints = patched_add
    base.validate_source_model = patched_validate
    base.replay_inherited_journals = replay_all_inherited
    base.write_manifest = patched_manifest
    base.build_case = patched_build_case
    return base.main()


if __name__ == "__main__":
    raise SystemExit(main())
