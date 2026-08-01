#!/usr/bin/env python3
"""Positive model audits and mutation tests for theorem-gated radius clauses."""

from __future__ import annotations

import itertools
from pathlib import Path

import probe


HERE = Path(__file__).resolve().parent
OUT = HERE / "self-test-artifacts"


def solve_artifact(name: str, built, extra_clauses=(), *, expect: str) -> tuple[Path, dict]:
    instance, separation, shell, indexed, layer, manifest = built
    case_dir = OUT / name
    case_dir.mkdir(parents=True, exist_ok=True)
    for clause in extra_clauses:
        instance.cnf.add(list(clause))
    manifest["variables"] = instance.cnf.n
    manifest["clauses"] = len(instance.cnf.clauses)
    if extra_clauses:
        manifest["self_test_extra_clauses"] = [list(clause) for clause in extra_clauses]
    cnf_path = case_dir / "input.cnf"
    proof_path = case_dir / "proof.drat"
    probe.write_text(cnf_path, instance.dimacs())
    probe.write_json(case_dir / "manifest.json", manifest)
    result, command = probe.run_cadical(cnf_path, proof_path, 180)
    probe.write_text(case_dir / "cadical.stdout", result.stdout)
    probe.write_text(case_dir / "cadical.stderr", result.stderr)
    if result.verdict == "SAT":
        probe.write_model_artifact(
            case_dir / "model.json", probe.parse_assignment(result.stdout)
        )
    record = {
        "schema": probe.SCHEMA,
        "verdict": result.verdict,
        "returncode": result.returncode,
        "wall_seconds": result.wall_seconds,
        "command": command,
        "variables": instance.cnf.n,
        "clauses": len(instance.cnf.clauses),
        "cnf_sha256": probe.sha256_file(cnf_path),
        "manifest_sha256": probe.sha256_file(case_dir / "manifest.json"),
        "proof_sha256": probe.sha256_file(proof_path) if proof_path.exists() else None,
        "proof_bytes": proof_path.stat().st_size if proof_path.exists() else 0,
        "model_sha256": (
            probe.sha256_file(case_dir / "model.json")
            if (case_dir / "model.json").exists() else None
        ),
    }
    probe.write_json(case_dir / "result.json", record)
    if result.verdict != expect:
        raise AssertionError((name, result.verdict, result.returncode, expect))
    if expect == "SAT":
        verification = probe.run_independent_verifier(case_dir)
        record["independent_verification"] = verification
    else:
        verification = probe.run_independent_verifier(case_dir)
        if verification["mode"] != "UNSAT-DRAT":
            raise AssertionError((name, verification))
        record["independent_verification"] = verification
    probe.write_json(case_dir / "result.json", record)
    return case_dir, record


def eq(layer, center: int, left: int, right: int) -> int:
    return layer["eq"](center, left, right)


def main() -> int:
    OUT.mkdir(parents=True, exist_ok=True)

    # Positive smoke gate: without a named exact-five shell, a complete local
    # partition and faithful no_qfree/source map must still have a model.
    _, positive = solve_artifact(
        "positive-domain", probe.build_instance(), expect="SAT"
    )
    positive_verification = positive["independent_verification"]
    assert positive_verification["local_equivalence_partitions_checked"] == 11
    assert positive_verification["no_qfree_source_checks"] == 11

    # Mutation 1: explicitly violate transitivity at one center.
    transitive = probe.build_instance()
    trans_layer = transitive[4]
    trans_extra = [
        [eq(trans_layer, 0, 1, 2)],
        [eq(trans_layer, 0, 2, 3)],
        [-eq(trans_layer, 0, 1, 3)],
    ]
    _, trans_result = solve_artifact(
        "mutation-nontransitive-equality", transitive, trans_extra, expect="UNSAT"
    )

    # Control 2: an arbitrary selected row may be a proper subset of its radius
    # class, provided no source chooses that center as its blocker.
    row_control = probe.build_instance()
    row_instance, _, _, row_indexed, row_layer, _ = row_control
    center = 0
    row_index = 0
    support = sorted(row_instance.cand[center][row_index])
    outside = sorted(set(probe.incident_labels(center)) - set(support))
    row_control_extra = [
        [row_instance.x[(center, row_index)]],
        [eq(row_layer, center, support[0], outside[0])],
    ] + [
        [-choice.variable]
        for choice in row_indexed["choices"]
        if choice.center == center
    ]
    _, row_control_result = solve_artifact(
        "control-selected-row-proper-subset", row_control, row_control_extra,
        expect="SAT",
    )

    # Mutation 3: the same merge is rejected when a concrete source choice
    # witnesses this selected row at its actual blocker center.
    blocker_mutation = probe.build_instance()
    blocker_instance, _, _, blocker_indexed, blocker_layer, _ = blocker_mutation
    blocker_choice = blocker_indexed["choices"][0]
    blocker_support = sorted(
        blocker_instance.cand[blocker_choice.center][blocker_choice.row_index]
    )
    blocker_outside = sorted(
        set(probe.incident_labels(blocker_choice.center)) - set(blocker_support)
    )
    blocker_extra = [
        [blocker_choice.variable],
        [eq(
            blocker_layer, blocker_choice.center,
            blocker_support[0], blocker_outside[0],
        )],
    ]
    _, blocker_result = solve_artifact(
        "mutation-blocker-row-proper-subset", blocker_mutation, blocker_extra,
        expect="UNSAT",
    )

    # Mutation 4: four labels outside a chosen blocker row are made one class.
    # The control omits only no_qfree and must be SAT; the faithful build must
    # reject the same source/row/equalities with a checked DRAT proof.
    no_qfree_control = probe.build_instance(include_no_qfree=False)
    control_instance, _, _, control_indexed, control_layer, _ = no_qfree_control
    control_choice = control_indexed["choices_by_source"][probe.source.base.Q][0]
    control_support = set(
        control_instance.cand[control_choice.center][control_choice.row_index]
    )
    control_outside = sorted(
        set(probe.incident_labels(control_choice.center)) - control_support
    )
    quad = tuple(control_outside[:4])
    control_extra = [[control_choice.variable]] + [
        [eq(control_layer, control_choice.center, quad[0], label)]
        for label in quad[1:]
    ]
    # This deliberately violates no_qfree, so only direct DIMACS/model checking
    # is appropriate for the disabled control.
    control_dir = OUT / "control-no-qfree-disabled"
    control_dir.mkdir(parents=True, exist_ok=True)
    for clause in control_extra:
        control_instance.cnf.add(clause)
    control_cnf = control_dir / "input.cnf"
    control_proof = control_dir / "proof.drat"
    probe.write_text(control_cnf, control_instance.dimacs())
    control_solver, control_command = probe.run_cadical(
        control_cnf, control_proof, 180
    )
    probe.write_text(control_dir / "cadical.stdout", control_solver.stdout)
    probe.write_text(control_dir / "cadical.stderr", control_solver.stderr)
    assert control_solver.verdict == "SAT", (
        control_solver.verdict, control_solver.returncode
    )
    control_assignment = probe.parse_assignment(control_solver.stdout)
    failed = [
        number for number, clause in enumerate(control_instance.cnf.clauses, start=1)
        if not any(
            control_assignment[abs(literal)] == (literal > 0)
            for literal in clause
        )
    ]
    assert not failed
    probe.write_json(control_dir / "result.json", {
        "verdict": control_solver.verdict,
        "command": control_command,
        "variables": control_instance.cnf.n,
        "clauses": len(control_instance.cnf.clauses),
        "cnf_sha256": probe.sha256_file(control_cnf),
        "all_clauses_satisfied": True,
        "targeted_source": control_choice.source,
        "targeted_center": control_choice.center,
        "targeted_row": control_choice.row_index,
        "forced_outside_four_class": list(quad),
        "meaning": "SAT only because chosen-blocker no_qfree clauses are disabled",
    })

    no_qfree_mutation = probe.build_instance()
    nq_instance, _, _, nq_indexed, nq_layer, _ = no_qfree_mutation
    nq_choice = nq_indexed["by_key"][(
        control_choice.source, control_choice.center, control_choice.row_index
    )]
    nq_extra = [[nq_choice.variable]] + [
        [eq(nq_layer, nq_choice.center, quad[0], label)]
        for label in quad[1:]
    ]
    _, no_qfree_result = solve_artifact(
        "mutation-no-qfree-four-class-after-deletion",
        no_qfree_mutation, nq_extra, expect="UNSAT",
    )

    # Mutation 5: an outside edge is forced into the named first-apex class.
    # This directly checks exact support, independent of the target shell's
    # existing row-vs-five-shell contradiction.
    exact_five = probe.build_instance()
    _, _, _, _, five_layer, _ = exact_five
    u5 = set(probe.source.base.shell_u5(2, 0))
    first_apex = probe.source.base.profile.V
    outside_five = min(set(probe.incident_labels(first_apex)) - u5)
    # Add only the exact-five class clauses to the otherwise shell-free build.
    five_extra = []
    for left, right in itertools.combinations(sorted(u5), 2):
        five_extra.append([eq(five_layer, first_apex, left, right)])
    for inside in sorted(u5):
        for other in sorted(set(probe.incident_labels(first_apex)) - u5):
            five_extra.append([-eq(five_layer, first_apex, inside, other)])
    five_extra.append([eq(five_layer, first_apex, min(u5), outside_five)])
    _, five_result = solve_artifact(
        "mutation-exact-five-shell-has-outside-member",
        exact_five, five_extra, expect="UNSAT",
    )

    summary = {
        "schema": probe.SCHEMA,
        "positive_domain": {
            "verdict": positive["verdict"],
            "independent_verification": positive_verification,
        },
        "mutations": {
            "nontransitive_equality": trans_result["independent_verification"],
            "selected_row_proper_subset_control":
                row_control_result["independent_verification"],
            "blocker_row_proper_subset":
                blocker_result["independent_verification"],
            "no_qfree_disabled_control": {
                "verdict": control_solver.verdict,
                "all_clauses_satisfied": True,
            },
            "no_qfree_four_class_after_deletion": no_qfree_result["independent_verification"],
            "exact_five_shell_outside_member": five_result["independent_verification"],
        },
        "all_passed": True,
    }
    probe.write_json(OUT / "summary.json", summary)
    print(
        "SELF-TEST PASS: positive full-radius model independently verified; "
        "arbitrary selected-row subset accepted; blocker exactness, "
        "transitivity, no_qfree, and exact-five mutations rejected with "
        "independently checked DRAT proofs"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
