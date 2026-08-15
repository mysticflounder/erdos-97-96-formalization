"""Focused tests for the strict FreshThird pinned-fan packet scaffold."""

from __future__ import annotations

import copy
import json
import sys
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search import (
    freshthird_firstnonhit_pinned_endpoint_fan_query as query,
)


def test_deterministic_roundtrip_for_both_source_arms(tmp_path: Path) -> None:
    for arm in ("endpoint", "off_endpoint"):
        packet = query.build_packet(arm)
        path = tmp_path / f"{arm}.json"
        assert query.write_packet(path, arm) == packet
        assert query.replay_packet(path, arm) == packet
        assert query.build_packet(arm) == packet


def test_endpoint_and_off_endpoint_preserve_distinct_branch_data() -> None:
    endpoint = query.build_packet("endpoint")
    off_endpoint = query.build_packet("off_endpoint")
    assert endpoint["source_contract"]["producer"].endswith(
        "FreshThirdPinnedEndpointOutsideSeedQueryPacket.ofSource"
    )
    assert endpoint["endpoint_split"]["pinned_center_role"] == "center_mem_seed"
    assert endpoint["endpoint_split"]["fan_row_center_role"] == "center_mem_seed"
    assert endpoint["hrow_at"]["seed_membership"]["pinned_center_in_seed"] is True
    assert "cap_witness" not in endpoint
    assert endpoint["field_provenance"]["source_entitled"] == []
    assert endpoint["field_provenance"]["metadata_only"] == [
        "source_contract", "source_hashes"
    ]
    assert "hrow_at" in endpoint["field_provenance"]["synthetic_schema_fixture"]
    assert endpoint["field_provenance"]["untrusted_proposal"] == [
        "metric_witness"
    ]
    assert all(
        "canonical_blocker_center_role" in record
        and "blocker_cap" not in record
        for record in endpoint["blocker_records"]
    )
    assert endpoint["endpoint_split"]["row_boundary_relation"] == "same_support"
    assert off_endpoint["endpoint_split"]["row_boundary_relation"] == "distinct_support"
    assert endpoint["rows"]["selected"]["support_roles"] == endpoint["rows"]["boundary"]["support_roles"]
    assert off_endpoint["rows"]["selected"]["support_roles"] != off_endpoint["rows"]["boundary"]["support_roles"]
    assert endpoint["escape"]["row"] == "selected"
    assert off_endpoint["escape"]["row"] == "boundary"


def test_tampering_missing_extra_and_hashes_fails_closed() -> None:
    packet = query.build_packet()

    missing = copy.deepcopy(packet)
    del missing["hrow_at"]["cap_counts"]
    with pytest.raises(query.AuditError):
        query.validate_packet(missing)

    extra = copy.deepcopy(packet)
    extra["unexpected"] = True
    with pytest.raises(query.AuditError):
        query.validate_packet(extra)

    altered_hash = copy.deepcopy(packet)
    altered_hash["hashes"]["canonical_artifact_sha256"] = "0" * 64
    with pytest.raises(query.AuditError):
        query.validate_packet(altered_hash)

    altered_source_hash = copy.deepcopy(packet)
    source = query.SOURCE_FILES[0]
    altered_source_hash["source_hashes"][source] = "0" * 64
    with pytest.raises(query.AuditError):
        query.validate_packet(altered_source_hash)


def test_tampering_float_alias_partition_and_support_cardinality_fails_closed() -> None:
    packet = query.build_packet()

    float_packet = copy.deepcopy(packet)
    float_packet["metric_witness"]["coordinates"]["boundary0"][0] = 1.0
    with pytest.raises(query.AuditError):
        query.validate_packet(float_packet)

    malformed_alias = copy.deepcopy(packet)
    malformed_alias["alias_partition"]["classes"][0].append("row0")
    with pytest.raises(query.AuditError):
        query.validate_packet(malformed_alias)

    malformed_support = copy.deepcopy(packet)
    malformed_support["blocker_records"][0]["support_roles"].pop()
    with pytest.raises(query.AuditError):
        query.validate_packet(malformed_support)


def test_json_roundtrip_keeps_rationals_as_strings() -> None:
    packet = query.build_packet("off_endpoint")
    encoded = json.dumps(packet, allow_nan=False)
    decoded = json.loads(encoded)
    query.validate_packet(decoded)
    assert isinstance(decoded["metric_witness"]["coordinates"]["boundary0"][0], str)
    assert all(
        type(value) is not float
        for point in decoded["metric_witness"]["coordinates"].values()
        for value in point
    )
