from __future__ import annotations

import copy
import hashlib
import json
import subprocess
from dataclasses import replace
from pathlib import Path

import pytest

import census.p97_search.freshthird_firstnonhit_cap_endpoint_v3 as v3


@pytest.fixture(scope="module")
def n17_bundle() -> v3.Bundle:
    return v3.emit_bundle(17)


def _json(data: bytes) -> dict[str, object]:
    value = json.loads(data)
    assert type(value) is dict
    return value


def _rehash_manifest(document: dict[str, object]) -> bytes:
    unsigned = dict(document)
    unsigned.pop("manifest_sha256", None)
    document["manifest_sha256"] = hashlib.sha256(
        v3._canonical_json(unsigned)
    ).hexdigest()
    return v3._canonical_json(document)


def test_n17_frozen_nonlaunch_counts_and_digest(n17_bundle: v3.Bundle) -> None:
    manifest = v3.validate_bundle(n17_bundle)

    assert manifest["variables"] == 93075
    assert manifest["clauses"] == 445258
    assert manifest["cnf_sha256"] == (
        "efee6f9ff7c95c090f11dd1f8566380e8c832d12641c1baf338e690d032962b3"
    )
    assert manifest["source_total"] is False
    assert manifest["launch_enabled"] is False
    assert manifest["solver_run"] is False
    assert manifest["solver_verdict"] is None
    assert manifest["generic_cardinality_lift"] is False
    assert manifest["query_is_separate_assumption"] is True
    assert manifest["omitted_relaxations"] == list(v3.OMITTED_RELAXATIONS)
    assert set(manifest["family_clause_counts"]) == set(v3.FAMILY_SOURCES)
    assert manifest["predecessor"]["cnf_sha256"] == v3.PREDECESSOR_CNF_SHA256
    assert manifest["clause_delta"]["count"] == 6
    assert manifest["clause_delta"]["all_positive_units"] is True


def test_exact_six_clause_delta_and_source_fields(n17_bundle: v3.Bundle) -> None:
    mapping = _json(n17_bundle.variable_map)
    clauses = mapping["clauses"]
    assert type(clauses) is list
    delta = clauses[v3.PREDECESSOR_CLAUSES :]
    assert len(delta) == 6
    assert [row["family"] for row in delta] == [
        "apex_cross_cap_membership"
    ] * 6
    assert all(len(row["literals"]) == 1 and row["literals"][0] > 0 for row in delta)
    assert len({row["role"] for row in delta}) == 6
    assert all(
        source_field in row["role"]
        for row, (_, _, source_field) in zip(
            delta, v3.APEX_CROSS_CAP_DELTA, strict=True
        )
    )
    assert (
        v3.SOURCE_HASHES[v3.APEX_SOURCE_FILE]
        in v3.FAMILY_SOURCES["apex_cross_cap_membership"]
    )


def test_audited_v2_sat_model_fails_new_family_with_empty_cap2() -> None:
    root = Path(v3.__file__).resolve().parents[2]
    stdout = (
        root
        / "scratch/runs/firstnonhit-complete-cnf-v2/"
        "n17-one-shot-audit-approved/production-cadical.stdout"
    ).read_bytes()
    control = v3.validate_predecessor_sat_model_control(stdout)
    assert control["predecessor_cnf_satisfied"] is True
    assert control["new_family_satisfied"] is False
    assert control["cap2_empty"] is True
    assert len(control["failed_new_clause_roles"]) == 3


def test_every_variable_and_clause_has_one_unique_role(
    n17_bundle: v3.Bundle,
) -> None:
    mapping = _json(n17_bundle.variable_map)
    variables = mapping["variables"]
    clauses = mapping["clauses"]
    assert type(variables) is list
    assert type(clauses) is list
    variable_roles = [row["role"] for row in variables]
    clause_roles = [row["role"] for row in clauses]
    assert len(variable_roles) == len(set(variable_roles))
    assert len(clause_roles) == len(set(clause_roles))
    assert all(row["family"] in v3.FAMILY_SOURCES for row in clauses)
    assert sum(row["family"] == "query_negation" for row in clauses) == 17 * 17 * 16
    for omitted in v3.OMITTED_RELAXATIONS:
        assert all(omitted not in role for role in variable_roles)
        assert all(omitted not in role for role in clause_roles)


def test_source_snapshot_pins_assignment_and_all_four_aggregate_modules(
    n17_bundle: v3.Bundle,
) -> None:
    snapshot = _json(n17_bundle.sources)
    files = snapshot["files"]
    assert type(files) is list
    assert snapshot["commit"] == v3.LEAN_COMMIT
    assert {row["path"] for row in files} == set(v3.SOURCE_HASHES)
    assert len(files) == 5
    assert all(row["sha256"] == v3.SOURCE_HASHES[row["path"]] for row in files)

    root = Path(v3.__file__).resolve().parents[2]
    for path, expected in v3.SOURCE_HASHES.items():
        committed = subprocess.run(
            ["git", "show", f"{v3.LEAN_COMMIT}:{path}"],
            cwd=root,
            check=True,
            capture_output=True,
        ).stdout
        assert hashlib.sha256(committed).hexdigest() == expected


@pytest.mark.parametrize("bad_n", [True, False, 16, 0, -1, 17.0, "17"])
def test_carrier_cardinality_controls_fail_closed(bad_n: object) -> None:
    with pytest.raises(v3.EncodingError, match="integer >= 17"):
        v3.encode(bad_n)  # type: ignore[arg-type]


def test_internal_tseitin_and_cardinality_truth_tables() -> None:
    v3.run_encoding_controls()


def test_bundle_is_byte_deterministic(n17_bundle: v3.Bundle) -> None:
    replay = v3.emit_bundle(17)
    assert replay == n17_bundle


def test_tampered_dimacs_rejected_after_digest_rebind(
    n17_bundle: v3.Bundle,
) -> None:
    lines = n17_bundle.cnf.splitlines()
    lines[0] = b"p cnf 93075 445257"
    bad_cnf = b"\n".join(lines) + b"\n"
    manifest = _json(n17_bundle.manifest)
    manifest["cnf_sha256"] = hashlib.sha256(bad_cnf).hexdigest()
    tampered = replace(
        n17_bundle,
        cnf=bad_cnf,
        manifest=_rehash_manifest(manifest),
    )
    with pytest.raises(v3.EncodingError, match="clause count mismatch"):
        v3.validate_bundle(tampered)


def test_tampered_map_role_rejected_after_digest_rebind(
    n17_bundle: v3.Bundle,
) -> None:
    mapping = _json(n17_bundle.variable_map)
    variables = mapping["variables"]
    assert type(variables) is list
    variables[1]["role"] = variables[0]["role"]
    bad_map = v3._canonical_json(mapping)
    manifest = _json(n17_bundle.manifest)
    manifest["map_sha256"] = hashlib.sha256(bad_map).hexdigest()
    tampered = replace(
        n17_bundle,
        variable_map=bad_map,
        manifest=_rehash_manifest(manifest),
    )
    with pytest.raises(v3.EncodingError, match="duplicate variable role"):
        v3.validate_bundle(tampered)


def test_audit_gate_tampering_is_rejected(n17_bundle: v3.Bundle) -> None:
    manifest = _json(n17_bundle.manifest)
    manifest["source_total"] = True
    tampered = replace(n17_bundle, manifest=_rehash_manifest(manifest))
    with pytest.raises(v3.EncodingError, match="audit gate flags"):
        v3.validate_bundle(tampered)


@pytest.mark.parametrize(
    ("field", "bad_value", "message"),
    [
        ("lean_commit", "0" * 40, "Lean commit binding"),
        ("variables", 93074, "manifest count"),
        ("clauses", 445257, "manifest count"),
        ("finite_encoding_emitted", False, "finite encoding flag"),
        ("query_is_separate_assumption", False, "query separation flag"),
        ("query", "different query", "query text"),
    ],
)
def test_manifest_boundary_tampering_rejected_after_self_hash_rebind(
    n17_bundle: v3.Bundle, field: str, bad_value: object, message: str
) -> None:
    manifest = _json(n17_bundle.manifest)
    manifest[field] = bad_value
    tampered = replace(n17_bundle, manifest=_rehash_manifest(manifest))
    with pytest.raises(v3.EncodingError, match=message):
        v3.validate_bundle(tampered)


def test_source_snapshot_tampering_is_rejected(n17_bundle: v3.Bundle) -> None:
    sources = copy.deepcopy(_json(n17_bundle.sources))
    files = sources["files"]
    assert type(files) is list
    files[0]["sha256"] = "0" * 64
    bad_sources = v3._canonical_json(sources)
    manifest = _json(n17_bundle.manifest)
    manifest["sources_sha256"] = hashlib.sha256(bad_sources).hexdigest()
    tampered = replace(
        n17_bundle,
        sources=bad_sources,
        manifest=_rehash_manifest(manifest),
    )
    with pytest.raises(v3.EncodingError, match="source snapshot"):
        v3.validate_bundle(tampered)


def test_source_custody_rejects_symlink(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    real = tmp_path / "real.lean"
    real.write_text("theorem x : True := by trivial\n", encoding="utf-8")
    link = tmp_path / "source.lean"
    link.symlink_to(real)
    monkeypatch.setattr(v3, "_repo_root", lambda: tmp_path)
    monkeypatch.setattr(
        v3, "SOURCE_HASHES", {"source.lean": hashlib.sha256(real.read_bytes()).hexdigest()}
    )
    with pytest.raises(v3.EncodingError, match="refuses symlink"):
        v3.source_snapshot()


def test_exact_writer_is_idempotent_and_refuses_conflicts(tmp_path: Path) -> None:
    target = tmp_path / "artifact"
    v3._write_exact(target, b"canonical\n")
    v3._write_exact(target, b"canonical\n")
    with pytest.raises(v3.EncodingError, match="nonidentical"):
        v3._write_exact(target, b"changed\n")


def test_module_has_no_solver_or_launch_entrypoint() -> None:
    source = Path(v3.__file__).read_text(encoding="utf-8")
    assert "import subprocess" not in source
    assert "--launch" not in source
    assert "cadical" not in source.lower()
    assert v3.PRODUCTION_LAUNCH_ENABLED is False
    assert v3.SOURCE_TOTAL_CLAIM is False
