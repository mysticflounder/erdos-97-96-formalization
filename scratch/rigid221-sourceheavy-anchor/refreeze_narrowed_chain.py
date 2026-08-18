# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Rediscover every bank sha after the manifest narrowing.

Narrowing ``_lean_source_paths`` from the transitive import closure to the
frozen kernel dependency set changes each bank's ``source_manifest``, and so
every ``EXPECTED_BANK_SHA256`` and every downstream
``EXPECTED_PARENT_BANK_SHA256`` literal.  Those pins are fail-closed direct
comparisons, so they cannot simply be blanked: the chain has to be walked in
order, each bank's parent pin set in memory to the sha its parent actually
produced, and the bank's own pin left unset so the observed value comes back.

Read-only with respect to the repository: this script edits nothing.  It
prints the discovered shas; a separate pass writes them.
"""

from __future__ import annotations

import importlib
import sys
import time
from pathlib import Path

REPO_ROOT = Path.cwd().resolve()
sys.path.insert(0, str(REPO_ROOT))

CHAIN = (
    "exact12_apex_first_opposite_shared_pair_common_five_membership_family_bank",
    "exact12_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank",
    "exact12_apex_triple_surplus_second_opposite_common_five_membership_family_bank",
    "exact12_surplus_pair_second_opposite_apex_pair_common_five_membership_family_bank",
    "exact12_apex_first_surplus_second_common_five_membership_family_bank",
    "exact12_second_apex_surplus_second_first_common_five_membership_family_bank",
    "exact12_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank",
    "exact12_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank",
    "exact12_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank",
    "exact12_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank",
    "exact12_all_order_common_five_membership_family_bank",
    "exact12_center_exchange_all_order_common_five_membership_family_bank",
    "exact12_core_pair_all_order_common_five_membership_family_bank",
)

VERIFY_ONLY = "--verify" in sys.argv
"""Walk with every frozen pin in force and override nothing."""

START = time.time()


def log(message: str) -> None:
    print(f"[{time.strftime('%H:%M:%S')} +{time.time() - START:5.0f}s] {message}", flush=True)


def entry_points(module):
    names = {}
    for name in module.__all__:
        for kind in ("build_", "validate_", "install_"):
            if name.startswith(kind):
                names[kind.rstrip("_")] = getattr(module, name)
    return names["build"], names["validate"], names["install"]


def main() -> None:
    from census.card_head.tests.test_exact12_apex_first_opposite_shared_pair_common_five_membership_family_bank import (
        _parent as _chain_head,
    )

    log("materializing the chain above the first narrowed bank...")
    instance, layout, parent_bank = _chain_head()
    log(f"chain head installed; parent sha {parent_bank['bank_sha256'][:16]}")

    discovered: list[tuple[str, str]] = []
    for name in CHAIN:
        module = importlib.import_module(f"census.card_head.{name}")
        build, validate, install = entry_points(module)
        # Its parent is whatever the walk just produced, and its own pin is
        # unset so the observed value comes back instead of failing closed.
        if not VERIFY_ONLY:
            module.EXPECTED_PARENT_BANK_SHA256 = parent_bank["bank_sha256"]
            module.EXPECTED_BANK_SHA256 = None
        # Families are installed into one shared formula but each is production
        # for its own cell; cell 1 families precede the cell 6 tail.
        (cell,) = sorted(module.PRODUCTION_FAMILY_ID_BY_CELL)
        # Banks differ in how they report a drifted own-sha: some name the
        # observed value, some do not.  Record every canonical digest the
        # module computes, then retry with each candidate, newest first, until
        # the fail-closed comparison passes.  The pin is never guessed: a
        # candidate is accepted only when the bank rebuilds green under it.
        seen_digests: list[str] = []
        original_sha256_json = module._sha256_json

        def recording_sha256_json(payload, _original=original_sha256_json):
            digest = _original(payload)
            seen_digests.append(digest)
            return digest

        module._sha256_json = recording_sha256_json
        try:
            try:
                bank = build(REPO_ROOT, instance, layout, parent_bank, cell_index=cell)
            except Exception as exc:
                if "hash drifted" not in str(exc):
                    raise
                bank = None
                for candidate in reversed(seen_digests):
                    module.EXPECTED_BANK_SHA256 = candidate
                    try:
                        bank = build(
                            REPO_ROOT, instance, layout, parent_bank, cell_index=cell
                        )
                        break
                    except Exception as retry_exc:
                        if "hash drifted" not in str(retry_exc):
                            raise
                if bank is None:
                    raise SystemExit(f"{name}: could not recover the observed sha")
        finally:
            module._sha256_json = original_sha256_json
        validate(REPO_ROOT, instance, layout, parent_bank, bank, cell_index=cell)
        manifest = len(bank["source_manifest"])
        log(f"cell{cell} {name[:52]:52s} manifest={manifest:4d} sha={bank['bank_sha256']}")
        discovered.append((name, bank["bank_sha256"]))
        parent_bank = install(REPO_ROOT, instance, layout, parent_bank, cell_index=cell)
        if parent_bank["bank_sha256"] != bank["bank_sha256"]:
            raise SystemExit(f"{name}: install sha differs from build sha")

    print()
    print("REFROZEN")
    for name, sha in discovered:
        print(f"{name} {sha}")
    log("CHAIN VERIFY COMPLETE" if VERIFY_ONLY else "CHAIN REFREEZE COMPLETE")


if __name__ == "__main__":
    main()
