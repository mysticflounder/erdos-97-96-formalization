from __future__ import annotations

import hashlib
import json
import sys
from dataclasses import dataclass, replace
from pathlib import Path
from typing import Any

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent))

import export_exact17_thirty_second_root as exporter
import validate_exact17_thirty_first_model_refinements_export as export_validation
import validate_exact17_thirty_first_model_refinements_ingress as ingress


@dataclass
class Fixture:
    paths: exporter.ExportPaths
    spec: export_validation.ExportSpec
    ledger: dict[str, Any]
    child_bytes: bytes
    calls: list[Path]
    publication_inputs: export_validation.PublicationInputs

    def validator(self, path: Path, **inputs: Path) -> dict[str, Any]:
        self.calls.append(path)
        assert inputs == {
            "lean_output": self.publication_inputs.lean_output,
            "analysis_path": self.publication_inputs.analysis,
            "parent_ledger_path": self.publication_inputs.parent_ledger,
            "parent_cnf_path": self.publication_inputs.parent_cnf,
        }
        return self.ledger


def _fixture(tmp_path: Path) -> Fixture:
    parent = tmp_path / "parent.cnf"
    ledger_path = tmp_path / "publication.json"
    lean_root = tmp_path / "Root.lean"
    lean_export = tmp_path / "Export.lean"
    analysis = tmp_path / "analysis.json"
    parent_ledger = tmp_path / "parent-ledger.json"
    child = tmp_path / "child.cnf"
    receipt = tmp_path / "receipt.json"
    parent.write_bytes(b"p cnf 308 2\n1 0\n2 0\n")
    lean_root.write_text("def root := True\n", encoding="utf-8")
    lean_export.write_text("def main := pure ()\n", encoding="utf-8")
    analysis.write_text("{}\n", encoding="utf-8")
    parent_ledger.write_text("{}\n", encoding="utf-8")
    ledger = {
        "schema": "fixture-child32/v2",
        "minimal_support_count": 1,
        "parent_subsumed_support_count": 0,
        "emitted_clause_count": 4,
        "shard_count": 4,
        "publication_protocol": (
            "immutable-outputs-then-ledger-last+shared-read-lock/v2"
        ),
        "parent_cnf": {
            "path": str(parent),
            "sha256": export_validation.sha256_file(parent),
            "bytes_verified": True,
        },
        "generated_outputs": {"fixture.lean": "0" * 64},
        "named_order": {
            "index": 1,
            "tuple": list(export_validation.ORDERS[1]),
            "reverse_tuple": list(reversed(export_validation.ORDERS[1])),
            "table_sha256": export_validation._order_table_sha256(),
        },
        "entries": [{"hits": [[0, 1]]}],
    }
    ledger_path.write_text(json.dumps(ledger, sort_keys=True) + "\n", encoding="utf-8")
    draft_spec = export_validation.ExportSpec(
        variables=308,
        parent_clauses=2,
        new_clauses=4,
        parent_sha256=export_validation.sha256_file(parent),
        child_sha256=None,
        child_bytes=None,
        ledger_schema="fixture-child32/v2",
        ledger_sha256=export_validation.sha256_file(ledger_path),
        occurrence_count=1,
        expected_output_paths=("fixture.lean",),
        publication_state="UNPROVISIONED",
    )
    suffix = export_validation._expected_suffix(ledger, draft_spec)
    child_bytes = (
        b"p cnf 308 6\n1 0\n2 0\n"
        + b"".join(
            (" ".join(map(str, clause)) + " 0\n").encode() for clause in suffix
        )
    )
    spec = export_validation.ExportSpec(
        **{
            **draft_spec.__dict__,
            "child_sha256": hashlib.sha256(child_bytes).hexdigest(),
            "child_bytes": len(child_bytes),
            "publication_state": "PROVISIONED",
        }
    )
    return Fixture(
        paths=exporter.ExportPaths(
            parent=parent,
            ledger=ledger_path,
            lean_root=lean_root,
            lean_export=lean_export,
            child=child,
            receipt=receipt,
        ),
        spec=spec,
        ledger=ledger,
        child_bytes=child_bytes,
        calls=[],
        publication_inputs=export_validation.PublicationInputs(
            lean_output=lean_root,
            analysis=analysis,
            parent_ledger=parent_ledger,
            parent_cnf=parent,
        ),
    )


def test_exact_order_prefix_hash_and_publication_replay(tmp_path: Path) -> None:
    fixture = _fixture(tmp_path)
    fixture.paths.child.write_bytes(fixture.child_bytes)
    report = export_validation.validate_export(
        fixture.paths.parent,
        fixture.paths.child,
        fixture.paths.ledger,
        spec=fixture.spec,
        publication_validator=fixture.validator,
        publication_inputs=fixture.publication_inputs,
    )
    assert report["status"] == "PASS"
    assert report["parent_prefix_byte_identical"] is True
    assert report["missing_clauses"] == report["extra_clauses"] == 0
    assert len(fixture.calls) == 2

    lines = fixture.child_bytes.splitlines(keepends=True)
    fixture.paths.child.write_bytes(b"".join(lines[:3] + [lines[4], lines[3], *lines[5:]]))
    with pytest.raises(ValueError, match="ordered suffix drift"):
        export_validation.validate_export(
            fixture.paths.parent,
            fixture.paths.child,
            fixture.paths.ledger,
            spec=fixture.spec,
            publication_validator=fixture.validator,
            publication_inputs=fixture.publication_inputs,
        )


@pytest.mark.parametrize(
    ("mutate", "message"),
    [
        (lambda lines: b"".join(lines[:-1]), "suffix is missing clause"),
        (lambda lines: b"".join([*lines, b"3 0\n"]), "contains extra clauses"),
    ],
)
def test_missing_and_extra_clauses_fail_explicitly(
    tmp_path: Path,
    mutate: Any,
    message: str,
) -> None:
    fixture = _fixture(tmp_path)
    fixture.paths.child.write_bytes(mutate(fixture.child_bytes.splitlines(keepends=True)))
    with pytest.raises(ValueError, match=message):
        export_validation.validate_export(
            fixture.paths.parent,
            fixture.paths.child,
            fixture.paths.ledger,
            spec=fixture.spec,
            publication_validator=fixture.validator,
            publication_inputs=fixture.publication_inputs,
        )


def test_semantically_reordered_parent_duplicate_is_rejected(tmp_path: Path) -> None:
    fixture = _fixture(tmp_path)
    suffix = export_validation._expected_suffix(fixture.ledger, fixture.spec)
    duplicate = " ".join(map(str, reversed(suffix[0]))) + " 0\n"
    parent_bytes = f"p cnf 308 2\n{duplicate}2 0\n".encode()
    fixture.paths.parent.write_bytes(parent_bytes)
    parent_sha = export_validation.sha256_file(fixture.paths.parent)
    fixture.ledger["parent_cnf"]["sha256"] = parent_sha
    fixture.paths.ledger.write_text(
        json.dumps(fixture.ledger, sort_keys=True) + "\n", encoding="utf-8"
    )
    child_bytes = (
        b"p cnf 308 6\n"
        + b"".join(parent_bytes.splitlines(keepends=True)[1:])
        + b"".join(
            (" ".join(map(str, clause)) + " 0\n").encode() for clause in suffix
        )
    )
    spec = replace(
        fixture.spec,
        parent_sha256=parent_sha,
        ledger_sha256=export_validation.sha256_file(fixture.paths.ledger),
        child_sha256=hashlib.sha256(child_bytes).hexdigest(),
        child_bytes=len(child_bytes),
    )
    fixture.paths.child.write_bytes(child_bytes)
    with pytest.raises(ValueError, match="successor clause already in parent"):
        export_validation.validate_export(
            fixture.paths.parent,
            fixture.paths.child,
            fixture.paths.ledger,
            spec=spec,
            publication_validator=fixture.validator,
            publication_inputs=fixture.publication_inputs,
        )


def test_repeated_parent_literal_does_not_hide_successor_overlap(tmp_path: Path) -> None:
    fixture = _fixture(tmp_path)
    suffix = export_validation._expected_suffix(fixture.ledger, fixture.spec)
    duplicate = " ".join(map(str, (*suffix[0], suffix[0][0]))) + " 0\n"
    parent_bytes = f"p cnf 308 2\n{duplicate}2 0\n".encode()
    fixture.paths.parent.write_bytes(parent_bytes)
    parent_sha = export_validation.sha256_file(fixture.paths.parent)
    fixture.ledger["parent_cnf"]["sha256"] = parent_sha
    fixture.paths.ledger.write_text(
        json.dumps(fixture.ledger, sort_keys=True) + "\n", encoding="utf-8"
    )
    child_bytes = (
        b"p cnf 308 6\n"
        + b"".join(parent_bytes.splitlines(keepends=True)[1:])
        + b"".join(
            (" ".join(map(str, clause)) + " 0\n").encode() for clause in suffix
        )
    )
    spec = replace(
        fixture.spec,
        parent_sha256=parent_sha,
        ledger_sha256=export_validation.sha256_file(fixture.paths.ledger),
        child_sha256=hashlib.sha256(child_bytes).hexdigest(),
        child_bytes=len(child_bytes),
    )
    fixture.paths.child.write_bytes(child_bytes)
    with pytest.raises(ValueError, match="successor clause already in parent"):
        export_validation.validate_export(
            fixture.paths.parent,
            fixture.paths.child,
            fixture.paths.ledger,
            spec=spec,
            publication_validator=fixture.validator,
            publication_inputs=fixture.publication_inputs,
        )


def test_authenticated_parent_may_repeat_same_literal(tmp_path: Path) -> None:
    fixture = _fixture(tmp_path)
    parent_bytes = b"p cnf 308 2\n1 1 1 0\n2 0\n"
    fixture.paths.parent.write_bytes(parent_bytes)
    parent_sha = export_validation.sha256_file(fixture.paths.parent)
    fixture.ledger["parent_cnf"]["sha256"] = parent_sha
    fixture.paths.ledger.write_text(
        json.dumps(fixture.ledger, sort_keys=True) + "\n", encoding="utf-8"
    )
    draft_spec = replace(fixture.spec, parent_sha256=parent_sha)
    suffix = export_validation._expected_suffix(fixture.ledger, draft_spec)
    child_bytes = (
        b"p cnf 308 6\n"
        + b"".join(parent_bytes.splitlines(keepends=True)[1:])
        + b"".join(
            (" ".join(map(str, clause)) + " 0\n").encode() for clause in suffix
        )
    )
    spec = replace(
        draft_spec,
        parent_sha256=parent_sha,
        ledger_sha256=export_validation.sha256_file(fixture.paths.ledger),
        child_sha256=hashlib.sha256(child_bytes).hexdigest(),
        child_bytes=len(child_bytes),
    )
    fixture.paths.child.write_bytes(child_bytes)
    report = export_validation.validate_export(
        fixture.paths.parent,
        fixture.paths.child,
        fixture.paths.ledger,
        spec=spec,
        publication_validator=fixture.validator,
        publication_inputs=fixture.publication_inputs,
    )
    assert report["status"] == "PASS"
    assert report["parent_duplicate_literal_clauses"] == 1


@pytest.mark.parametrize(
    ("clause", "message"),
    [
        ((1, 1), "duplicate literals"),
        ((1, -1), "tautological"),
    ],
)
def test_appended_clause_must_be_canonical(
    clause: tuple[int, ...], message: str
) -> None:
    with pytest.raises(ValueError, match=message):
        export_validation._canonical_clause_key(clause)


def test_export_is_exclusive_and_receipted(tmp_path: Path) -> None:
    fixture = _fixture(tmp_path)

    def fake_lean(_module: Path, destination: Path) -> None:
        destination.write_bytes(fixture.child_bytes)

    receipt = exporter.export_child32(
        fixture.paths,
        spec=fixture.spec,
        publication_validator=fixture.validator,
        publication_inputs=fixture.publication_inputs,
        lean_runner=fake_lean,
    )
    assert receipt["status"] == "PASS"
    assert receipt["child"]["sha256"] == fixture.spec.child_sha256
    assert fixture.paths.receipt.is_file()
    with pytest.raises(FileExistsError, match="refusing to replace"):
        exporter.export_child32(
            fixture.paths,
            spec=fixture.spec,
            publication_validator=fixture.validator,
            publication_inputs=fixture.publication_inputs,
            lean_runner=fake_lean,
        )


def test_export_rejects_candidate_mutation_after_hard_link(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path)

    def fake_lean(_module: Path, destination: Path) -> None:
        destination.write_bytes(fixture.child_bytes)

    real_link = exporter.os.link

    def racing_link(source: str | bytes | Path, destination: str | bytes | Path) -> None:
        real_link(source, destination)
        Path(source).write_bytes(b"tampered-after-link\n")

    monkeypatch.setattr(exporter.os, "link", racing_link)
    with pytest.raises(RuntimeError, match="changed after"):
        exporter.export_child32(
            fixture.paths,
            spec=fixture.spec,
            publication_validator=fixture.validator,
            publication_inputs=fixture.publication_inputs,
            lean_runner=fake_lean,
        )
    assert not fixture.paths.child.exists()
    assert not fixture.paths.receipt.exists()


def test_ingress_replays_receipt_and_refuses_tampering(tmp_path: Path) -> None:
    fixture = _fixture(tmp_path)

    def fake_lean(_module: Path, destination: Path) -> None:
        destination.write_bytes(fixture.child_bytes)

    exporter.export_child32(
        fixture.paths,
        spec=fixture.spec,
        publication_validator=fixture.validator,
        publication_inputs=fixture.publication_inputs,
        lean_runner=fake_lean,
    )
    parent_manifest = tmp_path / "parent-manifest.json"
    parent_manifest.write_text(
        json.dumps({"dimacs": {"sha256": fixture.spec.parent_sha256}}) + "\n",
        encoding="utf-8",
    )
    manifest = tmp_path / "ingress.json"
    paths = ingress.IngressPaths(
        export=fixture.paths,
        publication_inputs=fixture.publication_inputs,
        parent_manifest=parent_manifest,
        manifest=manifest,
    )
    spec = ingress.IngressSpec(
        export=fixture.spec,
        parent_manifest_sha256=export_validation.sha256_file(parent_manifest),
    )
    ingress.emit_ingress(paths, spec=spec, publication_validator=fixture.validator)
    report = ingress.validate_ingress(
        paths,
        spec=spec,
        expected_manifest_sha256=export_validation.sha256_file(manifest),
        publication_validator=fixture.validator,
    )
    assert report["status"] == "PASS"
    payload = json.loads(manifest.read_text(encoding="utf-8"))
    payload["piqd"]["solver_profile"] = "different"
    manifest.write_text(json.dumps(payload) + "\n", encoding="utf-8")
    with pytest.raises(ValueError, match="manifest SHA-256 drifted"):
        ingress.validate_ingress(
            paths,
            spec=spec,
            expected_manifest_sha256=report["manifest_sha256"],
            publication_validator=fixture.validator,
        )


def test_production_fixture_pins_independently_validated_export() -> None:
    spec = export_validation.PRODUCTION_SPEC
    assert spec.publication_state == "PROVISIONED"
    assert spec.child_sha256 == (
        "c325d3eedda8fe81e3d1c1d70645024f5b9ea8c36c20ca5cd1896f0934296a7d"
    )
    assert spec.child_bytes == 291_620_182
    assert spec.ledger_sha256 == (
        "fd1ffabf7d8abf1124d8f5376b82ff1db43226ffe1aa7428d7de41ba5c4f5654"
    )
