"""Fake/offline adversarial coverage for the Exact17 shadow adapter."""

from __future__ import annotations

import hashlib
import inspect
import json
import os
import stat
from dataclasses import replace
from pathlib import Path

import pytest

from census.p97_search import cegar_exact17_shadow as shadow
from census.p97_search.phase3_cegar_wave import canonical_json_bytes


def _write(path: Path, value: object) -> str:
    data = value if isinstance(value, bytes) else canonical_json_bytes(value)
    path.write_bytes(data)
    return hashlib.sha256(data).hexdigest()


def _fixture(
    tmp_path: Path, child: str = shadow.CHILD38
) -> tuple[shadow.Exact17LegacyBundle, shadow.StaticCnfControl]:
    variables, parent_count, suffix_count = (3, 2, 1)
    cnf_count = parent_count if child == shadow.CHILD38 else parent_count + suffix_count
    parent = tmp_path / "parent.cnf"
    cnf = tmp_path / "child.cnf"
    parent.write_bytes(b"p cnf 3 2\n1 0\n2 0\n")
    cnf.write_bytes(
        b"p cnf 3 2\n1 0\n2 0\n"
        if child == shadow.CHILD38
        else b"p cnf 3 3\n1 0\n2 0\n3 0\n"
    )
    source_model_path = tmp_path / "source-model.json"
    model_path = tmp_path / "model.json"
    export_path = tmp_path / "export.json"
    ingress_path = tmp_path / "ingress.json"
    final_path = tmp_path / "final.json"
    model = {
        "schema": f"p97-exact17-child{38 if child == shadow.CHILD38 else 39}-piqd-model/v3",
        "cnf_sha256": hashlib.sha256(cnf.read_bytes()).hexdigest(),
        "manifest_sha256": "0" * 64,
        "completion_identity_hash": "i" * 64,
        "job_id": "job",
        "model": {
            "assignment": [1, 2, 3],
            "backend": "cadical",
            "job_id": "job",
            "num_assigned": 3,
            "result": "SAT",
            "solver_profile": "sat",
        },
    }
    source_model_digest = _write(
        source_model_path,
        {"schema": "p97-exact17-source-model/v1", "assignment": [1, 2, 3]},
    )
    _write(model_path, model)
    export = {
        "schema": f"p97-exact17-child{38 if child == shadow.CHILD38 else 39}-immutable-export-receipt/v1",
        "status": "PASS",
        "publication_state": "PROVISIONED",
        "child": {
            "path": str(cnf),
            "sha256": model["cnf_sha256"],
            "bytes": cnf.stat().st_size,
            "variables": variables,
            "clauses": cnf_count,
        },
        "model": {"path": str(source_model_path), "sha256": source_model_digest},
        "validation": {
            "child": {"sha256": model["cnf_sha256"]},
            "ordered_suffix_exact": True,
            "ordered_suffix_sha256": hashlib.sha256(b"3 0\n").hexdigest(),
        },
    }
    if child == shadow.CHILD39:
        export["parent"] = {
            "path": str(parent),
            "sha256": hashlib.sha256(parent.read_bytes()).hexdigest(),
        }
        export["validation"].update(
            {
                "parent": {
                    "clauses": parent_count,
                    "sha256": export["parent"]["sha256"],
                }
            }
        )
    export_digest = _write(export_path, export)
    model["manifest_sha256"] = "m" * 64
    _write(model_path, model)
    export["model"]["sha256"] = source_model_digest
    _write(export_path, export)
    export_digest = hashlib.sha256(export_path.read_bytes()).hexdigest()
    ingress = {
        "schema": "p97-exact17-shadow-test-ingress/v1",
        "status": "PASS",
        "dimacs": {
            "path": str(cnf),
            "sha256": model["cnf_sha256"],
            "bytes": cnf.stat().st_size,
            "variables": variables,
            "clauses": cnf_count,
        },
        "export_receipt": {"path": str(export_path), "sha256": export_digest},
        "model": {"path": str(source_model_path), "sha256": source_model_digest},
        "validation": {
            "child": {"sha256": model["cnf_sha256"]},
            "ordered_suffix_exact": True,
            "ordered_suffix_sha256": hashlib.sha256(b"3 0\n").hexdigest(),
        },
        "piqd": {
            "backend": "cadical",
            "daemon_sha256": "d" * 64,
            "solver_sha256": "s" * 64,
        },
    }
    if child == shadow.CHILD39:
        ingress["parent_ingress"] = {
            "parent_dimacs_sha256": hashlib.sha256(parent.read_bytes()).hexdigest()
        }
        ingress["validation"]["parent"] = {
            "sha256": hashlib.sha256(parent.read_bytes()).hexdigest(),
            "clauses": parent_count,
        }
    ingress_digest = _write(ingress_path, ingress)
    model["manifest_sha256"] = ingress_digest
    _write(model_path, model)
    export["model"]["sha256"] = source_model_digest
    _write(export_path, export)
    export_digest = hashlib.sha256(export_path.read_bytes()).hexdigest()
    ingress["export_receipt"]["sha256"] = export_digest
    _write(ingress_path, ingress)
    ingress_digest = hashlib.sha256(ingress_path.read_bytes()).hexdigest()
    model["manifest_sha256"] = ingress_digest
    _write(model_path, model)
    export["model"]["sha256"] = source_model_digest
    _write(export_path, export)
    export_digest = hashlib.sha256(export_path.read_bytes()).hexdigest()
    ingress["export_receipt"]["sha256"] = export_digest
    _write(ingress_path, ingress)
    ingress_digest = hashlib.sha256(ingress_path.read_bytes()).hexdigest()
    # The final receipt is intentionally written after the final manifest.
    model["manifest_sha256"] = ingress_digest
    _write(model_path, model)
    final = {
        "schema": f"p97-exact17-child{38 if child == shadow.CHILD38 else 39}-piqd-final/v2",
        "job_id": "job",
        "result": "SAT",
        "model_sha256": hashlib.sha256(model_path.read_bytes()).hexdigest(),
        "binding": {
            "cnf_sha256": model["cnf_sha256"],
            "manifest_sha256": ingress_digest,
            "project": f"erdos-97-96-exact17-child{38 if child == shadow.CHILD38 else 39}",
            "backend": "cadical",
            "solver_profile": "sat",
            "identity_hash": "i" * 64,
        },
        "completion_status": {
            "daemon_sha256": "d" * 64,
            "identity_hash": "i" * 64,
            "cnf_blob_hash": model["cnf_sha256"],
        },
        "deciding_daemon_sha256": "d" * 64,
        "solver": {"sha256": "s" * 64},
        "model_check": {
            "job_id": "job",
            "outcome": "SATISFIED",
            "cnf_blob_hash": model["cnf_sha256"],
            "num_vars": variables,
            "num_clauses": cnf_count,
            "num_assigned": variables,
        },
        "model_replay": {"clauses_checked": cnf_count, "satisfies_all": True},
        "theorem_claim": False,
        "global_claim": False,
        "lean_claim": False,
        "proof_claim": False,
    }
    _write(final_path, final)
    # Keep the final's model digest and the model's manifest identity aligned.
    bundle = shadow.Exact17LegacyBundle(
        child,
        cnf,
        export_path,
        ingress_path,
        final_path,
        model_path,
        source_model_path,
        parent if child == shadow.CHILD39 else None,
    )
    control = shadow.StaticCnfControl(model["cnf_sha256"], variables, cnf_count)
    return bundle, control


def _bind_daemon_reference(
    bundle: shadow.Exact17LegacyBundle,
    path: Path,
    *,
    sha256: str | None = None,
) -> None:
    ingress = json.loads(bundle.ingress_manifest.read_text())
    ingress["piqd"]["daemon_build_receipt"] = {
        "path": str(path),
        "sha256": sha256 or hashlib.sha256(path.read_bytes()).hexdigest(),
    }
    ingress_digest = _write(bundle.ingress_manifest, ingress)
    model = json.loads(bundle.model.read_text())
    model["manifest_sha256"] = ingress_digest
    _write(bundle.model, model)
    final = json.loads(bundle.final_receipt.read_text())
    final["binding"]["manifest_sha256"] = ingress_digest
    final["model_sha256"] = hashlib.sha256(bundle.model.read_bytes()).hexdigest()
    _write(bundle.final_receipt, final)


def test_child38_shadow_is_offline_and_observed(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    monkeypatch.setitem(shadow._CHILD_COUNTS, shadow.CHILD38, (3, 2, 1))
    bundle, control = _fixture(tmp_path)
    result = shadow.validate_exact17_shadow(bundle, control)
    assert result["status"] == shadow.SAT_OBSERVED
    assert result["child"] == shadow.CHILD38


def test_child39_binds_parent_and_ordered_suffix(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    monkeypatch.setitem(shadow._CHILD_COUNTS, shadow.CHILD38, (3, 2, 1))
    monkeypatch.setitem(shadow._CHILD_COUNTS, shadow.CHILD39, (3, 3, 1))
    bundle, control = _fixture(tmp_path, shadow.CHILD39)
    assert (
        shadow.validate_exact17_shadow(bundle, control)["status"] == shadow.SAT_OBSERVED
    )


@pytest.mark.parametrize(
    "field", ["cnf", "export_receipt", "ingress_manifest", "final_receipt", "model"]
)
def test_crossed_or_same_length_tamper_fails(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, field: str
) -> None:
    monkeypatch.setitem(shadow._CHILD_COUNTS, shadow.CHILD38, (3, 2, 1))
    bundle, control = _fixture(tmp_path)
    path = getattr(bundle, field)
    data = path.read_bytes()
    path.write_bytes(data[:-1] + (b"\n" if data[-1:] != b"\n" else b" "))
    with pytest.raises(shadow.Exact17ShadowError):
        shadow.validate_exact17_shadow(bundle, control)


def test_symlink_hardlink_alias_and_protected_output_are_rejected(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    monkeypatch.setitem(shadow._CHILD_COUNTS, shadow.CHILD38, (3, 2, 1))
    bundle, control = _fixture(tmp_path)
    alias = tmp_path / "alias.cnf"
    alias.symlink_to(bundle.cnf)
    with pytest.raises(shadow.Exact17ShadowError):
        shadow.validate_exact17_shadow(
            shadow.Exact17LegacyBundle(
                bundle.child,
                alias,
                bundle.export_receipt,
                bundle.ingress_manifest,
                bundle.final_receipt,
                bundle.model,
            ),
            control,
        )
    hard = tmp_path / "hard.cnf"
    hard.hardlink_to(bundle.cnf)
    with pytest.raises(shadow.Exact17ShadowError):
        shadow.validate_exact17_shadow(
            shadow.Exact17LegacyBundle(
                bundle.child,
                hard,
                bundle.export_receipt,
                bundle.ingress_manifest,
                bundle.final_receipt,
                bundle.model,
            ),
            control,
        )
    with pytest.raises(shadow.Exact17ShadowError):
        shadow.publish_exact17_shadow_receipt(bundle, control, bundle.cnf)


def test_claims_false_and_receipt_is_create_once(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    monkeypatch.setitem(shadow._CHILD_COUNTS, shadow.CHILD38, (3, 2, 1))
    bundle, control = _fixture(tmp_path)
    destination = tmp_path / "shadow-receipt.json"
    result = shadow.publish_exact17_shadow_receipt(bundle, control, destination)
    assert (
        result["receipt_sha256"] == hashlib.sha256(destination.read_bytes()).hexdigest()
    )
    assert stat.S_IMODE(destination.stat().st_mode) == 0o600
    with pytest.raises(shadow.Exact17ShadowError):
        shadow.publish_exact17_shadow_receipt(bundle, control, destination)


def test_json_accepts_only_the_two_exact_legacy_serializations(tmp_path: Path) -> None:
    value = {"alpha": {"count": 1}, "omega": [False, None, "x"]}
    compact = canonical_json_bytes(value)
    legacy_pretty = (
        json.dumps(value, sort_keys=True, indent=2, ensure_ascii=False).encode() + b"\n"
    )
    for index, raw in enumerate((compact, legacy_pretty)):
        path = tmp_path / f"accepted-{index}.json"
        path.write_bytes(raw)
        assert (
            shadow._json(shadow._capture(path, "accepted JSON"), "accepted JSON")
            == value
        )

    rejected = (
        b'{"alpha":1,"alpha":1}',
        b'{"alpha":NaN}',
        b'{"alpha":Infinity}',
        b'{ "alpha": 1 }',
        b'{"omega":2,"alpha":1}',
        b'{\n  "alpha": 1\n}',
    )
    for index, raw in enumerate(rejected):
        path = tmp_path / f"rejected-{index}.json"
        path.write_bytes(raw)
        with pytest.raises(shadow.Exact17ShadowError):
            shadow._json(shadow._capture(path, "rejected JSON"), "rejected JSON")


def test_publication_rejects_parent_path_rebind_without_touching_hostile_entry(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    monkeypatch.setitem(shadow._CHILD_COUNTS, shadow.CHILD38, (3, 2, 1))
    inputs = tmp_path / "inputs"
    inputs.mkdir()
    bundle, control = _fixture(inputs)
    parent = tmp_path / "receipts"
    parent.mkdir()
    moved = tmp_path / "receipts-held"
    destination = parent / "shadow-receipt.json"
    hostile = b"hostile replacement\n"
    original = shadow._same_dir_path

    def rebind(path: Path, before: os.stat_result) -> bool:
        parent.rename(moved)
        parent.mkdir()
        (parent / destination.name).write_bytes(hostile)
        return original(path, before)

    monkeypatch.setattr(shadow, "_same_dir_path", rebind)
    with pytest.raises(shadow.Exact17ShadowError):
        shadow.publish_exact17_shadow_receipt(bundle, control, destination)
    assert destination.read_bytes() == hostile
    assert not (moved / destination.name).exists()


def test_large_dimacs_captures_do_not_retain_bytes(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    monkeypatch.setitem(shadow._CHILD_COUNTS, shadow.CHILD38, (3, 2, 1))
    monkeypatch.setitem(shadow._CHILD_COUNTS, shadow.CHILD39, (3, 3, 1))
    bundle, _ = _fixture(tmp_path, shadow.CHILD39)
    captured = shadow._capture_bundle(bundle)
    assert captured["cnf"].capture.data is None
    assert captured["parent_cnf"].capture.data is None


def test_model_assignment_order_is_semantically_irrelevant(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    monkeypatch.setitem(shadow._CHILD_COUNTS, shadow.CHILD38, (3, 2, 1))
    bundle, control = _fixture(tmp_path)
    model = json.loads(bundle.model.read_text())
    model["model"]["assignment"] = [3, 1, 2]
    _write(bundle.model, model)
    final = json.loads(bundle.final_receipt.read_text())
    final["model_sha256"] = hashlib.sha256(bundle.model.read_bytes()).hexdigest()
    _write(bundle.final_receipt, final)
    assert shadow.validate_exact17_shadow(bundle, control)["status"] == "SAT_OBSERVED"


def test_daemon_receipt_can_remain_a_sealed_reference_or_be_recaptured(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    monkeypatch.setitem(shadow._CHILD_COUNTS, shadow.CHILD38, (3, 2, 1))
    bundle, control = _fixture(tmp_path)
    daemon_receipt = tmp_path / "daemon-build.txt"
    daemon_receipt.write_bytes(b"daemon build identity\n")
    _bind_daemon_reference(bundle, daemon_receipt)

    referenced = shadow.validate_exact17_shadow(bundle, control)
    assert referenced["daemon_build_receipt_reference"] == {
        "path": str(daemon_receipt),
        "sha256": hashlib.sha256(daemon_receipt.read_bytes()).hexdigest(),
    }
    assert "daemon_build_receipt" not in referenced["artifact_sha256"]

    recaptured = shadow.validate_exact17_shadow(
        replace(bundle, daemon_build_receipt=daemon_receipt), control
    )
    assert (
        recaptured["artifact_sha256"]["daemon_build_receipt"]
        == hashlib.sha256(daemon_receipt.read_bytes()).hexdigest()
    )


def test_malformed_or_unsealed_daemon_receipt_fails(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    monkeypatch.setitem(shadow._CHILD_COUNTS, shadow.CHILD38, (3, 2, 1))
    bundle, control = _fixture(tmp_path)
    daemon_receipt = tmp_path / "daemon-build.txt"
    daemon_receipt.write_bytes(b"daemon build identity\n")
    _bind_daemon_reference(bundle, daemon_receipt, sha256="A" * 64)
    with pytest.raises(shadow.Exact17ShadowError):
        shadow.validate_exact17_shadow(bundle, control)

    unsealed_root = tmp_path / "unsealed"
    unsealed_root.mkdir()
    bundle, control = _fixture(unsealed_root)
    daemon_receipt = tmp_path / "unsealed-daemon-build.txt"
    daemon_receipt.write_bytes(b"daemon build identity\n")
    with pytest.raises(shadow.Exact17ShadowError):
        shadow.validate_exact17_shadow(
            replace(bundle, daemon_build_receipt=daemon_receipt), control
        )


def test_affirmative_claim_and_same_inode_rebind_fail(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    monkeypatch.setitem(shadow._CHILD_COUNTS, shadow.CHILD38, (3, 2, 1))
    bundle, control = _fixture(tmp_path)
    final = json.loads(bundle.final_receipt.read_text())
    final["theorem_claim"] = True
    bundle.final_receipt.write_bytes(canonical_json_bytes(final))
    with pytest.raises(shadow.Exact17ShadowError):
        shadow.validate_exact17_shadow(bundle, control)

    rebind_root = tmp_path / "rebind"
    rebind_root.mkdir()
    bundle, control = _fixture(rebind_root)
    original = shadow._capture_bundle
    calls = 0

    def capture_then_mutate(value: shadow.Exact17LegacyBundle) -> dict[str, object]:
        nonlocal calls
        result = original(value)
        calls += 1
        if calls == 1:
            data = value.model.read_bytes()
            value.model.write_bytes(
                data.replace(b'"job_id":"job"', b'"job_id":"jox"', 1)
            )
        return result

    monkeypatch.setattr(shadow, "_capture_bundle", capture_then_mutate)
    with pytest.raises(shadow.Exact17ShadowError):
        shadow.validate_exact17_shadow(bundle, control)


def test_shadow_has_no_execution_or_dynamic_dispatch_surface() -> None:
    source = inspect.getsource(shadow)
    assert "subprocess" not in source
    assert "socket" not in source
    assert "importlib" not in source
    assert "exec(" not in source
    assert "eval(" not in source
