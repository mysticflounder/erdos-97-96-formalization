from __future__ import annotations

import shutil
import subprocess

import pytest
import z3

from census.p97_search.freshthird_qfiber_three_carrier_batched_alternation_probe_v1 import (
    _parse_model,
    no_alternating_cap_clauses,
)
from census.p97_search.freshthird_qfiber_three_carrier_cnf_v1 import (
    FreshThirdCarrierCnfEncoding,
)
from census.p97_search.freshthird_qfiber_three_carrier_query_v1 import (
    CONSTRAINT_GROUPS,
    OLD_ROLES,
    _Builder,
    build_query,
    model_signature,
)
from census.p97_search.freshthird_qfiber_three_carrier_source_family_diagnostic_v1 import (
    FAMILY_NAMES,
    PINNED_GROUP,
    _and_terms,
    _split_query,
    _tracked_payloads,
    diagnose_signature,
    pinned_source_families,
)


def test_pinned_family_partition_is_complete_and_source_derived() -> None:
    query = build_query(0, timeout_ms=5_000)
    payloads = _tracked_payloads(query)
    families = pinned_source_families(query)

    assert tuple(payloads) == CONSTRAINT_GROUPS
    assert tuple(families) == FAMILY_NAMES
    assert sum(len(terms) for terms in families.values()) == 612
    assert len(families["seed_identity"]) == 18
    assert len(families["seed_multiplicity"]) == 360
    assert len(families["canonical_packet"]) == 11
    assert all(len(families[f"fan_local_{i}"]) == 8 + len(OLD_ROLES) for i in range(4))
    assert len(families["pinned_deletion_profile"]) == len(OLD_ROLES)
    assert len(families["normalized_fan_outcome"]) == 1
    flattened = tuple(term for family in families.values() for term in family)
    assert flattened == _and_terms(payloads[PINNED_GROUP])


def test_split_query_uses_fresh_solver_and_named_family_tracking() -> None:
    builder = _Builder(0, timeout_ms=5_000)
    source = builder.q()
    assert source.solver.check() == z3.sat
    signature = model_signature(source, source.solver.model())

    split = _split_query(
        0,
        signature,
        FAMILY_NAMES,
        timeout_ms=5_000,
        track_families=True,
        include_nonpinned_groups=True,
    )
    labels = [
        assertion.arg(0).decl().name()
        for assertion in split.solver.assertions()
        if z3.is_implies(assertion)
    ]
    assert labels == [
        *(f"source__{group}" for group in CONSTRAINT_GROUPS if group != PINNED_GROUP),
        *(f"source__pinned__{name}" for name in FAMILY_NAMES),
    ]


@pytest.mark.skipif(shutil.which("cadical") is None, reason="CaDiCaL unavailable")
def test_known_batched_cell_replay_shrinks_to_fresh_row_order(tmp_path) -> None:
    encoding = FreshThirdCarrierCnfEncoding(0)
    cnf_path = tmp_path / "cell-0.cnf"
    cnf_path.write_bytes(encoding.cnf_bytes(no_alternating_cap_clauses(encoding)))
    completed = subprocess.run(
        ["cadical", "-q", "-t", "10", str(cnf_path)],
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        timeout=15,
        check=False,
    )
    assert completed.returncode == 10
    assignment = _parse_model(completed.stdout, encoding.num_vars)
    encoding.validate(assignment)

    replay = diagnose_signature(
        0,
        encoding.model_signature(assignment),
        timeout_ms=10_000,
    )
    assert replay.monolithic_status == "UNSAT"
    assert replay.split_status == "UNSAT"
    assert replay.minimized_core == ("canonical_packet",)
    assert replay.drop_status == {"canonical_packet": "SAT"}
    assert replay.canonical_atom_minimized == ("fresh_row_ordered",)
