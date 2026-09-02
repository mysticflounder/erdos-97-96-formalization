"""Tests for the Stage 2 pattern algebra generator.

The unit tests exercise projection, equation generation, and output parsing
without any solver.  The known-answer tests (Guardrail 1) submit small
scripts through ``piqc singular run`` and are skipped when the piqd daemon
is not reachable; they never spawn Singular directly.
"""

from __future__ import annotations

import json
import shutil
import subprocess
import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

import d1_mu0_pattern_algebra as alg

SAMPLE = {
    "E": ["P0.1", "P0.3", "P1.2", "P1.4"],
    "centre": {
        "P0.1": "P0.2",
        "P0.2": "P0.1",
        "P0.3": "P0.2",
        "P0.4": "P0.3",
        "P1.1": "P0.1",
        "P1.2": "P0.2",
        "P1.3": "P0.3",
        "P1.4": "P0.4",
        "P2.1": "P0.1",
        "P2.2": "P0.2",
        "P2.3": "P0.3",
        "P2.4": "P0.4",
    },
    "classes": {
        "A0.0": ["A1", "A2", "P0.1", "P0.2", "P0.3", "P0.4"],
        "A1.0": ["A0", "A2", "P1.1", "P1.2", "P1.3", "P1.4"],
        "A2.0": ["A0", "P0.1", "P2.1", "P2.2", "P2.3", "P2.4"],
    },
    "partition": {},
    "roles": {"deleted": "P0.4", "kept": "P0.2", "source": "A1", "w": "A2", "z": "A1"},
    "shell": {
        "P0.1": ["P0.1", "P0.3", "P1.2", "P2.2"],
        "P0.2": ["A0", "P0.2", "P1.1", "P2.1"],
        "P0.3": ["P0.1", "P0.3", "P1.2", "P2.2"],
        "P0.4": ["A0", "P0.4", "P1.3", "P2.3"],
        "P1.1": ["A0", "P0.2", "P1.1", "P2.1"],
        "P1.2": ["P0.1", "P0.3", "P1.2", "P2.2"],
        "P1.3": ["A0", "P0.4", "P1.3", "P2.3"],
        "P1.4": ["A0", "A1", "P1.4", "P2.4"],
        "P2.1": ["A0", "P0.2", "P1.1", "P2.1"],
        "P2.2": ["P0.1", "P0.3", "P1.2", "P2.2"],
        "P2.3": ["A0", "P0.4", "P1.3", "P2.3"],
        "P2.4": ["A0", "A1", "P1.4", "P2.4"],
    },
}


def piqd_up() -> bool:
    if shutil.which("piqc") is None:
        return False
    proc = subprocess.run(["piqc", "version"], capture_output=True, text=True, check=False)
    return proc.returncode == 0


needs_piqd = pytest.mark.skipif(not piqd_up(), reason="piqd daemon not reachable")


# --------------------------------------------------------------------------
# Unit tests
# --------------------------------------------------------------------------


def test_metric_pattern_dedupes_shells_and_drops_roles() -> None:
    pattern = alg.metric_pattern(SAMPLE)
    # Twelve shell records collapse to the distinct (centre, support) pairs.
    supports = {support for _c, support in pattern.shells}
    assert len(pattern.shells) == 4
    assert ("P0.2", ("P0.1", "P0.3", "P1.2", "P2.2")) in pattern.shells
    assert ("P0.4", ("A0", "A1", "P1.4", "P2.4")) in pattern.shells
    assert all(len(s) == 4 for s in supports)
    assert len(pattern.classes) == 3
    assert ("A0", ("A1", "A2", "P0.1", "P0.2", "P0.3", "P0.4")) in pattern.classes
    assert pattern.points == alg.ALL_NAMES


def test_metric_pattern_key_ignores_roles() -> None:
    other = json.loads(json.dumps(SAMPLE))
    other["roles"] = {"deleted": "P0.1", "kept": "P0.3", "source": "A2", "w": "A1", "z": "A2"}
    other["E"] = ["P1.1", "P1.2", "P1.3", "P1.4"]
    assert alg.metric_pattern(SAMPLE).key == alg.metric_pattern(other).key


def test_metric_pattern_rejects_centre_in_own_shell() -> None:
    bad = json.loads(json.dumps(SAMPLE))
    bad["shell"]["P0.1"] = ["P0.1", "P0.2", "P1.2", "P2.2"]
    with pytest.raises(alg.D1Mu0AlgebraError):
        alg.metric_pattern(bad)


def test_equation_counts() -> None:
    pattern = alg.metric_pattern(SAMPLE)
    eqs = alg.equations(pattern)
    # Four shells x 3 + three six-point classes x 5.
    assert len(eqs) == 4 * 3 + 3 * 5
    names = alg.var_names(pattern.points)
    assert len(names) == 26
    assert "xA0" not in names and "xA1" not in names
    assert "xA2" in names and "yP2s4" in names


def test_pinned_coordinates_in_polynomials() -> None:
    eq = alg.equidistance_equations("A0", ["A1", "A2"])
    assert eq == ["(((0)-(1))^2+((0)-(0))^2)-(((0)-(xA2))^2+((0)-(yA2))^2)"]


def test_parse_output_and_verdicts() -> None:
    fields = alg.parse_output("equations 3\ndim_raw 0\ndim 0\nvdim 2\nreal 0\n")
    assert fields == {"equations": 3, "dim_raw": 0, "dim": 0, "vdim": 2, "real": 0}
    assert alg.verdict(fields) == "FINITE_NO_REAL"
    assert alg.verdict({"dim": -1}) == "EMPTY_COMPLEX"
    assert alg.verdict({"dim": 3}) == "POSITIVE_DIMENSIONAL"
    assert alg.verdict({"dim": 0, "vdim": 4, "real": 2}) == "FINITE_REAL_CANDIDATES"
    with pytest.raises(alg.D1Mu0AlgebraError):
        alg.parse_output("nothing here\n")
    with pytest.raises(alg.D1Mu0AlgebraError):
        alg.parse_output("equations 1\ndim_raw 4\ndim_sat 25\ndim 25\n")
    with pytest.raises(alg.D1Mu0AlgebraError):
        alg.parse_output("   ? `sat` undefined\ndim 3\n")


def test_load_patterns_counts_records(tmp_path: Path) -> None:
    path = tmp_path / "m.models.jsonl"
    other = json.loads(json.dumps(SAMPLE))
    other["roles"]["kept"] = "P0.3"
    path.write_text(json.dumps(SAMPLE) + "\n" + json.dumps({"pattern": other}) + "\n")
    loaded = alg.load_patterns([path])
    assert len(loaded) == 1
    (_pattern, count), = loaded.values()
    assert count == 2


# --------------------------------------------------------------------------
# Known-answer runs through piqd (Guardrail 1)
# --------------------------------------------------------------------------


def _run(tmp_path: Path, script: str, name: str) -> dict[str, int]:
    path = tmp_path / f"{name}.sing"
    path.write_text(script)
    run = alg.run_script(path, timeout_s=120, source=alg.SOURCE_LABEL + "/tests")
    assert run.receipt["run_status"] == "RAN", run.receipt
    assert run.receipt["exit_code"] == 0, run.stderr
    return alg.parse_output(run.stdout)


@needs_piqd
def test_known_free_class_dimension(tmp_path: Path) -> None:
    # One equation |A0A1| = |A0A2| on the two coordinates of A2: a curve.
    pattern = alg.MetricPattern((), (("A0", ("A1", "A2")),))
    fields = _run(tmp_path, alg.singular_script(pattern), "free_class")
    assert fields["equations"] == 1
    assert fields["dim"] == 1


@needs_piqd
def test_known_concyclic_shell_is_realizable(tmp_path: Path) -> None:
    # P0.3 equidistant from A0, A1, P0.1, P0.2: three equations on the six
    # free coordinates, a three-dimensional family.
    pattern = alg.MetricPattern((("P0.3", ("A0", "A1", "P0.1", "P0.2")),), ())
    fields = _run(tmp_path, alg.singular_script(pattern), "concyclic")
    assert fields["equations"] == 3
    assert fields["dim"] == 3


@needs_piqd
def test_known_non_concyclic_becomes_empty_after_saturation(tmp_path: Path) -> None:
    # P0.1, P0.2 at distance 1 from both A0 and A1 lie at (1/2, +-sqrt3/2);
    # together with A0, A1 they are not concyclic, so a centre P0.3
    # equidistant from all four exists only when P0.1 = P0.2.
    pattern = alg.MetricPattern(
        (("P0.3", ("A0", "A1", "P0.1", "P0.2")),),
        (("A0", ("A1", "P0.1", "P0.2")), ("A1", ("A0", "P0.1", "P0.2"))),
    )
    raw = _run(tmp_path, alg.singular_script(pattern), "nonconcyclic_raw")
    assert raw["dim"] == 0
    assert raw["vdim"] >= 2
    assert raw["real"] >= 2
    sat = _run(
        tmp_path,
        alg.singular_script(pattern, saturate=(("P0.1", "P0.2"),)),
        "nonconcyclic_sat",
    )
    assert sat["dim_raw"] == 0
    assert sat["dim"] == -1
    assert alg.verdict(sat) == "EMPTY_COMPLEX"


@needs_piqd
def test_known_finite_real_and_complex_only(tmp_path: Path) -> None:
    # A2 at distance 1 from A0 and A1: two real points (1/2, +-sqrt3/2).
    real = alg.MetricPattern((), (("A0", ("A1", "A2")), ("A1", ("A0", "A2"))))
    fields = _run(tmp_path, alg.singular_script(real), "equilateral")
    assert (fields["dim"], fields["vdim"], fields["real"]) == (0, 2, 2)
    # Add |A0A2|^2 = -1 via the extra hook: complex only.
    script = alg.singular_script(real, extra=(f"({alg.squared_distance('A0', 'A2')})+1",))
    fields = _run(tmp_path, script, "complex_only")
    assert fields["dim"] == -1 or fields.get("real") == 0


def test_contains_is_constraint_inclusion() -> None:
    pattern = alg.metric_pattern(SAMPLE)
    core = alg.MetricPattern(pattern.shells[:2], pattern.classes[:1])
    assert alg.contains(pattern, core)
    other = alg.MetricPattern((("P0.2", ("A0", "A1", "P1.1", "P2.1")),), ())
    assert not alg.contains(pattern, other)


@needs_piqd
def test_known_core_of_non_concyclic_drops_one_class(tmp_path: Path) -> None:
    # A circle through A0 = (0, 0) and A1 = (1, 0) meets the unit circle
    # about A0 in A1 and at most one further point, so the shell together
    # with either apex class alone already forces P0.1 = P0.2.  The
    # deletion-minimal core keeps the shell and exactly one class; the shell
    # alone and one class alone are realizable.
    pattern = alg.MetricPattern(
        (("P0.3", ("A0", "A1", "P0.1", "P0.2")),),
        (("A0", ("A1", "P0.1", "P0.2")), ("A1", ("A0", "P0.1", "P0.2"))),
    )
    assert alg.is_empty_saturated(pattern, tmp_path, "whole", timeout_s=120)
    core, confirmed = alg.shrink_core(pattern, tmp_path, timeout_s=120)
    assert confirmed
    assert core.shells == pattern.shells
    assert len(core.classes) == 1
    assert alg.contains(pattern, core)
    assert not alg.is_empty_saturated(
        alg.MetricPattern(pattern.shells, ()), tmp_path, "shell_only", timeout_s=120
    )


def test_modular_script_has_no_real_root_call() -> None:
    pattern = alg.MetricPattern((), (("A0", ("A1", "A2")),))
    script = alg.singular_script(pattern, char=alg.PREFILTER_CHAR)
    assert f"ring R = {alg.PREFILTER_CHAR}," in script
    assert "nrRootsDeterm" not in script
    assert "nrRootsDeterm" in alg.singular_script(pattern)


def test_raw_core_flag_disables_saturation() -> None:
    args = alg.parse_args(["m.jsonl", "--artifacts", "a", "--core", "--raw-core"])
    assert args.core and args.raw_core
    pattern = alg.MetricPattern((), (("A0", ("A1", "A2")),))
    assert "sat(" not in alg.singular_script(pattern, saturate=(), real_roots=False)
    assert "sat(" in alg.singular_script(pattern, saturate=alg.all_pairs(pattern), real_roots=False)


@needs_piqd
def test_known_raw_core_negative_control(tmp_path: Path) -> None:
    # The non-concyclic pattern is empty only after saturation (its raw
    # variety is the coincidence P0.1 = P0.2), so raw core mining must not
    # confirm a core.
    pattern = alg.MetricPattern(
        (("P0.3", ("A0", "A1", "P0.1", "P0.2")),),
        (("A0", ("A1", "P0.1", "P0.2")), ("A1", ("A0", "P0.1", "P0.2"))),
    )
    assert not alg.is_empty_saturated(pattern, tmp_path, "raw_whole", timeout_s=120, saturate=False)
    core, confirmed = alg.shrink_core(pattern, tmp_path, timeout_s=120, raw=True)
    assert not confirmed
    assert core == pattern
