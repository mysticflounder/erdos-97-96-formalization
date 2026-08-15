"""Rebuild the v23 canary while reporting, rather than pinning, suffix hashes."""

import sys
from pathlib import Path

repo_root = Path.cwd().resolve()
sys.path.insert(0, str(repo_root))

from census.card_head import exact12_next_row_arm_static_canary as canary


def append_probe(instance, compiled, arm_compiled):
    del compiled
    prefix = {
        "variables": instance.cnf.n_variables,
        "clauses": len(instance.cnf.clauses),
        "sha256": canary._cnf_sha256(instance),
    }
    for clause in arm_compiled.named_deletion_clause_delta:
        instance.cnf.add_clause(clause)
    canary._probe_post_arm = {
        "prefix": prefix,
        "suffix_clauses": len(arm_compiled.named_deletion_clause_delta),
        "variables": instance.cnf.n_variables,
        "clauses": len(instance.cnf.clauses),
        "sha256": canary._cnf_sha256(instance),
    }
    return canary._probe_post_arm


canary.append_authenticated_named_arm_suffix = append_probe
try:
    rebuilt = canary.materialize_arm_static_canary(repo_root)
except canary.Exact12NextRowArmStaticCanaryError as exc:
    print({"post_arm": canary._probe_post_arm, "final_mismatch": str(exc)})
else:
    print(
        {
            "post_arm": canary._probe_post_arm,
            "final": {
                "variables": rebuilt.instance.cnf.n_variables,
                "clauses": len(rebuilt.instance.cnf.clauses),
                "sha256": canary._cnf_sha256(rebuilt.instance),
                "source_order_bank_sha256": rebuilt.source_order_bank.get(
                    "bank_sha256"
                ),
            },
        }
    )
