from __future__ import annotations

import shutil
import subprocess

import pytest

from census.p97_search.freshthird_qfiber_three_carrier_batched_alternation_probe_v1 import (
    _parse_model,
    no_alternating_cap_clauses,
)
from census.p97_search.freshthird_qfiber_three_carrier_cnf_v1 import (
    FreshThirdCarrierCnfEncoding,
)
from census.p97_search.freshthird_qfiber_three_carrier_order_refined_cnf_v2 import (
    CNF_CONSTRAINT_GROUPS,
    CNF_SCHEMA,
    REFINEMENT_TAG,
    SOURCE_THEOREMS,
    FreshThirdCarrierOrderRefinedCnfEncoding,
    fresh_row_ordered_holds,
)


def _cadical_signature(encoding, tmp_path, *, extra=()):
    cnf_path = tmp_path / "query.cnf"
    cnf_path.write_bytes(encoding.cnf_bytes(extra))
    completed = subprocess.run(
        ["cadical", "-q", "-t", "10", str(cnf_path)],
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        timeout=15,
        check=False,
    )
    if completed.returncode != 10:
        return completed.returncode, None
    assignment = _parse_model(completed.stdout, encoding.num_vars)
    encoding.validate(assignment)
    return completed.returncode, encoding.model_signature(assignment)


def test_v2_allocates_all_survivor_packet_tseitin_choices() -> None:
    v1 = FreshThirdCarrierCnfEncoding(0)
    v2 = FreshThirdCarrierOrderRefinedCnfEncoding(0)

    assert v2.num_vars == v1.num_vars + 48
    assert v2.clause_counts[REFINEMENT_TAG] == 577
    assert v2.encoding_manifest()["schema"] == CNF_SCHEMA
    assert v2.encoding_manifest()["source_theorems"] == list(SOURCE_THEOREMS)
    assert v2.result_from_assignment.__self__ is v2
    assert list(CNF_CONSTRAINT_GROUPS)[-1] == "fresh_row_ordered_source_refinement"


@pytest.mark.skipif(shutil.which("cadical") is None, reason="CaDiCaL unavailable")
def test_known_v1_batched_witness_fails_fresh_row_ordered(tmp_path) -> None:
    v1 = FreshThirdCarrierCnfEncoding(0)
    status, signature = _cadical_signature(
        v1,
        tmp_path,
        extra=no_alternating_cap_clauses(v1),
    )
    assert status == 10
    assert signature is not None
    assert fresh_row_ordered_holds(signature) is False


@pytest.mark.skipif(shutil.which("cadical") is None, reason="CaDiCaL unavailable")
def test_v2_sat_model_satisfies_the_direct_survivor_packet(tmp_path) -> None:
    v2 = FreshThirdCarrierOrderRefinedCnfEncoding(0)
    status, signature = _cadical_signature(v2, tmp_path)
    assert status in {10, 20}
    if signature is not None:
        assert fresh_row_ordered_holds(signature) is True
