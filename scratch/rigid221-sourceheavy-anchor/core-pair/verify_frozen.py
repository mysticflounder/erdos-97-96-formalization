"""Verify the frozen O8 bank pins and export the core-pair generator payload.

Materializes the 21-bank parent chain the same way the center-exchange test
fixture does (that fixture's ``_parent`` gives the chain through the installed
all-order bank; installing the center-exchange bank on top of it is the frozen
parent of this family), then runs the frozen twenty-second-bank module's
build + validate + install with no in-memory overrides.  Every EXPECTED_* pin
that is frozen must match a live observation; the deliberately unfrozen pins
(``pending_pin_names()`` plus ``EXPECTED_BANK_SHA256``, which is ``None``
because the generated Lean CNF module does not exist yet) are skipped and
reported by name.  Writes mixed-extension-probe.json with the exact key
structure of the v24/v25 probes: {compiled, family_roles,
family_roles_sha256, probe_sha256, source_commit}.
"""

from __future__ import annotations

import hashlib
import itertools
import json
import subprocess
import sys
import time
from pathlib import Path

REPO_ROOT = Path.cwd().resolve()
sys.path.insert(0, str(REPO_ROOT))

OUT = Path(__file__).with_name("mixed-extension-probe.json")

import census.card_head.exact12_core_pair_all_order_common_five_membership_family_bank as bank_module
from census.card_head.exact12_center_exchange_all_order_common_five_membership_family_bank import (
    install_center_exchange_all_order_common_five_membership_family_bank,
)
from census.card_head.exact12_positive_membership_source_order_bank import _sha256_json
from census.card_head.tests.test_exact12_center_exchange_all_order_common_five_membership_family_bank import (
    _parent as _center_exchange_test_parent,
)


def log(message: str) -> None:
    print(f"[{time.strftime('%H:%M:%S')}] {message}", flush=True)


def reenumerate_orbit() -> dict[str, int]:
    """Independent re-enumeration of the orbit pins (never calls family_roles)."""

    side_conditions = 0
    admissible = 0
    single_core = 0
    delta: list[tuple[int, int, int, int, int]] = []
    for role in itertools.product(range(12), repeat=5):
        if not bank_module._pair_side_conditions(role):
            continue
        side_conditions += 1
        if not bank_module._admissible_core_pair(role):
            continue
        admissible += 1
        a, b, c, x, y = role
        pa, pb, pc, px, py = bank_module.partner_role(role)
        if bank_module._admissible_center_exchange(
            a, x, b, c, y
        ) or bank_module._admissible_center_exchange(pa, px, pb, pc, py):
            single_core += 1
            continue
        delta.append(role)
    pair_rows: set[tuple[int, tuple[int, ...]]] = set()
    triple_rows: set[tuple[int, tuple[int, ...]]] = set()
    for role in delta:
        for center, required in bank_module._union_rows(role):
            ordered = tuple(sorted(required))
            if len(ordered) == 2:
                pair_rows.add((center, ordered))
            else:
                triple_rows.add((center, ordered))
    return {
        "EXPECTED_PAIR_SIDE_CONDITION_ROLE_COUNT": side_conditions,
        "EXPECTED_PAIR_ADMISSIBLE_ROLE_COUNT": admissible,
        "EXPECTED_SINGLE_CORE_ADMITTED_ROLE_COUNT": single_core,
        "EXPECTED_FULL_ORBIT_ROLE_COUNT": len(delta),
        "EXPECTED_FULL_ORBIT_PAIR_ROW_COUNT": len(pair_rows),
        "EXPECTED_FULL_ORBIT_TRIPLE_ROW_COUNT": len(triple_rows),
        "EXPECTED_FULL_ORBIT_REQUIREMENT_COUNT": len(pair_rows) + len(triple_rows),
    }


def main() -> None:
    start = time.time()
    log("materializing 21-bank parent chain (center-exchange test fixture)...")
    instance, layout, v24_bank = _center_exchange_test_parent()
    log(
        f"chain through v24 installed ({time.time() - start:.0f}s); "
        "installing center-exchange bank..."
    )
    parent_bank = install_center_exchange_all_order_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, v24_bank, cell_index=6
    )
    log(f"parent chain complete ({time.time() - start:.0f}s)")

    parent_variables = instance.cnf.n_variables
    parent_clauses = len(instance.cnf.clauses)
    parent_dimacs = hashlib.sha256(instance.dimacs().encode("ascii")).hexdigest()
    log(
        f"parent identity: variables={parent_variables} "
        f"clauses={parent_clauses} dimacs={parent_dimacs}"
    )
    assert parent_variables == bank_module.EXPECTED_PARENT_VARIABLES
    assert parent_clauses == bank_module.EXPECTED_PARENT_CLAUSES
    assert parent_dimacs == bank_module.EXPECTED_PARENT_DIMACS_SHA256
    assert parent_bank["bank_sha256"] == bank_module.EXPECTED_PARENT_BANK_SHA256

    log("build with frozen pins...")
    bank = bank_module.build_core_pair_all_order_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, parent_bank, cell_index=6
    )
    log(f"build green ({time.time() - start:.0f}s); validating...")
    bank_module.validate_core_pair_all_order_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, parent_bank, bank, cell_index=6
    )
    log(f"validate green ({time.time() - start:.0f}s); installing...")
    installed_bank = (
        bank_module.install_core_pair_all_order_common_five_membership_family_bank(
            REPO_ROOT, instance, layout, parent_bank, cell_index=6
        )
    )
    assert installed_bank["bank_sha256"] == bank["bank_sha256"]
    log(f"install green ({time.time() - start:.0f}s)")

    compiled_payload = bank["compiled"]
    live_variables = instance.cnf.n_variables
    live_clauses = len(instance.cnf.clauses)
    live_dimacs = hashlib.sha256(instance.dimacs().encode("ascii")).hexdigest()
    assert live_variables == compiled_payload["final_n_variables"]
    assert live_clauses == compiled_payload["final_n_clauses"]
    assert live_dimacs == compiled_payload["final_dimacs_sha256"]
    log(
        f"identity: final_vars={compiled_payload['final_n_variables']} "
        f"final_clauses={compiled_payload['final_n_clauses']} "
        f"delta={len(compiled_payload['delta_clauses'])} "
        f"delta_sha={compiled_payload['delta_sha256']} "
        f"dimacs={compiled_payload['final_dimacs_sha256']} "
        f"compiled_sha={compiled_payload['compiled_sha256']} "
        f"bank_sha={bank['bank_sha256']} "
        f"roles_sha={bank['roles_sha256']}"
    )

    log("re-enumerating the delta orbit independently...")
    observed = reenumerate_orbit()
    log(f"orbit re-enumeration done ({time.time() - start:.0f}s)")

    roles = bank_module.family_roles()
    patterns = bank_module.family_patterns()
    requirements = bank_module.family_requirements()
    definitions = compiled_payload["pattern_definitions"]
    pair_requirements = sum(1 for item in definitions if len(item["required"]) == 2)
    triple_requirements = sum(1 for item in definitions if len(item["required"]) == 3)
    arities = {
        tuple(sorted(len(row["support"]) for row in pattern)) for pattern in patterns
    }
    assert len(arities) == 1, f"pattern row arities are not uniform: {sorted(arities)}"
    fresh_variables = sorted(
        item["pattern_variable"] for item in definitions if not item["reused"]
    )
    reused_variables = sorted(
        item["pattern_variable"] for item in definitions if item["reused"]
    )
    implication_clauses = sum(len(item["implication_clauses"]) for item in definitions)
    blocking_clauses = len(bank["entries"])
    observed.update(
        {
            "EXPECTED_PARENT_VARIABLES": parent_variables,
            "EXPECTED_PARENT_CLAUSES": parent_clauses,
            "EXPECTED_PARENT_DIMACS_SHA256": parent_dimacs,
            "EXPECTED_PARENT_BANK_SHA256": parent_bank["bank_sha256"],
            "EXPECTED_ROLE_COUNT": len(roles),
            "EXPECTED_PATTERN_COUNT": len(patterns),
            "EXPECTED_PATTERN_ROW_ARITIES": next(iter(arities)),
            "EXPECTED_ROLES_SHA256": bank["roles_sha256"],
            "EXPECTED_REQUIREMENTS_SHA256": bank["requirements_sha256"],
            "EXPECTED_LOGICAL_REQUIREMENT_COUNT": len(requirements),
            "EXPECTED_DEFINITION_COUNT": len(definitions),
            "EXPECTED_PAIR_REQUIREMENT_COUNT": pair_requirements,
            "EXPECTED_TRIPLE_REQUIREMENT_COUNT": triple_requirements,
            "EXPECTED_REUSED_REQUIREMENT_COUNT": compiled_payload[
                "reused_requirement_count"
            ],
            "EXPECTED_FRESH_REQUIREMENT_COUNT": compiled_payload[
                "fresh_requirement_count"
            ],
            "EXPECTED_REUSED_REQUIREMENT_BINDINGS_SHA256": compiled_payload[
                "reused_requirement_bindings_sha256"
            ],
            "EXPECTED_FINAL_VARIABLES": compiled_payload["final_n_variables"],
            "EXPECTED_FINAL_CLAUSES": compiled_payload["final_n_clauses"],
            "EXPECTED_DELTA_CLAUSE_COUNT": len(compiled_payload["delta_clauses"]),
            "EXPECTED_DELTA_SHA256": compiled_payload["delta_sha256"],
            "EXPECTED_COMPILED_SHA256": compiled_payload["compiled_sha256"],
            "EXPECTED_FINAL_DIMACS_SHA256": compiled_payload["final_dimacs_sha256"],
            "EXPECTED_BANK_SHA256": bank["bank_sha256"],
        }
    )
    declared = {
        name for name in dir(bank_module) if name.startswith("EXPECTED_")
    }
    missing = declared - set(observed)
    assert not missing, f"EXPECTED_* pins with no live observation: {sorted(missing)}"
    extra = set(observed) - declared
    assert not extra, f"observations with no declared pin: {sorted(extra)}"

    pending = list(bank_module.pending_pin_names())
    skipped: list[str] = []
    checked: list[str] = []
    for name in sorted(observed):
        expected = getattr(bank_module, name)
        if expected is None:
            skipped.append(name)
            continue
        assert observed[name] == expected, (
            f"pin {name} drifted: expected {expected!r}, observed {observed[name]!r}"
        )
        checked.append(name)
    log(f"pins matched ({len(checked)}): {', '.join(checked)}")
    log(f"pending_pin_names()={tuple(pending)}")
    log(f"pins skipped as unpinned (None) ({len(skipped)}): {', '.join(skipped)}")
    log(
        f"counts: family_roles={len(roles)} patterns={len(patterns)} "
        f"definitions={len(definitions)} fresh={len(fresh_variables)} "
        f"reused={len(reused_variables)} implication_clauses={implication_clauses} "
        f"blocking_clauses={blocking_clauses} "
        f"delta_clauses={len(compiled_payload['delta_clauses'])}"
    )
    log(
        f"fresh variable range: {fresh_variables[0]}..{fresh_variables[-1]} "
        f"(contiguous={fresh_variables == list(range(fresh_variables[0], fresh_variables[-1] + 1))}); "
        f"reused variable envelope: {reused_variables[0]}..{reused_variables[-1]} "
        f"(cutoff={bank_module.PARENT_VARIABLE_CUTOFF})"
    )

    compiled = dict(bank["compiled"])
    compiled.pop("schema")
    compiled.pop("compiled_sha256")
    family_roles = [list(role) for role in bank_module.family_roles()]
    family_roles_sha256 = _sha256_json(family_roles)
    source_commit = subprocess.run(
        ["git", "rev-parse", "HEAD"],
        cwd=REPO_ROOT,
        capture_output=True,
        text=True,
        check=True,
    ).stdout.strip()
    payload = {
        "compiled": compiled,
        "family_roles": family_roles,
        "family_roles_sha256": family_roles_sha256,
        "source_commit": source_commit,
    }
    payload["probe_sha256"] = _sha256_json(payload)
    OUT.write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    log(
        f"wrote {OUT} probe_sha256={payload['probe_sha256']} "
        f"bytes={OUT.stat().st_size}"
    )
    log("VERIFY COMPLETE")


if __name__ == "__main__":
    main()
