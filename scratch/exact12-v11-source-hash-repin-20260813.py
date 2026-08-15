"""Compute the downstream bank-hash repin after authenticated source drift.

This leaves every clause and DIMACS identity check active.  It substitutes only
the immediately preceding bank's freshly authenticated hash while constructing
the chain, then prints the constants that production modules must pin.
"""

from __future__ import annotations

import importlib
from pathlib import Path
from typing import Any, Callable

from census.card_head import exact12_next_row_arm_static_canary as canary


INSTALLERS = (
    "install_surplus_apex_pair_membership_family_bank",
    "install_adjacent_apex_cross_block_membership_family_bank",
    "install_second_cap_apex_surplus_membership_family_bank",
    "install_surplus_three_triad_membership_family_bank",
    "install_zero_center_cross_block_membership_family_bank",
    "install_apex_zero_cross_block_membership_family_bank",
    "install_apex_pair_cross_block_membership_family_bank",
    "install_apex_shared_pair_cross_block_membership_family_bank",
    "install_apex_internal_shared_pair_common_five_membership_family_bank",
    "install_apex_first_opposite_shared_pair_common_five_membership_family_bank",
    (
        "install_apex_first_opposite_shared_pair_second_opposite_common_five_"
        "membership_family_bank"
    ),
    (
        "install_apex_triple_surplus_second_opposite_common_five_"
        "membership_family_bank"
    ),
    (
        "install_surplus_pair_second_opposite_apex_pair_common_five_"
        "membership_family_bank"
    ),
    "install_apex_first_surplus_second_common_five_membership_family_bank",
    "install_second_apex_surplus_second_first_common_five_membership_family_bank",
    (
        "install_apex_first_opposite_shared_pair_surplus_common_five_"
        "membership_family_bank"
    ),
    (
        "install_reciprocal_first_opposite_surplus_second_opposite_common_five_"
        "membership_family_bank"
    ),
    (
        "install_first_opposite_pair_surplus_second_opposite_common_five_"
        "membership_family_bank"
    ),
    (
        "install_second_opposite_triple_surplus_first_opposite_three_triad_"
        "membership_family_bank"
    ),
)


rows: list[tuple[str, str, str]] = []


def wrapper(
    name: str, original: Callable[..., dict[str, Any]]
) -> Callable[..., dict[str, Any]]:
    module = importlib.import_module(original.__module__)
    if not hasattr(module, "EXPECTED_PARENT_BANK_SHA256"):
        raise RuntimeError(f"{original.__module__} has no parent-bank pin")

    def install(*args: Any, **kwargs: Any) -> dict[str, Any]:
        parent_sha256 = args[3]["bank_sha256"]
        module.EXPECTED_PARENT_BANK_SHA256 = parent_sha256
        bank = original(*args, **kwargs)
        rows.append((original.__module__, parent_sha256, bank["bank_sha256"]))
        return bank

    install.__name__ = name
    return install


for installer_name in INSTALLERS:
    original_installer = getattr(canary, installer_name)
    setattr(canary, installer_name, wrapper(installer_name, original_installer))

materialized = canary.materialize_arm_static_canary(Path.cwd())
for module_name, parent_sha256, bank_sha256 in rows:
    print(f"{module_name}\t{parent_sha256}\t{bank_sha256}")
print(
    "final",
    materialized.instance.cnf.n_variables,
    len(materialized.instance.cnf.clauses),
    canary._cnf_sha256(materialized.instance),
    sep="\t",
)
