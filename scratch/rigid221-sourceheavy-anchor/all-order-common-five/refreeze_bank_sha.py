"""Discover the O5-refrozen EXPECTED_BANK_SHA256 for the all-order bank.

Run after the generated MembershipFamilyCnf module joins LEAN_ROOT_MODULES.
Materializes the full parent chain exactly the way the three-triad test
fixture does, then runs build_ with every identity pin frozen; only the
bank sha (which covers the enlarged source manifest) is discovered by
catching the fail-closed drift error and rebuilding with the observed
value in memory (no file is edited).  Prints the sha to freeze.
"""

from __future__ import annotations

import sys
import time
from pathlib import Path

REPO_ROOT = Path.cwd().resolve()
sys.path.insert(0, str(REPO_ROOT))

import census.card_head.exact12_all_order_common_five_membership_family_bank as bank_module
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
    cnf_lean_path = (
        REPO_ROOT / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221AllOrderCommonFiveMembershipFamilyCnf.lean"
    )
    assert any(
        "AllOrderCommonFiveMembershipFamilyCnf" in module
        for module in bank_module.LEAN_ROOT_MODULES
    ), "bank LEAN_ROOT_MODULES does not list the generated CNF module yet"
    assert cnf_lean_path.is_file()
    log("materializing 19-bank parent chain (three-triad test fixture)...")
    instance, layout, v22_bank = _three_triad_test_parent()
    log(f"chain through v22 installed ({time.time() - start:.0f}s)...")
    parent_bank = install_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank(
        REPO_ROOT, instance, layout, v22_bank, cell_index=6
    )
    log(f"parent chain complete ({time.time() - start:.0f}s); running build_...")
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
        log(f"REFROZEN_BANK_SHA256={observed}; rebuilding with the pin...")
        bank = bank_module.build_all_order_common_five_membership_family_bank(
            REPO_ROOT, instance, layout, parent_bank, cell_index=6
        )
    else:
        log("build_ passed with the existing pin; no refreeze needed")
    log(f"build green ({time.time() - start:.0f}s); validating...")
    bank_module.validate_all_order_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, parent_bank, bank, cell_index=6
    )
    log(f"validate green ({time.time() - start:.0f}s)")
    manifest_paths = [record["path"] for record in bank["source_manifest"]]
    cnf_relative = str(cnf_lean_path.relative_to(REPO_ROOT))
    assert cnf_relative in manifest_paths, "CNF module missing from manifest"
    log(f"manifest includes {cnf_relative}")
    log(f"REFROZEN_BANK_SHA256={bank['bank_sha256']}")
    log("REFREEZE COMPLETE")


if __name__ == "__main__":
    main()
