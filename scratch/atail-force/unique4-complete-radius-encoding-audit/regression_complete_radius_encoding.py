#!/usr/bin/env python3
"""Audit the complete-radius mutual-triangle clauses and their replay boundary.

This is a deterministic encoding regression.  It checks the clauses emitted by
the shared exact-four outer, proves the direct blocker-image clause redundant
under the encoded support-lock kernel by exhaustive Boolean enumeration, checks
the independent semantic verifier's two conclusions, and replays rejection of
the two obsolete no-packing fixtures.
"""

from __future__ import annotations

import argparse
import ast
import hashlib
import importlib.util
import itertools
import json
import os
import sys
import tempfile
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SOURCE_DIR = HERE.parent / "unique-arm-whole-carrier-source-audit"
ENCODER_PATH = SOURCE_DIR / "exact_four_outer.py"
VERIFIER_PATH = SOURCE_DIR / "verify_exact_four_outer.py"
PLACEMENT_DIR = HERE.parent / "unique4-complete-radius-placement-audit"
PRODUCER_PATH = PLACEMENT_DIR / "CompleteRadiusPlacement.lean"
FIXTURE_AUDIT_PATH = PLACEMENT_DIR / "audit_counterpatterns.py"
CEGAR_DIR = HERE.parent / "unique4-curvature-occurrence-census"
CEGAR_DRIVER_PATH = CEGAR_DIR / "run_curvature_cegar.py"
KALMANSON_BANK = CEGAR_DIR / "kalmanson_schema_bank.kernel_only.json"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_module(name: str, path: Path) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def clause_value(clause: tuple[int, ...], values: dict[int, bool]) -> bool:
    return any(values[abs(literal)] == (literal > 0) for literal in clause)


def require_clause(cnf: Any, literals: list[int], label: str) -> tuple[int, ...]:
    expected = frozenset(literals)
    matches = [clause for clause in cnf.clauses if frozenset(clause) == expected]
    if not matches:
        same_variables = [
            clause for clause in cnf.clauses
            if {abs(literal) for literal in clause} == {abs(literal) for literal in literals}
        ]
        raise AssertionError(
            f"{label}: expected clause {sorted(expected)}, got {matches}; "
            f"same-variable clauses={same_variables}"
        )
    return matches[0]


def implication_truth_table(
    clause: tuple[int, ...], antecedents: list[int], conclusion: int, label: str
) -> dict[str, int]:
    variables = sorted({abs(literal) for literal in clause})
    if set(variables) != {abs(literal) for literal in [*antecedents, conclusion]}:
        raise AssertionError(f"{label}: clause variable support drift")
    falsifying_assignments = 0
    for bits in itertools.product((False, True), repeat=len(variables)):
        values = dict(zip(variables, bits, strict=True))
        expected = not (
            all(values[abs(literal)] == (literal > 0) for literal in antecedents)
            and values[abs(conclusion)] != (conclusion > 0)
        )
        actual = clause_value(clause, values)
        if actual != expected:
            raise AssertionError(f"{label}: polarity mismatch at {values}")
        falsifying_assignments += not actual
    if falsifying_assignments != 1:
        raise AssertionError(f"{label}: implication clause has {falsifying_assignments} falsifiers")
    return {
        "variable_count": len(variables),
        "assignment_count": 1 << len(variables),
        "falsifying_assignment_count": falsifying_assignments,
    }


def exhaustive_entailment(
    base: list[tuple[int, ...]], conclusion_clause: tuple[int, ...], label: str
) -> dict[str, int]:
    variables = sorted({abs(literal) for clause in [*base, conclusion_clause] for literal in clause})
    base_models = 0
    countermodels = 0
    for bits in itertools.product((False, True), repeat=len(variables)):
        values = dict(zip(variables, bits, strict=True))
        if not all(clause_value(clause, values) for clause in base):
            continue
        base_models += 1
        if not clause_value(conclusion_clause, values):
            countermodels += 1
    if countermodels:
        raise AssertionError(f"{label}: {countermodels} support-lock countermodels")
    return {
        "variable_count": len(variables),
        "assignment_count": 1 << len(variables),
        "base_model_count": base_models,
        "direct_clause_countermodel_count": countermodels,
    }


def empty_banks(directory: Path) -> tuple[Path, Path, Path]:
    records = (
        (
            "planar.json",
            {
                "schema": "p97-whole-carrier-planar-membership-schema-bank-v1",
                "schema_count": 0,
                "schemas": [],
                "epistemic_status": "EMPTY_REGRESSION_BANK",
            },
        ),
        (
            "kalmanson.json",
            {
                "schema": "p97-exact-four-kalmanson-order-schema-bank-v1",
                "schema_count": 0,
                "schemas": [],
                "epistemic_status": "EMPTY_REGRESSION_BANK",
            },
        ),
        (
            "u5.json",
            {
                "schema": "p97-exact-four-u5-signed-schema-bank-v1",
                "schema_count": 0,
                "schemas": [],
                "epistemic_status": "EMPTY_REGRESSION_BANK",
            },
        ),
    )
    paths = []
    for name, payload in records:
        path = directory / name
        path.write_text(json.dumps(payload, sort_keys=True) + "\n", encoding="utf-8")
        paths.append(path)
    return tuple(paths)  # type: ignore[return-value]


def audit_clauses(encoder: Any) -> dict[str, Any]:
    with tempfile.TemporaryDirectory() as temporary:
        banks = empty_banks(Path(temporary))
        cnf, _ = encoder.encode(11, 4, *banks)

    n = 11
    anchor, middle, blocker_center = 0, 1, 2
    member = lambda center, point: cnf.ids[f"m_{center}_{point}"]
    blocker = lambda source, center: cnf.ids[f"b_{source}_{center}"]
    support = lambda source, point: cnf.ids[f"h_{source}_{point}"]
    equality = lambda center, left, right: cnf.ids[
        f"eq_{center}_{min(left, right)}_{max(left, right)}"
    ]

    common_triangle = [
        member(anchor, middle),
        member(anchor, blocker_center),
        member(middle, anchor),
        member(middle, blocker_center),
    ]
    blocker_middle = member(blocker_center, middle)
    blocker_anchor = member(blocker_center, anchor)
    transported_equality = equality(blocker_center, anchor, middle)
    transport_clause = require_clause(
        cnf,
        [-literal for literal in common_triangle] + [transported_equality],
        "mutual-triangle radius transport",
    )
    transport_truth_table = implication_truth_table(
        transport_clause, common_triangle, transported_equality, "radius transport"
    )

    direct_truth_tables = []
    entailment_cases = []
    for source in range(n):
        blocker_atom = blocker(source, blocker_center)
        antecedents = [blocker_atom, *common_triangle, blocker_middle]
        direct_clause = require_clause(
            cnf,
            [-literal for literal in antecedents] + [blocker_anchor],
            f"direct blocker-image closure, source {source}",
        )
        direct_truth_tables.append(
            {
                "source": source,
                **implication_truth_table(
                    direct_clause, antecedents, blocker_anchor,
                    f"direct closure, source {source}",
                ),
            }
        )

        base = [transport_clause]
        if source == blocker_center:
            base.append(require_clause(cnf, [-blocker_atom], "blocker fixed-point exclusion"))
            source_case = "source_eq_blocker_antecedent_impossible"
        elif source == anchor:
            source_support = support(source, source)
            base.extend(
                [
                    require_clause(
                        cnf, [source_support], "critical support contains anchor source"
                    ),
                    require_clause(
                        cnf,
                        [-blocker_atom, -source_support, blocker_anchor],
                        "support lock at anchor source",
                    ),
                ]
            )
            source_case = "source_eq_anchor_support_lock_direct"
        elif source == middle:
            source_support = support(source, source)
            anchor_support = support(source, anchor)
            base.extend(
                [
                    require_clause(
                        cnf, [source_support], "critical support contains middle source"
                    ),
                    require_clause(
                        cnf,
                        [-blocker_atom, -transported_equality, anchor_support],
                        "full-class closure from middle source",
                    ),
                    require_clause(
                        cnf,
                        [-blocker_atom, -anchor_support, blocker_anchor],
                        "support lock conclusion from middle source",
                    ),
                ]
            )
            source_case = "source_eq_middle_transport_then_support_lock"
        else:
            middle_support = support(source, middle)
            anchor_support = support(source, anchor)
            source_middle_equality = equality(blocker_center, source, middle)
            source_anchor_equality = equality(blocker_center, source, anchor)
            base.extend(
                [
                    require_clause(
                        cnf,
                        [-blocker_atom, -blocker_middle, middle_support],
                        "row-to-critical support lock",
                    ),
                    require_clause(
                        cnf,
                        [-blocker_atom, -middle_support, source_middle_equality],
                        "critical support-to-full-class membership",
                    ),
                    require_clause(
                        cnf,
                        [-source_middle_equality, -transported_equality,
                         source_anchor_equality],
                        "radius partition transitivity",
                    ),
                    require_clause(
                        cnf,
                        [-blocker_atom, -source_anchor_equality, anchor_support],
                        "full-class-to-critical support membership",
                    ),
                    require_clause(
                        cnf,
                        [-blocker_atom, -anchor_support, blocker_anchor],
                        "critical support-to-row lock",
                    ),
                ]
            )
            source_case = "source_distinct_support_lock_radius_transport"
        entailment_cases.append(
            {
                "source": source,
                "source_case": source_case,
                **exhaustive_entailment(
                    base, direct_clause, f"direct closure entailment, source {source}"
                ),
            }
        )

    expected_transport_count = n * (n - 1) * (n - 2)
    expected_direct_count = n * expected_transport_count
    if cnf.block_counts["mutual_triangle_cross_center_radius_transport"] != expected_transport_count:
        raise AssertionError("mutual-triangle transport clause count drift")
    if cnf.block_counts["blocker_image_mutual_triangle_membership_closure"] != expected_direct_count:
        raise AssertionError("direct blocker-image closure clause count drift")
    unique_transport_clauses = {
        frozenset(clause)
        for clause in cnf.clauses
        if len(clause) == 5
        and sum(literal < 0 for literal in clause) == 4
        and any(literal > 0 and cnf.names[literal].startswith("eq_") for literal in clause)
        and all(
            cnf.names[abs(literal)].startswith("m_")
            for literal in clause if literal < 0
        )
    }
    expected_unique_transport_count = expected_transport_count // 2
    if len(unique_transport_clauses) != expected_unique_transport_count:
        raise AssertionError(
            "mutual-triangle unique transport clause count drift: "
            f"{len(unique_transport_clauses)}"
        )

    return {
        "role_distinctness": (
            "anchor, middle, and blocker are pairwise distinct by permutations; "
            "the source is unrestricted, with source=blocker made impossible by the "
            "fixed-point-free blocker clause"
        ),
        "transport_clause_count": expected_transport_count,
        "unique_transport_clause_count": expected_unique_transport_count,
        "direct_clause_count": expected_direct_count,
        "transport_clause": list(transport_clause),
        "transport_truth_table": transport_truth_table,
        "direct_truth_tables": direct_truth_tables,
        "direct_clause_entailment_cases": entailment_cases,
        "all_direct_clauses_follow_from_support_lock_kernel": True,
    }


def verifier_require_condition(source: str, message_fragment: str) -> str:
    tree = ast.parse(source)
    matches = []
    for node in ast.walk(tree):
        if not isinstance(node, ast.Call) or not isinstance(node.func, ast.Name):
            continue
        if node.func.id != "require" or len(node.args) < 2:
            continue
        message = node.args[1]
        if isinstance(message, ast.Constant) and isinstance(message.value, str):
            if message_fragment in message.value:
                matches.append(ast.unparse(node.args[0]))
        elif isinstance(message, ast.JoinedStr):
            rendered = ast.unparse(message)
            if message_fragment in rendered:
                matches.append(ast.unparse(node.args[0]))
    if len(matches) != 1:
        raise AssertionError(f"verifier require for {message_fragment!r}: {matches}")
    return matches[0]


def audit_verifier() -> dict[str, Any]:
    source = VERIFIER_PATH.read_text(encoding="utf-8")
    tree = ast.parse(source)
    transport = verifier_require_condition(
        source, "mutual selected-row triangle does not transport"
    )
    direct = verifier_require_condition(
        source, "blocker-image mutual triangle omits its forced reverse membership"
    )
    if transport != "eq(equality, blocker_center, anchor, middle)":
        raise AssertionError(f"semantic verifier transport conclusion drift: {transport}")
    if direct != "anchor in rows[blocker_center]":
        raise AssertionError(f"semantic verifier direct conclusion drift: {direct}")
    actual_if_tests = {
        ast.dump(node.test, include_attributes=False)
        for node in ast.walk(tree) if isinstance(node, ast.If)
    }
    expected_if_expressions = {
        "transport_guard": (
            "not ({middle, blocker_center} <= rows[anchor] "
            "and {anchor, blocker_center} <= rows[middle])"
        ),
        "blocker_image_guard": "blocker_center not in blocker_image",
        "direct_membership_guard": (
            "not ({middle, blocker_center} <= rows[anchor] "
            "and {anchor, blocker_center} <= rows[middle] "
            "and middle in rows[blocker_center])"
        ),
    }
    for label, expression in expected_if_expressions.items():
        expected = ast.dump(ast.parse(expression, mode="eval").body, include_attributes=False)
        if expected not in actual_if_tests:
            raise AssertionError(f"semantic verifier {label} drift")
    return {
        "semantic_verifier": str(VERIFIER_PATH.relative_to(ROOT)),
        "semantic_verifier_sha256": sha256(VERIFIER_PATH),
        "transport_replay_conclusion": transport,
        "direct_membership_replay_conclusion": direct,
        "replayed_guard_conditions": expected_if_expressions,
        "both_positive_conclusions_replayed": True,
    }


def audit_fixtures() -> dict[str, Any]:
    fixture_audit = load_module("unique4_complete_radius_fixture_audit", FIXTURE_AUDIT_PATH)
    payload = fixture_audit.generate()
    records = payload["records"]
    if [record["profile"] for record in records] != [4, 5]:
        raise AssertionError("obsolete fixture profile set drift")
    if [record["certificate_count"] for record in records] != [1, 1]:
        raise AssertionError("obsolete fixture certificate counts drift")
    for record in records:
        certificate = record["lexicographically_first_certificate"]
        if certificate["recorded_fixture_membership"]:
            raise AssertionError("obsolete fixture no longer records the forced omission")
        if certificate["forced_conclusion"]["membership"] is not True:
            raise AssertionError("obsolete fixture conclusion polarity drift")
    if not payload["all_counterpatterns_rejected_by_complete_radius_triangle_closure"]:
        raise AssertionError("obsolete fixtures were not both rejected")
    return {
        "fixture_audit": str(FIXTURE_AUDIT_PATH.relative_to(ROOT)),
        "fixture_audit_sha256": sha256(FIXTURE_AUDIT_PATH),
        "profiles": [record["profile"] for record in records],
        "certificate_counts": [record["certificate_count"] for record in records],
        "fixture_sha256": {
            str(record["profile"]): record["fixture_sha256"] for record in records
        },
        "both_obsolete_fixtures_rejected": True,
    }


def audit_source_hash_bindings() -> dict[str, Any]:
    driver = load_module("unique4_curvature_cegar_hash_audit", CEGAR_DRIVER_PATH)
    bindings = driver.source_hash_bindings(KALMANSON_BANK)
    expected = {
        "outer_encoder": ENCODER_PATH,
        "semantic_verifier": VERIFIER_PATH,
        "complete_radius_mutual_triangle_producer": PRODUCER_PATH,
    }
    selected = {}
    for key, path in expected.items():
        record = bindings.get(key)
        if record is None:
            raise AssertionError(f"CEGAR source binding omits {key}")
        expected_path = str(path.resolve().relative_to(ROOT.resolve()))
        if record["path"] != expected_path or record["sha256"] != sha256(path):
            raise AssertionError(f"CEGAR source binding drift for {key}: {record}")
        selected[key] = record
    tree = ast.parse(CEGAR_DRIVER_PATH.read_text(encoding="utf-8"))
    manifest_binding_calls = 0
    for node in ast.walk(tree):
        if not isinstance(node, ast.Dict):
            continue
        for key, value in zip(node.keys, node.values, strict=True):
            if not isinstance(key, ast.Constant) or key.value != "source_hash_bindings":
                continue
            if (
                isinstance(value, ast.Call)
                and isinstance(value.func, ast.Name)
                and value.func.id == "source_hash_bindings"
            ):
                manifest_binding_calls += 1
    if manifest_binding_calls != 1:
        raise AssertionError(
            f"CEGAR manifest source_hash_bindings call count is {manifest_binding_calls}"
        )
    return {
        "cegar_driver": str(CEGAR_DRIVER_PATH.relative_to(ROOT)),
        "cegar_driver_sha256": sha256(CEGAR_DRIVER_PATH),
        "checked_bindings": selected,
        "manifest_source_binding_call_count": manifest_binding_calls,
        "encoder_verifier_and_kernel_producer_hash_bound": True,
    }


def generate() -> dict[str, Any]:
    encoder = load_module("unique4_complete_radius_encoder_audit", ENCODER_PATH)
    return {
        "schema": "p97-unique4-complete-radius-encoding-regression-v1",
        "epistemic_status": "DETERMINISTIC_EXHAUSTIVE_BOOLEAN_AND_FIXTURE_REPLAY",
        "claim_scope": (
            "The two named CNF clause families, their encoded support-lock kernel, "
            "the independent semantic verifier conclusions, and two stored n=11 fixtures; "
            "this is not Euclidean realization or arbitrary-cardinality coverage"
        ),
        "audit_source": str(Path(__file__).resolve().relative_to(ROOT.resolve())),
        "audit_source_sha256": sha256(Path(__file__).resolve()),
        "outer_encoder": str(ENCODER_PATH.relative_to(ROOT)),
        "outer_encoder_sha256": sha256(ENCODER_PATH),
        "kernel_producer": str(PRODUCER_PATH.relative_to(ROOT)),
        "kernel_producer_sha256": sha256(PRODUCER_PATH),
        "clauses": audit_clauses(encoder),
        "semantic_verifier": audit_verifier(),
        "obsolete_fixtures": audit_fixtures(),
        "source_hash_bindings": audit_source_hash_bindings(),
        "all_checks_passed": True,
    }


def atomic_write_json(path: Path, payload: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(f".{path.name}.tmp.{os.getpid()}")
    temporary.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    temporary.replace(path)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    current = generate()
    if args.check:
        recorded = json.loads(args.output.read_text(encoding="utf-8"))
        if recorded != current:
            raise SystemExit("FAIL: complete-radius encoding regression drift")
        print("PASS: complete-radius clause polarity, entailment, verifier, and fixtures")
        return
    atomic_write_json(args.output, current)
    print(
        json.dumps(
            {
                "transport_clauses": current["clauses"]["transport_clause_count"],
                "direct_clauses": current["clauses"]["direct_clause_count"],
                "fixtures": current["obsolete_fixtures"]["profiles"],
                "all_checks_passed": current["all_checks_passed"],
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
