"""Verify the frozen O6 bank pins and export the O5 generator payload.

Materializes the 19-bank parent chain the same way discover_pins.py does,
then runs the frozen module's build + validate + install with no in-memory
overrides.  Every EXPECTED_* pin check must pass.  Writes
mixed-extension-probe.json with the exact key structure of the v23
three-triad probe: {compiled, family_roles, family_roles_sha256,
probe_sha256, source_commit}.
"""

from __future__ import annotations

import json
import subprocess
import sys
import time
from pathlib import Path

REPO_ROOT = Path.cwd().resolve()
sys.path.insert(0, str(REPO_ROOT))

OUT = Path(__file__).with_name("mixed-extension-probe.json")

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

    log("build with frozen pins...")
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
    assert instance.cnf.n_variables == bank_module.EXPECTED_FINAL_VARIABLES
    assert len(instance.cnf.clauses) == bank_module.EXPECTED_FINAL_CLAUSES
    log(f"install green ({time.time() - start:.0f}s)")
    log(
        f"identity: final_vars={bank['compiled']['final_n_variables']} "
        f"final_clauses={bank['compiled']['final_n_clauses']} "
        f"delta={len(bank['compiled']['delta_clauses'])} "
        f"delta_sha={bank['compiled']['delta_sha256']} "
        f"dimacs={bank['compiled']['final_dimacs_sha256']} "
        f"compiled_sha={bank['compiled']['compiled_sha256']} "
        f"bank_sha={bank['bank_sha256']} "
        f"roles_sha={bank['roles_sha256']}"
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
    log(f"wrote {OUT} probe_sha256={payload['probe_sha256']}")
    log("VERIFY COMPLETE")


if __name__ == "__main__":
    main()
