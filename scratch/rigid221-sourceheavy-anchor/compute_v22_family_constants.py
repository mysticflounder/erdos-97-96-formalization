from __future__ import annotations

import hashlib
import json

from census.card_head.exact12_positive_membership_cnf import normalize_memberships
from census.card_head.exact12_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank import (
    build_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank,
)
from census.card_head.exact12_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank import (
    install_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank,
)
from census.card_head.tests.test_exact12_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank import (
    REPO_ROOT,
    _parent,
)


instance, layout, parent = _parent()
bank = install_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank(
    REPO_ROOT, instance, layout, parent, cell_index=6
)
successor_bank = build_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank(
    REPO_ROOT, instance, layout, bank, cell_index=6
)
print("successor_bank_sha256", successor_bank["bank_sha256"])
patterns = tuple(
    (
        {"center": 10, "support": [a, b]},
        {"center": 11, "support": [a, b]},
        {"center": c, "support": [b, 10]},
        {"center": c, "support": [b, 11]},
    )
    for a in (6, 7, 8, 9)
    for b in (3, 4, 5)
    for c in (6, 7, 8, 9)
)
normalized = tuple(normalize_memberships(12, pattern) for pattern in patterns)
requirements = sorted({requirement for pattern in normalized for requirement in pattern})
reused: list[tuple[int, tuple[int, ...], int]] = []
fresh: list[tuple[int, tuple[int, ...], None]] = []
for center, required in requirements:
    variable = instance.pattern_variables.get((center, frozenset(required)))
    if variable is None:
        fresh.append((center, required, None))
    else:
        reused.append((center, required, variable))

print(
    "parent",
    instance.cnf.n_variables,
    len(instance.cnf.clauses),
    hashlib.sha256(instance.dimacs().encode("ascii")).hexdigest(),
    bank["bank_sha256"],
)
print(
    "patterns",
    len(patterns),
    "requirements",
    len(requirements),
    "reused",
    len(reused),
    "fresh",
    len(fresh),
)
print("reused", reused)
print("fresh", fresh)

initial_variables = instance.cnf.n_variables
initial_clauses = len(instance.cnf.clauses)
variables: dict[tuple[int, tuple[int, ...]], int] = {}
definitions: list[dict[str, object]] = []
for center, required in requirements:
    key = (center, frozenset(required))
    candidate_indices = [
        index
        for index, candidate in enumerate(instance.candidates[center])
        if set(required) <= set(candidate)
    ]
    inherited_variable = instance.pattern_variables.get(key)
    before = len(instance.cnf.clauses)
    variable = instance.pattern_variable(center, required)
    implications = tuple(instance.cnf.clauses[before:])
    variables[(center, required)] = variable
    definitions.append(
        {
            "center": center,
            "required": list(required),
            "pattern_variable": variable,
            "reused": inherited_variable is not None,
            "candidate_indices": candidate_indices,
            "candidate_variables": [
                instance.choice_variables[(center, index)]
                for index in candidate_indices
            ],
            "implication_clauses": [list(clause) for clause in implications],
            "implication_clauses_sha256": hashlib.sha256(
                json.dumps(
                    implications,
                    sort_keys=True,
                    separators=(",", ":"),
                    ensure_ascii=True,
                ).encode("ascii")
            ).hexdigest(),
        }
    )
entries: list[dict[str, object]] = []
for index, pattern in enumerate(normalized):
    block = tuple(-variables[item] for item in pattern)
    instance.cnf.add_clause(block)
    requirements_payload = [
        {"center": center, "required": list(required)}
        for center, required in pattern
    ]
    entries.append(
        {
            "index": index,
            "requirements": requirements_payload,
            "requirements_sha256": hashlib.sha256(
                json.dumps(
                    requirements_payload,
                    sort_keys=True,
                    separators=(",", ":"),
                    ensure_ascii=True,
                ).encode("ascii")
            ).hexdigest(),
            "blocking_clause": list(block),
            "blocking_clause_sha256": hashlib.sha256(
                json.dumps(
                    block,
                    sort_keys=True,
                    separators=(",", ":"),
                    ensure_ascii=True,
                ).encode("ascii")
            ).hexdigest(),
        }
    )
delta = tuple(instance.cnf.clauses[initial_clauses:])
sha = lambda value: hashlib.sha256(  # noqa: E731
    json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=True).encode(
        "ascii"
    )
).hexdigest()
compiled = {
    "schema": "p97_exact12_positive_membership_cnf.v1",
    "pattern_keys": [
        [
            {"center": center, "required": list(required)}
            for center, required in pattern
        ]
        for pattern in normalized
    ],
    "pattern_definitions": definitions,
    "entries": entries,
    "initial_n_variables": initial_variables,
    "initial_n_clauses": initial_clauses,
    "final_n_variables": instance.cnf.n_variables,
    "final_n_clauses": len(instance.cnf.clauses),
    "delta_clauses": [list(clause) for clause in delta],
    "delta_sha256": sha(delta),
}
compiled["final_dimacs_sha256"] = hashlib.sha256(
    instance.dimacs().encode("ascii")
).hexdigest()
compiled["compiled_sha256"] = sha(compiled)
roles = [
    {"a": a, "b": b, "c": c}
    for a in (6, 7, 8, 9)
    for b in (3, 4, 5)
    for c in (6, 7, 8, 9)
]
print(
    "compiled",
    compiled["final_n_variables"],
    compiled["final_n_clauses"],
    len(delta),
    compiled["delta_sha256"],
    compiled["final_dimacs_sha256"],
    compiled["compiled_sha256"],
)
print("roles_sha256", sha(roles))
print("fresh_bindings", [(item[0], item[1], 45_358 + i) for i, item in enumerate(fresh)])
print("blocks", [entry["blocking_clause"] for entry in entries])
