from __future__ import annotations

from census.p97_search.freshthird_qfiber_three_carrier_batched_alternation_probe_v1 import (
    ALTERNATING_PATTERNS,
    FRONTIER_ROLE_SCOPE,
    no_alternating_cap_clauses,
)
from census.p97_search.freshthird_qfiber_three_carrier_cnf_v1 import (
    FreshThirdCarrierCnfEncoding,
)


def test_batched_projection_has_expected_source_clause_count() -> None:
    encoding = FreshThirdCarrierCnfEncoding(0)
    clauses = no_alternating_cap_clauses(encoding)
    assert len(clauses) == 3 * 2 * len(tuple(__import__("itertools").combinations(FRONTIER_ROLE_SCOPE, 4)))
    assert all(len(clause) == 7 for clause in clauses)


def test_batched_projection_uses_only_semantic_variables() -> None:
    encoding = FreshThirdCarrierCnfEncoding(1)
    semantic = set(encoding.semantic_vars)
    assert all(abs(literal) in semantic for clause in no_alternating_cap_clauses(encoding) for literal in clause)
    assert ALTERNATING_PATTERNS == ((True, False, True, False), (False, True, False, True))
