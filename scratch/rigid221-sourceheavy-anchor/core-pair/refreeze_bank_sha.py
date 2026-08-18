"""Discover the O8-refrozen EXPECTED_BANK_SHA256 for the core-pair bank.

Run after the generated MembershipFamilyCnf module joins LEAN_ROOT_MODULES.
Materializes the 21-bank parent chain exactly the way this family's
``verify_frozen.py`` does, then runs build + validate with every frozen pin in
force.  ``EXPECTED_BANK_SHA256`` is deliberately absent from
``REQUIRED_PIN_NAMES`` and starts as ``None``, so the build does not fail
closed on it: the observed value is simply read back from the built bank and
printed.  No file is edited by this script.

The bank sha covers the source manifest, which now includes the generated Lean
CNF module and its whole import closure, so the printed value is only valid
for the exact tree it was measured against.
"""

from __future__ import annotations

import hashlib
import sys
import time
from pathlib import Path

REPO_ROOT = Path.cwd().resolve()
sys.path.insert(0, str(REPO_ROOT))

import census.card_head.exact12_core_pair_all_order_common_five_membership_family_bank as bank_module
from census.card_head.exact12_center_exchange_all_order_common_five_membership_family_bank import (
    install_center_exchange_all_order_common_five_membership_family_bank,
)
from census.card_head.tests.test_exact12_center_exchange_all_order_common_five_membership_family_bank import (
    _parent as _center_exchange_test_parent,
)

CNF_MODULE = bank_module.LEAN_CNF_MODULE
CNF_LEAN_PATH = REPO_ROOT / (
    "lean/" + CNF_MODULE.replace(".", "/") + ".lean"
)


def log(message: str) -> None:
    print(f"[{time.strftime('%H:%M:%S')}] {message}", flush=True)


def main() -> None:
    start = time.time()
    if CNF_MODULE not in bank_module.LEAN_ROOT_MODULES:
        raise SystemExit(
            "bank LEAN_ROOT_MODULES does not list the generated CNF module yet: "
            f"{CNF_MODULE}"
        )
    if not CNF_LEAN_PATH.is_file():
        raise SystemExit(f"generated CNF module is missing: {CNF_LEAN_PATH}")
    log(
        f"CNF module present: {CNF_LEAN_PATH.relative_to(REPO_ROOT)} "
        f"sha256={hashlib.sha256(CNF_LEAN_PATH.read_bytes()).hexdigest()}"
    )

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
    assert parent_bank["bank_sha256"] == bank_module.EXPECTED_PARENT_BANK_SHA256

    log("build with frozen pins...")
    bank = bank_module.build_core_pair_all_order_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, parent_bank, cell_index=6
    )
    log(f"build green ({time.time() - start:.0f}s); validating...")
    bank_module.validate_core_pair_all_order_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, parent_bank, bank, cell_index=6
    )
    log(f"validate green ({time.time() - start:.0f}s)")

    manifest_paths = [record["path"] for record in bank["source_manifest"]]
    cnf_relative = str(CNF_LEAN_PATH.relative_to(REPO_ROOT))
    if cnf_relative not in manifest_paths:
        raise SystemExit("CNF module missing from the authenticated manifest")
    log(f"manifest includes {cnf_relative} ({len(manifest_paths)} files)")

    if bank_module.EXPECTED_BANK_SHA256 is not None:
        if bank["bank_sha256"] != bank_module.EXPECTED_BANK_SHA256:
            raise SystemExit(
                "bank sha drifted from the frozen pin: expected "
                f"{bank_module.EXPECTED_BANK_SHA256}, observed {bank['bank_sha256']}"
            )
        log("bank sha already matches the frozen pin; no refreeze needed")
    log(f"REFROZEN_BANK_SHA256={bank['bank_sha256']}")
    log("REFREEZE COMPLETE")


if __name__ == "__main__":
    main()
