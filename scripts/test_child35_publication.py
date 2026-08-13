from __future__ import annotations

import hashlib
from dataclasses import replace
from pathlib import Path

import export_exact17_thirty_fifth_root as exporter
import pytest
import run_piqd_exact17_thirty_fifth_root as runner
import validate_exact17_thirty_fourth_model_refinements_export as validator
import validate_exact17_thirty_fourth_model_refinements_ingress as ingress


def _write(path: Path, data: bytes) -> str:
    path.write_bytes(data)
    return hashlib.sha256(data).hexdigest()


def _fixture(tmp_path: Path, monkeypatch: pytest.MonkeyPatch):
    tmp_path.mkdir(parents=True, exist_ok=True)
    parent = tmp_path / "parent.cnf"
    parent_bytes = b"p cnf 308 1\n1 0\n"
    parent_sha = _write(parent, parent_bytes)
    suffix = b"".join(f"{' '.join(map(str, clause))} 0\n".encode() for clause in validator.SUFFIX)
    child_bytes = f"p cnf 308 {1 + len(validator.SUFFIX)}\n1 0\n".encode() + suffix
    root = _write(tmp_path / "root.lean", b"root")
    export = _write(tmp_path / "export.lean", b"export")
    source = _write(tmp_path / "kalmanson.lean", b"source")
    perpendicular = _write(tmp_path / "perpendicular.lean", b"perpendicular")
    child_sha = hashlib.sha256(child_bytes).hexdigest()
    paths = exporter.ExportPaths(parent, tmp_path / "root.lean", tmp_path / "export.lean", tmp_path / "kalmanson.lean", tmp_path / "perpendicular.lean", tmp_path / "child.cnf", tmp_path / "receipt.json")
    for name, value in {
        "PARENT_CLAUSES": 1,
        "PARENT_SHA256": parent_sha,
        "LEAN_ROOT_PATH": str(paths.lean_root),
        "LEAN_EXPORT_PATH": str(paths.lean_export),
        "KALMANSON_PATH": str(paths.kalmanson),
        "PERPENDICULAR_BISECTOR_PATH": str(paths.perpendicular_bisector),
        "PARENT_PATH": str(paths.parent),
        "CHILD_PATH": str(paths.child),
        "RECEIPT_PATH": str(paths.receipt),
    }.items():
        monkeypatch.setattr(validator, name, value)
    spec = replace(validator.PRODUCTION_SPEC, parent_clauses=1, new_clauses=4, parent_sha256=parent_sha, child_sha256=child_sha, child_bytes=len(child_bytes), publication_state="PROVISIONED", lean_root_path=str(paths.lean_root), lean_export_path=str(paths.lean_export), kalmanson_path=str(paths.kalmanson), perpendicular_bisector_path=str(paths.perpendicular_bisector), parent_path=str(paths.parent), child_path=str(paths.child), receipt_path=str(paths.receipt), lean_root_sha256=root, lean_export_sha256=export, kalmanson_sha256=source, perpendicular_bisector_sha256=perpendicular)
    return paths, spec, child_bytes


def test_child35_export_ingress_and_runner_are_exactly_pinned() -> None:
    assert validator.PRODUCTION_SPEC.parent_clauses == 5_847_256
    assert validator.PRODUCTION_SPEC.new_clauses == 4
    assert validator.PRODUCTION_SPEC.child_clauses == 5_847_260
    assert validator.PRODUCTION_SPEC.provisioned
    assert validator.PRODUCTION_SPEC.fully_authenticated
    assert validator.PRODUCTION_SPEC.child_sha256 == (
        "0ce510af7c5c653719cb2d1250c8577e9c48d244605182bfe8b91112c538787f"
    )
    assert validator.PRODUCTION_SPEC.child_bytes == 291_621_156
    assert ingress.PRODUCTION_INGRESS_SPEC.provisioned
    assert ingress.PRODUCTION_INGRESS_SPEC.daemon_sha256 == (
        "f89994bc10fcad69a264d8efbd7d76b8203c94c08f22b4536d3b473a12cee089"
    )
    assert ingress.PRODUCTION_INGRESS_SPEC.daemon_source_commit == (
        "acefb4aba14765d45e38ac4193373f0aa210f22d"
    )
    assert ingress.PRODUCTION_INGRESS_SPEC.solver_sha256 == (
        "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965"
    )
    assert runner.PRODUCTION_RUNNER_SPEC.provisioned
    assert runner.PRODUCTION_RUNNER_SPEC.manifest_sha256 == (
        "3241c3f22d0bb4a1635430ad35a395a0c46cd8b3a06423e05a682999533a72ae"
    )
    assert runner.PRODUCTION_RUNNER_SPEC.root_sha256 == (
        "0ce510af7c5c653719cb2d1250c8577e9c48d244605182bfe8b91112c538787f"
    )
    assert runner.PRODUCTION_RUNNER_SPEC.root_bytes == 291_621_156


def test_exact_prefix_and_four_clause_suffix(tmp_path: Path, monkeypatch: pytest.MonkeyPatch) -> None:
    paths, spec, child_bytes = _fixture(tmp_path, monkeypatch)
    paths.child.write_bytes(child_bytes)
    report = validator.validate_export(paths.parent, paths.child, spec=spec)
    assert report["status"] == "PASS"
    assert report["new_clauses"] == 4
    assert report["source_clause_families"] == ["child34PerpBisectorClauses"]


def test_lifecycle_namespace_is_direct_child35(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    assert validator.PRODUCTION_SPEC.new_clauses == 4
    assert runner.PRODUCTION_RUNNER_SPEC.clauses == 5_847_260
    assert validator.PRODUCTION_SPEC.perpendicular_bisector_sha256 == (
        "dfc440da5753ecb0051cc4a9245ae27366a1dce55577c9e8171d692cd0966052"
    )
    lifecycle = runner._lifecycle_spec(runner.PRODUCTION_RUNNER_SPEC)
    assert lifecycle.artifact_namespace == "child35"
    assert runner._base._uses_hardened_protocol(lifecycle)
    monkeypatch.setattr(runner._base, "expected_identity_hash", lambda _spec: "identity")
    binding = runner._base._expected_binding(lifecycle)
    assert binding["timeout_s"] == lifecycle.timeout_s
    assert binding["march_timeout_s"] == lifecycle.march_timeout_s


def test_child35_cli_start_dispatches_to_custody_runner(
    monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]
) -> None:
    client = object()
    monkeypatch.setattr(runner, "SubprocessPiqdClient", lambda: client)
    monkeypatch.setattr(
        runner,
        "start",
        lambda actual: {"status": "prepared", "same_client": actual is client},
    )
    monkeypatch.setattr(runner.sys, "argv", ["runner", "start"])
    assert runner.main() == 0
    assert '"same_client": true' in capsys.readouterr().out


def test_child35_terminal_shape_is_hardened() -> None:
    lifecycle = runner._lifecycle_spec(runner.PRODUCTION_RUNNER_SPEC)
    with pytest.raises(ValueError, match="child35 status omitted proof_blob_hash"):
        runner._base._check_hardened_result_shape(
            {"completed_at": 1}, lifecycle, "SAT"
        )


def test_export_receipt_is_ledger_last_and_rolls_back(tmp_path: Path, monkeypatch: pytest.MonkeyPatch) -> None:
    paths, spec, child_bytes = _fixture(tmp_path, monkeypatch)

    def emit(_source: Path, candidate: Path) -> None:
        candidate.write_bytes(child_bytes)

    receipt = exporter.export_child35(paths, spec=spec, lean_runner=emit)
    assert receipt["status"] == "PASS"
    assert paths.child.exists() and paths.receipt.exists()
    paths2, spec2, child_bytes2 = _fixture(tmp_path / "retry", monkeypatch)
    def emit2(_source: Path, candidate: Path) -> None:
        candidate.write_bytes(child_bytes2)

    with pytest.raises(RuntimeError, match="receipt hook"):
        exporter.export_child35(paths2, spec=spec2, lean_runner=emit2, before_receipt=lambda: (_ for _ in ()).throw(RuntimeError("receipt hook")))
    assert not paths2.child.exists() and not paths2.receipt.exists()


def test_export_losing_receipt_race_preserves_winner(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, spec, child_bytes = _fixture(tmp_path, monkeypatch)

    def emit(_source: Path, candidate: Path) -> None:
        candidate.write_bytes(child_bytes)

    winner = b'{"owner":"other-publisher"}\n'

    def publish_winner() -> None:
        paths.receipt.write_bytes(winner)

    with pytest.raises(FileExistsError):
        exporter.export_child35(
            paths,
            spec=spec,
            lean_runner=emit,
            before_receipt=publish_winner,
        )
    assert paths.receipt.read_bytes() == winner
    assert paths.child.read_bytes() == child_bytes


def test_wrong_suffix_rejected(tmp_path: Path, monkeypatch: pytest.MonkeyPatch) -> None:
    paths, spec, child_bytes = _fixture(tmp_path, monkeypatch)
    first = (" ".join(map(str, validator.SUFFIX[0])) + " 0").encode()
    bad = child_bytes.replace(first, first.removesuffix(b" 0") + b" 1 0")
    assert bad != child_bytes
    paths.child.write_bytes(bad)
    with pytest.raises(ValueError, match="suffix"):
        validator.validate_export(paths.parent, paths.child, spec=spec)


@pytest.mark.parametrize(
    ("index", "lean_clause", "previous_permutation"),
    [
        (
            1,
            (-307, -227, -233, -90, -96, -97, -193, -192, -198),
            (-307, -227, -233, -96, -90, -97, -193, -198, -192),
        ),
        (
            3,
            (-308, -227, -233, -90, -96, -97, -193, -192, -198),
            (-308, -227, -233, -96, -90, -97, -193, -198, -192),
        ),
    ],
)
def test_lean_owned_suffix_byte_order_rejects_previous_permutation(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    index: int,
    lean_clause: tuple[int, ...],
    previous_permutation: tuple[int, ...],
) -> None:
    paths, spec, child_bytes = _fixture(tmp_path, monkeypatch)
    assert validator.SUFFIX[index] == lean_clause
    expected_line = (" ".join(map(str, lean_clause)) + " 0\n").encode()
    previous_line = (" ".join(map(str, previous_permutation)) + " 0\n").encode()
    bad = child_bytes.replace(expected_line, previous_line, 1)
    assert bad != child_bytes
    paths.child.write_bytes(bad)
    with pytest.raises(ValueError, match=f"suffix mismatch at clause {index + 1}"):
        validator.validate_export(paths.parent, paths.child, spec=spec)


def test_inherited_parent_duplicates_are_out_of_child35_scope(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    monkeypatch.setattr(validator, "PARENT_CLAUSES", 2)
    parent = tmp_path / "parent.cnf"
    child = tmp_path / "child.cnf"
    parent_bytes = b"p cnf 308 2\n1 0\n1 0\n"
    monkeypatch.setattr(
        validator, "PARENT_SHA256", hashlib.sha256(parent_bytes).hexdigest()
    )
    suffix = b"".join(
        (" ".join(map(str, clause)) + " 0\n").encode()
        for clause in validator.SUFFIX
    )
    child_bytes = b"p cnf 308 6\n1 0\n1 0\n" + suffix
    parent.write_bytes(parent_bytes)
    child.write_bytes(child_bytes)
    spec = replace(
        validator.PRODUCTION_SPEC,
        parent_clauses=2,
        parent_sha256=hashlib.sha256(parent_bytes).hexdigest(),
        child_sha256=hashlib.sha256(child_bytes).hexdigest(),
        child_bytes=len(child_bytes),
        publication_state="PROVISIONED",
    )
    assert validator.validate_export(parent, child, spec=spec)["status"] == "PASS"


def test_suffix_clause_already_in_parent_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    monkeypatch.setattr(validator, "PARENT_CLAUSES", 1)
    parent = tmp_path / "parent.cnf"
    child = tmp_path / "child.cnf"
    first = (" ".join(map(str, validator.SUFFIX[0])) + " 0\n").encode()
    suffix = b"".join(
        (" ".join(map(str, clause)) + " 0\n").encode()
        for clause in validator.SUFFIX
    )
    parent_bytes = b"p cnf 308 1\n" + first
    monkeypatch.setattr(
        validator, "PARENT_SHA256", hashlib.sha256(parent_bytes).hexdigest()
    )
    child_bytes = b"p cnf 308 5\n" + first + suffix
    parent.write_bytes(parent_bytes)
    child.write_bytes(child_bytes)
    spec = replace(
        validator.PRODUCTION_SPEC,
        parent_clauses=1,
        parent_sha256=hashlib.sha256(parent_bytes).hexdigest(),
        child_sha256=hashlib.sha256(child_bytes).hexdigest(),
        child_bytes=len(child_bytes),
        publication_state="PROVISIONED",
    )
    with pytest.raises(ValueError, match="suffix clause already occurs"):
        validator.validate_export(parent, child, spec=spec)
