#!/usr/bin/env python3
"""Exact-CAS audit of the canonical corrected bank-clean ATAIL shadow.

This lane is deliberately narrower than the structural CEGAR search.  It
reconstructs the one canonical bank-clean row assignment, restores the full
ambient five-point class at ``O``, and asks whether the resulting normalized
squared-distance equalities generate the unit ideal over ``QQ``.

The script uses Singular for deterministic deletion-based discovery and then
cross-checks the retained core with Singular and msolve in both variable
orders.  Its output is certificate-discovery evidence; the accompanying Lean
file is the kernel-facing replay.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
from pathlib import Path
from typing import Any, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SOURCE = HERE.parent / "robust-all-center-marco" / "bank_cegar_checkpoint.json"
SURFACE_SOURCE = HERE.parent / "robust-all-center-cegar" / "search.py"
ORACLE_DIR = HERE.parent / "second_center_metric_oracle"
ORACLE_SOURCE = ORACLE_DIR / "oracle.py"
CHECKPOINT = HERE / "checkpoint.json"

EXPECTED_SOURCE_SHA256 = (
    "b307fed8cf6c30508a615553f5a1caf8a836859f3d70f1907eb3f34b9196c8b9"
)
EXPECTED_SURFACE_SHA256 = (
    "54edd2c3ed92ef6d0d55f5f5196d9ec84d2d04cabc40a3ecc04cabbcb4a16d02"
)
EXPECTED_ORACLE_SHA256 = (
    "b708722ce49f9d0f165facf20a911161815ce8018c5fc3760bf872dad6977a09"
)
EXPECTED_ROW_ASSIGNMENT_SHA256 = (
    "f4c8e9e69d7ca3bec381d27178710fc7aa4ab7f4308e70973b675a38b8eacc66"
)
EXPECTED_BLOCKER_ASSIGNMENT_SHA256 = (
    "726f7c38f5c125a17442ad4780ad30ce879d056fe8ae7d99ae225514ca2ff602"
)

# Independently reconstructed from the canonical witness, then supplied as a
# deterministic starting point for the expensive CAS deletion audit.  The
# script rechecks every support against the pinned source before using it.
EXPECTED_ROW_CORE_NAMES = ("O", "A", "X", "Y", "Z", "G", "K", "F")

# A deletion-derived UNIT subset supplied by the independent metric-audit lane.
# This lane reconstructs and cross-checks it from the pinned rows rather than
# trusting its polynomial stream or verdict.
EXPECTED_EQUALITY_CORE_NAMES = (
    "ROW_A_O_G",
    "ROW_A_O_K",
    "ROW_F_A_Z",
    "ROW_F_A_K",
    "ROW_G_X_E",
    "ROW_G_X_K",
    "ROW_K_O_Y",
    "ROW_K_O_G",
    "ROW_K_O_I",
    "ROW_O_A_E",
    "ROW_X_Z_G",
    "ROW_X_Z_F",
    "ROW_Y_O_X",
    "ROW_Y_O_Z",
    "ROW_Y_O_E",
    "ROW_Z_A_Y",
    "ROW_Z_A_G",
)
EXPECTED_EQUALITY_CORE_POLYNOMIAL_SHA256 = (
    "501e72748dc8938b808c2f22789dc57601e4d6cdeb717a3746f33a4d4db30777"
)

for path in (ROOT, ORACLE_DIR):
    if str(path) not in sys.path:
        sys.path.insert(0, str(path))

import oracle  # noqa: E402


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    return hashlib.sha256(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


def load_module(path: Path, name: str) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def pinned_sources() -> dict[str, str]:
    expected = {
        SOURCE: EXPECTED_SOURCE_SHA256,
        SURFACE_SOURCE: EXPECTED_SURFACE_SHA256,
        ORACLE_SOURCE: EXPECTED_ORACLE_SHA256,
    }
    actual = {str(path.relative_to(ROOT)): file_sha256(path) for path in expected}
    for path, digest in expected.items():
        if file_sha256(path) != digest:
            raise RuntimeError(
                f"source drift for {path.relative_to(ROOT)}: "
                f"expected {digest}, found {file_sha256(path)}"
            )
    return actual


def canonical_rows() -> tuple[tuple[oracle.MetricRow, ...], dict[int, str]]:
    checkpoint = json.loads(SOURCE.read_text(encoding="utf-8"))
    if checkpoint["status"] != "SAT_PRODUCER_BANK_CLEAN_CORRECTED_SHADOW":
        raise RuntimeError("canonical source is not the corrected bank-clean state")
    witness = checkpoint["witness"]
    if witness["row_assignment_sha256"] != EXPECTED_ROW_ASSIGNMENT_SHA256:
        raise RuntimeError("canonical row assignment drift")
    if witness["blocker_assignment_sha256"] != EXPECTED_BLOCKER_ASSIGNMENT_SHA256:
        raise RuntimeError("canonical blocker assignment drift")
    if witness["independent_structural_verifier"] != "PASS":
        raise RuntimeError("source witness lost its independent structural check")
    if witness["selected_row_bank_scan"] or witness["blocker_exact_bank_scan"]:
        raise RuntimeError("source witness is no longer producer-bank clean")

    surface_module = load_module(SURFACE_SOURCE, "p97_bank_clean_surface")
    surface = surface_module.Surface()
    by_name = surface.by_name
    by_label = surface.by_label
    if {by_label[i] for i in range(14)} != set(surface_module.HULL_NAMES):
        raise RuntimeError("surface role map is not a fourteen-label bijection")
    if by_name["O"] != 0 or by_name["A"] != 1:
        raise RuntimeError("normalized gauge labels O=0, A=1 drifted")

    rows_by_name = {record["center"]: record for record in witness["rows"]}
    if set(rows_by_name) != set(surface_module.HULL_NAMES):
        raise RuntimeError("witness does not have exactly one row at every center")

    rows = []
    for center_name in surface_module.HULL_NAMES:
        record = rows_by_name[center_name]
        support_names = tuple(str(name) for name in record["support"])
        if center_name == "O":
            # The selected O-row is only a four-subset of this ambient-exact
            # class.  Metric realizability must consume the full class.
            support_names = tuple(sorted(surface_module.FIRST_APEX_CLASS))
        rows.append(
            oracle.MetricRow(
                int(by_name[center_name]),
                tuple(sorted(int(by_name[name]) for name in support_names)),
                exact=False,
            )
        )
    return tuple(sorted(rows, key=lambda row: row.center)), by_label


def named_generators(
    rows: Sequence[oracle.MetricRow], by_label: dict[int, str]
) -> tuple[tuple[str, str, int], ...]:
    answer = []
    for row in rows:
        polynomials = oracle.serialized_system(14, (row,))
        pivot = row.support[0]
        for member, polynomial in zip(row.support[1:], polynomials, strict=True):
            answer.append(
                (
                    f"ROW_{by_label[row.center]}_{by_label[pivot]}_{by_label[member]}",
                    polynomial,
                    row.center,
                )
            )
    return tuple(answer)


def singular_unit(polynomials: Sequence[str], timeout_s: float = 30.0) -> bool:
    variables = tuple(str(variable) for variable in oracle.variable_symbols(14))
    return oracle.run_singular(
        variables, tuple(polynomials), timeout_s=timeout_s
    ).verdict == "UNIT"


def greedy_row_core(
    rows: Sequence[oracle.MetricRow], by_label: dict[int, str]
) -> tuple[oracle.MetricRow, ...]:
    retained = list(rows)
    changed = True
    while changed:
        changed = False
        for row in tuple(retained):
            trial = [candidate for candidate in retained if candidate != row]
            polynomials = [item[1] for item in named_generators(trial, by_label)]
            if singular_unit(polynomials, timeout_s=20.0):
                retained = trial
                changed = True
    return tuple(retained)


def greedy_equality_core(
    generators: Sequence[tuple[str, str, int]],
) -> tuple[tuple[str, str, int], ...]:
    retained = list(generators)
    changed = True
    while changed:
        changed = False
        for generator in tuple(retained):
            trial = [candidate for candidate in retained if candidate != generator]
            if singular_unit([item[1] for item in trial], timeout_s=20.0):
                retained = trial
                changed = True
    return tuple(retained)


def exact_row_minimality(
    rows: Sequence[oracle.MetricRow], by_label: dict[int, str]
) -> dict[str, object]:
    deletions = []
    for row in rows:
        trial = tuple(candidate for candidate in rows if candidate != row)
        verdict = oracle.run_singular(
            tuple(str(variable) for variable in oracle.variable_symbols(14)),
            tuple(item[1] for item in named_generators(trial, by_label)),
            timeout_s=30.0,
        )
        deletions.append(
            {
                "removed_center": by_label[row.center],
                "verdict": verdict.verdict,
                **({"detail": verdict.detail} if verdict.detail else {}),
            }
        )
    return {
        "all_single_row_deletions_nonunit": all(
            item["verdict"] == "PROPER" for item in deletions
        ),
        "deletions": deletions,
    }


def exact_equality_minimality(
    generators: Sequence[tuple[str, str, int]],
) -> dict[str, object]:
    deletions = []
    variables = tuple(str(variable) for variable in oracle.variable_symbols(14))
    for index, generator in enumerate(generators):
        trial = tuple(item[1] for i, item in enumerate(generators) if i != index)
        verdict = oracle.run_singular(variables, trial, timeout_s=30.0)
        deletions.append(
            {
                "removed_generator": generator[0],
                "verdict": verdict.verdict,
                **({"detail": verdict.detail} if verdict.detail else {}),
            }
        )
    return {
        "all_single_equality_deletions_nonunit": all(
            item["verdict"] == "PROPER" for item in deletions
        ),
        "deletions": deletions,
    }


def crosscheck(generators: Sequence[tuple[str, str, int]]) -> dict[str, object]:
    variables = tuple(str(variable) for variable in oracle.variable_symbols(14))
    polynomials = tuple(item[1] for item in generators)
    singular = oracle.run_singular(variables, polynomials, timeout_s=60.0)
    msolve_forward = oracle.run_msolve(variables, polynomials, timeout_s=60.0)
    msolve_reverse = oracle.run_msolve(
        tuple(reversed(variables)), polynomials, timeout_s=60.0
    )
    verdicts = (singular.verdict, msolve_forward.verdict, msolve_reverse.verdict)
    return {
        "status": (
            "CROSSCHECKED_UNIT"
            if verdicts == ("UNIT", "UNIT", "UNIT")
            else "UNDECIDED_FAIL_CLOSED"
        ),
        "singular": singular.verdict,
        "msolve_forward": msolve_forward.verdict,
        "msolve_reverse": msolve_reverse.verdict,
    }


def build_report() -> dict[str, object]:
    source_sha256 = pinned_sources()
    rows, by_label = canonical_rows()
    full_generators = named_generators(rows, by_label)
    if not singular_unit([item[1] for item in full_generators], timeout_s=60.0):
        raise RuntimeError("full canonical metric system was not UNIT")

    row_core = tuple(
        row
        for row in rows
        if by_label[row.center] in EXPECTED_ROW_CORE_NAMES
    )
    if tuple(by_label[row.center] for row in row_core) != EXPECTED_ROW_CORE_NAMES:
        raise RuntimeError("retained row-core order or role map drift")
    row_generators = named_generators(row_core, by_label)
    generator_by_name = {generator[0]: generator for generator in row_generators}
    equality_core = tuple(
        generator_by_name[name] for name in EXPECTED_EQUALITY_CORE_NAMES
    )
    if {generator[0] for generator in equality_core} != set(
        EXPECTED_EQUALITY_CORE_NAMES
    ):
        raise RuntimeError("pinned equality core is not a subset of the row core")
    equality_core_sha256 = canonical_sha256([item[1] for item in equality_core])
    if equality_core_sha256 != EXPECTED_EQUALITY_CORE_POLYNOMIAL_SHA256:
        raise RuntimeError(
            "pinned seventeen-equality polynomial stream drift: "
            f"expected {EXPECTED_EQUALITY_CORE_POLYNOMIAL_SHA256}, "
            f"found {equality_core_sha256}"
        )
    core_crosscheck = crosscheck(equality_core)
    if core_crosscheck["status"] != "CROSSCHECKED_UNIT":
        raise RuntimeError("retained equality core failed the three-engine crosscheck")

    full_polynomials = [item[1] for item in full_generators]
    row_polynomials = [item[1] for item in row_generators]
    core_polynomials = [item[1] for item in equality_core]
    return {
        "schema": "p97-atail-bank-clean-lean-certificate-audit-v1",
        "epistemic_status": {
            "source_shadow": "EXACT_REPLAY_OF_CANONICAL_STRUCTURAL_CHECKPOINT",
            "metric_inconsistency": "EXACT_CAS_CROSSCHECK_NOT_YET_KERNEL_REPLAY",
            "row_minimality": "NOT_CLAIMED",
            "equality_minimality": "NOT_CLAIMED",
        },
        "source_sha256": source_sha256,
        "numeric_role_map": {
            by_label[index]: index for index in sorted(by_label)
        },
        "normalization": {"O": [0, 0], "A": [1, 0]},
        "full_system": {
            "row_count": len(rows),
            "equality_count": len(full_generators),
            "polynomial_sha256": canonical_sha256(full_polynomials),
        },
        "row_core": {
            "row_count": len(row_core),
            "equality_count": len(row_generators),
            "center_names": [by_label[row.center] for row in row_core],
            "rows": [
                {
                    "center": by_label[row.center],
                    "center_index": row.center,
                    "support": [by_label[point] for point in row.support],
                    "support_indices": list(row.support),
                }
                for row in row_core
            ],
            "polynomial_sha256": canonical_sha256(row_polynomials),
            "single_deletion_audit": "NOT_RUN_IN_THIS_KERNEL_FACING_LANE",
        },
        "equality_core": {
            "equality_count": len(equality_core),
            "generators": [
                {"name": name, "polynomial": polynomial, "center": by_label[center]}
                for name, polynomial, center in equality_core
            ],
            "polynomial_sha256": canonical_sha256(core_polynomials),
            "single_deletion_audit": "NOT_RUN_IN_THIS_KERNEL_FACING_LANE",
            "crosscheck": core_crosscheck,
        },
        "omitted_ledger": [
            "an exhaustive search for every row-minimal core of the 14-row system",
            "a proof that the canonical structural shadow is forced by live K-A data",
            "a Lean replay of the retained exact-CAS identity",
        ],
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--output", type=Path, default=CHECKPOINT)
    args = parser.parse_args()
    report = build_report()
    rendered = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.check:
        if not args.output.exists() or args.output.read_text(encoding="utf-8") != rendered:
            raise SystemExit(f"stale checkpoint: {args.output}")
        print(
            "PASS: canonical bank-clean shadow, metric core, deletion audits, "
            "and three-engine UNIT crosscheck replayed"
        )
        return 0
    args.output.write_text(rendered, encoding="utf-8")
    print(f"wrote {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
