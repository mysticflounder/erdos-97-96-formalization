#!/usr/bin/env python3
"""One bounded, source-gated seven-row-cut CEGAR wave."""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import sys
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[2]
PREV = HERE.parent / "freshthird_firstnonhit_global_blocker_quotient_v1"
CASES = ("retained", "common", "common_sameblocker")
QROWS = ("q0", "q1", "q2", "q3")
BASE_ROWS = QROWS + ("first", "second")
ACTIVE = {
    "retained": BASE_ROWS + ("retz", "retw"),
    "common": BASE_ROWS,
    "common_sameblocker": BASE_ROWS + ("w0", "w1", "w2", "w3"),
}
BLOCKER = {
    "q0": "b0", "q1": "b1", "q2": "b2", "q3": "b3",
    "first": "blk_first", "second": "blk_second",
    "retz": "blk_retz", "retw": "blk_retw",
    "w0": "blk_w0", "w1": "blk_w1", "w2": "blk_w2", "w3": "blk_w3",
}
SOURCE = {row: f"v_{row}" for row in BLOCKER}
NOFIX = {
    "q0": "nofix_q0", "q1": "nofix_q1", "q2": "nofix_q2", "q3": "nofix_q3",
    "first": "nofix_first", "second": "nofix_second",
    "retz": "nofix_retz", "retw": "nofix_retw",
    "w0": "nofix_w0", "w1": "nofix_w1", "w2": "nofix_w2", "w3": "nofix_w3",
}
MOTIF_CENTERS = ("p1", "p2", "p3", "p4", "p5", "p8", "p9")
MOTIF_ROLES = MOTIF_CENTERS + ("p6", "p11")
MOTIF_EDGES = (
    ("p1", "p3"), ("p1", "p6"), ("p1", "p9"),
    ("p2", "p3"), ("p2", "p8"), ("p2", "p11"),
    ("p3", "p1"), ("p3", "p5"), ("p3", "p6"), ("p3", "p9"),
    ("p4", "p2"), ("p4", "p6"), ("p4", "p8"), ("p4", "p11"),
    ("p5", "p3"), ("p5", "p9"), ("p5", "p11"),
    ("p8", "p1"), ("p8", "p3"),
    ("p9", "p2"), ("p9", "p3"), ("p9", "p8"),
)
OUT_DEGREE = {role: sum(a == role for a, _ in MOTIF_EDGES) for role in MOTIF_CENTERS}
SEARCH_ORDER = ("p3", "p4", "p1", "p2", "p5", "p9", "p8", "p6", "p11")
TIMEOUT_MS = 30_000
MAX_CORES = 12


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write_json(path: Path, value: object) -> None:
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")


def source_gate() -> dict:
    u1 = REPO / "lean/Erdos9796Proof/P97/U1CarrierInjection.lean"
    surv = REPO / "lean/Erdos9796Proof/P97/ATail/SurvivalCover.lean"
    core = REPO / "lean/scratch/firstnonhit-sevenrow-lean/SevenRowObstruction.lean"
    required = {
        u1: (
            "structure CriticalShellSystem", "def selectedAt", "abbrev CarrierVertex",
            "def blockerVertex", "theorem blockerVertex_ne",
        ),
        surv: ("theorem selectedSupports_eq_of_actualBlockers_eq",),
        core: (
            "theorem normalized_k4_membership_impossible",
            "noncomputable def sevenRowPattern",
        ),
    }
    failures = []
    pins = {}
    for path, needles in required.items():
        if not path.is_file():
            failures.append(f"missing:{path}")
            continue
        text = path.read_text()
        pins[str(path.relative_to(REPO))] = sha256(path)
        failures.extend(f"missing-token:{path.name}:{needle}" for needle in needles if needle not in text)
    for case in CASES:
        path = PREV / f"case_{case}.smt2"
        if not path.is_file():
            failures.append(f"missing:{path}")
        else:
            pins[str(path.relative_to(REPO))] = sha256(path)
            text = path.read_text()
            if "(set-logic QF_LIA)" not in text or "(check-sat)" not in text:
                failures.append(f"bad-predecessor:{path.name}")
    pins[str((PREV / "SOURCE-MAP.md").relative_to(REPO))] = sha256(PREV / "SOURCE-MAP.md")
    result = {
        "status": "PASS" if not failures else "SOURCE_GATE_NO_RUN",
        "mapping": "mem(blocker(source), point) is selectedAt(source).toCriticalFourShell.support membership",
        "ambient_cardinality_bound": None,
        "active_rows_are_named_carrier_sources": True,
        "point_terms_are_named_sources_or_actual_blocker_vertices": True,
        "pins": pins,
        "failures": failures,
    }
    write_json(HERE / "SOURCE-GATE.json", result)
    return result


def prepare() -> int:
    gate = source_gate()
    launch = {
        "wave": "freshthird_firstnonhit_sevenrow_cut_v1",
        "compatibility_class": "C",
        "state": "RUNNING" if gate["status"] == "PASS" else "TERMINAL",
        "source_gate": gate["status"],
        "cases": list(CASES),
        "case_matrix_covered": list(CASES),
        "logic": "QF_UFLIA",
        "ambient_cardinality_bound": None,
        "core_lease": {"global_max_authenticated_nogoods": MAX_CORES, "workers": 1},
        "timeout_ms_per_solver_call": TIMEOUT_MS,
        "timeout_escalation": False,
        "commands": [
            "uv run python wave.py --prepare",
            "uv run python wave.py --run",
            "bash run.sh",
        ],
        "cut_status": "relaxation; independently audited geometry, normalized Lean core, full adapter pending",
    }
    write_json(HERE / "LAUNCH-MANIFEST.json", launch)
    (HERE / "control_unsat.smt2").write_text("(set-logic QF_UFLIA)\n(assert false)\n(check-sat)\n")
    (HERE / "control_malformed.smt2").write_text("(set-logic QF_UFLIA)\n(assert (and true)\n(check-sat)\n")
    print(gate["status"])
    return 0 if gate["status"] == "PASS" else 3


def point_specs(case: str) -> list[tuple[str, str]]:
    rows = ACTIVE[case]
    return ([(f"S_{row}", SOURCE[row]) for row in rows] +
            [(f"B_{row}", BLOCKER[row]) for row in rows])


def mname(row: str, point_label: str) -> str:
    return f"M_{row}__{point_label}"


def bool_sum(names: list[str]) -> str:
    return "(+ " + " ".join(f"(ite {name} 1 0)" for name in names) + ")"


def predecessor_body(case: str) -> str:
    text = (PREV / f"case_{case}.smt2").read_text()
    text = text.split("(check-sat)", 1)[0]
    return text.replace("(set-logic QF_LIA)", "(set-logic QF_UFLIA)", 1).rstrip() + "\n"


def augmented_base(case: str) -> str:
    rows = ACTIVE[case]
    points = point_specs(case)
    lines = [predecessor_body(case), "(declare-fun mem (Int Int) Bool)"]
    for row in rows:
        lines.append(f"(declare-const {SOURCE[row]} Int)")
        if not row.startswith("q"):
            lines.append(f"(declare-const {BLOCKER[row]} Int)")
    for row in rows:
        for label, term in points:
            atom = mname(row, label)
            lines.append(f"(declare-const {atom} Bool)")
            lines.append(f"(assert (= {atom} (mem {BLOCKER[row]} {term})))")

    # Four Q-support roles are exact distinct carrier points.  Existing m_ij
    # becomes a readback of the actual selectedAt row membership.
    lines.append("(assert (distinct v_q0 v_q1 v_q2 v_q3))")
    for i in range(4):
        for j in range(4):
            lines.append(f"(assert (= m{i}{j} {mname(f'q{i}', f'S_q{j}')}))")

    # Every active row really is the critical shell emitted for its source.
    for row in rows:
        lines.append(f"(assert {mname(row, f'S_{row}')})")
        lines.append(f"(assert (not {mname(row, f'B_{row}')}))")
        lines.append(f"(assert (= {NOFIX[row]} (not (= {BLOCKER[row]} {SOURCE[row]}))))")

    for row, prefix in (("first", "first"), ("second", "second")):
        qmem = [mname(row, f"S_q{j}") for j in range(4)]
        lines.append(f"(assert (= {prefix}_ov {bool_sum(qmem)}))")
        lines.append(f"(assert (= (= {prefix}_tag 0) (= {BLOCKER[row]} 0)))")
        lines.append(
            f"(assert (= {prefix}_contains_deleted "
            f"(ite (= {prefix}_deleted_q 0) {qmem[0]} {qmem[1]})))"
        )

    if case == "retained":
        lines.append("(assert (distinct v_retz v_retw))")
        for row, side in (("retz", "z"), ("retw", "w")):
            qmem = [mname(row, f"S_q{j}") for j in range(4)]
            lines.append(f"(assert (= ret_{side}_ov {bool_sum(qmem)}))")
            lines.append(f"(assert (= ret_{side}_eq_q (= {BLOCKER[row]} 0)))")
        lines.append(f"(assert (= ret_z_contains_w {mname('retz', 'S_retw')}))")
        lines.append(f"(assert (= ret_w_contains_z {mname('retw', 'S_retz')}))")

    if case == "common_sameblocker":
        lines.append("(assert (= common_witnesses_distinct (distinct v_w0 v_w1 v_w2 v_w3)))")
        for i in range(4):
            row = f"w{i}"
            qmem = [mname(row, f"S_q{j}") for j in range(4)]
            lines.append(f"(assert (= common_w{i}_ov {bool_sum(qmem)}))")
            lines.append(f"(assert (= common_w{i}_off_q (not {mname('q0', f'S_w{i}')})))")
            lines.append(f"(assert (= common_w{i}_blocker_ne_q (not (= {BLOCKER[row]} 0))))")

    return "\n".join(lines) + "\n"


DECL_RE = re.compile(r"\(declare-const\s+([^\s()]+)\s+(Int|Bool)\)")


def declarations(text: str) -> dict[str, str]:
    return dict(DECL_RE.findall(text))


def model_readback(model: z3.ModelRef, decls: dict[str, str]) -> dict[str, int | bool]:
    result: dict[str, int | bool] = {}
    for name, sort in decls.items():
        term = z3.Int(name) if sort == "Int" else z3.Bool(name)
        value = model.eval(term, model_completion=True)
        result[name] = value.as_long() if sort == "Int" else z3.is_true(value)
    return result


def canonical_value_maps(case: str, readback: dict[str, int | bool]):
    rows = ACTIVE[case]
    points = point_specs(case)
    point_rep: dict[int, tuple[str, str]] = {}
    for label, term in points:
        point_rep.setdefault(int(readback[term]), (label, term))
    center_rep: dict[int, str] = {}
    for row in rows:
        center_rep.setdefault(int(readback[BLOCKER[row]]), row)
    return point_rep, center_rep


def find_motif(case: str, readback: dict[str, int | bool]) -> dict | None:
    point_rep, center_rep = canonical_value_maps(case, readback)
    points = sorted(point_rep)
    centers = sorted(center_rep)

    def has(center_value: int, point_value: int) -> bool:
        row = center_rep[center_value]
        label, _ = point_rep[point_value]
        return bool(readback[mname(row, label)])

    outgoing = {c: {p for p in points if has(c, p)} for c in centers}
    candidates = {
        role: [c for c in centers if len(outgoing[c]) >= OUT_DEGREE[role]]
        for role in MOTIF_CENTERS
    }
    candidates["p6"] = points
    candidates["p11"] = points
    assignment: dict[str, int] = {}
    used: set[int] = set()

    def compatible() -> bool:
        return all(
            source not in assignment or target not in assignment or
            has(assignment[source], assignment[target])
            for source, target in MOTIF_EDGES
        )

    def dfs(depth: int) -> bool:
        if depth == len(SEARCH_ORDER):
            return True
        role = SEARCH_ORDER[depth]
        for value in candidates[role]:
            if value in used:
                continue
            assignment[role] = value
            used.add(value)
            if compatible() and dfs(depth + 1):
                return True
            used.remove(value)
            del assignment[role]
        return False

    if not dfs(0):
        return None
    centers_by_role = {role: center_rep[assignment[role]] for role in MOTIF_CENTERS}
    point_labels = {}
    point_terms = {}
    for role in MOTIF_ROLES:
        if role in MOTIF_CENTERS:
            row = centers_by_role[role]
            point_labels[role] = f"B_{row}"
            point_terms[role] = BLOCKER[row]
        else:
            label, term = point_rep[assignment[role]]
            point_labels[role] = label
            point_terms[role] = term
    edge_atoms = [mname(centers_by_role[source], point_labels[target]) for source, target in MOTIF_EDGES]
    assert len(set(assignment.values())) == 9
    assert all(readback[name] is True for name in edge_atoms)
    return {
        "values": {role: assignment[role] for role in MOTIF_ROLES},
        "center_rows": centers_by_role,
        "point_labels": point_labels,
        "point_terms": point_terms,
        "edge_atoms": edge_atoms,
    }


def no_good(embedding: dict) -> str:
    terms = [embedding["point_terms"][role] for role in MOTIF_ROLES]
    atoms = embedding["edge_atoms"]
    return "(assert (not (and (distinct " + " ".join(terms) + ") " + " ".join(atoms) + ")))"


def pin_formula(base: str, cuts: list[str], readback: dict[str, int | bool]) -> str:
    lines = [base, *cuts]
    for name in sorted(readback):
        value = readback[name]
        rendered = "true" if value is True else "false" if value is False else str(value)
        lines.append(f"(assert (= {name} {rendered}))")
    names = " ".join(sorted(readback))
    lines.extend(["(check-sat)", f"(get-value ({names}))"])
    return "\n".join(lines) + "\n"


def unpinned_formula(base: str, cuts: list[str]) -> str:
    return "\n".join([base, *cuts, "(check-sat)"]) + "\n"


def run_wave() -> int:
    gate = source_gate()
    if gate["status"] != "PASS":
        print("SOURCE_GATE_NO_RUN")
        return 3
    (HERE / "iterations").mkdir(exist_ok=True)
    total_cores = 0
    case_results = []
    for case in CASES:
        base = augmented_base(case)
        (HERE / f"base_{case}.smt2").write_text(base)
        decls = declarations(base)
        cuts: list[str] = []
        cut_records = []
        iteration = 0
        while True:
            solver = z3.SolverFor("QF_UFLIA")
            solver.set(timeout=TIMEOUT_MS)
            solver.add(z3.parse_smt2_string(base + "\n".join(cuts)))
            result = solver.check()
            if result == z3.unknown:
                case_result = {
                    "case": case, "status": "UNKNOWN", "oracle_verdict": "UNKNOWN",
                    "reason": solver.reason_unknown(), "iterations": iteration + 1,
                    "authenticated_nogoods": len(cuts),
                }
                (HERE / f"terminal_{case}.smt2").write_text(unpinned_formula(base, cuts))
                break
            if result == z3.unsat:
                case_result = {
                    "case": case, "status": "UNSAT", "oracle_verdict": "relaxation-UNSAT",
                    "iterations": iteration + 1, "authenticated_nogoods": len(cuts),
                }
                (HERE / f"terminal_{case}.smt2").write_text(unpinned_formula(base, cuts))
                break
            readback = model_readback(solver.model(), decls)
            embedding = find_motif(case, readback)
            record = {
                "case": case, "iteration": iteration, "solver": "z3",
                "status": "sat", "readback": readback,
                "motif_embedding": embedding,
            }
            iter_path = HERE / "iterations" / f"{case}-{iteration:02d}.json"
            write_json(iter_path, record)
            if embedding is None:
                terminal = pin_formula(base, cuts, readback)
                (HERE / f"terminal_{case}.smt2").write_text(terminal)
                case_result = {
                    "case": case, "status": "SAT", "oracle_verdict": "SAT-abstraction",
                    "terminal": "motif-free survivor", "iterations": iteration + 1,
                    "authenticated_nogoods": len(cuts), "readback": str(iter_path.relative_to(HERE)),
                }
                break
            if total_cores >= MAX_CORES:
                terminal = pin_formula(base, cuts, readback)
                (HERE / f"terminal_{case}.smt2").write_text(terminal)
                case_result = {
                    "case": case, "status": "BUDGET", "oracle_verdict": "UNKNOWN",
                    "terminal": "motif-bearing readback retained", "iterations": iteration + 1,
                    "authenticated_nogoods": len(cuts), "readback": str(iter_path.relative_to(HERE)),
                }
                break
            clause = no_good(embedding)
            clause_hash = hashlib.sha256((clause + "\n").encode()).hexdigest()
            assert clause not in cuts
            cuts.append(clause)
            total_cores += 1
            cut_records.append({
                "case": case, "iteration": iteration, "clause": clause,
                "sha256": clause_hash, "embedding": embedding,
                "authentication": "exact readback; nine distinct values; all 22 membership atoms true",
            })
            iteration += 1
        write_json(HERE / f"cuts_{case}.json", cut_records)
        case_results.append(case_result)

    statuses = {r["status"] for r in case_results}
    if statuses == {"SAT"}:
        overall = "SAT_MOTIF_FREE_SURVIVOR"
        verdict = "SAT-abstraction"
    elif "UNKNOWN" in statuses or "BUDGET" in statuses:
        overall = "UNKNOWN"
        verdict = "UNKNOWN"
    elif statuses == {"UNSAT"}:
        overall = "ABSTRACTION_CLOSED_BY_RELAXATION_CUT"
        verdict = "relaxation-UNSAT"
    else:
        overall = "MIXED_CASE_MATRIX"
        verdict = "UNKNOWN"
    terminal = {
        "wave": "freshthird_firstnonhit_sevenrow_cut_v1",
        "status": overall,
        "four_valued_verdict": verdict,
        "total_authenticated_nogoods": total_cores,
        "max_authenticated_nogoods": MAX_CORES,
        "cases": case_results,
        "scope": "unbounded named-role quotient; no MAXN; no universal/Lean closure",
    }
    write_json(HERE / "TERMINAL.json", terminal)
    print(f"{overall} cores={total_cores}")
    return 0 if overall != "UNKNOWN" else 4


def main() -> int:
    parser = argparse.ArgumentParser()
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--prepare", action="store_true")
    mode.add_argument("--run", action="store_true")
    args = parser.parse_args()
    return prepare() if args.prepare else run_wave()


if __name__ == "__main__":
    raise SystemExit(main())
