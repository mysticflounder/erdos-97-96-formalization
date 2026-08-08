# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import hashlib
import json
import lzma
import sys
from pathlib import Path
from typing import Any

import pytest

ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search import phase3_piqd_source_classifier_lean as emitter

CLASSIFIER = (
    ROOT
    / "census"
    / "p97_search"
    / "tests"
    / "fixtures"
    / "p97_source_duplicate_center_classifier_0000.v2.json.xz"
)
CHECKED_IN_OUTPUT = (
    ROOT
    / "lean"
    / "Erdos9796Proof"
    / "P97"
    / "ATail"
    / "FrontierLiveClosure"
    / "ExactTwelvePiqdSourceDuplicateCenter.lean"
)


def _classifier_value() -> dict[str, Any]:
    value = json.loads(lzma.decompress(CLASSIFIER.read_bytes()))
    assert isinstance(value, dict)
    return value


def test_frozen_classifier_renders_deterministically_through_generic_checker() -> None:
    data = emitter.load_classifier(CLASSIFIER)

    first = emitter.render_module(data)
    second = emitter.render_module(data)

    assert first == second
    assert data.classifier_sha256 == (
        "f183e53818371bcb4b060ed981301e67db0b51d9fc7ed9072571f05fefb30c91"
    )
    assert hashlib.sha256(CLASSIFIER.read_bytes()).hexdigest() == (
        "12ffe7ffb88b970f5d2c99cb7b741748e7feb123141597b3420b544036f28f5f"
    )
    assert len(data.rows) == 5
    assert all(0 <= row.center < 12 for row in data.rows)
    assert all(0 <= point < 12 for row in data.rows for point in row.support)
    assert "abbrev Label := Fin 12" in first
    assert "List (RowChoice Label)" in first
    assert "DuplicateCenterData Label" in first
    assert "DuplicateCenterNogood Label" in first
    assert "ExactTwelveV14DuplicateCenterCanary" in first
    assert "sourceNogood.not_realizes_of_positiveCheck" in first
    assert "sourceNogood_eq_existingRecord0" in first
    assert "sourceNogood_learnedClause" in first
    assert "[-6, -55, -155, -175, -525]" in first
    assert "executedByteProvenance : Bool := false" in first
    assert "aggregateCoverage : Bool := false" in first
    assert "universalLift : Bool := false" in first
    assert "leanTheoremClosure : Bool := false" in first
    assert "metadata, not kernel authentication" in first
    assert "live-spine closure" in first
    assert "conditional source consumers therefore predate" in first


def test_checked_in_lean_output_matches_frozen_classifier() -> None:
    rendered = emitter.render_module(emitter.load_classifier(CLASSIFIER))

    assert CHECKED_IN_OUTPUT.read_text(encoding="utf-8") == rendered


def test_loader_keeps_raw_json_support(tmp_path: Path) -> None:
    raw_classifier = tmp_path / "classifier.json"
    raw_classifier.write_bytes(lzma.decompress(CLASSIFIER.read_bytes()))

    assert emitter.load_classifier(raw_classifier) == emitter.load_classifier(
        CLASSIFIER
    )


def test_xz_reader_rejects_corruption(tmp_path: Path) -> None:
    artifact = tmp_path / "corrupt.json.xz"
    artifact.write_bytes(b"not an xz stream")

    with pytest.raises(emitter.SourceClassifierLeanError, match="single-stream xz"):
        emitter.load_classifier(artifact)


@pytest.mark.parametrize("suffix", [b"trailing", CLASSIFIER.read_bytes()])
def test_xz_reader_rejects_trailing_or_concatenated_streams(
    tmp_path: Path, suffix: bytes
) -> None:
    artifact = tmp_path / "trailing.json.xz"
    artifact.write_bytes(CLASSIFIER.read_bytes() + suffix)

    with pytest.raises(
        emitter.SourceClassifierLeanError, match="trailing data or concatenated"
    ):
        emitter.load_classifier(artifact)


def test_xz_reader_rejects_oversize_decoded_input(tmp_path: Path) -> None:
    artifact = tmp_path / "oversize.json.xz"
    artifact.write_bytes(lzma.compress(b" " * (emitter._MAX_CLASSIFIER_BYTES + 1)))

    with pytest.raises(emitter.SourceClassifierLeanError, match="exceeds .* decoded"):
        emitter.load_classifier(artifact)


def test_loader_invokes_complete_source_classifier_validator(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    original = emitter.validate_source_duplicate_center_classifier
    calls: list[object] = []

    def recording_validator(value: object) -> None:
        calls.append(value)
        original(value)  # type: ignore[arg-type]

    monkeypatch.setattr(
        emitter, "validate_source_duplicate_center_classifier", recording_validator
    )

    emitter.load_classifier(CLASSIFIER)

    assert len(calls) == 1


def test_loader_rejects_invalid_classifier_contract(tmp_path: Path) -> None:
    value = _classifier_value()
    value["stage"] = "not-the-accepted-stage"
    artifact = tmp_path / "invalid.json"
    artifact.write_text(json.dumps(value), encoding="utf-8")

    with pytest.raises(
        emitter.SourceClassifierLeanError, match="classifier validation failed"
    ):
        emitter.load_classifier(artifact)


def test_strict_reader_rejects_duplicate_json_keys(tmp_path: Path) -> None:
    artifact = tmp_path / "duplicate.json"
    artifact.write_text('{"schema": 1, "schema": 2}', encoding="utf-8")

    with pytest.raises(emitter.SourceClassifierLeanError, match="not strict JSON"):
        emitter.load_classifier(artifact)


def test_typed_parser_rejects_exact_rows_and_out_of_range_labels() -> None:
    exact = _classifier_value()
    exact["certificate"]["rows"][0]["exact"] = True
    with pytest.raises(emitter.SourceClassifierLeanError, match="exact=false"):
        emitter._parse_validated_classifier(exact)

    bad_label = _classifier_value()
    bad_label["certificate"]["rows"][0]["support"][0] = 12
    with pytest.raises(emitter.SourceClassifierLeanError, match="Fin 12"):
        emitter._parse_validated_classifier(bad_label)


def test_typed_parser_rejects_unsupported_path_steps() -> None:
    value = _classifier_value()
    step = value["certificate"]["closure_paths"][1]["steps"][1]
    assert step["kind"] == "flip"
    step["center"] = 0

    with pytest.raises(
        emitter.SourceClassifierLeanError, match="unsupported step shape"
    ):
        emitter._parse_validated_classifier(value)


@pytest.mark.parametrize(
    "namespace",
    [
        "ExactTwelveOutsideProblem97",
        "Problem97.Bad-Namespace",
        "Problem97..Empty",
    ],
)
def test_render_rejects_invalid_namespace(namespace: str) -> None:
    data = emitter.load_classifier(CLASSIFIER)

    with pytest.raises(emitter.SourceClassifierLeanError, match="under Problem97"):
        emitter.render_module(data, namespace=namespace)


def test_lean_string_escaping_is_literal() -> None:
    assert emitter._lean_string('a"b\\c\n\t') == '"a\\"b\\\\c\\n\\t"'


def test_cli_write_check_and_stale_output(tmp_path: Path) -> None:
    output = tmp_path / "ExactTwelveSourceDuplicateCenter0000.lean"
    args = [str(CLASSIFIER), str(output)]

    assert emitter.main(args) == 0
    first = output.read_text(encoding="utf-8")
    assert emitter.main(args) == 0
    assert output.read_text(encoding="utf-8") == first
    assert emitter.main([*args, "--check"]) == 0
    output.write_text(first + "-- stale\n", encoding="utf-8")
    with pytest.raises(SystemExit, match="generated output is stale"):
        emitter.main([*args, "--check"])
    assert list(tmp_path.glob(f".{output.name}.*.tmp")) == []
