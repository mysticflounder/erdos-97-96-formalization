"""Discover the O6 all-order common-five bank identity pins.

Materializes the full 19-bank parent chain exactly the way the three-triad
test fixture does, then discovers every EXPECTED_* identity value for the
20th bank by overriding the module's placeholder pins in memory (no file is
edited).  The bank installs the REALIZABLE SUB-ORBIT of the full validated
orbit: roles whose three rows all have a candidate realization on the
frozen source-faithful surface.  Prints pre-filter and post-filter counts
prominently and writes discovery.json next to this script.
"""

from __future__ import annotations

import copy
import hashlib
import json
import sys
import time
from pathlib import Path

REPO_ROOT = Path.cwd().resolve()
sys.path.insert(0, str(REPO_ROOT))

OUT = Path(__file__).with_name("discovery.json")

import census.card_head.exact12_all_order_common_five_membership_family_bank as bank_module
from census.card_head.exact12_positive_membership_source_order_bank import _sha256_json
from census.card_head.exact12_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank import (
    install_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank,
)
from census.card_head.tests.test_exact12_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank import (
    _parent as _three_triad_test_parent,
)


def log(message: str) -> None:
    print(f"[{time.strftime('%H:%M:%S')}] {message}", flush=True)


def main() -> None:
    start = time.time()
    log("materializing 19-bank parent chain (three-triad test fixture)...")
    instance, layout, v22_bank = _three_triad_test_parent()
    log(f"chain through v22 installed ({time.time() - start:.0f}s); installing three-triad bank...")
    parent_bank = install_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank(
        REPO_ROOT, instance, layout, v22_bank, cell_index=6
    )
    log(f"parent chain complete ({time.time() - start:.0f}s)")

    parent_dimacs = hashlib.sha256(instance.dimacs().encode("ascii")).hexdigest()
    log(
        f"parent identity: variables={instance.cnf.n_variables} "
        f"clauses={len(instance.cnf.clauses)} dimacs={parent_dimacs}"
    )
    assert instance.cnf.n_variables == 45_489
    assert len(instance.cnf.clauses) == 646_103
    assert parent_dimacs == bank_module.EXPECTED_PARENT_DIMACS_SHA256
    assert parent_bank["bank_sha256"] == bank_module.EXPECTED_PARENT_BANK_SHA256

    log("aligning candidate surface (candidate_rows vs instance)...")
    assert all(
        tuple(instance.candidates[center]) == bank_module.candidate_rows(center)
        for center in range(12)
    ), "candidate_rows does not match the live instance candidate surface"

    log("discovering the realizable sub-orbit count...")
    try:
        bank_module.family_roles()
    except bank_module.Exact12AllOrderCommonFiveMembershipFamilyBankError as exc:
        message = str(exc)
        if "dominant core" in message:
            raise
        if "realizable sub-orbit drifted" not in message:
            raise
        observed = int(message.rsplit("observed ", 1)[1])
        bank_module.EXPECTED_ROLE_COUNT = observed
        bank_module.EXPECTED_PATTERN_COUNT = observed
        bank_module._family_roles.cache_clear()
    roles = bank_module.family_roles()
    assert bank_module.DOMINANT_CORE in roles
    log(
        f"PRE-FILTER full orbit: {bank_module.EXPECTED_FULL_ORBIT_ROLE_COUNT} roles / "
        f"{bank_module.EXPECTED_FULL_ORBIT_REQUIREMENT_COUNT} rows "
        f"({bank_module.EXPECTED_FULL_ORBIT_PAIR_ROW_COUNT} pair + "
        f"{bank_module.EXPECTED_FULL_ORBIT_TRIPLE_ROW_COUNT} triple)"
    )
    log(
        f"POST-FILTER realizable sub-orbit: {len(roles)} roles "
        f"({bank_module.EXPECTED_FULL_ORBIT_ROLE_COUNT - len(roles)} dropped); "
        f"dominant core {bank_module.DOMINANT_CORE} SURVIVES"
    )

    roles_payload = [
        {"a": a, "b": b, "c": c, "x": x, "y": y} for a, b, c, x, y in roles
    ]
    roles_sha256 = _sha256_json(roles_payload)
    requirements = bank_module._all_requirements()
    pair_count = sum(1 for _c, req in requirements if len(req) == 2)
    triple_count = sum(1 for _c, req in requirements if len(req) == 3)
    log(
        f"POST-FILTER requirements: {len(requirements)} = "
        f"{pair_count} pair + {triple_count} triple"
    )

    reused_bindings = tuple(
        ((center, required), instance.pattern_variables[(center, frozenset(required))])
        for center, required in requirements
        if (center, frozenset(required)) in instance.pattern_variables
    )
    reused_count = len(reused_bindings)
    fresh_count = len(requirements) - reused_count
    log(
        f"POST-FILTER split: reused={reused_count} fresh={fresh_count} "
        f"(fresh variables 45,490..{45_489 + fresh_count})"
    )

    bank_module.EXPECTED_ROLES_SHA256 = roles_sha256
    bank_module.EXPECTED_LOGICAL_REQUIREMENT_COUNT = len(requirements)
    bank_module.EXPECTED_PAIR_REQUIREMENT_COUNT = pair_count
    bank_module.EXPECTED_TRIPLE_REQUIREMENT_COUNT = triple_count
    bank_module.EXPECTED_DEFINITION_COUNT = len(requirements)
    bank_module.EXPECTED_REUSED_REQUIREMENT_BINDINGS = reused_bindings
    bank_module.EXPECTED_REUSED_REQUIREMENTS = tuple(r for r, _v in reused_bindings)
    bank_module.EXPECTED_REUSED_PATTERN_VARIABLES = tuple(v for _r, v in reused_bindings)
    bank_module.EXPECTED_REUSED_REQUIREMENT_COUNT = reused_count
    bank_module.EXPECTED_FRESH_REQUIREMENT_COUNT = fresh_count
    bank_module.EXPECTED_FRESH_PATTERN_VARIABLES = tuple(
        range(45_490, 45_490 + fresh_count)
    )

    log("running module _compile on a deep copy...")
    working = copy.deepcopy(instance)
    compiled = bank_module._compile(working)
    final_dimacs = hashlib.sha256(working.dimacs().encode("ascii")).hexdigest()
    implication_count = sum(
        len(d["implication_clauses"]) for d in compiled["pattern_definitions"]
    )
    block_count = len(compiled["entries"])
    log(
        f"compiled: final_vars={compiled['final_n_variables']} "
        f"final_clauses={compiled['final_n_clauses']} "
        f"delta={len(compiled['delta_clauses'])} "
        f"(implications={implication_count} blocks={block_count}) "
        f"delta_sha={compiled['delta_sha256']} dimacs={final_dimacs}"
    )

    bank_module.EXPECTED_FINAL_VARIABLES = compiled["final_n_variables"]
    bank_module.EXPECTED_FINAL_CLAUSES = compiled["final_n_clauses"]
    bank_module.EXPECTED_FINAL_DIMACS_SHA256 = final_dimacs
    bank_module.EXPECTED_DELTA_SHA256 = compiled["delta_sha256"]
    compiled_with = dict(compiled)
    compiled_with["final_dimacs_sha256"] = final_dimacs
    compiled_sha = _sha256_json(compiled_with)
    bank_module.EXPECTED_COMPILED_SHA256 = compiled_sha
    log(f"compiled_sha256={compiled_sha}")

    log("running build_ to discover the bank sha...")
    try:
        bank = bank_module.build_all_order_common_five_membership_family_bank(
            REPO_ROOT, instance, layout, parent_bank, cell_index=6
        )
    except bank_module.Exact12AllOrderCommonFiveMembershipFamilyBankError as exc:
        message = str(exc)
        if "bank hash drifted" not in message:
            raise
        observed = message.rsplit("observed ", 1)[1].strip()
        assert len(observed) == 64, observed
        bank_module.EXPECTED_BANK_SHA256 = observed
        log(f"bank_sha256={observed}; rebuilding with the discovered pin...")
        bank = bank_module.build_all_order_common_five_membership_family_bank(
            REPO_ROOT, instance, layout, parent_bank, cell_index=6
        )
    log(f"build green ({time.time() - start:.0f}s); validating...")
    bank_module.validate_all_order_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, parent_bank, bank, cell_index=6
    )
    log(f"validate green ({time.time() - start:.0f}s); installing...")
    installed_bank = bank_module.install_all_order_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, parent_bank, cell_index=6
    )
    assert installed_bank["bank_sha256"] == bank["bank_sha256"]
    assert instance.cnf.n_variables == compiled["final_n_variables"]
    assert len(instance.cnf.clauses) == compiled["final_n_clauses"]
    log(f"install green ({time.time() - start:.0f}s)")

    patterns = bank_module.family_patterns()
    discovery = {
        "full_orbit_role_count": bank_module.EXPECTED_FULL_ORBIT_ROLE_COUNT,
        "full_orbit_requirement_count": bank_module.EXPECTED_FULL_ORBIT_REQUIREMENT_COUNT,
        "full_orbit_pair_row_count": bank_module.EXPECTED_FULL_ORBIT_PAIR_ROW_COUNT,
        "full_orbit_triple_row_count": bank_module.EXPECTED_FULL_ORBIT_TRIPLE_ROW_COUNT,
        "dominant_core_survives": bank_module.DOMINANT_CORE in roles,
        "role_count": len(roles),
        "dropped_role_count": bank_module.EXPECTED_FULL_ORBIT_ROLE_COUNT - len(roles),
        "first_role": list(roles[0]),
        "last_role": list(roles[-1]),
        "first_pattern": list(patterns[0]),
        "last_pattern": list(patterns[-1]),
        "roles_sha256": roles_sha256,
        "requirement_count": len(requirements),
        "pair_requirement_count": pair_count,
        "triple_requirement_count": triple_count,
        "reused_requirement_count": reused_count,
        "fresh_requirement_count": fresh_count,
        "reused_requirement_bindings": [
            [[center, list(required)], variable]
            for (center, required), variable in reused_bindings
        ],
        "fresh_variable_min": 45_490 if fresh_count else None,
        "fresh_variable_max": 45_489 + fresh_count if fresh_count else None,
        "final_n_variables": compiled["final_n_variables"],
        "final_n_clauses": compiled["final_n_clauses"],
        "delta_clause_count": len(compiled["delta_clauses"]),
        "implication_clause_count": implication_count,
        "block_clause_count": block_count,
        "delta_sha256": compiled["delta_sha256"],
        "final_dimacs_sha256": final_dimacs,
        "compiled_sha256": compiled_sha,
        "bank_sha256": bank["bank_sha256"],
        "elapsed_seconds": round(time.time() - start, 1),
    }
    OUT.write_text(json.dumps(discovery, indent=2) + "\n", encoding="utf-8")
    log(f"wrote {OUT}")
    log("DISCOVERY COMPLETE")


if __name__ == "__main__":
    main()
