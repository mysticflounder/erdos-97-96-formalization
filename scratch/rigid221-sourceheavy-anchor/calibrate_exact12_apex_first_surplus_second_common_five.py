"""Calibrate one proposed family against the frozen post-v16 parent.

This performs no SAT solve.  It materializes the already-authenticated v16
canary prefix, removes the clause-only arm and source-order suffixes, and
records exactly which positive-membership requirements are reused or fresh.
"""

from __future__ import annotations

import copy
import hashlib
import json
from pathlib import Path

from census.card_head.exact12_apex_first_surplus_second_common_five_membership_family_bank import (
    install_apex_first_surplus_second_common_five_membership_family_bank,
)
from census.card_head.exact12_next_row_arm_static_canary import (
    materialize_arm_static_canary,
)
from census.card_head.exact12_positive_membership_cnf import (
    SCHEMA as MEMBERSHIP_CNF_SCHEMA,
)
from census.card_head.exact12_positive_membership_cnf import normalize_memberships
from census.card_head.exact12_positive_membership_source_order_bank import _sha256_json
from census.card_head.exact12_v14_ordered_cut_adapter import (
    install_prepared_source_order_bank,
    prepare_proof_backed_source_order_bank,
)
from census.card_head.exact12_v14_source_order_bank import build_source_order_bank

REPO_ROOT = Path(__file__).resolve().parents[2]
OUTPUT_PATH = Path(__file__).with_name(
    "exact12_apex_first_surplus_second_common_five_calibration.json"
)

PARENT_VARIABLES = 45_247
PARENT_CLAUSES = 642_425
PARENT_DIMACS_SHA256 = (
    "d23b721936153e866afc6ca780b6829a8d3a9217e55f420fad9489baf1a7b7bb"
)


def roles() -> tuple[tuple[int, int, int], ...]:
    return tuple(
        (a, b, y)
        for a in (10, 11)
        for b in (3, 4, 5)
        for y in (6, 7, 8, 9)
    )


def patterns() -> tuple[tuple[dict[str, object], ...], ...]:
    return tuple(
        (
            {"center": 0, "support": [a, b]},
            {"center": y, "support": [a, b]},
            {"center": 1, "support": [0, b, y]},
        )
        for a, b, y in roles()
    )


def main() -> None:
    materialized = materialize_arm_static_canary(REPO_ROOT, arm_cell_index=6)
    instance = copy.deepcopy(materialized.instance)
    del instance.cnf.clauses[PARENT_CLAUSES:]
    parent_dimacs_sha256 = hashlib.sha256(instance.dimacs().encode("ascii")).hexdigest()
    assert instance.cnf.n_variables == PARENT_VARIABLES
    assert len(instance.cnf.clauses) == PARENT_CLAUSES
    assert parent_dimacs_sha256 == PARENT_DIMACS_SHA256

    installed_instance = copy.deepcopy(instance)
    source_order_attribute = "_proof_backed_source_order_bank_installation"
    if hasattr(installed_instance, source_order_attribute):
        delattr(installed_instance, source_order_attribute)
    family_bank = (
        install_apex_first_surplus_second_common_five_membership_family_bank(
            REPO_ROOT,
            installed_instance,
            materialized.layout,
            materialized.surplus_pair_second_opposite_apex_pair_common_five_family_bank,
            cell_index=6,
        )
    )
    for clause in materialized.arm_compiled.named_deletion_clause_delta:
        installed_instance.cnf.add_clause(clause)
    post_arm_dimacs_sha256 = hashlib.sha256(
        installed_instance.dimacs().encode("ascii")
    ).hexdigest()
    prepared = prepare_proof_backed_source_order_bank(
        installed_instance, build_source_order_bank(REPO_ROOT, installed_instance)
    )
    source_order_installation = install_prepared_source_order_bank(
        installed_instance, prepared
    )
    final_dimacs_sha256_after_suffixes = hashlib.sha256(
        installed_instance.dimacs().encode("ascii")
    ).hexdigest()

    normalized = tuple(normalize_memberships(12, choices) for choices in patterns())
    requirements = sorted({item for pattern in normalized for item in pattern})
    initial_variables = instance.cnf.n_variables
    initial_clauses = len(instance.cnf.clauses)
    variables: dict[tuple[int, tuple[int, ...]], int] = {}
    definitions: list[dict[str, object]] = []
    reused: list[dict[str, object]] = []
    for center, required in requirements:
        key = (center, frozenset(required))
        was_installed = key in instance.pattern_variables
        before = len(instance.cnf.clauses)
        variable = instance.pattern_variable(center, required)
        variables[(center, required)] = variable
        record = {
            "center": center,
            "required": list(required),
            "pattern_variable": variable,
        }
        if was_installed:
            reused.append(record)
            continue
        implications = tuple(instance.cnf.clauses[before:])
        candidate_indices = [
            index
            for index, candidate in enumerate(instance.candidates[center])
            if set(required) <= set(candidate)
        ]
        candidate_variables = tuple(
            instance.choice_variables[(center, index)] for index in candidate_indices
        )
        assert implications == tuple(
            (-choice_variable, variable) for choice_variable in candidate_variables
        )
        definitions.append(
            {
                **record,
                "candidate_indices": candidate_indices,
                "candidate_variables": list(candidate_variables),
                "implication_clauses": [list(clause) for clause in implications],
                "implication_clauses_sha256": _sha256_json(implications),
            }
        )

    entries: list[dict[str, object]] = []
    blocks: list[tuple[int, ...]] = []
    for index, pattern in enumerate(normalized):
        block = tuple(-variables[item] for item in pattern)
        instance.cnf.add_clause(block)
        blocks.append(block)
        requirements_payload = [
            {"center": center, "required": list(required)}
            for center, required in pattern
        ]
        entries.append(
            {
                "index": index,
                "requirements": requirements_payload,
                "requirements_sha256": _sha256_json(requirements_payload),
                "blocking_clause": list(block),
                "blocking_clause_sha256": _sha256_json(block),
            }
        )

    delta = tuple(instance.cnf.clauses[initial_clauses:])
    compiled = {
        "schema": MEMBERSHIP_CNF_SCHEMA,
        "pattern_keys": [
            [
                {"center": center, "required": list(required)}
                for center, required in pattern
            ]
            for pattern in normalized
        ],
        "pattern_definitions": definitions,
        "entries": entries,
        "initial_n_variables": initial_variables,
        "initial_n_clauses": initial_clauses,
        "final_n_variables": instance.cnf.n_variables,
        "final_n_clauses": len(instance.cnf.clauses),
        "delta_clauses": [list(clause) for clause in delta],
        "delta_sha256": _sha256_json(delta),
    }
    final_dimacs_sha256 = hashlib.sha256(instance.dimacs().encode("ascii")).hexdigest()
    compiled["final_dimacs_sha256"] = final_dimacs_sha256
    compiled["compiled_sha256"] = _sha256_json(compiled)
    role_payload = [{"a": a, "b": b, "y": y} for a, b, y in roles()]
    payload = {
        "schema": "p97_rigid221_exact12_apex_first_surplus_second_calibration.v1",
        "scope": "deterministic compiler calibration only; no SAT solve or closure claim",
        "parent": {
            "n_variables": PARENT_VARIABLES,
            "n_clauses": PARENT_CLAUSES,
            "dimacs_sha256": parent_dimacs_sha256,
            "bank_sha256": materialized.surplus_pair_second_opposite_apex_pair_common_five_family_bank[
                "bank_sha256"
            ],
        },
        "roles": role_payload,
        "roles_sha256": _sha256_json(role_payload),
        "logical_requirement_count": len(requirements),
        "reused_requirements": reused,
        "fresh_requirements": [
            {
                "center": definition["center"],
                "required": definition["required"],
                "pattern_variable": definition["pattern_variable"],
            }
            for definition in definitions
        ],
        "duplicate_block_count": len(blocks) - len(set(blocks)),
        "compiled": compiled,
        "authenticated_family_bank": family_bank,
        "downstream": {
            "post_arm_variables": installed_instance.cnf.n_variables,
            "post_arm_clauses": PARENT_CLAUSES
            + (compiled["final_n_clauses"] - PARENT_CLAUSES)
            + len(materialized.arm_compiled.named_deletion_clause_delta),
            "post_arm_dimacs_sha256": post_arm_dimacs_sha256,
            "source_order_clauses": len(prepared.entries),
            "source_order_bank_sha256": prepared.bank_sha256,
            "source_order_installation": source_order_installation,
            "final_variables": installed_instance.cnf.n_variables,
            "final_clauses": len(installed_instance.cnf.clauses),
            "final_dimacs_sha256": final_dimacs_sha256_after_suffixes,
        },
    }
    OUTPUT_PATH.write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(
        json.dumps(
            {
                "output": str(OUTPUT_PATH.relative_to(REPO_ROOT)),
                "roles": len(role_payload),
                "requirements": len(requirements),
                "reused": len(reused),
                "fresh": len(definitions),
                "final_variables": instance.cnf.n_variables,
                "final_clauses": len(instance.cnf.clauses),
                "delta_sha256": compiled["delta_sha256"],
                "final_dimacs_sha256": final_dimacs_sha256,
                "compiled_sha256": compiled["compiled_sha256"],
                "bank_sha256": family_bank["bank_sha256"],
                "post_arm_dimacs_sha256": post_arm_dimacs_sha256,
                "source_order_bank_sha256": prepared.bank_sha256,
                "final_dimacs_sha256_after_suffixes": (
                    final_dimacs_sha256_after_suffixes
                ),
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
