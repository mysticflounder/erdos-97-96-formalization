"""Exact-17 FreshThird five-survivor named-metric v4 discovery wave.

This scratch runner strengthens the corrected v2 finite ingress by the public
first-cap endpoint facts for C3/C4.  It enumerates one structural survivor for
each of the eight tags and tests only source-mapped named metric stages.  It is
not a coverage proof, a counterexample search for P97, or a Lean closure.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import shutil
import subprocess
import sys
from dataclasses import asdict
from fractions import Fraction
from pathlib import Path
from typing import Any

import z3

ROOT = Path(__file__).resolve().parent
REPO = ROOT.parents[2]
V2_PATH = REPO / "scratch/p97-consumer-first/freshthird_five_survivor_alias_aware_v2/run_query.py"
V3_PATH = REPO / "scratch/p97-consumer-first/freshthird_five_survivor_named_metric_v3/run_named_metric.py"
ARTIFACTS = ROOT / "artifacts"
N = 17
POINTS = tuple(range(N))


def load_module(name: str, path: Path) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


V2 = load_module("five_survivor_v2_for_v4", V2_PATH)
V3 = load_module("five_survivor_v3_for_v4", V3_PATH)

STRUCTURAL_CUTS = [
    V2.at("Cap", "C3"),
    V2.at("Cap", "C4"),
    "(not (= C3 Q0))",
    "(not (= C3 Q1))",
    "(not (= C4 Q0))",
    "(not (= C4 Q1))",
]

BASELINE_GROUPS = [
    "gauge",
    "carrier_distinct",
    "convex_independent",
    "mec_boundary",
    "triangle_nonobtuse",
    "first_cap_on_arc_opposite",
]

NAMED_ROW_GROUPS = [
    "row_PRow",
    "row_PRhoRow",
    "row_S0Row",
    "row_S1Row",
    "row_R",
    "row_Rh",
    "row_B3",
    "row_B4",
    "row_DBRow",
    "retained_radii_distinct",
]

STAGE_TIMEOUTS = {"baseline": 8, "named_rows": 12, "exact_offsupport": 20}


def sha256_text(text: str) -> str:
    return hashlib.sha256(text.encode()).hexdigest()


def json_write(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")


def structural_assertions(tag: Any, malformed: str | None = None) -> list[str]:
    assertions = list(V2.base_assertions(tag))
    assertions.extend(V3.row_center_omissions())
    assertions.extend(V3.exact_blocker_alias_constraints())
    assertions.extend(STRUCTURAL_CUTS)
    if malformed == "cap_alias":
        assertions.append("(= C3 Q0)")
    elif malformed == "row_center":
        assertions.append(V2.at("B3", "C3"))
    elif malformed is not None:
        raise ValueError(malformed)
    return assertions


def emit_structural(tag: Any, malformed: str | None = None) -> tuple[str, list[str]]:
    assertions = structural_assertions(tag, malformed)
    lines = ["(set-logic QF_LIA)", "(set-option :produce-models true)"]
    lines.extend(f"(declare-fun {role} () Int)" for role in V2.ROLES)
    for row in V2.ROWS:
        lines.extend(f"(declare-fun {V2.sym(row, i)} () Bool)" for i in POINTS)
    lines.extend(f"(assert {formula})" for formula in assertions)
    lines.append("(check-sat)")
    values = list(V2.ROLES) + [V2.sym(row, i) for row in V2.ROWS for i in POINTS]
    lines.append(f"(get-value ({' '.join(values)}))")
    return "\n".join(lines) + "\n", assertions


def row_slots(model: dict[str, int | bool], row: str) -> set[int]:
    return {i for i in POINTS if model.get(V2.sym(row, i)) is True}


def validate_structural(tag: Any, model: dict[str, int | bool]) -> list[str]:
    failures = list(V2.validate_assignment(tag, "base", model))
    cap = row_slots(model, "Cap")
    for center in ("C3", "C4"):
        if int(model[center]) not in cap:
            failures.append(f"{center} absent from first closed cap")
    for q in ("Q0", "Q1"):
        if int(model[q]) in cap:
            failures.append(f"{q} present in first closed cap")
    for center in ("C3", "C4"):
        for q in ("Q0", "Q1"):
            if model[center] == model[q]:
                failures.append(f"forbidden endpoint/outside alias {center}={q}")
    for row, center in V2.selected_row_pairs():
        if int(model[center]) in row_slots(model, row):
            failures.append(f"{row} contains its center {center}")
    exact = (("PRow", "CP"), ("PRhoRow", "C1"), ("S0Row", "CS0"),
             ("S1Row", "CS1"), ("DBRow", "DB"))
    for i, (left_row, left_center) in enumerate(exact):
        for right_row, right_center in exact[i + 1:]:
            if model[left_center] == model[right_center] and row_slots(model, left_row) != row_slots(model, right_row):
                failures.append(f"aliased exact centers have unequal supports: {left_row}/{right_row}")
    return failures


def solver_status(output: str) -> str:
    return next(
        (line.strip() for line in output.splitlines() if line.strip() in {"sat", "unsat", "unknown"}),
        "timeout" if "timeout" in output.lower() else "error",
    )


def run_binary(binary: str, smt: str, timeout_s: int, nonlinear: bool) -> tuple[str, str, float]:
    return V3.run_binary(binary, smt, timeout_s, nonlinear)


def run_structural_solver(binary: str, smt: str, timeout_s: int) -> tuple[str, str, float, dict[str, int | bool]]:
    status, output, elapsed = run_binary(binary, smt, timeout_s, nonlinear=False)
    model = V2.parse_assignment(output) if status == "sat" else {}
    return status, output, elapsed, model


def active_stages(groups: dict[str, list[str]]) -> dict[str, list[str]]:
    exact = [name for name in groups if name.startswith("exact_offsupport_")]
    return {
        "baseline": list(BASELINE_GROUPS),
        "named_rows": list(BASELINE_GROUPS + NAMED_ROW_GROUPS),
        "exact_offsupport": list(BASELINE_GROUPS + NAMED_ROW_GROUPS + exact),
    }


def validate_metric_stage(
    values: dict[str, Fraction], metadata: dict[str, Any], active: list[str]
) -> list[str]:
    """Independent exact-Fraction replay of precisely the active stage."""
    failures: list[str] = []
    enabled = set(active)
    role = metadata["roles"]
    rows = {name: set(indices) for name, indices in metadata["rows"].items()}

    def x(i: int) -> Fraction:
        return values[f"x{i}"]

    def y(i: int) -> Fraction:
        return values[f"y{i}"]

    def dist2(i: int, j: int) -> Fraction:
        return (x(i) - x(j)) ** 2 + (y(i) - y(j)) ** 2

    def signed(i: int, j: int, k: int) -> Fraction:
        return (x(j) - x(i)) * (y(k) - y(i)) - (x(k) - x(i)) * (y(j) - y(i))

    def need(condition: bool, message: str) -> None:
        if not condition:
            failures.append(message)

    if "gauge" in enabled:
        need(x(0) == 0 and y(0) == 0 and y(1) == 0 and x(1) > 0, "gauge")
    if "carrier_distinct" in enabled:
        for i in POINTS:
            for j in range(i + 1, N):
                need((x(i), y(i)) != (x(j), y(j)), f"duplicate carrier points {i},{j}")
    if "convex_independent" in enabled:
        for i in POINTS:
            a, b, c = values[f"sep_a{i}"], values[f"sep_b{i}"], values[f"sep_c{i}"]
            need(a * x(i) + b * y(i) > c, f"separator misses point {i}")
            for j in POINTS:
                if i != j:
                    need(a * x(j) + b * y(j) <= c, f"separator {i} fails at {j}")
    c2, c3, c4 = role["C2"], role["C3"], role["C4"]
    if "mec_boundary" in enabled:
        mx, my, mr = values["mec_x"], values["mec_y"], values["mec_r2"]
        need(mr > 0, "nonpositive MEC radius squared")
        center_d2 = lambda i: (x(i) - mx) ** 2 + (y(i) - my) ** 2
        for i in POINTS:
            need(center_d2(i) <= mr, f"point {i} outside MEC")
        for i in (c2, c3, c4):
            need(center_d2(i) == mr, f"apex {i} off MEC boundary")
    if "triangle_nonobtuse" in enabled:
        dot = lambda a, b, c: (x(b) - x(a)) * (x(c) - x(a)) + (y(b) - y(a)) * (y(c) - y(a))
        need(dot(c2, c3, c4) >= 0, "obtuse at C2")
        need(dot(c3, c4, c2) >= 0, "obtuse at C3")
        need(dot(c4, c2, c3) >= 0, "obtuse at C4")
    if "first_cap_on_arc_opposite" in enabled:
        apex_area = signed(c2, c3, c4)
        for i in POINTS:
            on_opposite = signed(i, c3, c4) * apex_area <= 0
            need(on_opposite == (i in rows["Cap"]), f"cap mismatch at {i}")

    selected = (
        ("PRow", "CP"), ("PRhoRow", "C1"), ("S0Row", "CS0"),
        ("S1Row", "CS1"), ("R", "C2"), ("Rh", "C2"),
        ("B3", "C3"), ("B4", "C4"), ("DBRow", "DB"),
    )
    for row, center_name in selected:
        if f"row_{row}" not in enabled:
            continue
        radius = values[f"rad_{row}"]
        need(radius > 0, f"nonpositive radius {row}")
        for i in rows[row]:
            need(dist2(role[center_name], i) == radius, f"row equation {row}/{i}")
    if "retained_radii_distinct" in enabled:
        need(values["rad_R"] != values["rad_Rh"], "retained radii equal")
    center_by_row = dict(selected)
    for group in enabled:
        prefix = "exact_offsupport_"
        if not group.startswith(prefix):
            continue
        row = group[len(prefix):]
        for i in POINTS:
            if i not in rows[row]:
                need(dist2(role[center_by_row[row]], i) != values[f"rad_{row}"], f"off-support {row}/{i}")
    return failures


def write_model(path: Path, model: dict[str, int | bool]) -> None:
    json_write(path, model)


def structural_controls(z3_bin: str, cvc5_bin: str) -> dict[str, Any]:
    tag = V2.TAGS[0]
    controls: dict[str, Any] = {}
    for case, malformed, expected in (
        ("structural_known_sat", None, "sat"),
        ("structural_endpoint_outside_alias_unsat", "cap_alias", "unsat"),
        ("structural_row_contains_center_unsat", "row_center", "unsat"),
    ):
        smt, _ = emit_structural(tag, malformed)
        path = ARTIFACTS / "controls" / f"{case}.smt2"
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(smt)
        controls[case] = {}
        for binary in (z3_bin, cvc5_bin):
            name = Path(binary).name
            status, output, elapsed, model = run_structural_solver(binary, smt, 30)
            (ARTIFACTS / "controls" / f"{case}.{name}.log").write_text(output)
            failures = validate_structural(tag, model) if status == "sat" else []
            controls[case][name] = {
                "status": status,
                "expected": expected,
                "elapsed_s": round(elapsed, 3),
                "validator": "pass" if status == "sat" and not failures else "not_applicable",
                "validator_failures": failures,
            }
            if status != expected or failures:
                raise RuntimeError(f"failed structural control {case}/{name}: {status}, {failures}")

    known = """(set-logic QF_NRA)
(declare-fun x0 () Real)
(declare-fun y0 () Real)
(declare-fun x1 () Real)
(declare-fun y1 () Real)
(assert (= x0 0))
(assert (= y0 0))
(assert (= x1 1))
(assert (= y1 0))
(assert (= (+ (* (- x1 x0) (- x1 x0)) (* (- y1 y0) (- y1 y0))) 1))
(check-sat)
"""
    malformed = known.replace("(check-sat)", "(assert (= x1 x0))\n(check-sat)")
    for case, smt, expected in (("metric_known_sat", known, "sat"), ("metric_duplicate_unsat", malformed, "unsat")):
        (ARTIFACTS / "controls" / f"{case}.smt2").write_text(smt)
        controls[case] = {}
        for binary in (z3_bin, cvc5_bin):
            name = Path(binary).name
            status, output, elapsed = run_binary(binary, smt, 30, nonlinear=True)
            (ARTIFACTS / "controls" / f"{case}.{name}.log").write_text(output)
            controls[case][name] = {"status": status, "expected": expected, "elapsed_s": round(elapsed, 3)}
            if status != expected:
                raise RuntimeError(f"failed metric control {case}/{name}: {status}")
    return controls


def enumerate_survivor(tag: Any, z3_bin: str, cvc5_bin: str) -> tuple[dict[str, Any], dict[str, int | bool]]:
    tag_dir = ARTIFACTS / tag.name
    tag_dir.mkdir(parents=True, exist_ok=True)
    smt, assertions = emit_structural(tag)
    (tag_dir / "structural.smt2").write_text(smt)
    record: dict[str, Any] = {
        "assertion_count": len(assertions),
        "sha256": sha256_text(smt),
        "solvers": {},
    }
    z3_model: dict[str, int | bool] | None = None
    for binary in (z3_bin, cvc5_bin):
        name = Path(binary).name
        status, output, elapsed, model = run_structural_solver(binary, smt, 45)
        (tag_dir / f"structural.{name}.log").write_text(output)
        failures = validate_structural(tag, model) if status == "sat" else []
        record["solvers"][name] = {
            "status": status,
            "elapsed_s": round(elapsed, 3),
            "validator": "pass" if status == "sat" and not failures else "fail" if status == "sat" else "not_applicable",
            "validator_failures": failures,
        }
        if status == "sat":
            write_model(tag_dir / f"structural.{name}.model.json", model)
        if name == "z3" and status == "sat" and not failures:
            z3_model = model
    if any(record["solvers"].get(name, {}).get("status") != "sat" for name in ("z3", "cvc5")):
        raise RuntimeError(f"tag {tag.name} lacks dual structural SAT: {record['solvers']}")
    if any(record["solvers"][name]["validator"] != "pass" for name in ("z3", "cvc5")):
        raise RuntimeError(f"tag {tag.name} structural validator failed")
    assert z3_model is not None
    return record, z3_model


def source_labels_for(groups: list[str]) -> dict[str, str]:
    out: dict[str, str] = {}
    for group in groups:
        if group in {"gauge", "carrier_distinct", "convex_independent"}:
            out[group] = "Euclidean carrier normalization / strict convex position"
        elif group in {"mec_boundary", "triangle_nonobtuse"}:
            out[group] = "SurplusCapPacket three boundary apices of the minimum enclosing circle"
        elif group == "first_cap_on_arc_opposite":
            out[group] = "first closed cap is the arc opposite oppApex1; v4 endpoint/outside cut already validated"
        elif group.startswith("row_"):
            out[group] = "named boundary row support has one exact squared distance from its source-mapped center"
        elif group == "retained_radii_distinct":
            out[group] = "the retained R/Rrho first-apex rows use distinct radii"
        elif group.startswith("exact_offsupport_"):
            out[group] = "exact support exclusion only for a canonical selected shell or actual blocker-image row"
        else:
            out[group] = "UNMAPPED"
    return out


def run_metric_stage(
    tag: Any,
    model: dict[str, int | bool],
    stage: str,
    groups: dict[str, list[str]],
    real_vars: list[str],
    metadata: dict[str, Any],
    active: list[str],
    z3_bin: str,
    cvc5_bin: str,
) -> dict[str, Any]:
    del z3_bin  # Python Z3 is used for exact rational extraction and cores.
    stage_dir = ARTIFACTS / tag.name / stage
    stage_dir.mkdir(parents=True, exist_ok=True)
    smt = V3.emit_metric(groups, real_vars, active)
    (stage_dir / "query.smt2").write_text(smt)
    timeout_s = STAGE_TIMEOUTS[stage]
    z3_status, exact_values, z3_core, z3_elapsed = V3.z3_solve_exact(smt, real_vars, timeout_s)
    validator_failures: list[str] = []
    if z3_status == "sat":
        validator_failures = validate_metric_stage(exact_values, metadata, active)
        json_write(stage_dir / "z3.exact-model.json", {key: str(value) for key, value in exact_values.items()})
    json_write(stage_dir / "z3.result.json", {
        "status": z3_status,
        "elapsed_s": round(z3_elapsed, 3),
        "unsat_core": z3_core,
        "exact_fraction_validator": "pass" if z3_status == "sat" and not validator_failures else "fail" if z3_status == "sat" else "not_applicable",
        "validator_failures": validator_failures,
    })
    cvc5_status, cvc5_output, cvc5_elapsed = run_binary(cvc5_bin, smt, timeout_s, nonlinear=True)
    (stage_dir / "cvc5.log").write_text(cvc5_output)

    minimized: dict[str, Any] | None = None
    if z3_status == "unsat":
        minimized_groups = V3.minimize_groups(groups, real_vars, z3_core or active)
        atom_groups, minimized_atoms = V3.minimize_atoms(groups, real_vars, minimized_groups)
        minimized_smt = V3.emit_metric(atom_groups, real_vars, minimized_atoms)
        (stage_dir / "minimized.smt2").write_text(minimized_smt)
        replay_status, replay_output, replay_elapsed = run_binary(cvc5_bin, minimized_smt, timeout_s, nonlinear=True)
        (stage_dir / "minimized.cvc5.log").write_text(replay_output)
        minimized = {
            "groups": minimized_groups,
            "atoms": minimized_atoms,
            "atom_assertions": {label: atom_groups[label][0] for label in minimized_atoms},
            "cvc5_replay_status": replay_status,
            "cvc5_replay_elapsed_s": round(replay_elapsed, 3),
            "source_origins": source_labels_for(minimized_groups),
        }

    if z3_status == "sat" and not validator_failures and cvc5_status == "sat":
        classification = "DUAL_SAT_EXACT_Z3_WITNESS"
    elif z3_status == "unsat" and cvc5_status == "unsat":
        classification = "DUAL_UNSAT_FROZEN_MOTIF_STAGE"
    else:
        classification = "INCONCLUSIVE"
    return {
        "classification": classification,
        "active_groups": active,
        "assertion_count": sum(len(groups[name]) for name in active),
        "real_variable_count": len(real_vars),
        "sha256": sha256_text(smt),
        "z3": {
            "status": z3_status,
            "elapsed_s": round(z3_elapsed, 3),
            "core": z3_core,
            "exact_fraction_validator": "pass" if z3_status == "sat" and not validator_failures else "fail" if z3_status == "sat" else "not_applicable",
            "validator_failures": validator_failures,
        },
        "cvc5": {"status": cvc5_status, "elapsed_s": round(cvc5_elapsed, 3)},
        "minimized": minimized,
    }


def write_checksums() -> None:
    entries: list[str] = []
    for path in sorted(ROOT.rglob("*")):
        if not path.is_file() or path.name == "SHA256SUMS":
            continue
        digest = hashlib.sha256(path.read_bytes()).hexdigest()
        entries.append(f"{digest}  {path.relative_to(ROOT)}")
    (ROOT / "SHA256SUMS").write_text("\n".join(entries) + "\n")


def prepare_manifest(z3_bin: str, cvc5_bin: str) -> dict[str, Any]:
    manifest = {
        "scope": "finite exact-17 producer discovery only",
        "runner": str(Path(__file__).relative_to(REPO)),
        "v2_ingress": str(V2_PATH.relative_to(REPO)),
        "v3_metric_machinery": str(V3_PATH.relative_to(REPO)),
        "tags": [asdict(tag) for tag in V2.TAGS],
        "tag_count": len(V2.TAGS),
        "structural_cuts": STRUCTURAL_CUTS,
        "stages": {
            "baseline": BASELINE_GROUPS,
            "named_rows": BASELINE_GROUPS + NAMED_ROW_GROUPS,
            "exact_offsupport": "named_rows plus all exact_offsupport groups",
        },
        "timeouts_s": STAGE_TIMEOUTS,
        "concurrency": {"solver_processes": 1, "maximum_allowed": 8, "cores_total": "serial; below 12"},
        "solvers": {
            "z3_python": z3.get_version_string(),
            "z3_binary": subprocess.run(
                [z3_bin, "--version"], capture_output=True, text=True, check=False
            ).stdout.strip(),
            "cvc5": subprocess.run(
                [cvc5_bin, "--version"], capture_output=True, text=True, check=False
            ).stdout.splitlines()[0],
        },
        "hard_gate": "FiveRowCircleIntersectionOrderCore absent and never encoded",
        "commands": [
            f"uv run python {Path(__file__).relative_to(REPO)}",
            f"uv run python -m unittest discover -s {ROOT.relative_to(REPO)} -p 'test_*.py'",
            f"uvx ruff check {Path(__file__).relative_to(REPO)} "
            + str((ROOT / "audit_cvc5_unsat.py").relative_to(REPO))
            + " "
            + str((ROOT / "test_wave.py").relative_to(REPO)),
        ],
    }
    json_write(ROOT / "manifest.json", manifest)
    return manifest


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--smoke-only", action="store_true")
    args = parser.parse_args()
    ARTIFACTS.mkdir(parents=True, exist_ok=True)
    z3_bin = shutil.which("z3")
    cvc5_bin = shutil.which("cvc5")
    if not z3_bin or not cvc5_bin:
        raise RuntimeError("z3 and cvc5 binaries are required")
    manifest = prepare_manifest(z3_bin, cvc5_bin)
    controls = structural_controls(z3_bin, cvc5_bin)
    if args.smoke_only:
        json_write(ROOT / "smoke-results.json", controls)
        write_checksums()
        print(json.dumps({"controls": "pass", "path": str(ROOT.relative_to(REPO))}, sort_keys=True))
        return 0

    results: dict[str, Any] = {
        "scope": "finite exact-17 producer discovery only; no CE, universal, or Lean closure claim",
        "controls": controls,
        "hard_gate": manifest["hard_gate"],
        "tags": {},
        "omissions": [
            "FiveRowCircleIntersectionOrderCore and all absent EdgeClosure/orientation premises",
            "crossed-three-row constructors",
            "anonymous carrier-wide K4 rows",
            "coverage of all structural survivors within any tag",
            "general-cardinality ingress and lift",
        ],
    }
    for tag in V2.TAGS:
        structural, model = enumerate_survivor(tag, z3_bin, cvc5_bin)
        groups, real_vars, metadata = V3.metric_groups(model)
        stages = active_stages(groups)
        tag_result: dict[str, Any] = {
            "tag": asdict(tag),
            "structural": structural,
            "metric_stages": {},
            "source_labels": source_labels_for(list(groups)),
        }
        for stage, active in stages.items():
            tag_result["metric_stages"][stage] = run_metric_stage(
                tag, model, stage, groups, real_vars, metadata, active, z3_bin, cvc5_bin
            )
        results["tags"][tag.name] = tag_result
        json_write(ROOT / "results.partial.json", results)
    json_write(ROOT / "results.json", results)

    classifications: dict[str, int] = {}
    for tag_result in results["tags"].values():
        for stage_result in tag_result["metric_stages"].values():
            key = stage_result["classification"]
            classifications[key] = classifications.get(key, 0) + 1
    results_md = [
        "# Results",
        "",
        "This v4 wave validated one source-faithful structural survivor in each of the eight exact-17 tags.",
        "",
        f"Metric stage classifications: `{json.dumps(classifications, sort_keys=True)}`.",
        "",
        "The complete per-tag solver statuses, exact witness validation, hashes, and any minimized cores are in `results.json`.",
        "",
        "`FiveRowCircleIntersectionOrderCore` was not emitted: no complete source-entitled map supplies its ten EdgeClosure and orientation premises.",
        "",
        "This is finite exact-17 producer discovery over one frozen survivor per tag. It is not exhaustive tag coverage, a P97 counterexample, a universal contradiction, or Lean closure.",
        "",
    ]
    (ROOT / "RESULTS.md").write_text("\n".join(results_md))
    write_checksums()
    print(json.dumps({"classifications": classifications, "results": str((ROOT / 'results.json').relative_to(REPO))}, sort_keys=True))
    return 0 if "INCONCLUSIVE" not in classifications else 2


if __name__ == "__main__":
    raise SystemExit(main())
