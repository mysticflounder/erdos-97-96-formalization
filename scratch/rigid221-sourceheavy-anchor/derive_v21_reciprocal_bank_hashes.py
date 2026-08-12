"""One-shot hash derivation for the post-v20 reciprocal common-five bank."""

from __future__ import annotations

import copy
import hashlib
import json
from pathlib import Path

from census.card_head.exact12_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank import (
    build_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank,
    install_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank,
)
from census.card_head.exact12_next_row_arm_static_canary import (
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    arm_cells,
    build_model,
    build_source_order_bank,
    compile_arm_cell,
    install_prepared_source_order_bank,
    prepare_proof_backed_source_order_bank,
)
from census.card_head.exact12_positive_membership_source_order_bank import (
    _sha256_json,
    _source_record,
)
from census.card_head.exact12_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank import (
    BANK_SCHEMA,
    EXPECTED_PARENT_CLAUSES,
    SEMANTIC_STATUS,
    _compile,
    _parent_record,
    _source_paths,
    family_patterns,
    family_roles,
    production_family_id_for_cell,
)
from census.card_head.source_faithful_candidate_surface import (
    SourceFaithfulCoverInstance,
)
from census.card_head.tests.test_exact12_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank import (
    _parent as _v20_parent,
)


def main() -> None:
    repo_root = Path(__file__).resolve().parents[2]
    instance, layout, v19_parent = _v20_parent()
    parent_bank = (
        build_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank(
            repo_root, instance, layout, v19_parent, cell_index=6
        )
    )
    install_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank(
        repo_root, instance, layout, v19_parent, cell_index=6
    )
    assert len(instance.cnf.clauses) == EXPECTED_PARENT_CLAUSES

    parent_body = dict(parent_bank)
    parent_bank_sha256 = parent_body.pop("bank_sha256", None)
    parent_diagnostics = {
        "bank_sha256": parent_bank_sha256,
        "recomputed_bank_sha256": _sha256_json(parent_body),
        "n_variables": instance.cnf.n_variables,
        "n_clauses": len(instance.cnf.clauses),
        "dimacs_sha256": hashlib.sha256(
            instance.dimacs().encode("ascii")
        ).hexdigest(),
        "installed": bool(
            getattr(
                instance,
                "_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank_installed",
                False,
            )
        ),
    }
    print(json.dumps({"parent": parent_diagnostics}, sort_keys=True))
    parent_record = _parent_record(instance, layout, parent_bank)

    compiled = _compile(instance)
    prefix_variables = instance.cnf.n_variables
    prefix_clauses = len(instance.cnf.clauses)
    prefix_dimacs_sha256 = hashlib.sha256(
        instance.dimacs().encode("ascii")
    ).hexdigest()
    compiled["final_dimacs_sha256"] = prefix_dimacs_sha256
    compiled["compiled_sha256"] = _sha256_json(compiled)

    roles = [
        {"a": a, "x": x, "c": c}
        for a, x, c in family_roles()
    ]
    roles_sha256 = _sha256_json(roles)
    body = {
        "schema": BANK_SCHEMA,
        "family_id": production_family_id_for_cell(6),
        "cell_index": 6,
        "semantic_status": SEMANTIC_STATUS,
        "claims": {
            "terminal_unsat": False,
            "lean_terminal_ingress_ready": False,
            "aggregate_placement_coverage": False,
            "universal_lift": False,
            "live_theorem_closure": False,
        },
        "parent_apex_first_opposite_shared_pair_surplus_common_five_bank": parent_record,
        "apex_first_opposite_shared_pair_surplus_common_five_bank": (
            copy.deepcopy(dict(parent_bank))
        ),
        "roles": roles,
        "roles_sha256": roles_sha256,
        "patterns": [list(pattern) for pattern in family_patterns()],
        "entries": copy.deepcopy(compiled["entries"]),
        "compiled": compiled,
        "reused_requirement_count": 6,
        "source_manifest": [
            _source_record(repo_root, path) for path in _source_paths(repo_root)
        ],
    }

    arm_instance = SourceFaithfulCoverInstance(
        build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
    )
    arm_compiled = compile_arm_cell(arm_instance, arm_cells()[6])
    for clause in arm_compiled.named_deletion_clause_delta:
        instance.cnf.add_clause(clause)
    post_arm_dimacs_sha256 = hashlib.sha256(
        instance.dimacs().encode("ascii")
    ).hexdigest()
    prepared = prepare_proof_backed_source_order_bank(
        instance, build_source_order_bank(repo_root, instance)
    )
    source_order_bank = prepared.snapshot()
    installation = install_prepared_source_order_bank(instance, prepared)
    final_dimacs_after_source_order_sha256 = hashlib.sha256(
        instance.dimacs().encode("ascii")
    ).hexdigest()
    print(
        json.dumps(
            {
                "prefix_variables": prefix_variables,
                "prefix_clauses": prefix_clauses,
                "prefix_dimacs_sha256": prefix_dimacs_sha256,
                "delta_sha256": compiled["delta_sha256"],
                "compiled_sha256": compiled["compiled_sha256"],
                "roles_sha256": roles_sha256,
                "bank_sha256": _sha256_json(body),
                "post_arm_clauses": len(instance.cnf.clauses)
                - len(source_order_bank["entries"]),
                "post_arm_dimacs_sha256": post_arm_dimacs_sha256,
                "source_order_bank_sha256": source_order_bank["bank_sha256"],
                "source_order_installation_sha256": _sha256_json(installation),
                "final_after_source_order_clauses": len(instance.cnf.clauses),
                "final_after_source_order_dimacs_sha256": (
                    final_dimacs_after_source_order_sha256
                ),
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
