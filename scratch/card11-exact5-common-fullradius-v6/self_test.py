#!/usr/bin/env python3
"""Focused structural and semantic tests for the v6 theorem-family delta."""

from __future__ import annotations

import importlib.util
import itertools
import json
import sys
from pathlib import Path

import probe
import verify_artifact


HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parents[1]
V5_DIR = REPO_ROOT / "scratch" / "card11-exact5-common-fullradius-v5"


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def expect_structural_rejection(
    name: str,
    clauses: list[list[int]],
    manifest: dict,
    global_vars,
    eq_vars,
    local_four,
    qdeleted_pair,
    clause_index: int,
) -> str:
    mutated = list(clauses)
    changed = list(mutated[clause_index])
    changed[-1] = -changed[-1]
    mutated[clause_index] = changed
    try:
        verify_artifact.verify_v6_clause_blocks(
            mutated, manifest, global_vars, eq_vars, local_four, qdeleted_pair
        )
    except verify_artifact.VerificationError:
        return name
    raise RuntimeError(f"{name}: structural verifier accepted a changed clause")


def differential_boolean_checks() -> int:
    """Exhaustively compare direct DNF-pair cuts with the compact predicate."""

    checked = 0
    # The local-four Tseitin clauses are equivalent to h iff e1 and e2 and e3.
    for values in itertools.product((False, True), repeat=4):
        h, e1, e2, e3 = values
        cnf = (
            ((not h) or e1)
            and ((not h) or e2)
            and ((not h) or e3)
            and (h or (not e1) or (not e2) or (not e3))
        )
        if cnf != (h == (e1 and e2 and e3)):
            raise RuntimeError("local-four iff differential check failed")
        checked += 1

    # The q-deleted-pair shape is w iff at least one four-set witness.
    for width in range(1, 5):
        for values in itertools.product((False, True), repeat=width + 1):
            w, *witnesses = values
            cnf = (
                all((not witness) or w for witness in witnesses)
                and ((not w) or any(witnesses))
            )
            if cnf != (w == any(witnesses)):
                raise RuntimeError("q-deleted-pair iff differential check failed")
            checked += 1

    # For small witness universes, the conjunction of every direct
    # (-y or -Li or -Rj) clause equals the one compact guarded cut after
    # substituting L=OR(Li), R=OR(Rj).
    for width in range(1, 5):
        for values in itertools.product((False, True), repeat=1 + 2 * width):
            y = values[0]
            left = values[1:1 + width]
            right = values[1 + width:]
            direct = all(
                (not y) or (not left_value) or (not right_value)
                for left_value in left
                for right_value in right
            )
            compact = (not y) or (not any(left)) or (not any(right))
            if direct != compact:
                raise RuntimeError("Family A factorization differential failed")
            checked += 1
    return checked


def parse_v5_model(case_name: str) -> tuple[dict, dict[int, bool]]:
    case_dir = V5_DIR / "runs" / case_name
    manifest = json.loads(
        (case_dir / "manifest.json").read_text(encoding="utf-8")
    )
    payload = json.loads((case_dir / "model.json").read_text(encoding="utf-8"))
    assignment = {
        abs(int(literal)): int(literal) > 0
        for literal in payload["signed_literals"]
    }
    return manifest, assignment


def audit_v5_model(case_name: str) -> dict:
    """Evaluate the complete v6 predicates directly on a persisted v5 model."""

    manifest, assignment = parse_v5_model(case_name)
    eq_vars = verify_artifact.parse_local_variables(manifest)
    row_by_key = {
        (int(row["center"]), int(row["row_index"])):
            set(map(int, row["support"]))
        for row in manifest["selected_rows"]
    }

    def equal(center: int, first: int, second: int) -> bool:
        return assignment[
            eq_vars[(center, min(first, second), max(first, second))]
        ]

    def qpair(
        deleted: int, center: int, first: int, second: int
    ) -> bool:
        extras = [
            label for label in verify_artifact.LABELS
            if label not in {deleted, center, first, second}
        ]
        return any(
            all(
                equal(center, support[0], other)
                for other in support[1:]
            )
            for a, b in itertools.combinations(extras, 2)
            for support in [tuple(sorted((first, second, a, b)))]
        )

    family_a_violations = []
    family_b_violations = []
    for choice in manifest["source_choices"]:
        selector = int(choice["variable"])
        if not assignment[selector]:
            continue
        deleted = int(choice["source"])
        center = int(choice["center"])
        row_index = int(choice["row_index"])
        support = row_by_key[(center, row_index)]
        triple = sorted(support - {deleted})
        outside = sorted(
            set(verify_artifact.LABELS) - support - {center}
        )
        for member in triple:
            for off_circle in outside:
                if (
                    qpair(deleted, member, center, off_circle)
                    and qpair(deleted, off_circle, center, member)
                ):
                    family_a_violations.append({
                        "source": deleted,
                        "center": center,
                        "member": member,
                        "off_circle": off_circle,
                    })
        for off_circle in outside:
            if all(equal(off_circle, center, member) for member in triple):
                family_b_violations.append({
                    "source": deleted,
                    "center": center,
                    "triple": triple,
                    "off_circle": off_circle,
                })
    return {
        "case": case_name,
        "family_a_violations": len(family_a_violations),
        "family_b_violations": len(family_b_violations),
        "first_family_a": family_a_violations[:1],
        "first_family_b": family_b_violations[:1],
    }


def main() -> int:
    v5 = load_module("card11_fullradius_v5_for_v6_test", V5_DIR / "probe.py")
    v5_built = v5.build_instance(2, 0)
    built = probe.build_instance(2, 0)
    instance, _, _, _, _, manifest = built

    if instance.cnf.n != 49357 or len(instance.cnf.clauses) != 1180698:
        raise RuntimeError("unexpected v6 production counts")
    if (
        manifest["pre_v6_prefix_variables"] != v5_built[0].cnf.n
        or manifest["pre_v6_prefix_clauses"] != len(v5_built[0].cnf.clauses)
    ):
        raise RuntimeError("v5 prefix counts changed")
    if (
        instance.cnf.clauses[:manifest["pre_v6_prefix_clauses"]]
        != v5_built[0].cnf.clauses
    ):
        raise RuntimeError("v5 clause prefix changed")

    global_vars = verify_artifact.parse_global_variables(
        manifest, instance.cnf.n
    )
    eq_vars = verify_artifact.parse_local_variables(manifest)
    local_four, qdeleted_pair = verify_artifact.parse_v6_aux_variables(
        manifest, instance.cnf.n
    )
    structural = verify_artifact.verify_v6_clause_blocks(
        instance.cnf.clauses,
        manifest,
        global_vars,
        eq_vars,
        local_four,
        qdeleted_pair,
    )

    blocks = {
        block["name"]: block for block in manifest["clause_blocks"]
    }
    mutations = []
    for name in (
        "v6-local-four-class-witness-iff",
        "v6-qdeleted-pair-witness-iff",
        "v6-u5-nontriple-equilateral-incompatibilities",
        "v6-u5-common-bisector-triple-incompatibilities",
    ):
        mutations.append(expect_structural_rejection(
            name,
            instance.cnf.clauses,
            manifest,
            global_vars,
            eq_vars,
            local_four,
            qdeleted_pair,
            int(blocks[name]["first_clause_1based"]) - 1,
        ))

    differential_checks = differential_boolean_checks()
    regression = [
        audit_v5_model(case_name)
        for case_name in ("s2_o0", "s2_o9", "s3_o0", "s3_o9")
    ]
    by_case = {entry["case"]: entry for entry in regression}
    if by_case["s2_o0"]["family_a_violations"] == 0:
        raise RuntimeError("s2_o0 did not trigger the audited Family A cut")
    if by_case["s3_o9"]["family_b_violations"] == 0:
        raise RuntimeError("s3_o9 did not trigger the audited Family B cut")

    result = {
        "schema": probe.SCHEMA,
        "passed": True,
        "v5_prefix_variables": manifest["pre_v6_prefix_variables"],
        "v5_prefix_clauses": manifest["pre_v6_prefix_clauses"],
        "v6_variables": instance.cnf.n,
        "v6_clauses": len(instance.cnf.clauses),
        "structural": structural,
        "mutations_rejected": mutations,
        "differential_boolean_assignments_checked": differential_checks,
        "v5_model_regression": regression,
    }
    probe.write_json(HERE / "self-test-results.json", result)
    print(json.dumps({
        "passed": True,
        "mutations_rejected": len(mutations),
        "differential_boolean_assignments_checked": differential_checks,
        "regression": {
            entry["case"]: [
                entry["family_a_violations"],
                entry["family_b_violations"],
            ]
            for entry in regression
        },
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
