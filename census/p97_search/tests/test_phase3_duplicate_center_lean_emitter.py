from __future__ import annotations

import shutil
import sys
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search import phase3_duplicate_center_lean_emitter as emitter

ARTIFACT = (
    ROOT
    / "census"
    / "p97_search"
    / "out"
    / "phase3-realization"
    / "k4-n10-profile-445-bounded100-structural-current"
)


def test_frozen_artifact_replays_and_deduplicates_exactly() -> None:
    data = emitter.load_artifact(ARTIFACT)

    assert len(data.patterns) == 23
    assert len(data.certificates) == 23
    assert len(data.metric_rows_sha256) == 23
    assert len(data.certificate_proof_sha256) == 23
    assert len(data.source_to_unique) == 100
    assert set(data.source_to_unique) == set(range(23))
    assert len(data.source_canonical_digest) == 100
    assert all(len(pattern) == 10 for pattern in data.patterns)
    assert all(len(support) == 4 for pattern in data.patterns for support in pattern)
    assert (
        emitter._sha256_value(list(data.source_to_unique))
        == "db32b7e8eb9ced657464dd7beec25f3ccb3f90f24771702ee742135da3cc2b5b"
    )


def test_render_is_deterministic_and_targets_checker_api() -> None:
    data = emitter.load_artifact(ARTIFACT)

    first = emitter.render_module(data)
    second = emitter.render_module(data)

    assert first == second
    assert "def uniquePattern : Fin 23 → RowPattern Label :=" in first
    assert (
        "def uniqueCertificate : Fin 23 → DuplicateCenterCertificate :=" in first
    )
    assert "def sourceToUnique : Fin 100 → Fin 23 :=" in first
    assert "theorem uniqueCertificate_check" in first
    assert "theorem source_not_realizes" in first
    assert "source enumeration is partial" in first
    assert emitter.EXPECTED_FILE_SHA256["results.jsonl"] in first
    assert emitter.SOURCE_MANIFEST_SHA256 in first


def test_load_fails_closed_on_frozen_artifact_drift(tmp_path: Path) -> None:
    copied = tmp_path / "artifact"
    shutil.copytree(ARTIFACT, copied)
    with (copied / "results.jsonl").open("a", encoding="utf-8") as output:
        output.write("\n")

    with pytest.raises(
        emitter.DuplicateCenterEmissionError,
        match="results.jsonl SHA-256 mismatch",
    ):
        emitter.load_artifact(copied)


def test_cli_write_is_idempotent_and_check_mode_accepts_it(
    tmp_path: Path,
) -> None:
    output = tmp_path / "Phase3Bounded100DuplicateCenterData.lean"
    args = [str(ARTIFACT), str(output)]

    assert emitter.main(args) == 0
    first = output.read_text(encoding="utf-8")
    assert emitter.main(args) == 0
    assert output.read_text(encoding="utf-8") == first
    assert emitter.main([*args, "--check"]) == 0
    assert list(tmp_path.glob(f".{output.name}.*.tmp")) == []


@pytest.mark.parametrize(
    "namespace",
    ["Phase3OutsideProblem97", "Problem97.Bad-Namespace"],
)
def test_render_rejects_invalid_namespace(namespace: str) -> None:
    data = emitter.load_artifact(ARTIFACT)

    with pytest.raises(emitter.DuplicateCenterEmissionError):
        emitter.render_module(data, namespace=namespace)
