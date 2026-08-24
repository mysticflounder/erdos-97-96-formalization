"""Discover the v27 canary formula identity without editing pins.

Materializes the frozen v26 canary (every existing pinned identity check
stays in force), then builds, attests, snapshots, and installs the
physically-bridged class-cut bank on top and prints the resulting v27
final formula identity.  It writes nothing.
"""

from __future__ import annotations

import sys
from pathlib import Path

REPO = Path("/Users/adam/projects/math-projects/erdos-97-96-formalization")
sys.path.insert(0, str(REPO))

from census.card_head import exact12_next_row_arm_static_canary as canary
from census.card_head.exact12_physical_class_cut_bank import (
    attest_physical_class_cut_bank_installed,
    attest_physical_class_cut_bank_live_sources,
    build_physical_class_cut_bank,
    install_physical_class_cut_bank,
)

materialized = canary.materialize_arm_static_canary(REPO)
instance = materialized.instance
print(
    "v26 final    "
    f"variables={instance.cnf.n_variables} "
    f"clauses={len(instance.cnf.clauses)} "
    f"sha256={canary._cnf_sha256(instance)}"
)

bank = build_physical_class_cut_bank(REPO, instance)
attest_physical_class_cut_bank_live_sources(REPO, bank)
installation = install_physical_class_cut_bank(REPO, instance, bank)
attested = attest_physical_class_cut_bank_installed(instance, bank)
print(f"class-cut bank_sha256={bank['bank_sha256']}")
print(f"class-cut entries={len(bank['entries'])}")
print(f"installation attested={installation == attested}")
print(f"installation_sha256={installation['installation_sha256']}")
print(
    "v27 final    "
    f"variables={instance.cnf.n_variables} "
    f"clauses={len(instance.cnf.clauses)} "
    f"sha256={canary._cnf_sha256(instance)}"
)
print(f"installed final_cnf_sha256={installation['final_cnf_sha256']}")
