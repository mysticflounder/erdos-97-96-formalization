"""Tests for the Tier-2a algebraic certificate recheck.

Two of these are the mandatory negative controls named in the validation plan:
``test_mutants_are_rejected_by_both_legs`` (a perturbed certificate must fail
leg A and leg B) and ``test_caret_is_exponentiation_not_xor`` (sympy reads
``^`` as XOR by default, which would silently pass wrong certificates).
"""

from __future__ import annotations

import json
import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent))

import recheck_algebraic_certificates as mod

REPO = Path(__file__).resolve().parents[1]

# One endpoint certificate that declares the exact-polynomial check ran, and one
# surplus certificate that declares it did not.  Both are small.
ENDPOINT_CERT = REPO / "certificates/endpoint/ep_Q1_000.json"
SURPLUS_CERT = REPO / "certificates/surplus/relaxed_split_singleton/R000_ueqv_R000.json"


def tiny(coefficients: list[str], generators: list[str]) -> dict[str, object]:
    """A certificate over one variable, holding when sum c_i * g_i = 1."""
    return {
        "schema": mod.ENDPOINT_SCHEMA,
        "variables": ["x"],
        "generators": generators,
        "coefficients": coefficients,
    }


# --------------------------------------------------------------------------
# leg A -- parsing
# --------------------------------------------------------------------------


def test_holds_on_a_trivial_identity():
    cert = tiny(["0", "1"], ["x", "1"])
    assert mod.independent_leg(cert)["verdict"] == mod.HOLDS


def test_fails_on_a_wrong_identity():
    cert = tiny(["1", "1"], ["x", "1"])
    entry = mod.independent_leg(cert)
    assert entry["verdict"] == mod.FAILS
    assert entry["residual_terms"] == 1


def test_caret_is_exponentiation_not_xor():
    """``x^2 - x*x`` is the zero polynomial only if ``^`` means power.

    sympy's default reading of ``^`` is XOR.  Without ``convert_xor`` this
    certificate would not cancel, and -- worse -- a genuinely wrong certificate
    written with ``^`` could cancel by accident.
    """
    cert = tiny(["1", "1"], ["x^2 - x*x", "1"])
    assert mod.independent_leg(cert)["verdict"] == mod.HOLDS

    wrong = tiny(["1", "1"], ["x^2 - x*x*x", "1"])
    assert mod.independent_leg(wrong)["verdict"] == mod.FAILS


def test_undeclared_symbol_is_rejected():
    """A misspelled variable must not become a fresh free symbol.

    Without the check a typo turns into a new symbol and the certificate can
    still cancel to 1 in a variable the consumer never declared.
    """
    cert = tiny(["1", "1"], ["y", "1"])
    with pytest.raises(ValueError, match=r"undeclared symbols \['y'\]"):
        mod.independent_leg(cert)


def test_an_undeclared_name_that_cancels_within_one_string_is_invisible():
    """The stated limit of the check: it reads free symbols after parsing.

    ``y - y`` evaluates to 0 during parsing, so no free symbol survives to be
    reported.  The expression is genuinely the zero polynomial, so the verdict
    is still sound; the name simply is not reported.
    """
    cert = tiny(["1", "1"], ["y - y", "1"])
    assert mod.independent_leg(cert)["verdict"] == mod.HOLDS


def test_float_literal_is_rejected():
    cert = tiny(["0.5", "1"], ["x", "1"])
    with pytest.raises(ValueError, match="floating point"):
        mod.independent_leg(cert)


def test_length_mismatch_is_rejected():
    cert = tiny(["1"], ["x", "1"])
    with pytest.raises(ValueError, match="length mismatch"):
        mod.independent_leg(cert)


def test_no_variables_is_rejected():
    cert = {
        "schema": mod.ENDPOINT_SCHEMA,
        "variables": [],
        "generators": ["1"],
        "coefficients": ["1"],
    }
    with pytest.raises(ValueError, match="no variables"):
        mod.independent_leg(cert)


def test_duplicate_variable_is_rejected():
    cert = {
        "schema": mod.ENDPOINT_SCHEMA,
        "variables": ["x", "x"],
        "generators": ["1"],
        "coefficients": ["1"],
    }
    with pytest.raises(ValueError, match="declared twice"):
        mod.independent_leg(cert)


# --------------------------------------------------------------------------
# mutation index selection
# --------------------------------------------------------------------------


def test_mutation_index_skips_a_zero_coefficient():
    """Index 0 has a zero coefficient, so perturbing its generator is invisible."""
    cert = tiny(["0", "1"], ["x", "1"])
    entry = mod.independent_leg(cert, want_mutation_index=True)
    assert entry["mutation_index"] == 1


def test_mutation_index_skips_a_zero_generator():
    cert = tiny(["1", "1"], ["x - x", "1"])
    entry = mod.independent_leg(cert, want_mutation_index=True)
    assert entry["mutation_index"] == 1


def test_mutation_index_is_none_when_every_product_vanishes():
    cert = tiny(["0", "0"], ["x", "1"])
    entry = mod.independent_leg(cert, want_mutation_index=True)
    assert entry["mutation_index"] is None
    control = mod.run_mutation_control(cert, None, REPO)
    assert control["n_mutants"] == 0
    assert "skipped" in control


def test_a_vacuous_mutation_would_not_be_detected():
    """Why the index selection exists: mutating a zero-product index passes.

    This pins the failure the selection rule avoids.  If the rule ever picks an
    index whose coefficient or generator vanishes, the control reports a false
    pass and the whole run is worthless.
    """
    cert = tiny(["0", "1"], ["x", "1"])
    vacuous = mod.mutate(cert, "generators", 0)
    assert mod.independent_leg(vacuous)["verdict"] == mod.HOLDS


# --------------------------------------------------------------------------
# mandatory negative control
# --------------------------------------------------------------------------


@pytest.mark.parametrize("path", [ENDPOINT_CERT, SURPLUS_CERT])
def test_mutants_are_rejected_by_both_legs(path):
    cert, _ = mod.load_certificate(path)
    entry = mod.independent_leg(cert, want_mutation_index=True)
    assert entry["verdict"] == mod.HOLDS
    control = mod.run_mutation_control(cert, entry["mutation_index"], REPO)
    assert control["n_mutants"] == 2
    assert control["n_rejected"] == 2
    for mutant in control["mutants"]:
        assert mutant["independent"] == mod.FAILS
        assert mutant["producer"] == mod.FAILS


# --------------------------------------------------------------------------
# leg B and the two legs together
# --------------------------------------------------------------------------


def test_producer_leg_loads_and_agrees():
    cert, _ = mod.load_certificate(ENDPOINT_CERT)
    assert mod.producer_leg(cert, REPO)["verdict"] == mod.HOLDS


def test_producer_leg_rejects_a_wrong_identity():
    cert = tiny(["1", "1"], ["x", "1"])
    entry = mod.producer_leg(cert, REPO)
    assert entry["verdict"] == mod.FAILS
    assert "identity check failed" in entry["error"]


# --------------------------------------------------------------------------
# repository ground truth
# --------------------------------------------------------------------------


def test_declared_false_flag_does_not_mean_the_identity_fails():
    """The headline Tier-2a finding, pinned on one file.

    ``checks.python_exact_polynomial`` echoes ``--no-python-check``
    (``scripts/endpoint-certificate.py:732,2370``).  It records whether the
    check ran, not whether the identity holds.
    """
    cert, _ = mod.load_certificate(SURPLUS_CERT)
    assert cert["checks"]["python_exact_polynomial"] is False
    assert mod.independent_leg(cert)["verdict"] == mod.HOLDS


def test_lean_names_every_certificate_in_both_families():
    consumers = mod.lean_certificate_consumers(REPO)
    named = set(consumers)
    for directory in (
        "certificates/endpoint",
        "certificates/surplus/relaxed_split_singleton",
    ):
        on_disk = {
            p.relative_to(REPO).as_posix() for p in (REPO / directory).glob("*.json")
        }
        assert on_disk <= named, f"{directory}: unnamed {sorted(on_disk - named)}"
    assert all((REPO / token).is_file() for token in named)


def test_lean_link_scanner_does_not_truncate_jsonl(tmp_path):
    """An alternation on `json` truncates `bank.jsonl` and invents a dangling link."""
    lean = tmp_path / "lean" / "Erdos9796Proof"
    lean.mkdir(parents=True)
    (lean / "M.lean").write_text("-- certificates/x/bank.jsonl\n", encoding="utf-8")
    consumers = mod.lean_certificate_consumers(tmp_path)
    assert list(consumers) == ["certificates/x/bank.jsonl"]


# --------------------------------------------------------------------------
# bounded IO
# --------------------------------------------------------------------------


def test_duplicate_json_key_is_rejected(tmp_path):
    path = tmp_path / "dup.json"
    path.write_text('{"a": 1, "a": 2}', encoding="utf-8")
    with pytest.raises(ValueError, match="duplicate JSON key"):
        mod.load_certificate(path)


def test_load_reports_the_on_disk_digest(tmp_path):
    import hashlib

    path = tmp_path / "c.json"
    raw = json.dumps(tiny(["1"], ["1"])).encode("utf-8")
    path.write_bytes(raw)
    _, digest = mod.load_certificate(path)
    assert digest == hashlib.sha256(raw).hexdigest()


def test_symlink_is_not_followed(tmp_path):
    target = tmp_path / "real.json"
    target.write_text("{}", encoding="utf-8")
    link = tmp_path / "link.json"
    link.symlink_to(target)
    with pytest.raises(OSError):
        mod.load_certificate(link)
