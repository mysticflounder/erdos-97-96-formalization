from __future__ import annotations

import copy
import hashlib
import json
import subprocess
from dataclasses import replace
from pathlib import Path

import pytest

import census.p97_search.freshthird_firstnonhit_complete_finite_v2 as v2


@pytest.fixture(scope="module")
def n17_bundle() -> v2.Bundle:
    return v2.emit_bundle(17)


def _json(data: bytes) -> dict[str, object]:
    value = json.loads(data)
    assert type(value) is dict
    return value


def _rehash_manifest(document: dict[str, object]) -> bytes:
    unsigned = dict(document)
    unsigned.pop("manifest_sha256", None)
    document["manifest_sha256"] = hashlib.sha256(
        v2._canonical_json(unsigned)
    ).hexdigest()
    return v2._canonical_json(document)


def test_n17_frozen_nonlaunch_counts_and_digest(n17_bundle: v2.Bundle) -> None:
    manifest = v2.validate_bundle(n17_bundle)

    assert manifest["variables"] == 93075
    assert manifest["clauses"] == 445252
    assert manifest["cnf_sha256"] == (
        "3d02bdddcf044bb49f7e23f2e53c6a50927b72e29f2d9bf7ac3b270e3e71b323"
    )
    assert manifest["source_total"] is False
    assert manifest["launch_enabled"] is False
    assert manifest["solver_run"] is False
    assert manifest["solver_verdict"] is None
    assert manifest["generic_cardinality_lift"] is False
    assert manifest["query_is_separate_assumption"] is True
    assert manifest["omitted_relaxations"] == list(v2.OMITTED_RELAXATIONS)
    assert set(manifest["family_clause_counts"]) == set(v2.FAMILY_SOURCES)


def test_every_variable_and_clause_has_one_unique_role(
    n17_bundle: v2.Bundle,
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
    assert all(row["family"] in v2.FAMILY_SOURCES for row in clauses)
    assert sum(row["family"] == "query_negation" for row in clauses) == 17 * 17 * 16
    for omitted in v2.OMITTED_RELAXATIONS:
        assert all(omitted not in role for role in variable_roles)
        assert all(omitted not in role for role in clause_roles)


def test_source_snapshot_pins_assignment_and_all_four_aggregate_modules(
    n17_bundle: v2.Bundle,
) -> None:
    snapshot = _json(n17_bundle.sources)
    files = snapshot["files"]
    assert type(files) is list
    assert snapshot["commit"] == v2.LEAN_COMMIT
    assert {row["path"] for row in files} == set(v2.SOURCE_HASHES)
    assert len(files) == 5
    assert all(row["sha256"] == v2.SOURCE_HASHES[row["path"]] for row in files)

    root = Path(v2.__file__).resolve().parents[2]
    for path, expected in v2.SOURCE_HASHES.items():
        committed = subprocess.run(
            ["git", "show", f"{v2.LEAN_COMMIT}:{path}"],
            cwd=root,
            check=True,
            capture_output=True,
        ).stdout
        assert hashlib.sha256(committed).hexdigest() == expected


@pytest.mark.parametrize("bad_n", [True, False, 16, 0, -1, 17.0, "17"])
def test_carrier_cardinality_controls_fail_closed(bad_n: object) -> None:
    with pytest.raises(v2.EncodingError, match="integer >= 17"):
        v2.encode(bad_n)  # type: ignore[arg-type]


def test_internal_tseitin_and_cardinality_truth_tables() -> None:
    v2.run_encoding_controls()


def test_bundle_is_byte_deterministic(n17_bundle: v2.Bundle) -> None:
    replay = v2.emit_bundle(17)
    assert replay == n17_bundle


def test_tampered_dimacs_rejected_after_digest_rebind(
    n17_bundle: v2.Bundle,
) -> None:
    lines = n17_bundle.cnf.splitlines()
    lines[0] = b"p cnf 93075 445251"
    bad_cnf = b"\n".join(lines) + b"\n"
    manifest = _json(n17_bundle.manifest)
    manifest["cnf_sha256"] = hashlib.sha256(bad_cnf).hexdigest()
    tampered = replace(
        n17_bundle,
        cnf=bad_cnf,
        manifest=_rehash_manifest(manifest),
    )
    with pytest.raises(v2.EncodingError, match="clause count mismatch"):
        v2.validate_bundle(tampered)


def test_tampered_map_role_rejected_after_digest_rebind(
    n17_bundle: v2.Bundle,
) -> None:
    mapping = _json(n17_bundle.variable_map)
    variables = mapping["variables"]
    assert type(variables) is list
    variables[1]["role"] = variables[0]["role"]
    bad_map = v2._canonical_json(mapping)
    manifest = _json(n17_bundle.manifest)
    manifest["map_sha256"] = hashlib.sha256(bad_map).hexdigest()
    tampered = replace(
        n17_bundle,
        variable_map=bad_map,
        manifest=_rehash_manifest(manifest),
    )
    with pytest.raises(v2.EncodingError, match="duplicate variable role"):
        v2.validate_bundle(tampered)


def test_audit_gate_tampering_is_rejected(n17_bundle: v2.Bundle) -> None:
    manifest = _json(n17_bundle.manifest)
    manifest["source_total"] = True
    tampered = replace(n17_bundle, manifest=_rehash_manifest(manifest))
    with pytest.raises(v2.EncodingError, match="audit gate flags"):
        v2.validate_bundle(tampered)


def test_source_snapshot_tampering_is_rejected(n17_bundle: v2.Bundle) -> None:
    sources = copy.deepcopy(_json(n17_bundle.sources))
    files = sources["files"]
    assert type(files) is list
    files[0]["sha256"] = "0" * 64
    bad_sources = v2._canonical_json(sources)
    manifest = _json(n17_bundle.manifest)
    manifest["sources_sha256"] = hashlib.sha256(bad_sources).hexdigest()
    tampered = replace(
        n17_bundle,
        sources=bad_sources,
        manifest=_rehash_manifest(manifest),
    )
    with pytest.raises(v2.EncodingError, match="source snapshot"):
        v2.validate_bundle(tampered)


def test_source_custody_rejects_symlink(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    real = tmp_path / "real.lean"
    real.write_text("theorem x : True := by trivial\n", encoding="utf-8")
    link = tmp_path / "source.lean"
    link.symlink_to(real)
    monkeypatch.setattr(v2, "_repo_root", lambda: tmp_path)
    monkeypatch.setattr(
        v2, "SOURCE_HASHES", {"source.lean": hashlib.sha256(real.read_bytes()).hexdigest()}
    )
    with pytest.raises(v2.EncodingError, match="refuses symlink"):
        v2.source_snapshot()


def test_exact_writer_is_idempotent_and_refuses_conflicts(tmp_path: Path) -> None:
    target = tmp_path / "artifact"
    v2._write_exact(target, b"canonical\n")
    v2._write_exact(target, b"canonical\n")
    with pytest.raises(v2.EncodingError, match="nonidentical"):
        v2._write_exact(target, b"changed\n")


def test_module_has_no_solver_or_launch_entrypoint() -> None:
    source = Path(v2.__file__).read_text(encoding="utf-8")
    assert "import subprocess" not in source
    assert "--launch" not in source
    assert "cadical" not in source.lower()
    assert v2.PRODUCTION_LAUNCH_ENABLED is False
    assert v2.SOURCE_TOTAL_CLAIM is False
