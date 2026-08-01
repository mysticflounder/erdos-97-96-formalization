from __future__ import annotations

import copy
import json
import sys
from fractions import Fraction
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search import phase3_qq_certificate_lean_emitter as emitter

ARTIFACT_ROOT = (
    ROOT
    / "scratch"
    / "p97-distinct-distance-lane"
    / "phase3_survivor_singular_cert_2_20260729"
)
SYSTEMS = (
    (
        "system-00-48c65d6d0dda",
        "Problem97.Phase3SurvivorSingularSystem00",
        ROOT
        / "lean"
        / "Erdos9796Proof"
        / "P97"
        / "Phase3SurvivorSingularSystem00.lean",
        26,
    ),
    (
        "system-01-208c2305f405",
        "Problem97.Phase3SurvivorSingularSystem01",
        ROOT
        / "lean"
        / "Erdos9796Proof"
        / "P97"
        / "Phase3SurvivorSingularSystem01.lean",
        17,
    ),
)


def _resign(payload: dict) -> None:
    payload["cofactor_stream_sha256"] = emitter._sha256_value(
        [entry["cofactor"] for entry in payload["entries"]]
    )
    unsigned = dict(payload)
    unsigned.pop("certificate_payload_sha256", None)
    payload["certificate_payload_sha256"] = emitter._sha256_value(unsigned)


def _minimal_payload() -> dict:
    entries = []
    for index, (row_index, support_position) in enumerate(
        emitter.EXPECTED_GENERATOR_POSITIONS
    ):
        if index == 0:
            center, pivot, target = 0, 1, 0
            polynomial, cofactor = "1", "1"
        else:
            center = pivot = target = row_index
            polynomial, cofactor = "0", "0"
        entries.append(
            {
                "index": index,
                "singular_index": index + 1,
                "name": f"f{index:02d}",
                "row_index": row_index,
                "support_position": support_position,
                "center": center,
                "pivot": pivot,
                "target": target,
                "polynomial": polynomial,
                "cofactor": cofactor,
            }
        )
    payload = {
        "schema": emitter.SCHEMA,
        "source_system": "synthetic/system.json",
        "source_system_sha256": "a" * 64,
        "source_metric_rows_sha256": "b" * 64,
        "scope": "synthetic focused emitter test",
        "coefficient_field": "QQ",
        "variables": list(emitter.EXPECTED_VARIABLES),
        "coordinate_gauge": copy.deepcopy(emitter.EXPECTED_GAUGE),
        "identity": emitter.IDENTITY,
        "generator_order": emitter.GENERATOR_ORDER,
        "entries": entries,
        "cofactor_stream_sha256": "",
        "certificate_payload_sha256": "",
    }
    _resign(payload)
    return payload


def _write_payload(tmp_path: Path, payload: dict) -> Path:
    path = tmp_path / "certificate.json"
    path.write_text(json.dumps(payload, sort_keys=True) + "\n")
    return path


def test_trim_exponent_tail_canonicalizes_constant_and_variables() -> None:
    assert emitter.trim_exponent_tail(()) == ()
    assert emitter.trim_exponent_tail((0, 0, 0)) == ()
    assert emitter.trim_exponent_tail((2, 0, 0)) == (2,)
    assert emitter.trim_exponent_tail((0, 1, 0)) == (0, 1)


def test_parse_qq_polynomial_preserves_exact_rationals() -> None:
    _, terms = emitter.parse_qq_polynomial(
        "3/7*x2x^2-5/11",
        emitter.EXPECTED_VARIABLES,
    )

    assert terms == (
        ((2,), Fraction(3, 7)),
        ((), Fraction(-5, 11)),
    )
    assert emitter._lean_monomial(()) == "[]"
    assert emitter._lean_rational(Fraction(-5, 11)) == (
        "((-5 : ℚ) / (11 : ℚ))"
    )


def test_load_replays_identity_and_omits_zero_cofactors(tmp_path: Path) -> None:
    certificate = emitter.load_certificate(
        _write_payload(tmp_path, _minimal_payload())
    )

    assert len(certificate.facts) == 30
    assert certificate.facts[0] == (((), Fraction(1)),)
    assert certificate.cofactors == ((0, (((), Fraction(1)),)),)


def test_load_rejects_reordered_generator_indices(tmp_path: Path) -> None:
    payload = _minimal_payload()
    payload["entries"][0], payload["entries"][1] = (
        payload["entries"][1],
        payload["entries"][0],
    )
    _resign(payload)

    with pytest.raises(
        emitter.CertificateEmissionError,
        match="indices are not exactly 0..29",
    ):
        emitter.load_certificate(_write_payload(tmp_path, payload))


def test_load_rejects_wrong_metric_orientation(tmp_path: Path) -> None:
    payload = _minimal_payload()
    payload["entries"][0]["polynomial"] = "-1"
    _resign(payload)

    with pytest.raises(
        emitter.CertificateEmissionError,
        match="wrong metric orientation",
    ):
        emitter.load_certificate(_write_payload(tmp_path, payload))


def test_render_includes_index_audit_checker_and_handoff(tmp_path: Path) -> None:
    certificate = emitter.load_certificate(
        _write_payload(tmp_path, _minimal_payload())
    )
    rendered = emitter.render_module(
        certificate,
        namespace="Problem97.Phase3SyntheticEmitterTest",
        artifact_label="synthetic-test",
    )

    assert "theorem cofactor_indices_lt" in rendered
    assert "unitIdealCertCheckerNormalized facts cofactors = true" in rendered
    assert "theorem false_of_facts_eval_zero" in rendered
    assert "(0, [" in rendered
    assert "(1, [" not in rendered


def test_cli_write_is_idempotent_and_check_mode_accepts_it(
    tmp_path: Path,
) -> None:
    certificate_path = _write_payload(tmp_path, _minimal_payload())
    output_path = tmp_path / "Generated.lean"
    args = [
        str(certificate_path),
        str(output_path),
        "--namespace",
        "Problem97.TestGenerated",
        "--artifact-label",
        "synthetic-test",
    ]

    assert emitter.main(args) == 0
    first_render = output_path.read_text(encoding="utf-8")
    assert emitter.main(args) == 0
    assert output_path.read_text(encoding="utf-8") == first_render
    assert emitter.main([*args, "--check"]) == 0
    assert list(tmp_path.glob(f".{output_path.name}.*.tmp")) == []


@pytest.mark.parametrize(
    ("system_name", "namespace", "output", "nonzero_count"),
    SYSTEMS,
)
def test_current_artifacts_replay_and_match_generated_modules(
    system_name: str,
    namespace: str,
    output: Path,
    nonzero_count: int,
) -> None:
    artifact = ARTIFACT_ROOT / system_name / "certificate.json"
    if not artifact.exists():
        pytest.skip(f"current certificate artifact is not present: {artifact}")
    certificate = emitter.load_certificate(artifact)

    assert len(certificate.facts) == 30
    assert len(certificate.cofactors) == nonzero_count
    assert all(0 <= index < 30 for index, _ in certificate.cofactors)
    assert output.read_text() == emitter.render_module(
        certificate,
        namespace=namespace,
        artifact_label=system_name,
    )
