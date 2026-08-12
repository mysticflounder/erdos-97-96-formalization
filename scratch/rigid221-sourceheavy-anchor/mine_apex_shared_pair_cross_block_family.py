"""Audit and compile the apex-shared-pair cross-block family.

This is a theorem-mining checkpoint for one authenticated exact-12 SAT
survivor.  It prints compact deterministic summaries only; it does not publish
a bank or claim terminal coverage.
"""

from __future__ import annotations

import hashlib
import json
from pathlib import Path

from census.card_head.exact12_adjacent_apex_cross_block_membership_family_bank import (
    install_adjacent_apex_cross_block_membership_family_bank,
)
from census.card_head.exact12_apex_pair_cross_block_membership_family_bank import (
    install_apex_pair_cross_block_membership_family_bank,
)
from census.card_head.exact12_apex_zero_cross_block_membership_family_bank import (
    install_apex_zero_cross_block_membership_family_bank,
)
from census.card_head.exact12_next_row_static_cegar import (
    materialize_positive_membership_static_cell,
)
from census.card_head.exact12_positive_membership_cnf import (
    compile_fresh_positive_membership_extension,
)
from census.card_head.exact12_second_cap_apex_surplus_membership_family_bank import (
    install_second_cap_apex_surplus_membership_family_bank,
)
from census.card_head.exact12_surplus_apex_pair_membership_family_bank import (
    install_surplus_apex_pair_membership_family_bank,
)
from census.card_head.exact12_surplus_three_triad_membership_family_bank import (
    install_surplus_three_triad_membership_family_bank,
)
from census.card_head.exact12_v14_ordered_coverage import (
    SOURCE_ORDERS,
    _common_five_orientation,
)
from census.card_head.exact12_zero_center_cross_block_membership_family_bank import (
    install_zero_center_cross_block_membership_family_bank,
)


def sha256_json(value: object) -> str:
    payload = json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode("ascii")
    return hashlib.sha256(payload).hexdigest()


def roles() -> tuple[tuple[int, int, int], ...]:
    return tuple((a, b, c) for a in (6, 7, 8, 9) for b in (3, 4, 5) for c in (10, 11))


def patterns() -> tuple[tuple[dict[str, object], ...], ...]:
    return tuple(
        (
            {"center": 0, "support": [a, b]},
            {"center": 1, "support": [a, b]},
            {"center": c, "support": [0, 1, b]},
        )
        for a, b, c in roles()
    )


def main() -> None:
    repo_root = Path(__file__).resolve().parents[2]
    instance, _compiled, layout, membership_bank = (
        materialize_positive_membership_static_cell(repo_root, 1)
    )
    bank1 = install_surplus_apex_pair_membership_family_bank(
        repo_root, instance, layout, membership_bank, cell_index=1
    )
    bank2 = install_adjacent_apex_cross_block_membership_family_bank(
        repo_root, instance, layout, bank1, cell_index=1
    )
    bank3 = install_second_cap_apex_surplus_membership_family_bank(
        repo_root, instance, layout, bank2, cell_index=1
    )
    bank4 = install_surplus_three_triad_membership_family_bank(
        repo_root, instance, layout, bank3, cell_index=1
    )
    bank5 = install_zero_center_cross_block_membership_family_bank(
        repo_root, instance, layout, bank4, cell_index=1
    )
    bank6 = install_apex_zero_cross_block_membership_family_bank(
        repo_root, instance, layout, bank5, cell_index=1
    )
    parent = install_apex_pair_cross_block_membership_family_bank(
        repo_root, instance, layout, bank6, cell_index=1
    )
    parent_summary = {
        "variables": instance.cnf.n_variables,
        "clauses": len(instance.cnf.clauses),
        "dimacs_sha256": hashlib.sha256(instance.dimacs().encode("ascii")).hexdigest(),
        "bank_sha256": parent["bank_sha256"],
    }
    compiled = compile_fresh_positive_membership_extension(
        instance, patterns()
    ).as_dict()
    final_summary = {
        "variables": instance.cnf.n_variables,
        "clauses": len(instance.cnf.clauses),
        "dimacs_sha256": hashlib.sha256(instance.dimacs().encode("ascii")).hexdigest(),
        "delta_sha256": compiled["delta_sha256"],
        "compiled_sha256": sha256_json(
            {
                **compiled,
                "final_dimacs_sha256": hashlib.sha256(
                    instance.dimacs().encode("ascii")
                ).hexdigest(),
            }
        ),
        "pattern_count": len(compiled["entries"]),
        "definition_count": len(compiled["pattern_definitions"]),
    }
    orientation_counts: dict[str, int] = {}
    failures: list[dict[str, object]] = []
    for a, b, c in roles():
        core = {"a": a, "x": 0, "b": b, "c": c, "y": 1}
        for source_orientation, order in SOURCE_ORDERS:
            orientation = _common_five_orientation(order, core)
            key = f"{source_orientation}:{orientation}"
            orientation_counts[key] = orientation_counts.get(key, 0) + 1
            if orientation is None:
                failures.append({"roles": [a, b, c], "order": list(order)})
    print(
        json.dumps(
            {
                "roles_sha256": sha256_json([list(role) for role in roles()]),
                "parent": parent_summary,
                "final": final_summary,
                "orientation_counts": orientation_counts,
                "failure_count": len(failures),
            },
            sort_keys=True,
            indent=2,
        )
    )


if __name__ == "__main__":
    main()
