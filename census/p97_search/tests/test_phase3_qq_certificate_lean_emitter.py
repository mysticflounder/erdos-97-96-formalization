from __future__ import annotations

import copy
import hashlib
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
WAVE10_GENERIC_CERTIFICATE = (
    ROOT
    / "scratch"
    / "runs"
    / "b1-exact12-structural-20260830"
    / "wave-10"
    / "artifacts"
    / "singular-wave9-full-equality-28d5d18112b6c6898870"
    / "audited-final-core-certificate.json"
)
WAVE10_GENERIC_CERTIFICATE_SHA256 = (
    "156a943dd31f25e51bc461753b79585b0aebf0731d0f6d6ab354442acc000146"
)


def _resign(payload: dict) -> None:
    payload["cofactor_stream_sha256"] = emitter._sha256_value(
        [entry["cofactor"] for entry in payload["entries"]]
    )
    _resign_payload_only(payload)


def _resign_payload_only(payload: dict) -> None:
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


def _minimal_generic_payload(
    *,
    point_count: int = 12,
    generator_count: int = 3,
) -> dict:
    variables = [
        coordinate
        for point in range(2, point_count)
        for coordinate in (f"x{point}x", f"x{point}y")
    ]
    entries = []
    for index in range(generator_count):
        if index == 0:
            center, pivot, target = 0, 1, 0
            polynomial, cofactor = "1", "1"
        elif index == 1 and point_count > 2:
            center, pivot, target = point_count - 1, 0, 1
            polynomial, cofactor = f"2*x{point_count - 1}x-1", "0"
        else:
            center = pivot = target = index % point_count
            polynomial, cofactor = "0", "0"
        entries.append(
            {
                "index": index,
                "singular_index": index + 1,
                "name": f"g{index:02d}",
                "center": center,
                "pivot": pivot,
                "target": target,
                "polynomial": polynomial,
                "cofactor": cofactor,
            }
        )
    payload = {
        "schema": emitter.GENERIC_SCHEMA,
        "source_system": "synthetic/generic-system.json",
        "source_system_sha256": "c" * 64,
        "source_metric_rows_sha256": "d" * 64,
        "scope": "synthetic generic emitter test",
        "coefficient_field": "QQ",
        "point_count": point_count,
        "variables": variables,
        "coordinate_gauge": copy.deepcopy(emitter.EXPECTED_GAUGE),
        "identity": emitter.IDENTITY,
        "generator_order": emitter.GENERIC_GENERATOR_ORDER,
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


def test_parser_rejects_execution_calls_and_attributes_without_side_effects(
    tmp_path: Path,
) -> None:
    marker = tmp_path / "parser-executed"
    expressions = (
        f"__import__('os').system('touch {marker}')+1",
        "system(1)+1",
        "sin(x2x)+1",
        "x2x.real+1",
    )

    for expression in expressions:
        payload = _minimal_generic_payload()
        payload["entries"][0]["polynomial"] = expression
        _resign(payload)
        with pytest.raises(
            emitter.CertificateEmissionError,
            match="cannot parse exact QQ polynomial",
        ):
            emitter.load_certificate(_write_payload(tmp_path, payload))
        assert not marker.exists()


@pytest.mark.parametrize(
    "expression",
    (
        "sqrt(2)",
        "nan",
        "oo",
        "zoo",
        "1/0",
        "x2x/2",
        "x2x^-1",
    ),
)
def test_parser_rejects_nonpolynomial_and_nonfinite_inputs(
    expression: str,
) -> None:
    with pytest.raises(
        emitter.CertificateEmissionError,
        match="cannot parse exact QQ polynomial",
    ):
        emitter.parse_qq_polynomial(expression, emitter.EXPECTED_VARIABLES)


@pytest.mark.parametrize(
    "expression",
    (
        "9" * (emitter.MAX_INTEGER_DIGITS + 1),
        f"x2x^{emitter.MAX_EXPONENT + 1}",
        "10**4096*10**4096",
        "(x2x+x2y)**4096",
    ),
)
def test_parser_rejects_huge_literals_with_bounded_errors(expression: str) -> None:
    with pytest.raises(emitter.CertificateEmissionError) as error:
        emitter.parse_qq_polynomial(expression, emitter.EXPECTED_VARIABLES)

    assert len(str(error.value)) < 1_000


def test_parser_preflights_distinct_large_denominator_growth() -> None:
    denominators = (2**3_000, 3**3_000, 5**3_000)
    expression = "+".join(f"1/{denominator}" for denominator in denominators)

    with pytest.raises(
        emitter.CertificateEmissionError,
        match="polynomial coefficient growth exceeds",
    ):
        emitter.parse_qq_polynomial(expression, emitter.EXPECTED_VARIABLES)


def test_load_replays_identity_and_omits_zero_cofactors(tmp_path: Path) -> None:
    certificate = emitter.load_certificate(
        _write_payload(tmp_path, _minimal_payload())
    )

    assert len(certificate.facts) == 30
    assert certificate.facts[0] == (((), Fraction(1)),)
    assert certificate.cofactors == ((0, (((), Fraction(1)),)),)
    assert certificate.schema == emitter.SCHEMA
    assert certificate.point_count == 10
    assert certificate.variable_count == 16


def test_generic_profile_loads_arbitrary_size_and_renders_dynamic_counts(
    tmp_path: Path,
) -> None:
    certificate = emitter.load_certificate(
        _write_payload(
            tmp_path,
            _minimal_generic_payload(point_count=12, generator_count=3),
        )
    )

    assert certificate.schema == emitter.GENERIC_SCHEMA
    assert certificate.point_count == 12
    assert certificate.variables[-2:] == ("x11x", "x11y")
    assert certificate.variable_count == 20
    assert len(certificate.facts) == 3
    assert certificate.cofactors == ((0, (((), Fraction(1)),)),)

    rendered = emitter.render_module(
        certificate,
        namespace="Problem97.GenericMetricEmitterTest",
        artifact_label="generic-synthetic-test",
    )
    assert "# Generated exact metric QQ unit checker" in rendered
    assert "def variableCount : ℕ := 20" in rendered
    assert "The 3 facts in exact artifact generator order" in rendered
    assert "satisfying all 3 artifact facts" in rendered
    assert "It proves no coverage or\nP97 closure theorem." in rendered


def test_generic_profile_supports_only_the_two_gauge_points(
    tmp_path: Path,
) -> None:
    certificate = emitter.load_certificate(
        _write_payload(
            tmp_path,
            _minimal_generic_payload(point_count=2, generator_count=1),
        )
    )

    assert certificate.variables == ()
    assert certificate.variable_count == 0
    assert certificate.facts == ((((), Fraction(1)),),)
    rendered = emitter.render_module(
        certificate,
        namespace="Problem97.TwoPointGenericMetricEmitterTest",
        artifact_label="two-point-generic-synthetic-test",
    )
    assert "def variableCount : ℕ := 0" in rendered


def test_wave10_generic_certificate_replays_after_sparse_additive_normalization() -> None:
    if not WAVE10_GENERIC_CERTIFICATE.exists():
        pytest.skip(
            "Wave 10 generic certificate is not present: "
            f"{WAVE10_GENERIC_CERTIFICATE}"
        )
    assert (
        hashlib.sha256(WAVE10_GENERIC_CERTIFICATE.read_bytes()).hexdigest()
        == WAVE10_GENERIC_CERTIFICATE_SHA256
    )

    certificate = emitter.load_certificate(WAVE10_GENERIC_CERTIFICATE)

    assert certificate.schema == emitter.GENERIC_SCHEMA
    assert certificate.point_count == 12
    assert certificate.variable_count == 20
    assert len(certificate.facts) == 11
    assert len(certificate.cofactors) == 11
    assert max(len(polynomial) for _, polynomial in certificate.cofactors) == 1_283
    assert max(
        max(
            abs(coefficient.numerator).bit_length(),
            coefficient.denominator.bit_length(),
        )
        for _, polynomial in certificate.cofactors
        for _, coefficient in polynomial
    ) == 61

    rendered = emitter.render_module(
        certificate,
        namespace="Problem97.Wave10GenericCertificateRegression",
        artifact_label="wave-10-generic-certificate-regression",
    )
    assert "def variableCount : ℕ := 20" in rendered
    assert "The 11 facts in exact artifact generator order" in rendered


def test_generic_shape_requires_the_explicit_generic_schema(tmp_path: Path) -> None:
    payload = _minimal_generic_payload()
    payload["schema"] = emitter.SCHEMA
    _resign(payload)

    with pytest.raises(
        emitter.CertificateEmissionError,
        match="certificate payload fields are not exact",
    ):
        emitter.load_certificate(_write_payload(tmp_path, payload))


@pytest.mark.parametrize(
    ("field", "value", "message"),
    (
        ("point_count", True, "point_count is not an integer in"),
        ("generator_order", emitter.GENERATOR_ORDER, "generator order"),
        ("coefficient_field", "RR", "coefficient field"),
        ("identity", "sum = 1", "identity orientation"),
        ("coordinate_gauge", {"0": ["0", "0"]}, "coordinate gauge"),
        ("source_system", "", "source_system"),
        ("scope", "", "scope"),
        ("source_system_sha256", "not-a-hash", "source_system_sha256"),
        (
            "source_metric_rows_sha256",
            "A" * 64,
            "source_metric_rows_sha256",
        ),
    ),
)
def test_generic_profile_rejects_invalid_header_fields(
    tmp_path: Path,
    field: str,
    value: object,
    message: str,
) -> None:
    payload = _minimal_generic_payload()
    payload[field] = value
    _resign(payload)

    with pytest.raises(emitter.CertificateEmissionError, match=message):
        emitter.load_certificate(_write_payload(tmp_path, payload))


def test_generic_profile_rejects_wrong_variable_order(tmp_path: Path) -> None:
    payload = _minimal_generic_payload()
    payload["variables"][-2:] = reversed(payload["variables"][-2:])
    _resign(payload)

    with pytest.raises(emitter.CertificateEmissionError, match="variable order"):
        emitter.load_certificate(_write_payload(tmp_path, payload))


def test_generic_profile_bounds_point_count_before_variable_allocation(
    tmp_path: Path,
) -> None:
    payload = _minimal_generic_payload()
    payload["point_count"] = emitter.MAX_GENERIC_POINT_COUNT + 1
    _resign(payload)

    with pytest.raises(
        emitter.CertificateEmissionError,
        match="point_count is not an integer in",
    ):
        emitter.load_certificate(_write_payload(tmp_path, payload))


def test_generic_profile_bounds_generator_count(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    payload = _minimal_generic_payload(generator_count=3)
    monkeypatch.setattr(emitter, "MAX_GENERATOR_COUNT", 2)

    with pytest.raises(
        emitter.CertificateEmissionError,
        match="generator entry count exceeds 2",
    ):
        emitter.load_certificate(_write_payload(tmp_path, payload))


@pytest.mark.parametrize("field", ("source_system", "scope"))
def test_generic_profile_bounds_header_text(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    field: str,
) -> None:
    payload = _minimal_generic_payload()
    payload["source_system"] = "source"
    payload["scope"] = "scope"
    payload[field] = "x" * 9
    _resign(payload)
    monkeypatch.setattr(emitter, "MAX_HEADER_TEXT_LENGTH", 8)

    with pytest.raises(
        emitter.CertificateEmissionError,
        match=f"{field} exceeds 8 characters",
    ):
        emitter.load_certificate(_write_payload(tmp_path, payload))


def test_generic_profile_bounds_total_replay_work(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    payload = _minimal_generic_payload()
    monkeypatch.setattr(emitter, "MAX_REPLAY_WORK_UNITS", 1)

    with pytest.raises(
        emitter.CertificateEmissionError,
        match="certificate replay work .* exceeds 1 units",
    ):
        emitter.load_certificate(_write_payload(tmp_path, payload))


def test_generic_profile_bounds_algebra_replay_work(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    payload = _minimal_generic_payload()
    monkeypatch.setattr(emitter, "MAX_REPLAY_ALGEBRA_WORK_UNITS", 1)

    with pytest.raises(
        emitter.CertificateEmissionError,
        match="certificate algebra replay exceeds 1 work units",
    ):
        emitter.load_certificate(_write_payload(tmp_path, payload))


@pytest.mark.parametrize("location", ("payload", "entry"))
def test_generic_profile_rejects_unexpected_fields(
    tmp_path: Path,
    location: str,
) -> None:
    payload = _minimal_generic_payload()
    if location == "payload":
        payload["unexpected"] = "not authenticated by the schema"
        message = "certificate payload fields are not exact"
    else:
        payload["entries"][0]["unexpected"] = "not an entry field"
        message = "generator entry 0 fields are not exact"
    _resign(payload)

    with pytest.raises(emitter.CertificateEmissionError, match=message):
        emitter.load_certificate(_write_payload(tmp_path, payload))


def test_generic_profile_rejects_duplicate_json_keys(tmp_path: Path) -> None:
    payload = _minimal_generic_payload()
    text = json.dumps(payload, sort_keys=True)
    schema_field = f'"schema": "{emitter.GENERIC_SCHEMA}"'
    text = text.replace(schema_field, f"{schema_field}, {schema_field}", 1)
    path = tmp_path / "duplicate-key-certificate.json"
    path.write_text(text + "\n")

    with pytest.raises(
        emitter.CertificateEmissionError,
        match="duplicate JSON key 'schema'",
    ):
        emitter.load_certificate(path)


@pytest.mark.parametrize(
    ("needle", "replacement", "constant"),
    (
        ('"point_count": 12', '"point_count": NaN', "NaN"),
        (
            '"source_system": "synthetic/generic-system.json"',
            '"source_system": Infinity',
            "Infinity",
        ),
        ('"polynomial": "1"', '"polynomial": -Infinity', "-Infinity"),
    ),
)
def test_load_rejects_nonfinite_json_constants(
    tmp_path: Path,
    needle: str,
    replacement: str,
    constant: str,
) -> None:
    text = json.dumps(_minimal_generic_payload(), sort_keys=True)
    assert needle in text
    path = tmp_path / "nonfinite-certificate.json"
    path.write_text(text.replace(needle, replacement, 1) + "\n")

    with pytest.raises(
        emitter.CertificateEmissionError,
        match=rf"non-finite JSON constant {constant!r}",
    ):
        emitter.load_certificate(path)


def test_load_rejects_json_float_literals(tmp_path: Path) -> None:
    text = json.dumps(_minimal_generic_payload(), sort_keys=True)
    path = tmp_path / "float-certificate.json"
    path.write_text(text.replace('"point_count": 12', '"point_count": 12.0', 1))

    with pytest.raises(
        emitter.CertificateEmissionError,
        match="JSON floating-point literal '12.0' is not allowed",
    ):
        emitter.load_certificate(path)


def test_load_wraps_json_huge_integer_failure(tmp_path: Path) -> None:
    text = json.dumps(_minimal_generic_payload(), sort_keys=True)
    huge_integer = "9" * 5_000
    path = tmp_path / "huge-integer-certificate.json"
    path.write_text(
        text.replace('"point_count": 12', f'"point_count": {huge_integer}', 1)
    )

    with pytest.raises(
        emitter.CertificateEmissionError,
        match="cannot parse certificate JSON",
    ):
        emitter.load_certificate(path)


def test_load_bounds_total_json_bytes(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    path = _write_payload(tmp_path, _minimal_generic_payload())
    monkeypatch.setattr(emitter, "MAX_CERTIFICATE_JSON_BYTES", path.stat().st_size - 1)

    with pytest.raises(
        emitter.CertificateEmissionError,
        match="certificate JSON exceeds",
    ):
        emitter.load_certificate(path)


@pytest.mark.parametrize(
    ("field", "value", "message"),
    (
        ("index", 0, "generator indices are not exactly 0..2"),
        ("singular_index", 1, "Singular indices are not exactly 1..3"),
    ),
)
def test_generic_profile_rejects_noncontiguous_indices(
    tmp_path: Path,
    field: str,
    value: int,
    message: str,
) -> None:
    payload = _minimal_generic_payload()
    payload["entries"][1][field] = value
    _resign(payload)

    with pytest.raises(emitter.CertificateEmissionError, match=message):
        emitter.load_certificate(_write_payload(tmp_path, payload))


def test_generic_profile_rejects_empty_generator_stream(tmp_path: Path) -> None:
    payload = _minimal_generic_payload(generator_count=0)

    with pytest.raises(
        emitter.CertificateEmissionError,
        match="at least one generator entry",
    ):
        emitter.load_certificate(_write_payload(tmp_path, payload))


def test_generic_profile_rejects_out_of_range_points(tmp_path: Path) -> None:
    payload = _minimal_generic_payload(point_count=12)
    payload["entries"][1]["center"] = 12
    _resign(payload)

    with pytest.raises(
        emitter.CertificateEmissionError,
        match="center point index 12 is outside 0..11",
    ):
        emitter.load_certificate(_write_payload(tmp_path, payload))


def test_generic_profile_rejects_duplicate_generator_names(tmp_path: Path) -> None:
    payload = _minimal_generic_payload()
    payload["entries"][1]["name"] = payload["entries"][0]["name"]
    _resign(payload)

    with pytest.raises(
        emitter.CertificateEmissionError,
        match="names are missing, too long, or not unique",
    ):
        emitter.load_certificate(_write_payload(tmp_path, payload))


def test_generic_profile_rejects_wrong_metric_polynomial(tmp_path: Path) -> None:
    payload = _minimal_generic_payload(point_count=12)
    payload["entries"][1]["polynomial"] = "2*x11x+1"
    _resign(payload)

    with pytest.raises(
        emitter.CertificateEmissionError,
        match="generator 1 has wrong metric orientation",
    ):
        emitter.load_certificate(_write_payload(tmp_path, payload))


def test_generic_profile_rejects_nonunit_exact_qq_replay(tmp_path: Path) -> None:
    payload = _minimal_generic_payload()
    payload["entries"][0]["cofactor"] = "0"
    _resign(payload)

    with pytest.raises(
        emitter.CertificateEmissionError,
        match="exact QQ replay is not one",
    ):
        emitter.load_certificate(_write_payload(tmp_path, payload))


def test_generic_profile_rejects_payload_hash_mismatch(tmp_path: Path) -> None:
    payload = _minimal_generic_payload()
    payload["certificate_payload_sha256"] = "0" * 64

    with pytest.raises(
        emitter.CertificateEmissionError,
        match="certificate payload hash mismatch",
    ):
        emitter.load_certificate(_write_payload(tmp_path, payload))


def test_generic_profile_rejects_cofactor_stream_hash_mismatch(
    tmp_path: Path,
) -> None:
    payload = _minimal_generic_payload()
    payload["cofactor_stream_sha256"] = "0" * 64
    _resign_payload_only(payload)

    with pytest.raises(
        emitter.CertificateEmissionError,
        match="cofactor stream hash mismatch",
    ):
        emitter.load_certificate(_write_payload(tmp_path, payload))


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
    assert "def variableCount" not in rendered
    assert "# Generated Phase-3 QQ unit checker" in rendered
    assert "The 30 facts in exact artifact generator order" in rendered


@pytest.mark.parametrize(
    "artifact_label",
    (
        "close-/\ntheorem injected : False := by contradiction",
        "open/-nested-comment",
        "line-feed\nlabel",
        "carriage-return\rlabel",
        "nul\x00label",
        "delete\x7flabel",
        "bidi\u202elabel",
        "x" * (emitter.MAX_ARTIFACT_LABEL_LENGTH + 1),
    ),
)
def test_render_rejects_lean_comment_injection_in_artifact_label(
    tmp_path: Path,
    artifact_label: str,
) -> None:
    certificate = emitter.load_certificate(
        _write_payload(tmp_path, _minimal_payload())
    )

    with pytest.raises(emitter.CertificateEmissionError, match="artifact label"):
        emitter.render_module(
            certificate,
            namespace="Problem97.Phase3SyntheticEmitterTest",
            artifact_label=artifact_label,
        )


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
