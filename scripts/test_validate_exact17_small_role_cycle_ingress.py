from __future__ import annotations

import copy
import hashlib
import os
import shutil
import sys
from dataclasses import dataclass, replace
from pathlib import Path
from typing import Any

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent))
import validate_exact17_small_role_cycle_ingress as ingress


def _sha(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def _pin(raw: bytes, commit: str | None = None) -> ingress.FilePin:
    return ingress.FilePin(_sha(raw), len(raw), commit)


def _dummy_bound(path: Path, raw: bytes) -> ingress.BoundFile:
    state = ingress.FileState(0, 0, 0, 1, len(raw), 0, 0)
    return ingress.BoundFile(path.absolute(), -1, state, _sha(raw), len(raw))


@dataclass
class TinyPackage:
    paths: ingress.IngressPaths
    spec: ingress.IngressSpec
    input_raw: dict[str, bytes]
    git_raw: dict[tuple[str, Path], bytes]
    validation: dict[str, Any]

    def git_reader(self, commit: str, path: Path) -> bytes:
        return self.git_raw.get((commit, path.absolute()), b"wrong committed bytes")

    def replay(
        self,
        _paths: ingress.IngressPaths,
        _spec: ingress.IngressSpec,
        _package_files: dict[str, ingress.BoundFile],
        _inputs: dict[str, ingress.BoundFile],
        _validator_raw: bytes,
    ) -> dict[str, Any]:
        return copy.deepcopy(self.validation)

    def run(self, *, replay: ingress.Replay | None = None) -> dict[str, Any]:
        return ingress._validate_core(
            self.paths,
            self.spec,
            git_reader=self.git_reader,
            replay=self.replay if replay is None else replay,
        )

    def write_package(
        self,
        *,
        audit_mutator: Any = None,
        ledger_mutator: Any = None,
        receipt_mutator: Any = None,
    ) -> None:
        child_raw = b"p cnf 3 2\n1 0\n-1 0\n"
        input_bounds = {
            key: _dummy_bound(getattr(self.paths, _path_attribute(key)), raw)
            for key, raw in self.input_raw.items()
        }
        audit = ingress._expected_audit(copy.deepcopy(self.validation), input_bounds)
        ledger = ingress._expected_ledger(self.validation, self.spec)
        if audit_mutator is not None:
            audit_mutator(audit)
        if ledger_mutator is not None:
            ledger_mutator(ledger)
        audit_raw = ingress.canonical_json_bytes(audit)
        ledger_raw = ingress.canonical_json_bytes(ledger)
        package_files = {
            self.paths.child.name: _dummy_bound(self.paths.child, child_raw),
            self.paths.audit_report.name: _dummy_bound(
                self.paths.audit_report, audit_raw
            ),
            self.paths.coverage_ledger.name: _dummy_bound(
                self.paths.coverage_ledger, ledger_raw
            ),
        }
        dummy_package = ingress.PackageBinding(
            self.paths.package_root,
            -1,
            -1,
            (0, 0),
            ingress.FileState(0, 0, 0, 1, 0, 0, 0),
            package_files,
        )
        receipt = ingress._expected_receipt(
            self.paths, self.spec, self.validation, input_bounds, dummy_package
        )
        if receipt_mutator is not None:
            receipt_mutator(receipt)
        self.paths.package_root.mkdir(parents=True, exist_ok=True)
        self.paths.child.write_bytes(child_raw)
        self.paths.audit_report.write_bytes(audit_raw)
        self.paths.coverage_ledger.write_bytes(ledger_raw)
        self.paths.receipt.write_bytes(ingress.canonical_json_bytes(receipt))


def _path_attribute(key: str) -> str:
    return {
        "parent_cnf": "parent",
        "publisher_script": "publisher",
        "independent_audit_script": "validator",
        "lean_root": "lean_root",
        "lean_export": "lean_export",
        "kalmanson_helper": "kalmanson_helper",
        "parent_lean_root": "parent_lean_root",
        "parent_lean_export": "parent_lean_export",
        "parent_model": "parent_model",
        "parent_model_receipt": "parent_model_receipt",
    }[key]


def _build_tiny(tmp_path: Path, name: str = "one") -> TinyPackage:
    inputs = tmp_path / f"inputs-{name}"
    inputs.mkdir()
    custody = tmp_path / f"custody-{name}"
    custody.mkdir()
    package_root = custody / "exact17-small-role-cycle-package-v2"
    path_values = {
        "parent": inputs / "parent.cnf",
        "publisher": inputs / "publisher.py",
        "validator": inputs / "validator.py",
        "lean_root": inputs / "root.lean",
        "lean_export": inputs / "export.lean",
        "kalmanson_helper": inputs / "helper.lean",
        "parent_lean_root": inputs / "parent-root.lean",
        "parent_lean_export": inputs / "parent-export.lean",
        "parent_model": inputs / "model.json",
        "parent_model_receipt": inputs / "model-receipt.json",
    }
    raw_by_attribute = {
        "parent": b"p cnf 3 1\n1 0\n",
        "publisher": b"# pinned tiny publisher\n",
        "validator": b"# pinned tiny validator\n",
        "lean_root": b"def tinyRoot := true\n",
        "lean_export": b"def tinyExport := true\n",
        "kalmanson_helper": b"def tinyHelper := true\n",
        "parent_lean_root": b"def tinyParent := true\n",
        "parent_lean_export": b"def tinyParentExport := true\n",
        "parent_model": b'{"assignment":[1,2,3]}\n',
        "parent_model_receipt": b'{"result":"SAT"}\n',
    }
    for attribute, path in path_values.items():
        path.write_bytes(raw_by_attribute[attribute])

    source_commit = "1" * 40
    parent_commit = "2" * 40
    publisher_commit = "3" * 40
    validator_commit = "4" * 40
    child_raw = b"p cnf 3 2\n1 0\n-1 0\n"
    suffix_raw = b"-1 0\n"
    spec = ingress.IngressSpec(
        source_commit=source_commit,
        parent_source_commit=parent_commit,
        source_baseline_sha256=_sha(raw_by_attribute["lean_root"]),
        publisher=_pin(raw_by_attribute["publisher"], publisher_commit),
        validator=_pin(raw_by_attribute["validator"], validator_commit),
        parent=_pin(raw_by_attribute["parent"]),
        child=_pin(child_raw),
        lean_root=_pin(raw_by_attribute["lean_root"], source_commit),
        lean_export=_pin(raw_by_attribute["lean_export"], source_commit),
        kalmanson_helper=_pin(raw_by_attribute["kalmanson_helper"], source_commit),
        parent_lean_root=_pin(raw_by_attribute["parent_lean_root"], parent_commit),
        parent_lean_export=_pin(raw_by_attribute["parent_lean_export"], parent_commit),
        parent_model=_pin(raw_by_attribute["parent_model"]),
        parent_model_receipt=_pin(raw_by_attribute["parent_model_receipt"]),
        variables=3,
        parent_clauses=1,
        child_clauses=2,
        suffix_sha256=_sha(suffix_raw),
        suffix_bytes=len(suffix_raw),
        suffix_clauses=1,
        five_role_offset_choices=1,
        four_role_offset_choices=1,
        five_role_clauses=1,
        four_role_clauses=0,
        parent_subsuming_clauses=1,
        parent_subsumed_suffix_clauses=1,
        nonredundant_suffix_clauses=0,
        shortest_parent_length_distribution=(("1", 1),),
        family_shortest_parent_length_distribution=(("five", 1, 1),),
        parent_exact_duplicate_suffix_clauses=0,
        redundancy_witness_sha256=_sha(b"0 0\n"),
        redundancy_witness_bytes=4,
        model_falsified_nonredundant_indices=(1, 2, 3, 4, 5, 6, 7),
    )
    paths = ingress.IngressPaths(package_root=package_root, **path_values)
    input_raw = {
        key: raw_by_attribute[_path_attribute(key)]
        for key, _path, _pin_value in ingress._input_definitions(paths, spec)
    }
    git_raw = {
        (pin.commit, path.absolute()): raw_by_attribute[_path_attribute(key)]
        for key, path, pin in ingress._input_definitions(paths, spec)
        if pin.commit is not None
    }
    tiny = TinyPackage(paths, spec, input_raw, git_raw, {})
    tiny.validation = ingress._expected_validation(paths, spec)
    tiny.write_package()
    return tiny


def test_tiny_strict_package_passes(tmp_path: Path) -> None:
    tiny = _build_tiny(tmp_path)
    result = tiny.run()
    assert result["status"] == "PASS"
    assert result["required_package_entries"] == sorted(ingress.PACKAGE_ENTRIES)
    assert result["validation"]["check_support"] is True


@pytest.mark.parametrize("missing", sorted(ingress.PACKAGE_ENTRIES))
def test_missing_package_entry_fails(tmp_path: Path, missing: str) -> None:
    tiny = _build_tiny(tmp_path)
    (tiny.paths.package_root / missing).unlink()
    with pytest.raises(ingress.IngressValidationError, match="exactly the four"):
        tiny.run()


def test_extra_package_entry_fails(tmp_path: Path) -> None:
    tiny = _build_tiny(tmp_path)
    (tiny.paths.package_root / "extra.json").write_text("{}\n")
    with pytest.raises(ingress.IngressValidationError, match="exactly the four"):
        tiny.run()


def test_symlink_package_entry_fails(tmp_path: Path) -> None:
    tiny = _build_tiny(tmp_path)
    tiny.paths.audit_report.unlink()
    tiny.paths.audit_report.symlink_to(tiny.paths.coverage_ledger)
    with pytest.raises(ingress.IngressValidationError, match="without following"):
        tiny.run()


def test_hardlinked_package_entries_fail(tmp_path: Path) -> None:
    tiny = _build_tiny(tmp_path)
    tiny.paths.coverage_ledger.unlink()
    os.link(tiny.paths.audit_report, tiny.paths.coverage_ledger)
    with pytest.raises(ingress.IngressValidationError, match="singly linked"):
        tiny.run()


@pytest.mark.parametrize("flag", ["O_DIRECTORY", "O_NOFOLLOW", "O_CLOEXEC"])
def test_required_open_flags_fail_closed(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, flag: str
) -> None:
    tiny = _build_tiny(tmp_path)
    monkeypatch.setattr(ingress.os, flag, 0)
    with pytest.raises(ingress.IngressValidationError, match="required open flag"):
        tiny.run()


def test_child_mutation_during_replay_is_detected(tmp_path: Path) -> None:
    tiny = _build_tiny(tmp_path)

    def mutate(
        _paths: ingress.IngressPaths,
        _spec: ingress.IngressSpec,
        package_files: dict[str, ingress.BoundFile],
        _inputs: dict[str, ingress.BoundFile],
        _raw: bytes,
    ) -> dict[str, Any]:
        with tiny.paths.child.open("r+b") as stream:
            stream.write(b"X")
        assert package_files[tiny.paths.child.name].fd >= 0
        return copy.deepcopy(tiny.validation)

    with pytest.raises(ingress.IngressValidationError, match="changed|mutated"):
        tiny.run(replay=mutate)


def test_pinned_input_mutation_during_replay_is_detected(tmp_path: Path) -> None:
    tiny = _build_tiny(tmp_path)

    def mutate(*_args: Any) -> dict[str, Any]:
        with tiny.paths.lean_root.open("r+b") as stream:
            stream.write(b"X")
        return copy.deepcopy(tiny.validation)

    with pytest.raises(ingress.IngressValidationError, match="changed|mutated"):
        tiny.run(replay=mutate)


def test_package_entry_path_rebinding_is_detected(tmp_path: Path) -> None:
    tiny = _build_tiny(tmp_path)

    def rebind(*_args: Any) -> dict[str, Any]:
        replacement = tiny.paths.package_root / "replacement"
        replacement.write_bytes(tiny.paths.audit_report.read_bytes())
        os.replace(replacement, tiny.paths.audit_report)
        return copy.deepcopy(tiny.validation)

    with pytest.raises(ingress.IngressValidationError, match="changed|rebound"):
        tiny.run(replay=rebind)


def test_package_root_rebinding_is_detected(tmp_path: Path) -> None:
    tiny = _build_tiny(tmp_path)

    def rebind(*_args: Any) -> dict[str, Any]:
        old = tiny.paths.package_root.with_name("old-package")
        tiny.paths.package_root.rename(old)
        shutil.copytree(old, tiny.paths.package_root)
        return copy.deepcopy(tiny.validation)

    with pytest.raises(
        ingress.IngressValidationError, match="root.*rebound|root changed"
    ):
        tiny.run(replay=rebind)


def test_package_ancestor_rebinding_is_detected(tmp_path: Path) -> None:
    tiny = _build_tiny(tmp_path)

    def rebind(*_args: Any) -> dict[str, Any]:
        ancestor = tiny.paths.package_root.parent
        old = ancestor.with_name("old-custody")
        ancestor.rename(old)
        ancestor.mkdir()
        shutil.copytree(old / tiny.paths.package_root.name, tiny.paths.package_root)
        return copy.deepcopy(tiny.validation)

    with pytest.raises(ingress.IngressValidationError, match="ancestor.*rebound"):
        tiny.run(replay=rebind)


@pytest.mark.parametrize("document", ["audit", "ledger", "receipt"])
def test_extra_schema_key_is_rejected(tmp_path: Path, document: str) -> None:
    tiny = _build_tiny(tmp_path)
    keyword = f"{document}_mutator"
    tiny.write_package(**{keyword: lambda value: value.__setitem__("extra", True)})
    with pytest.raises(ingress.IngressValidationError, match="object|schema|receipt"):
        tiny.run()


def test_malformed_json_is_rejected(tmp_path: Path) -> None:
    tiny = _build_tiny(tmp_path)
    tiny.paths.receipt.write_bytes(b"[]\n")
    with pytest.raises(ingress.IngressValidationError, match="JSON object"):
        tiny.run()


def test_duplicate_json_key_is_rejected(tmp_path: Path) -> None:
    tiny = _build_tiny(tmp_path)
    tiny.paths.receipt.write_bytes(b'{"schema":1,"schema":2}\n')
    with pytest.raises(ingress.IngressValidationError, match="duplicate key"):
        tiny.run()


def test_cross_package_ledger_mix_is_rejected(tmp_path: Path) -> None:
    first = _build_tiny(tmp_path, "first")
    second = _build_tiny(tmp_path, "second")
    foreign_ledger = ingress._strict_canonical_json(
        second.paths.coverage_ledger.read_bytes(), "foreign ledger"
    )
    first.write_package(ledger_mutator=lambda value: value.update(foreign_ledger))
    with pytest.raises(ingress.IngressValidationError, match="coverage ledger"):
        first.run()


@pytest.mark.parametrize("field", ["publisher", "validator"])
@pytest.mark.parametrize("kind", ["commit", "hash"])
def test_wrong_code_commit_or_hash_is_rejected(
    tmp_path: Path, field: str, kind: str
) -> None:
    tiny = _build_tiny(tmp_path)
    pin = getattr(tiny.spec, field)
    if kind == "commit":
        pin = replace(pin, commit="5" * 40)
        expected = "committed identity"
    else:
        pin = replace(pin, sha256="0" * 64)
        expected = "live identity"
    tiny.spec = replace(tiny.spec, **{field: pin})
    with pytest.raises(ingress.IngressValidationError, match=expected):
        tiny.run()


def test_wrong_redundancy_census_is_rejected(tmp_path: Path) -> None:
    tiny = _build_tiny(tmp_path)

    def replay(*_args: Any) -> dict[str, Any]:
        result = copy.deepcopy(tiny.validation)
        result["suffix"]["redundancy"]["parent_subsuming_clauses"] += 1
        return result

    with pytest.raises(ingress.IngressValidationError, match="exact authorized census"):
        tiny.run(replay=replay)


def test_wrong_seven_cut_indices_are_rejected(tmp_path: Path) -> None:
    tiny = _build_tiny(tmp_path)

    def replay(*_args: Any) -> dict[str, Any]:
        result = copy.deepcopy(tiny.validation)
        result["parent_model"]["falsified_nonredundant_suffix_indices"][-1] = 8
        return result

    with pytest.raises(ingress.IngressValidationError, match="exact authorized census"):
        tiny.run(replay=replay)


def test_receipt_only_spoof_cannot_authorize_bad_audit(tmp_path: Path) -> None:
    tiny = _build_tiny(tmp_path)
    tiny.write_package(audit_mutator=lambda audit: audit.update(status="FAIL"))
    with pytest.raises(ingress.IngressValidationError, match="audit report object"):
        tiny.run()


def test_receipt_policy_bool_cannot_be_spoofed_by_int(tmp_path: Path) -> None:
    tiny = _build_tiny(tmp_path)
    tiny.write_package(
        receipt_mutator=lambda receipt: receipt["policy"].update(direct_lean_export=1)
    )
    with pytest.raises(ingress.IngressValidationError, match="receipt object"):
        tiny.run()


def test_ledger_claim_bool_cannot_be_spoofed_by_int(tmp_path: Path) -> None:
    tiny = _build_tiny(tmp_path)
    tiny.write_package(
        ledger_mutator=lambda ledger: ledger["claims"].update(exact17_closure=0)
    )
    with pytest.raises(ingress.IngressValidationError, match="coverage ledger"):
        tiny.run()


def test_audit_integer_cannot_be_spoofed_by_float(tmp_path: Path) -> None:
    tiny = _build_tiny(tmp_path)
    tiny.write_package(
        audit_mutator=lambda audit: audit["validation"].update(variables=3.0)
    )
    with pytest.raises(ingress.IngressValidationError, match="audit report object"):
        tiny.run()


def test_validator_integer_cannot_be_spoofed_by_float(tmp_path: Path) -> None:
    tiny = _build_tiny(tmp_path)

    def replay(*_args: Any) -> dict[str, Any]:
        result = copy.deepcopy(tiny.validation)
        result["variables"] = 3.0
        return result

    with pytest.raises(ingress.IngressValidationError, match="exact authorized census"):
        tiny.run(replay=replay)


def test_committed_replay_forces_full_support_check(tmp_path: Path) -> None:
    tiny = _build_tiny(tmp_path)
    package = ingress._open_package(tiny.paths.package_root)
    inputs, _committed = ingress._authenticate_inputs(
        tiny.paths, tiny.spec, tiny.git_reader
    )
    validator_raw = b"""
from pathlib import Path
PRODUCTION_SPEC = object()
def _open_regular_nofollow(path):
    return Path(path).open('rb')
def _validate_export(parent, child, *, check_support, spec):
    assert check_support is True
    assert spec is PRODUCTION_SPEC
    with _open_regular_nofollow(child) as stream:
        assert stream.read().startswith(b'p cnf')
    return {'full': True}
"""
    try:
        assert ingress._committed_replay(
            tiny.paths, tiny.spec, package.files, inputs, validator_raw
        ) == {"full": True}
    finally:
        ingress._close_inputs(inputs)
        ingress._close_package(package)


def test_absent_package_is_unprovisioned(tmp_path: Path) -> None:
    tiny = _build_tiny(tmp_path)
    shutil.rmtree(tiny.paths.package_root)
    with pytest.raises(ingress.UnprovisionedError, match="UNPROVISIONED"):
        tiny.run()


def test_cli_reports_unprovisioned(
    monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]
) -> None:
    monkeypatch.setattr(
        ingress,
        "production_static_check",
        lambda: (_ for _ in ()).throw(
            ingress.UnprovisionedError("UNPROVISIONED: package is absent")
        ),
    )
    assert ingress.main(["--static"]) == 2
    assert "UNPROVISIONED" in capsys.readouterr().err


def test_production_target_is_clear_while_absent() -> None:
    if ingress.PACKAGE_ROOT.exists():
        pytest.skip("production package has now been provisioned")
    with pytest.raises(ingress.UnprovisionedError, match="UNPROVISIONED"):
        ingress.production_static_check()
