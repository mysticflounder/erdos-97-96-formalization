from __future__ import annotations

import hashlib
import json
import math
import os
import shutil
import sys
from itertools import product
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

import census.p97_search.freshthird_firstnonhit_live_retained_static_v1 as runner

NONHIT_BRANCHES = ("sameBlocker", "sourceRowOmission")
INTERACTION_BRANCHES = (
    "sameBlocker",
    "sourceRowOmission",
    "distinctBlockersDifferentCaps",
    "sameCapWithInternalFiberSource",
)
ORIGIN_BRANCHES = ("P", "P_rho", "Q")
EXPECTED_CELLS = set(product(NONHIT_BRANCHES, INTERACTION_BRANCHES, ORIGIN_BRANCHES))


def _canonical_json(value: object) -> bytes:
    return (
        json.dumps(
            value, ensure_ascii=True, sort_keys=True, separators=(",", ":")
        ).encode("utf-8")
        + b"\n"
    )


def _json(path: Path) -> object:
    return json.loads(path.read_text(encoding="utf-8"))


def _result_paths(output: Path) -> list[Path]:
    return sorted(
        path
        for path in output.rglob("result.json")
        if path.is_file() and not path.is_symlink()
    )


def _manifest_paths(output: Path) -> list[Path]:
    return sorted(
        path
        for path in output.rglob("*.json")
        if path.is_file()
        and not path.is_symlink()
        and ("manifest" in path.name or "inventory" in path.name)
    )


@pytest.fixture(scope="module")
def completed_run(
    tmp_path_factory: pytest.TempPathFactory,
) -> tuple[Path, dict[str, object]]:
    output = tmp_path_factory.mktemp("freshthird-live-retained-static") / "run"
    summary = runner.run_wave(output, allow_test_output=True)
    return output, summary


def test_plan_has_explicit_unique_2x4x3_cells() -> None:
    plan = runner.plan_wave()

    assert isinstance(plan, list)
    assert len(plan) == 24
    cells = {(cell["nonhit"], cell["interaction"], cell["origin"]) for cell in plan}
    assert len(cells) == 24
    assert cells == EXPECTED_CELLS
    assert all(isinstance(cell, dict) for cell in plan)


def test_full_run_has_sat_cells_canonical_manifests_and_validates(
    completed_run: tuple[Path, dict[str, object]],
) -> None:
    output, summary = completed_run
    results = [_json(path) for path in _result_paths(output)]
    manifests = [_json(path) for path in _manifest_paths(output)]

    assert summary["schema"] == runner.RUN_SCHEMA
    assert len(results) == 24
    assert {result["status"] for result in results} == {"SAT_ABSTRACTION"}
    assert {
        (
            result["cell"]["nonhit"],
            result["cell"]["interaction"],
            result["cell"]["origin"],
        )
        for result in results
    } == EXPECTED_CELLS
    assert all(isinstance(result["signature"], dict) for result in results)

    assert manifests
    assert any(
        isinstance(manifest, dict)
        and ("artifact_inventory" in manifest or "artifacts" in manifest)
        for manifest in manifests
    )
    for path in _manifest_paths(output):
        assert path.read_bytes() == _canonical_json(_json(path)), path

    source_archive = _json(output / "artifacts" / "source-snapshot" / "manifest.json")
    assert isinstance(source_archive, dict)
    assert {row["path"] for row in source_archive["archived"]} == set(
        runner._snapshot_paths()
    )
    assert all(len(row["git_blob_oid"]) == 40 for row in source_archive["archived"])

    validated = runner.validate_run(output)
    assert validated["schema"] == runner.RUN_SCHEMA


def _copy_run(source: Path, tmp_path: Path, name: str) -> Path:
    destination = tmp_path / name
    shutil.copytree(source, destination)
    return destination


def test_rerun_to_same_path_rejects(
    completed_run: tuple[Path, dict[str, object]],
) -> None:
    output, _ = completed_run

    with pytest.raises(runner.StaticRunnerError):
        runner.run_wave(output, allow_test_output=True)


def test_result_signature_tampering_fails_validation(
    completed_run: tuple[Path, dict[str, object]], tmp_path: Path
) -> None:
    output = _copy_run(completed_run[0], tmp_path, "tampered-signature")
    result_path = _result_paths(output)[0]
    result = _json(result_path)
    assert isinstance(result, dict)
    signature = result["signature"]
    assert isinstance(signature, dict)
    signature["origin"] = "tampered"
    result_path.write_bytes(_canonical_json(result))

    with pytest.raises(runner.StaticRunnerError):
        runner.validate_run(output)


def test_smt2_tampering_fails_validation(
    completed_run: tuple[Path, dict[str, object]], tmp_path: Path
) -> None:
    output = _copy_run(completed_run[0], tmp_path, "tampered-smt2")
    smt2_paths = sorted(output.rglob("*.smt2"))
    assert smt2_paths
    smt2_paths[0].write_bytes(smt2_paths[0].read_bytes() + b"\n; tampered\n")

    with pytest.raises(runner.StaticRunnerError):
        runner.validate_run(output)


def test_rehashed_promotion_claim_still_fails_validation(
    completed_run: tuple[Path, dict[str, object]], tmp_path: Path
) -> None:
    output = _copy_run(completed_run[0], tmp_path, "tampered-promotion")
    manifest_path = output / "run_manifest.json"
    manifest = _json(manifest_path)
    assert isinstance(manifest, dict)
    manifest["promotion_ready"] = True
    manifest.pop("run_manifest_sha256")
    manifest["run_manifest_sha256"] = hashlib.sha256(
        _canonical_json(manifest)
    ).hexdigest()
    manifest_path.write_bytes(_canonical_json(manifest))

    with pytest.raises(runner.StaticRunnerError):
        runner.validate_run(output)


def test_rehashed_postflight_source_claim_still_fails_validation(
    completed_run: tuple[Path, dict[str, object]], tmp_path: Path
) -> None:
    output = _copy_run(completed_run[0], tmp_path, "tampered-postflight")
    manifest_path = output / "run_manifest.json"
    manifest = _json(manifest_path)
    assert isinstance(manifest, dict)
    manifest["postflight_source_content_sha256"] = "0" * 64
    manifest.pop("run_manifest_sha256")
    manifest["run_manifest_sha256"] = hashlib.sha256(
        _canonical_json(manifest)
    ).hexdigest()
    manifest_path.write_bytes(_canonical_json(manifest))

    with pytest.raises(runner.StaticRunnerError):
        runner.validate_run(output)


def test_rehashed_extra_claim_still_fails_validation(
    completed_run: tuple[Path, dict[str, object]], tmp_path: Path
) -> None:
    output = _copy_run(completed_run[0], tmp_path, "tampered-extra-claim")
    manifest_path = output / "run_manifest.json"
    manifest = _json(manifest_path)
    assert isinstance(manifest, dict)
    manifest["theorem"] = True
    manifest.pop("run_manifest_sha256")
    manifest["run_manifest_sha256"] = hashlib.sha256(
        _canonical_json(manifest)
    ).hexdigest()
    manifest_path.write_bytes(_canonical_json(manifest))

    with pytest.raises(runner.StaticRunnerError):
        runner.validate_run(output)


def test_rehashed_snapshot_clean_flag_fails_structural_validation(
    completed_run: tuple[Path, dict[str, object]],
) -> None:
    snapshot = dict(completed_run[1]["source_snapshot"])
    snapshot["files"] = [dict(row) for row in snapshot["files"]]
    row = snapshot["files"][0]
    row["clean"] = not row["clean"]
    snapshot.pop("snapshot_sha256")
    snapshot["snapshot_sha256"] = hashlib.sha256(_canonical_json(snapshot)).hexdigest()

    with pytest.raises(runner.StaticRunnerError):
        runner._validate_snapshot_self_hash(snapshot)


def test_aggregate_status_distinguishes_terminal_and_mixed_results() -> None:
    assert runner._aggregate_status(["SAT_ABSTRACTION"] * 24) == "SAT_ABSTRACTION"
    assert runner._aggregate_status(["UNSAT_RELAXATION"] * 24) == "UNSAT_RELAXATION"
    assert (
        runner._aggregate_status(["SAT_ABSTRACTION", "UNSAT_RELAXATION"])
        == "MIXED_RELAXATION"
    )
    with pytest.raises(runner.StaticRunnerError):
        runner._aggregate_status(["UNKNOWN"])


def test_signature_must_match_outer_cell(
    completed_run: tuple[Path, dict[str, object]],
) -> None:
    output = completed_run[0]
    first, second = [_json(path) for path in _result_paths(output)[:2]]
    assert isinstance(first, dict) and isinstance(second, dict)
    assert isinstance(first["signature"], dict)
    assert first["cell"] != second["cell"]

    with pytest.raises(runner.StaticRunnerError):
        runner._validate_signature_cell(first["signature"], second["cell"])


def test_nonstandard_json_number_is_rejected(tmp_path: Path) -> None:
    with pytest.raises(ValueError):
        runner._canonical_json({"value": math.nan})

    path = tmp_path / "nan.json"
    path.write_bytes(b'{"value":NaN}\n')
    with pytest.raises(runner.StaticRunnerError):
        runner._read_canonical_json(path, "NaN control")


def test_source_path_with_symlinked_ancestor_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    real = tmp_path / "real"
    real.mkdir()
    (real / "source.py").write_text("pass\n", encoding="utf-8")
    linked = tmp_path / "linked"
    linked.symlink_to(real, target_is_directory=True)
    monkeypatch.setattr(runner.packet, "REPO_ROOT", tmp_path)

    with pytest.raises(runner.StaticRunnerError):
        runner._validated_source_path("linked/source.py")


def test_symlink_output_root_is_rejected(
    tmp_path: Path,
) -> None:
    if not hasattr(os, "symlink"):
        pytest.skip("symlinks are unavailable on this platform")

    target = tmp_path / "target"
    target.mkdir()
    output = tmp_path / "output-link"
    output.symlink_to(target, target_is_directory=True)

    with pytest.raises(runner.StaticRunnerError):
        runner.run_wave(output, allow_test_output=True)
