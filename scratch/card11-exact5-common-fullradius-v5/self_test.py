#!/usr/bin/env python3
"""Positive-model and mutation tests for the v5 closure obstructions."""

from __future__ import annotations

import itertools
from pathlib import Path

import probe
import verify_artifact


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


def geq(
    layer, first: tuple[int, int], second: tuple[int, int]
) -> int:
    return layer["global_eq"](first, second)


def solve_direct_sat(name: str, built, extra_clauses=()) -> tuple[dict, dict]:
    """Solve a deliberately disabled control without production semantics."""
    instance, _, _, _, _, manifest = built
    case_dir = OUT / name
    case_dir.mkdir(parents=True, exist_ok=True)
    for clause in extra_clauses:
        instance.cnf.add(list(clause))
    cnf_path = case_dir / "input.cnf"
    proof_path = case_dir / "proof.drat"
    probe.write_text(cnf_path, instance.dimacs())
    probe.write_json(case_dir / "manifest.json", manifest)
    solver, command = probe.run_cadical(cnf_path, proof_path, 180)
    probe.write_text(case_dir / "cadical.stdout", solver.stdout)
    probe.write_text(case_dir / "cadical.stderr", solver.stderr)
    if solver.verdict != "SAT":
        raise AssertionError((name, solver.verdict, solver.returncode))
    assignment = probe.parse_assignment(solver.stdout)
    failed = [
        number for number, clause in enumerate(instance.cnf.clauses, start=1)
        if not any(
            assignment[abs(literal)] == (literal > 0)
            for literal in clause
        )
    ]
    if failed:
        raise AssertionError((name, failed[:10]))
    record = {
        "verdict": solver.verdict,
        "command": command,
        "variables": instance.cnf.n,
        "clauses": len(instance.cnf.clauses),
        "cnf_sha256": probe.sha256_file(cnf_path),
        "all_clauses_satisfied": True,
    }
    probe.write_json(case_dir / "result.json", record)
    return assignment, record


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

    # Mutation 6: the global edge relation itself must be transitively closed.
    global_transitive = probe.build_instance()
    global_transitive_layer = global_transitive[4]
    first_edge = probe.edge_key(0, 1)
    second_edge = probe.edge_key(0, 2)
    third_edge = probe.edge_key(0, 3)
    global_transitive_extra = [
        [geq(global_transitive_layer, first_edge, second_edge)],
        [geq(global_transitive_layer, second_edge, third_edge)],
        [-geq(global_transitive_layer, first_edge, third_edge)],
    ]
    _, global_transitive_result = solve_artifact(
        "mutation-global-equality-nontransitive",
        global_transitive,
        global_transitive_extra,
        expect="UNSAT",
    )

    # Mutation 7 and its disabled control: two distinct centers are forced to
    # be equidistant from the same three labels.
    p, q, r, first_center, second_center = 0, 1, 2, 3, 4
    duplicate = probe.build_instance()
    duplicate_layer = duplicate[4]
    duplicate_extra = [
        [geq(
            duplicate_layer,
            probe.edge_key(first_center, p),
            probe.edge_key(first_center, q),
        )],
        [geq(
            duplicate_layer,
            probe.edge_key(first_center, p),
            probe.edge_key(first_center, r),
        )],
        [geq(
            duplicate_layer,
            probe.edge_key(second_center, p),
            probe.edge_key(second_center, q),
        )],
        [geq(
            duplicate_layer,
            probe.edge_key(second_center, p),
            probe.edge_key(second_center, r),
        )],
    ]
    _, duplicate_result = solve_artifact(
        "mutation-duplicate-center-core",
        duplicate,
        duplicate_extra,
        expect="UNSAT",
    )

    duplicate_control = probe.build_instance(
        include_duplicate_center_core=False
    )
    duplicate_control_layer = duplicate_control[4]
    duplicate_control_extra = [
        [geq(
            duplicate_control_layer,
            probe.edge_key(first_center, p),
            probe.edge_key(first_center, q),
        )],
        [geq(
            duplicate_control_layer,
            probe.edge_key(first_center, p),
            probe.edge_key(first_center, r),
        )],
        [geq(
            duplicate_control_layer,
            probe.edge_key(second_center, p),
            probe.edge_key(second_center, q),
        )],
        [geq(
            duplicate_control_layer,
            probe.edge_key(second_center, p),
            probe.edge_key(second_center, r),
        )],
    ]
    duplicate_assignment, duplicate_control_result = solve_direct_sat(
        "control-duplicate-center-core-disabled",
        duplicate_control,
        duplicate_control_extra,
    )
    duplicate_manifest = duplicate_control[-1]
    duplicate_global_vars = verify_artifact.parse_global_variables(
        duplicate_manifest, duplicate_control[0].cnf.n
    )

    def control_equal(first, second):
        if first == second:
            return True
        return duplicate_assignment[
            duplicate_global_vars[verify_artifact.global_key(first, second)]
        ]

    control_witness = verify_artifact.duplicate_witness(control_equal)
    assert control_witness == {
        "p": p, "q": q, "r": r,
        "first_center": first_center, "second_center": second_center,
    }

    # Mutation 8 and its disabled control: three distinct points outside one
    # focus pair are forced onto the same encoded perpendicular bisector.
    focus_a, focus_b, point_p, point_q, point_r = 0, 1, 2, 3, 4
    perpendicular = probe.build_instance()
    perpendicular_layer = perpendicular[4]
    perpendicular_extra = [
        [geq(
            perpendicular_layer,
            probe.edge_key(point, focus_a),
            probe.edge_key(point, focus_b),
        )]
        for point in (point_p, point_q, point_r)
    ]
    _, perpendicular_result = solve_artifact(
        "mutation-perpendicular-bisector-core",
        perpendicular,
        perpendicular_extra,
        expect="UNSAT",
    )

    perpendicular_control = probe.build_instance(
        include_perpendicular_bisector_core=False
    )
    perpendicular_control_layer = perpendicular_control[4]
    perpendicular_control_extra = [
        [geq(
            perpendicular_control_layer,
            probe.edge_key(point, focus_a),
            probe.edge_key(point, focus_b),
        )]
        for point in (point_p, point_q, point_r)
    ]
    perpendicular_assignment, perpendicular_control_result = solve_direct_sat(
        "control-perpendicular-bisector-core-disabled",
        perpendicular_control,
        perpendicular_control_extra,
    )
    perpendicular_manifest = perpendicular_control[-1]
    perpendicular_global_vars = verify_artifact.parse_global_variables(
        perpendicular_manifest, perpendicular_control[0].cnf.n
    )

    def perpendicular_control_equal(first, second):
        if first == second:
            return True
        return perpendicular_assignment[
            perpendicular_global_vars[
                verify_artifact.global_key(first, second)
            ]
        ]

    perpendicular_control_witness = (
        verify_artifact.perpendicular_bisector_witness(
            perpendicular_control_equal
        )
    )
    assert perpendicular_control_witness == {
        "focus_a": focus_a,
        "focus_b": focus_b,
        "p": point_p,
        "q": point_q,
        "r": point_r,
    }

    # Mutation 9 and its disabled control: use the direct selected-row-only
    # witness from the persisted v4 s2_o0 model.  The four global equality
    # atoms and its selected boundary order are SAT in v4, but their complete
    # forward ConvexFivePointCore clause is immediately UNSAT in v5.
    convex_tuple = (8, 3, 1, 9, 10)
    convex_a, convex_x, convex_b, convex_c, convex_y = convex_tuple
    convex_comparisons = [
        (probe.edge_key(convex_x, convex_a),
         probe.edge_key(convex_x, convex_b)),
        (probe.edge_key(convex_y, convex_a),
         probe.edge_key(convex_y, convex_b)),
        (probe.edge_key(convex_c, convex_b),
         probe.edge_key(convex_c, convex_x)),
        (probe.edge_key(convex_c, convex_b),
         probe.edge_key(convex_c, convex_y)),
    ]
    convex = probe.build_instance(2, 0)
    convex_layer = convex[4]
    convex_order = next(
        order for order in convex[-1]["order_selectors"]
        if order["orientation"] == "mirror"
        and int(order["internal_index"]) == 61
    )
    convex_extra = [[int(convex_order["variable"])]] + [
        [geq(convex_layer, first, second)]
        for first, second in convex_comparisons
    ]
    _, convex_result = solve_artifact(
        "mutation-convex-five-point-core",
        convex,
        convex_extra,
        expect="UNSAT",
    )

    convex_control = probe.build_instance(
        2, 0, include_convex_five_point_core=False
    )
    convex_control_layer = convex_control[4]
    convex_control_order = next(
        order for order in convex_control[-1]["order_selectors"]
        if order["orientation"] == "mirror"
        and int(order["internal_index"]) == 61
    )
    convex_control_extra = [[int(convex_control_order["variable"])]] + [
        [geq(convex_control_layer, first, second)]
        for first, second in convex_comparisons
    ]
    convex_assignment, convex_control_result = solve_direct_sat(
        "control-convex-five-point-core-disabled",
        convex_control,
        convex_control_extra,
    )
    convex_control_global_vars = verify_artifact.parse_global_variables(
        convex_control[-1], convex_control[0].cnf.n
    )

    def convex_control_equal(first, second):
        if first == second:
            return True
        return convex_assignment[
            convex_control_global_vars[
                verify_artifact.global_key(first, second)
            ]
        ]

    assert convex_assignment[int(convex_control_order["variable"])]
    assert all(
        convex_control_equal(first, second)
        for first, second in convex_comparisons
    )
    convex_control_witness = verify_artifact.convex_five_point_witness(
        [convex_control_order], convex_control_equal
    )
    assert convex_control_witness is not None

    # Structural mutation: independently regenerated block checks must reject
    # even a single changed convex-five-point clause.
    structure = probe.build_instance(2, 0)
    structure_instance, _, _, _, _, structure_manifest = structure
    structure_clauses = [list(clause) for clause in structure_instance.cnf.clauses]
    structure_global_vars = verify_artifact.parse_global_variables(
        structure_manifest, structure_instance.cnf.n
    )
    structure_audit = verify_artifact.verify_v5_clause_blocks(
        structure_clauses, structure_manifest, structure_global_vars
    )
    convex_block = next(
        block for block in structure_manifest["clause_blocks"]
        if block["name"] == "convex-five-point-core-forward-exclusions"
    )
    changed_clauses = [list(clause) for clause in structure_clauses]
    changed_index = int(convex_block["first_clause_1based"]) - 1
    changed_clauses[changed_index][0] *= -1
    try:
        verify_artifact.verify_v5_clause_blocks(
            changed_clauses, structure_manifest, structure_global_vars
        )
    except verify_artifact.VerificationError:
        structural_mutation_rejected = True
    else:
        raise AssertionError(
            "changed convex-five-point clause was not rejected"
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
            "global_equality_nontransitive":
                global_transitive_result["independent_verification"],
            "duplicate_center_core": duplicate_result["independent_verification"],
            "duplicate_center_core_disabled_control": {
                **duplicate_control_result,
                "semantic_duplicate_witness": control_witness,
            },
            "perpendicular_bisector_core":
                perpendicular_result["independent_verification"],
            "perpendicular_bisector_core_disabled_control": {
                **perpendicular_control_result,
                "semantic_perpendicular_bisector_witness":
                    perpendicular_control_witness,
            },
            "convex_five_point_core":
                convex_result["independent_verification"],
            "convex_five_point_core_disabled_control": {
                **convex_control_result,
                "target_tuple": list(convex_tuple),
                "target_order": convex_control_order,
                "semantic_convex_five_point_witness":
                    convex_control_witness,
            },
            "changed_convex_five_clause_structurally_rejected":
                structural_mutation_rejected,
        },
        "production_structure_audit": structure_audit,
        "all_passed": True,
    }
    probe.write_json(OUT / "summary.json", summary)
    print(
        "SELF-TEST PASS: positive full-radius model independently verified; "
        "arbitrary selected-row subset accepted; blocker exactness, "
        "local/global transitivity, no_qfree, exact-five, duplicate-center, "
        "perpendicular-bisector, and convex-five-point mutations rejected "
        "with independently checked DRAT proofs"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
