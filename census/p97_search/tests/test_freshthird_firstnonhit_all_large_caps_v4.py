from __future__ import annotations

import hashlib
import itertools
import json
import subprocess
from dataclasses import replace
from pathlib import Path

import pytest

import census.p97_search.freshthird_firstnonhit_all_large_caps_v4 as v4
import census.p97_search.freshthird_firstnonhit_cap_endpoint_v3 as v3


def _json(data: bytes) -> dict[str, object]:
    return json.loads(data)


@pytest.fixture(scope="module")
def n17_bundle() -> v4.Bundle:
    return v4.emit_bundle(17)


def _rehash_manifest(bundle: v4.Bundle, changes: dict[str, object]) -> v4.Bundle:
    manifest = _json(bundle.manifest)
    manifest.update(changes)
    manifest.pop("manifest_sha256", None)
    manifest["manifest_sha256"] = hashlib.sha256(
        v4._canonical_json(manifest)
    ).hexdigest()
    return replace(bundle, manifest=v4._canonical_json(manifest))


def test_counts_schema_and_delta(n17_bundle: v4.Bundle) -> None:
    manifest = v4.validate_bundle(n17_bundle)
    assert manifest["schema"] == v4.MANIFEST_SCHEMA
    assert manifest["variables"] == 93075
    assert manifest["clauses"] == 463822
    assert manifest["source_total"] is False
    assert manifest["launch_enabled"] is False
    assert manifest["predecessor"] == {
        "schema": v3.SCHEMA,
        "variables": 93075,
        "clauses": 445258,
        "cnf_sha256": v3.INDEPENDENT_AUDIT["cnf_sha256"]
        if hasattr(v3, "INDEPENDENT_AUDIT")
        else "efee6f9ff7c95c090f11dd1f8566380e8c832d12641c1baf338e690d032962b3",
    }
    assert manifest["clause_delta"]["constraint_count"] == 3
    assert manifest["family_clause_counts"]["all_large_caps"] == 18564


def test_prefix_is_byte_identical_to_v3(n17_bundle: v4.Bundle) -> None:
    current = n17_bundle.cnf.splitlines()
    predecessor = v3._dimacs(v3.encode(17)).splitlines()
    assert current[0] == b"p cnf 93075 463822"
    assert current[1 : 1 + v4.PREDECESSOR_CLAUSES] == predecessor[1:]
    assert (
        hashlib.sha256(b"\n".join(predecessor) + b"\n").hexdigest()
        == v4.PREDECESSOR_CNF_SHA256
    )


def test_exact_three_cardinality_families_and_lexicographic_roles(
    n17_bundle: v4.Bundle,
) -> None:
    mapping = _json(n17_bundle.variable_map)
    rows = mapping["clauses"][v4.PREDECESSOR_CLAUSES :]
    assert len(rows) == 3 * 6188
    for cap, field in v4.ALL_LARGE_CAP_DELTA:
        assert field == "cap_card_ge_six"
        part = [
            row
            for row in rows
            if row["role"].startswith(f"all_large_caps/{field}/cap{cap}/")
        ]
        assert len(part) == 6188
        assert all(len(row["literals"]) == 12 for row in part)
        assert [tuple(row["literals"]) for row in part] == sorted(
            tuple(row["literals"]) for row in part
        )


def test_all_cap_source_is_normalized_theorem(n17_bundle: v4.Bundle) -> None:
    mapping = _json(n17_bundle.variable_map)
    source = mapping["family_sources"]["all_large_caps"]
    assert "FirstNonHitFiniteAllLargeCaps.cap_card_ge_six" in source
    assert "antecedent=FirstNonHitCompleteFiniteSourceTheory.allLargeCaps" in source
    assert "surplusCap_card_ge_six" not in source
    assert "firstOppCap_card_ge_six" not in source
    assert "secondOppCap_card_ge_six" not in source


def test_v3_model_counts_and_cap0_delta_fail() -> None:
    root = Path(v4.__file__).resolve().parents[2]
    stdout = (
        root
        / "scratch/runs/firstnonhit-cap-endpoint-v3/n17-one-shot-audit-approved/production-cadical.stdout"
    ).read_bytes()
    control = v4.validate_predecessor_sat_model_control(stdout)
    assert control["predecessor_cnf_satisfied"] is True
    assert control["cap_counts"] == [4, 10, 6]
    assert control["cap0_delta_failed"] is True


def test_source_snapshot_is_head_pinned(n17_bundle: v4.Bundle) -> None:
    snapshot = _json(n17_bundle.sources)
    assert snapshot["commit"] == v4.LEAN_COMMIT
    root = Path(v4.__file__).resolve().parents[2]
    for path, expected in v4.SOURCE_HASHES.items():
        committed = subprocess.run(
            ["git", "show", f"{v4.LEAN_COMMIT}:{path}"],
            cwd=root,
            check=True,
            capture_output=True,
        ).stdout
        assert hashlib.sha256(committed).hexdigest() == expected


def test_cardinality_truth_tables() -> None:
    for n in (6, 7):
        for truth in itertools.product((False, True), repeat=n):
            clauses = v4._cardinality_clauses(truth, n)
            assert all(any(truth[index] for index in clause) for clause in clauses) == (
                sum(truth) >= 6
            )


@pytest.mark.parametrize("bad_n", [True, False, 16, 0, -1, 17.0, "17"])
def test_carrier_controls_fail_closed(bad_n: object) -> None:
    with pytest.raises(v4.EncodingError):
        v4.encode(bad_n)  # type: ignore[arg-type]


def test_malformed_bundle_rejected(n17_bundle: v4.Bundle) -> None:
    lines = n17_bundle.cnf.splitlines()
    lines[-1] = b"1 0"
    bad = replace(n17_bundle, cnf=b"\n".join(lines) + b"\n")
    with pytest.raises(v4.EncodingError):
        v4.validate_bundle(bad)


def test_audit_gate_rejects_source_total_claim(n17_bundle: v4.Bundle) -> None:
    with pytest.raises(v4.EncodingError, match="audit gate"):
        v4.validate_bundle(_rehash_manifest(n17_bundle, {"source_total": True}))
