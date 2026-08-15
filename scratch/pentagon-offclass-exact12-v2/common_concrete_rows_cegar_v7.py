#!/usr/bin/env python3
"""Exact-12 common-arm CEGAR with the checked concrete three-row ingress.

This driver refines the common-deletion arm of v6 using the source theorem
``pentagonOffClassBlocker_xuCommonArm_threeConcreteExactRows``.  Under the
frozen exact-12 adapter, its rows are:

* ``Kxv``: the selected row at the fixed center ``C = centerAt(xv)``;
* ``Kc``: the selected row at ``blocker(C) = centerAt(C)``;
* ``BO``: the fixed physical five-class with ``xu`` erased.

The adapter adds the two explicit xu-omission conditions and the packet's
two nonphysical blocker-avoidance conditions.  It maps the three pairwise C2
conditions to the already-built base constraints.  A separate global C4
constraint counts BO's physical circle once; C4 is not claimed as output of
the concrete-row theorem.  The five remaining cross-incidences now have a
checked Lean consumer.  This remains theorem-mining code: the frozen-label
source-to-CNF adapter is not yet kernel checked, and one exact-12 common arm
is not the full parent theorem.
"""

from __future__ import annotations

import argparse
import json
import sys
from itertools import combinations
from pathlib import Path

import dichotomy_arm_cegar_v6 as v6
from probe import CARDINALITY, C, PHYSICAL_APEX, SOURCE_ROLE_LABELS, U, XV, XU


HERE = Path(__file__).resolve().parent
SCHEMA = "p97_pentagon_offclass_exact12_common_concrete_rows_cegar.v7"
SCOPE = (
    "one encoded exact-12 common-deletion branch with concrete Kxv, Kc, "
    "and physical-minus-xu rows; not a kernel proof and not "
    "universal-cardinality closure"
)
TARGET_THEOREM = v6.TARGET_THEOREM
DICHOTOMY_THEOREM = v6.DICHOTOMY_THEOREM
CONCRETE_ROWS_THEOREM = (
    "Problem97.ATailFrontierLiveClosure."
    "pentagonOffClassBlocker_xuCommonArm_threeConcreteExactRows"
)
BLOCKER_AVOIDANCE_THEOREM = (
    "Problem97.ATailFrontierLiveClosure."
    "pentagonOffClassBlocker_xuCommonArm_blockerAvoidsConcreteCenters"
)
TETRAHEDRON_CONSUMER_THEOREM = (
    "Problem97.ATailFrontierLiveClosure."
    "pentagonOffClassBlocker_xuCommonArm_false_of_tetrahedron_incidences"
)
TETRAHEDRON_KERNEL_THEOREM = (
    "Problem97.U5QDeletedK4Class."
    "three_exact_classes_tetrahedron_incompatibility"
)


def _physical_and_bo(instance) -> tuple[frozenset[int], frozenset[int]]:
    physical = frozenset(instance.metadata.get("physical_class", ()))
    if len(physical) != 5 or XU not in physical:
        raise RuntimeError("missing exact physical five-class metadata")
    bo = physical - {XU}
    if len(bo) != 4:
        raise RuntimeError("physical-minus-xu row is not exact four")
    return physical, bo


def add_common_concrete_row_constraints(
    instance,
    blocker_variables,
    *,
    source_role: str,
    deletion_role: str,
):
    """Encode the complete concrete-row output of the checked Lean producer."""

    ingress = v6.branch.add_branch_constraints(
        instance,
        blocker_variables,
        source_role=source_role,
        deletion_role=deletion_role,
    )
    _physical, bo = _physical_and_bo(instance)
    before = len(instance.cnf.clauses)

    # Kxv is the selected row at C because the base adapter fixes b(xv)=C.
    # Add only the two row-identity omissions here.  C2 and C4 are already in
    # the composed v2 base; duplicating their tens of thousands of clauses
    # would slow the search without changing its models.
    kxv_xu_omission_clauses = 0
    for index, candidate in enumerate(instance.candidates[C]):
        variable = instance.choice_variables[(C, index)]
        candidate_set = set(candidate)
        if XU in candidate_set:
            instance.cnf.add_clause((-variable,))
            kxv_xu_omission_clauses += 1

    # Kc is the selected row at the as-yet anonymous actual blocker of C.
    kc_xu_omission_clauses = 0
    for next_center in range(CARDINALITY):
        blocker = blocker_variables.get((C, next_center))
        if blocker is None:
            continue
        for next_index, next_candidate in enumerate(
            instance.candidates[next_center]
        ):
            next_variable = instance.choice_variables[(next_center, next_index)]
            next_set = set(next_candidate)
            if XU in next_set:
                instance.cnf.add_clause((-blocker, -next_variable))
                kc_xu_omission_clauses += 1

    # Each CommonDeletionTwoCenterPacket says that the actual blocker of xu
    # avoids its two centers.  The physical apex is absent from every blocker
    # domain already; encode the two remaining nonphysical exclusions.
    xu_blocker_not_c = blocker_variables.get((XU, C))
    if xu_blocker_not_c is None:
        raise RuntimeError("missing blocker(xu,C) variable")
    instance.cnf.add_clause((-xu_blocker_not_c,))
    xu_blocker_not_next_clauses = 0
    for next_center in range(CARDINALITY):
        c_blocker = blocker_variables.get((C, next_center))
        xu_blocker = blocker_variables.get((XU, next_center))
        if c_blocker is None:
            continue
        if xu_blocker is None:
            # next_center=xu is already excluded by the blocker-domain
            # center-at-source inequality; the physical apex is unavailable
            # for blocker(C) as well.
            continue
        instance.cnf.add_clause((-c_blocker, -xu_blocker))
        xu_blocker_not_next_clauses += 1

    # The checked consumer rules out exactly this five-incidence conjunction:
    # d in BO; O,u in Kc; and O,d in Kxv.  The other three tetrahedron
    # incidences (u in BO, c in Kc, u in Kxv) are derived by the Lean
    # consumer from the surrounding source contract.
    tetrahedron_consumer_clauses = 0
    tetrahedron_consumer_clauses_by_d: dict[int, int] = {}
    for next_center in range(CARDINALITY):
        c_blocker = blocker_variables.get((C, next_center))
        if c_blocker is None or next_center not in bo:
            continue
        kxv_choices = [
            instance.choice_variables[(C, index)]
            for index, candidate in enumerate(instance.candidates[C])
            if PHYSICAL_APEX in candidate and next_center in candidate
        ]
        kc_choices = [
            instance.choice_variables[(next_center, index)]
            for index, candidate in enumerate(instance.candidates[next_center])
            if PHYSICAL_APEX in candidate and U in candidate
        ]
        clause_count = 0
        for kxv_choice in kxv_choices:
            for kc_choice in kc_choices:
                instance.cnf.add_clause((-c_blocker, -kxv_choice, -kc_choice))
                clause_count += 1
        tetrahedron_consumer_clauses_by_d[next_center] = clause_count
        tetrahedron_consumer_clauses += clause_count

    # Audit the finite combinations governed by the already-built base C2/C4
    # constraints.  These counts make accidental row-identity drift visible
    # without adding duplicate clauses.
    inherited_audit = {
        "Kxv_BO_C2_forbidden_choices": sum(
            len(set(candidate) & bo) > 2 for candidate in instance.candidates[C]
        ),
        "Kc_BO_C2_forbidden_conditional_choices": 0,
        "Kxv_Kc_C2_forbidden_conditional_pairs": 0,
        "three_row_C4_forbidden_conditional_pairs": 0,
    }
    bo_pairs = tuple(map(set, combinations(sorted(bo), 2)))
    for next_center in range(CARDINALITY):
        if blocker_variables.get((C, next_center)) is None:
            continue
        for next_candidate in instance.candidates[next_center]:
            next_set = set(next_candidate)
            inherited_audit["Kc_BO_C2_forbidden_conditional_choices"] += (
                len(next_set & bo) > 2
            )
            for kxv_candidate in instance.candidates[C]:
                kxv_set = set(kxv_candidate)
                inherited_audit["Kxv_Kc_C2_forbidden_conditional_pairs"] += (
                    len(kxv_set & next_set) > 2
                )
                inherited_audit[
                    "three_row_C4_forbidden_conditional_pairs"
                ] += any(pair <= kxv_set and pair <= next_set for pair in bo_pairs)

    concrete = {
        "schema": f"{SCHEMA}.concrete_row_ingress.v1",
        "semantic_class": "Class C: checked common-arm concrete rows",
        "target_theorem": TARGET_THEOREM,
        "dichotomy_theorem": DICHOTOMY_THEOREM,
        "concrete_rows_theorem": CONCRETE_ROWS_THEOREM,
        "blocker_avoidance_theorem": BLOCKER_AVOIDANCE_THEOREM,
        "tetrahedron_consumer_theorem": TETRAHEDRON_CONSUMER_THEOREM,
        "tetrahedron_kernel_theorem": TETRAHEDRON_KERNEL_THEOREM,
        "arm": "common_deletion",
        "row_adapter": {
            "Kxv": "selected cube row at fixed center C=centerAt(xv)",
            "Kc": "selected cube row at blocker(C)=centerAt(C)",
            "BO": sorted(bo),
            "BO_identity": "physical five-class circle with xu erased",
        },
        "added_clause_counts": {
            "Kxv_xu_omission": kxv_xu_omission_clauses,
            "Kc_xu_omission": kc_xu_omission_clauses,
            "blocker_xu_not_C": 1,
            "blocker_xu_not_blocker_C": xu_blocker_not_next_clauses,
            "tetrahedron_five_incidence_consumer": (
                tetrahedron_consumer_clauses
            ),
        },
        "tetrahedron_consumer_clause_schema": {
            "clause": "-blocker(C,d) OR -choice(C,Kxv) OR -choice(d,Kc)",
            "d_domain": sorted(bo),
            "clauses_by_d": tetrahedron_consumer_clauses_by_d,
            "positive_incidences": [
                "d in BO",
                "oppApex2 in Kc",
                "u in Kc",
                "oppApex2 in Kxv",
                "d in Kxv",
            ],
        },
        "inherited_constraint_audit": inherited_audit,
        "inherited_constraint_sources": {
            "Kxv_Kc_C2": "CoverInstance._build_c2",
            "Kxv_BO_C2": "probe.build_case physical-circle C2 units",
            "Kc_BO_C2": "probe.build_case physical-circle C2 units",
            "three_row_deduplicated_C4": (
                "separate global probe.build_case physical-circle pair "
                "constraints; not exported by the concrete-row theorem, and "
                "the physical circle is counted only once"
            ),
        },
        "added_clauses": len(instance.cnf.clauses) - before,
        "producer_consequence_encoded_under_frozen_adapter": True,
        "checked_consumer_encoded_under_frozen_adapter": True,
        "kernel_checked_source_to_cnf": False,
        "kernel_status": (
            "Lean row producer and tetrahedron consumer checked; frozen-label "
            "Python source-to-CNF adapter not kernel checked"
        ),
    }
    combined = dict(ingress)
    combined["common_concrete_rows"] = concrete
    combined["schema"] = f"{SCHEMA}.combined_ingress.v1"
    return combined


def _tetrahedron_incidence_status(*, kxv, kc, bo, next_center: int):
    """Replay the five positive hypotheses of the checked Lean consumer."""

    status = {
        "d_in_BO": next_center in bo,
        "O_in_Kc": PHYSICAL_APEX in kc,
        "u_in_Kc": U in kc,
        "O_in_Kxv": PHYSICAL_APEX in kxv,
        "d_in_Kxv": next_center in kxv,
    }
    status["all_five"] = all(status.values())
    return status


def _check_common_concrete_rows(
    *,
    kxv,
    kc,
    bo,
    next_center: int,
    xu_blocker: int,
):
    """Replay the composed concrete-row and global physical-circle contract."""

    kxv = set(kxv)
    kc = set(kc)
    bo = set(bo)
    if XU in kxv or XU in kc or XU in bo:
        raise RuntimeError("common concrete row retained xu")
    if len(kxv) != 4 or len(kc) != 4 or len(bo) != 4:
        raise RuntimeError("common concrete row is not exact four")
    if next_center in {C, PHYSICAL_APEX}:
        raise RuntimeError("concrete row centers are not distinct")
    if xu_blocker == C or xu_blocker == next_center:
        raise RuntimeError("xu blocker met a common-packet center")
    overlaps = {
        "Kxv_Kc": len(kxv & kc),
        "Kxv_BO": len(kxv & bo),
        "Kc_BO": len(kc & bo),
    }
    if any(value > 2 for value in overlaps.values()):
        raise RuntimeError("common concrete rows violated C2")
    shared_bo_pairs = [
        list(pair)
        for pair in combinations(sorted(bo), 2)
        if set(pair) <= kxv and set(pair) <= kc
    ]
    if shared_bo_pairs:
        # This is replay of the separately inherited global C4 rule.  It is
        # deliberately not attributed to the concrete-row Lean producer.
        raise RuntimeError("common concrete rows violated global physical C4")
    tetrahedron = _tetrahedron_incidence_status(
        kxv=kxv, kc=kc, bo=bo, next_center=next_center
    )
    if tetrahedron["all_five"]:
        raise RuntimeError("common rows matched checked tetrahedron consumer")
    return overlaps, shared_bo_pairs, tetrahedron


def validate_common_concrete_row_model(
    instance,
    blockers,
    cube,
    *,
    source_role: str,
    deletion_role: str,
):
    replay = v6.branch.validate_branch_model(
        instance,
        blockers,
        cube,
        source_role=source_role,
        deletion_role=deletion_role,
    )
    _physical, bo = _physical_and_bo(instance)
    next_center = blockers[C]
    xu_blocker = blockers[XU]
    kxv = set(cube[C])
    kc = set(cube[next_center])
    overlaps, shared_bo_pairs, tetrahedron = _check_common_concrete_rows(
        kxv=kxv,
        kc=kc,
        bo=bo,
        next_center=next_center,
        xu_blocker=xu_blocker,
    )
    replay.update(
        {
            "dichotomy_arm": "common_deletion",
            "c_actual_blocker": next_center,
            "xu_actual_blocker": xu_blocker,
            "xu_blocker_avoids_concrete_centers": True,
            "Kxv": sorted(kxv),
            "Kc": sorted(kc),
            "BO": sorted(bo),
            "pairwise_overlap_cards": overlaps,
            "shared_BO_pairs_in_Kxv_and_Kc": shared_bo_pairs,
            "tetrahedron_consumer_incidence_predicate": tetrahedron,
            "tetrahedron_consumer_theorem": TETRAHEDRON_CONSUMER_THEOREM,
            "concrete_row_contract_replayed": True,
        }
    )
    return replay


def contract_self_test() -> int:
    def expect_reject(name: str, message: str, **kwargs) -> None:
        try:
            _check_common_concrete_rows(**kwargs)
        except RuntimeError as error:
            if message not in str(error):
                raise RuntimeError(
                    f"{name}: expected {message!r}, got {str(error)!r}"
                ) from error
        else:
            raise RuntimeError(f"{name}: malformed contract was accepted")

    valid = {
        "kxv": {U, PHYSICAL_APEX, 3, 4},
        "kc": {U, PHYSICAL_APEX, C, 8},
        "bo": {U, 5, 0, 2},
        "next_center": 5,
        "xu_blocker": 4,
    }
    overlaps, shared, tetrahedron = _check_common_concrete_rows(**valid)
    if overlaps != {"Kxv_Kc": 2, "Kxv_BO": 1, "Kc_BO": 1} or shared:
        raise RuntimeError("valid overlap-two boundary case replay drifted")
    if tetrahedron["all_five"] or tetrahedron["d_in_Kxv"]:
        raise RuntimeError("valid negative consumer boundary drifted")
    expect_reject(
        "xu-free",
        "retained xu",
        **(valid | {"kxv": {U, PHYSICAL_APEX, 4, XU}}),
    )
    expect_reject(
        "exact-four",
        "not exact four",
        **(valid | {"kc": {U, PHYSICAL_APEX, C}}),
    )
    expect_reject(
        "blocker-avoids-C",
        "met a common-packet center",
        **(valid | {"xu_blocker": C}),
    )
    expect_reject(
        "blocker-avoids-next",
        "met a common-packet center",
        **(valid | {"xu_blocker": valid["next_center"]}),
    )
    expect_reject(
        "C2-overlap-three",
        "violated C2",
        **(valid | {"kc": {U, PHYSICAL_APEX, 3, 8}}),
    )
    expect_reject(
        "global-C4-not-producer",
        "global physical C4",
        **(
            valid
            | {
                "kxv": {U, valid["next_center"], 3, 4},
                "kc": {U, valid["next_center"], C, 8},
            }
        ),
    )
    expect_reject(
        "same-support-distinct-centers",
        "violated C2",
        **(valid | {"kc": valid["kxv"]}),
    )
    expect_reject(
        "checked-tetrahedron-consumer",
        "matched checked tetrahedron consumer",
        **(
            valid
            | {
                "kxv": {
                    U,
                    PHYSICAL_APEX,
                    valid["next_center"],
                    4,
                }
            }
        ),
    )

    all_five = {
        "kxv": {PHYSICAL_APEX, valid["next_center"]},
        "kc": {PHYSICAL_APEX, U},
        "bo": {valid["next_center"]},
        "next_center": valid["next_center"],
    }
    if not _tetrahedron_incidence_status(**all_five)["all_five"]:
        raise RuntimeError("all-five incidence mask did not activate")
    missing_cases = {
        "d_in_BO": all_five | {"bo": set()},
        "O_in_Kc": all_five | {"kc": {U}},
        "u_in_Kc": all_five | {"kc": {PHYSICAL_APEX}},
        "O_in_Kxv": all_five | {"kxv": {valid["next_center"]}},
        "d_in_Kxv": all_five | {"kxv": {PHYSICAL_APEX}},
    }
    for missing, kwargs in missing_cases.items():
        status = _tetrahedron_incidence_status(**kwargs)
        if status[missing] or status["all_five"]:
            raise RuntimeError(f"missing-incidence mask failed for {missing}")

    cases = []
    for source_role in SOURCE_ROLE_LABELS:
        for deletion_role in v6.branch.DELETION_ROLE_LABELS:
            _model, instance, blockers, metadata = v6.base.build_case(0, 2)
            instance.metadata = metadata
            ingress = add_common_concrete_row_constraints(
                instance,
                blockers,
                source_role=source_role,
                deletion_role=deletion_role,
            )
            concrete = ingress["common_concrete_rows"]
            counts = concrete["added_clause_counts"]
            inherited = concrete["inherited_constraint_audit"]
            if concrete["row_adapter"]["BO"] != sorted(
                set(metadata["physical_class"]) - {XU}
            ):
                raise RuntimeError("BO adapter drifted from physical-minus-xu")
            if any(value <= 0 for value in counts.values()):
                raise RuntimeError(f"empty concrete-row clause family: {counts}")
            if any(value <= 0 for value in inherited.values()):
                raise RuntimeError(
                    f"empty inherited concrete-row audit family: {inherited}"
                )
            if concrete["kernel_checked_source_to_cnf"]:
                raise RuntimeError("scratch adapter incorrectly claims kernel ingress")
            if concrete["tetrahedron_consumer_theorem"] != (
                TETRAHEDRON_CONSUMER_THEOREM
            ):
                raise RuntimeError("tetrahedron consumer provenance drifted")
            clause_schema = concrete["tetrahedron_consumer_clause_schema"]
            if clause_schema["d_domain"] != concrete["row_adapter"]["BO"]:
                raise RuntimeError("tetrahedron d-domain drifted from BO")
            if len(clause_schema["positive_incidences"]) != 5:
                raise RuntimeError("tetrahedron incidence schema drifted")
            concrete_tail = instance.cnf.clauses[-concrete["added_clauses"] :]
            actual_tetrahedron_clauses = [
                tuple(clause) for clause in concrete_tail if len(clause) == 3
            ]
            expected_tetrahedron_clauses = set()
            bo_test = set(concrete["row_adapter"]["BO"])
            for next_center in bo_test:
                blocker = blockers.get((C, next_center))
                if blocker is None:
                    continue
                for kxv_index, kxv_candidate in enumerate(instance.candidates[C]):
                    if not {PHYSICAL_APEX, next_center} <= set(kxv_candidate):
                        continue
                    kxv_choice = instance.choice_variables[(C, kxv_index)]
                    for kc_index, kc_candidate in enumerate(
                        instance.candidates[next_center]
                    ):
                        if not {PHYSICAL_APEX, U} <= set(kc_candidate):
                            continue
                        kc_choice = instance.choice_variables[
                            (next_center, kc_index)
                        ]
                        expected_tetrahedron_clauses.add(
                            (-blocker, -kxv_choice, -kc_choice)
                        )
            if len(actual_tetrahedron_clauses) != counts[
                "tetrahedron_five_incidence_consumer"
            ]:
                raise RuntimeError("tetrahedron ternary clause count drifted")
            if set(actual_tetrahedron_clauses) != expected_tetrahedron_clauses:
                raise RuntimeError("tetrahedron guarded clause shape drifted")
            c4_source = concrete["inherited_constraint_sources"][
                "three_row_deduplicated_C4"
            ]
            if "not exported by the concrete-row theorem" not in c4_source:
                raise RuntimeError("global C4 provenance was attributed to producer")
            cases.append(
                {
                    "source_role": source_role,
                    "deletion_role": deletion_role,
                    "added_clauses": concrete["added_clauses"],
                    "added_clause_counts": counts,
                    "inherited_constraint_audit": inherited,
                    "status": "PASS",
                }
            )
    print(
        json.dumps(
            {
                "schema": f"{SCHEMA}.self_test.v2",
                "pure_contract_tests": 10,
                "cases": cases,
            }
        )
    )
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument("--d", type=int, default=0)
    parser.add_argument("--v", type=int, default=2)
    parser.add_argument("--source-role", choices=tuple(SOURCE_ROLE_LABELS), default="u")
    parser.add_argument(
        "--deletion", choices=tuple(v6.branch.DELETION_ROLE_LABELS), default="q"
    )
    parser.add_argument("--contract-self-test", action="store_true")
    args, remaining = parser.parse_known_args()
    if args.contract_self_test:
        return contract_self_test()

    default_out = HERE / (
        f"cegar-d{args.d}-v{args.v}-source-role-deletion-common-v7-"
        f"{args.source_role}-{args.deletion}"
    )
    run_out = default_out
    if "--out" not in remaining:
        remaining.extend(("--out", str(default_out)))
    else:
        out_index = remaining.index("--out")
        run_out = Path(remaining[out_index + 1])
    remaining.extend(("--d", str(args.d), "--v", str(args.v)))
    sys.argv = [sys.argv[0], *remaining]

    original_write_manifest = v6.base.write_manifest
    original_build_case = v6.base.build_case

    def patched_add(instance, blocker_variables):
        return add_common_concrete_row_constraints(
            instance,
            blocker_variables,
            source_role=args.source_role,
            deletion_role=args.deletion,
        )

    def patched_validate(instance, blockers, cube):
        return validate_common_concrete_row_model(
            instance,
            blockers,
            cube,
            source_role=args.source_role,
            deletion_role=args.deletion,
        )

    def patched_replay(instance, d: int, v: int):
        return v6.replay_all_inherited(
            instance,
            d,
            v,
            source_role=args.source_role,
            deletion_role=args.deletion,
        )

    def patched_manifest(out, run_args, instance, ingress, _paths, status):
        paths = v6.inherited_journal_paths(
            run_args.d, run_args.v, args.source_role, args.deletion
        )
        original_write_manifest(out, run_args, instance, ingress, paths, status)
        path = out / "manifest.json"
        manifest = json.loads(path.read_text(encoding="utf-8"))
        manifest["schema"] = f"{SCHEMA}.manifest.v1"
        manifest["source_deletion_branch"] = ingress["branch"]
        manifest["common_concrete_rows"] = ingress["common_concrete_rows"]
        manifest["implementation"] = {
            "path": str(Path(__file__).resolve()),
            "sha256": v6.branch._sha256(Path(__file__).resolve()),
        }
        manifest["publication"] = {
            "bankable": False,
            "reason": (
                "scratch exact-12 theorem-mining run; frozen-label "
                "source-to-CNF Lean ingress is not kernel checked, and this "
                "common arm alone does not close the exact-12 parent"
            ),
        }
        path.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")

    def patched_build_case(d: int, v: int):
        model, instance, blockers, metadata = original_build_case(d, v)
        instance.metadata = metadata
        return model, instance, blockers, metadata

    v6.base.SCHEMA = SCHEMA
    v6.base.SCOPE = SCOPE
    v6.base.add_source_constraints = patched_add
    v6.base.validate_source_model = patched_validate
    v6.base.replay_inherited_journals = patched_replay
    v6.base.write_manifest = patched_manifest
    v6.base.build_case = patched_build_case
    exit_code = v6.base.main()
    summary_path = run_out.resolve() / "summary.json"
    if summary_path.is_file():
        summary = json.loads(summary_path.read_text(encoding="utf-8"))
        if "v4_records_total" in summary:
            summary["v7_records_total"] = summary.pop("v4_records_total")
        summary_path.write_text(
            json.dumps(summary, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
    return exit_code


if __name__ == "__main__":
    raise SystemExit(main())
