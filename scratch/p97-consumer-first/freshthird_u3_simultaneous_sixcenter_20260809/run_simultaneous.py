#!/usr/bin/env python3
"""One bounded simultaneous-six-center SMT diagnostic for FreshThird U3.

This is deliberately a finite, source-audited diagnostic.  It does not encode
Euclidean coordinates and it cannot prove the live Lean boundary.  The exact
all-confined cases mirror the finite U5 audit label schema; the live
escape/shell case is explicitly a SAT abstraction.
"""

from __future__ import annotations

import hashlib
import itertools
import json
import re
import subprocess
import time
from collections import Counter
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable


ROOT = Path(__file__).resolve().parent
REPO = ROOT.parents[2]
MODELS = ROOT / "models"
LOGS = ROOT / "logs"
READBACK = ROOT / "readback"

TIMEOUT_SECONDS = 20
CONCURRENT_PROCESSES = 1
TOTAL_HOST_CORE_BUDGET = 1
LOGICAL_CASE_BUDGET = 12

P, Q, T1, T2, T3, U, A0, A1 = range(8)
LABELS = ("p", "q", "t1", "t2", "t3", "u", "a0", "a1")
TRIPLE = (T1, T2, T3)
NONTRIPLE = (U, A0, A1)
CENTERS = (T1, T2, T3, U, A0, A1)
CENTER_NAMES = tuple(LABELS[c] for c in CENTERS)
P_CIRCLE_MASK = (1 << Q) | (1 << T1) | (1 << T2) | (1 << T3)

# Exact lists from Problem97.U5AuditLabel.choices.
CHOICES = {
    T1: (57, 89, 153, 105, 169, 201, 113, 177, 209, 225, 120, 184, 216, 232, 240),
    T2: (53, 85, 149, 101, 165, 197, 113, 177, 209, 225, 116, 180, 212, 228, 240),
    T3: (45, 77, 141, 101, 165, 197, 105, 169, 201, 225, 108, 172, 204, 228, 232),
    U: (29, 77, 141, 85, 149, 197, 89, 153, 201, 209, 92, 156, 204, 212, 216),
    A0: (29, 45, 141, 53, 149, 165, 57, 153, 169, 177, 60, 156, 172, 180, 184),
    A1: (29, 45, 77, 53, 85, 101, 57, 89, 105, 113, 60, 92, 108, 116, 120),
}

REASONS = (
    "unitTriangleOnPCircle",
    "nontripleEquilateralOnPCircle",
    "equilateralOppositePoint",
    "equilateralBisector",
    "commonBisectorTriple",
    "equilateralCircumcenterOnPCircle",
    "equilateralOuterPoint",
)

SOURCE_FILES = (
    "lean/Erdos9796Proof/P97/U3ToU5Terminal.lean",
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceClosure.lean",
    "lean/Erdos9796Proof/P97/U5GlobalIncidenceBasic.lean",
    "lean/Erdos9796Proof/P97/U5GlobalIncidenceSupport.lean",
    "lean/Erdos9796Proof/P97/U5FiniteAudit.lean",
    "lean/Erdos9796Proof/P97/U5FiniteExtraction.lean",
    "lean/Erdos9796Proof/P97/U1CarrierInjection.lean",
    "lean/Erdos9796Proof/P97/ATail/SurvivalCover.lean",
)


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def canonical_hash(value: object) -> str:
    return sha256_bytes(json.dumps(value, sort_keys=True, separators=(",", ":")).encode())


def bit(mask: int, label: int) -> bool:
    return bool(mask & (1 << label))


def contains(mask: int, *labels: int) -> bool:
    return all(bit(mask, x) for x in labels)


def third_triple(a: int, b: int) -> int:
    return next(c for c in TRIPLE if c not in (a, b))


def unit_closure(rows: dict[int, int]) -> set[tuple[int, int]]:
    """Exact port of unitClosure: 8 outer iterations, ordered center fold."""
    edges = {(P, t) for t in TRIPLE} | {(t, P) for t in TRIPLE}
    for _ in range(8):
        for center in CENTERS:
            members = [x for x in range(8) if bit(rows[center], x)]
            if any((center, x) in edges for x in members):
                for x in members:
                    edges.add((center, x))
                    edges.add((x, center))
    return edges


def prefilter_reason(rows: dict[int, int]) -> str | None:
    """Exact priority port of Problem97.U5AuditLabel.prefilterReason."""
    edges = unit_closure(rows)
    if all((a, b) in edges for a, b in ((T1, T2), (T1, T3), (T2, T3))):
        return REASONS[0]
    if any(
        contains(rows[t], P, x) and contains(rows[x], P, t)
        for t in TRIPLE for x in NONTRIPLE
    ):
        return REASONS[1]
    if any(
        contains(rows[a], P, b, third_triple(a, b), x)
        and contains(rows[b], P, a, x)
        and contains(rows[x], P, third_triple(a, b))
        for a in TRIPLE for b in TRIPLE if a != b for x in NONTRIPLE
    ):
        return REASONS[2]
    if any(
        contains(rows[a], P, b, x)
        and contains(rows[b], P, a, x)
        and contains(rows[x], P, third_triple(a, b))
        and contains(rows[third_triple(a, b)], a, b)
        for a in TRIPLE for b in TRIPLE if a != b for x in NONTRIPLE
    ):
        return REASONS[3]
    if any(contains(rows[x], P, T1, T2, T3) for x in NONTRIPLE):
        return REASONS[4]

    e01 = contains(rows[T1], T2, T3)
    e02 = contains(rows[T2], T1, T3)
    e12 = contains(rows[T3], T1, T2)
    triple_pair_dots = (e01 and e02) or (e01 and e12) or (e02 and e12)
    if triple_pair_dots and any(
        bit(rows[x], P) and sum(bit(rows[x], t) for t in TRIPLE) >= 2
        for x in NONTRIPLE
    ):
        return REASONS[5]

    def has_triple_witness(center: int) -> bool:
        return any(t != center and bit(rows[center], t) for t in TRIPLE)

    if triple_pair_dots and any(
        bit(rows[left], x)
        and bit(rows[right], x)
        and has_triple_witness(left)
        and has_triple_witness(right)
        and contains(rows[x], P, third_triple(left, right))
        for x in NONTRIPLE
        for left in TRIPLE
        for right in TRIPLE
        if left != right
    ):
        return REASONS[6]
    return None


def structural_patterns() -> list[dict[str, object]]:
    """Enumerate the 468 source-compatible all-confined structural rows."""
    filtered = {
        c: tuple(m for m in CHOICES[c] if (m & P_CIRCLE_MASK).bit_count() <= 2)
        for c in CENTERS
    }
    out: list[dict[str, object]] = []
    for masks in itertools.product(*(filtered[c] for c in CENTERS)):
        if not all(
            (masks[i] & masks[j]).bit_count() <= 2
            for i in range(6) for j in range(i + 1, 6)
        ):
            continue
        rows = dict(zip(CENTERS, masks))
        reason = prefilter_reason(rows)
        if reason is None:
            raise RuntimeError(f"source-port mismatch: unclassified pattern {masks}")
        out.append({"masks": list(masks), "reason": reason})
    return out


def bvar(center_name: str, label_name: str) -> str:
    return f"m_{center_name}_{label_name}"


def smt_bool_sum(names: Iterable[str]) -> str:
    return "(+ " + " ".join(f"(ite {n} 1 0)" for n in names) + ")"


def confined_prelude() -> list[str]:
    lines = ["(set-logic QF_LIA)", "(set-option :produce-models true)"]
    for c in CENTER_NAMES:
        for x in LABELS:
            lines.append(f"(declare-fun {bvar(c, x)} () Bool)")
    for ci, c in enumerate(CENTER_NAMES):
        names = [bvar(c, x) for x in LABELS]
        lines.append(f"(assert (= {smt_bool_sum(names)} 4))")
        lines.append(f"(assert (not {bvar(c, 'q')}))")
        lines.append(f"(assert (not {bvar(c, c)}))")
        triple_names = [bvar(c, LABELS[t]) for t in TRIPLE]
        lines.append(f"(assert (<= {smt_bool_sum(triple_names)} 2))")
    for i, c in enumerate(CENTER_NAMES):
        for d in CENTER_NAMES[i + 1:]:
            both = [f"(and {bvar(c, x)} {bvar(d, x)})" for x in LABELS]
            lines.append(f"(assert (<= {smt_bool_sum(both)} 2))")
    return lines


def pattern_nogood(masks: list[int], idx: int, reason: str) -> str:
    differs = []
    for c, mask in zip(CENTER_NAMES, masks):
        for xi, x in enumerate(LABELS):
            name = bvar(c, x)
            differs.append(f"(not {name})" if bit(mask, xi) else name)
    return f"(assert (! (or {' '.join(differs)}) :named ng_{reason}_{idx:04d}))"


def build_confined_case(case_name: str, patterns: list[dict[str, object]],
                        active_reasons: set[str] | None) -> str:
    lines = confined_prelude()
    if active_reasons is not None:
        for idx, pattern in enumerate(patterns):
            reason = str(pattern["reason"])
            if reason in active_reasons:
                lines.append(pattern_nogood(list(pattern["masks"]), idx, reason))
    lines += ["(check-sat)", "(exit)"]
    return "\n".join(lines) + "\n"


def build_live_case(patterns: list[dict[str, object]]) -> str:
    """A label-free-shell, one-outside-witness live abstraction.

    mode 0 = confined q-deleted row; mode 1 = q-deleted row with exactly one
    abstract outside witness; mode 2 = critical full-shell tag.  Shell support
    points are intentionally not named.  Pair intersections involving a shell
    are abstract integer cardinalities bounded by the source two-circle cut.
    """
    lines = ["(set-logic QF_LIA)", "(set-option :produce-models true)"]
    for c in CENTER_NAMES:
        lines.append(f"(declare-fun mode_{c} () Int)")
        lines.append(f"(assert (and (<= 0 mode_{c}) (<= mode_{c} 2)))")
        for x in LABELS:
            lines.append(f"(declare-fun {bvar(c, x)} () Bool)")
        lines.append(f"(assert (=> (= mode_{c} 0) (= {smt_bool_sum(bvar(c, x) for x in LABELS)} 4)))")
        lines.append(f"(assert (=> (= mode_{c} 1) (= {smt_bool_sum(bvar(c, x) for x in LABELS)} 3)))")
        # No shell support labels: named-label membership is disabled in shell mode.
        lines.append(f"(assert (=> (= mode_{c} 2) (= {smt_bool_sum(bvar(c, x) for x in LABELS)} 0)))")
        lines.append(f"(assert (=> (not (= mode_{c} 2)) (not {bvar(c, 'q')})))")
        lines.append(f"(assert (not {bvar(c, c)}))")
        triple_names = [bvar(c, LABELS[t]) for t in TRIPLE]
        lines.append(f"(assert (=> (not (= mode_{c} 2)) (<= {smt_bool_sum(triple_names)} 2)))")

    # The source obstruction forces at least one escape or shell.
    lines.append("(assert (or " + " ".join(f"(not (= mode_{c} 0))" for c in CENTER_NAMES) + "))")

    for i, c in enumerate(CENTER_NAMES):
        for d in CENTER_NAMES[i + 1:]:
            ivar = f"inter_{c}_{d}"
            lines.append(f"(declare-fun {ivar} () Int)")
            lines.append(f"(assert (and (<= 0 {ivar}) (<= {ivar} 2)))")
            base_overlap = smt_bool_sum(f"(and {bvar(c, x)} {bvar(d, x)})" for x in LABELS)
            both_qdeleted = f"(and (not (= mode_{c} 2)) (not (= mode_{d} 2)))"
            lines.append(f"(assert (=> {both_qdeleted} (<= {base_overlap} {ivar})))")
            # A confined row has no unnamed member, so its intersection is exact
            # if both rows are confined; two escaping rows may share their one
            # unnamed witness, hence the +1 upper allowance.
            lines.append(f"(assert (=> (and (= mode_{c} 0) (= mode_{d} 0)) (= {ivar} {base_overlap})))")
            lines.append(f"(assert (=> (and (= mode_{c} 2) (= mode_{d} 2)) (<= 1 {ivar})))")

    # Source-reflected finite prefilter no-goods apply only to the all-confined arm.
    all_confined = "(and " + " ".join(f"(= mode_{c} 0)" for c in CENTER_NAMES) + ")"
    for idx, pattern in enumerate(patterns):
        raw = pattern_nogood(list(pattern["masks"]), idx, str(pattern["reason"]))
        expr = raw[len("(assert (! "):-len(")")]
        # Strip the :named wrapper for a conditional clause.
        expr = expr.split(" :named ", 1)[0]
        lines.append(f"(assert (=> {all_confined} {expr}))")
    lines += ["(check-sat)", "(exit)"]
    return "\n".join(lines) + "\n"


def build_smoke(sat: bool) -> str:
    assertion = "true" if sat else "false"
    return f"(set-logic QF_LIA)\n(assert {assertion})\n(check-sat)\n(exit)\n"


@dataclass(frozen=True)
class Case:
    name: str
    family: str
    expected: str
    omitted_reason: str | None = None


def cases() -> list[Case]:
    out = [
        Case("smoke_sat", "control", "sat"),
        Case("smoke_unsat", "control", "unsat"),
        Case("confined_structural", "all-confined", "sat"),
        Case("confined_all_prefilters", "all-confined", "unsat"),
    ]
    out.extend(Case(f"confined_drop_{r}", "leave-one-prefilter-out", "diagnostic", r) for r in REASONS)
    out.append(Case("live_escape_or_shell", "live-abstraction", "sat"))
    assert len(out) == LOGICAL_CASE_BUDGET
    return out


def solver_commands(path: Path) -> dict[str, list[str]]:
    return {
        "z3": ["z3", f"-T:{TIMEOUT_SECONDS}", "-smt2", str(path)],
        "cvc5": ["cvc5", "--lang=smt2", f"--tlimit-per={TIMEOUT_SECONDS * 1000}", str(path)],
    }


def parse_status(stdout: str) -> str:
    for line in stdout.splitlines():
        token = line.strip()
        if token in {"sat", "unsat", "unknown"}:
            return token
    return "missing"


def run_process(command: list[str], stem: str) -> dict[str, object]:
    started = time.monotonic()
    timed_out = False
    try:
        proc = subprocess.run(command, text=True, capture_output=True,
                              timeout=TIMEOUT_SECONDS + 5, check=False)
        stdout, stderr, code = proc.stdout, proc.stderr, proc.returncode
    except subprocess.TimeoutExpired as exc:
        timed_out = True
        stdout = exc.stdout or ""
        stderr = exc.stderr or ""
        code = 124
    elapsed = time.monotonic() - started
    (LOGS / f"{stem}.stdout.txt").write_text(stdout)
    (LOGS / f"{stem}.stderr.txt").write_text(stderr)
    return {
        "command": command,
        "exit_code": code,
        "timed_out": timed_out,
        "seconds": round(elapsed, 6),
        "status": "unknown" if timed_out else parse_status(stdout),
    }


DEFINE_BOOL = re.compile(
    r"\(define-fun\s+([A-Za-z0-9_]+)\s*\(\)\s*Bool\s+(true|false)\s*\)", re.S
)
DEFINE_INT = re.compile(
    r"\(define-fun\s+([A-Za-z0-9_]+)\s*\(\)\s*Int\s+(-?[0-9]+)\s*\)", re.S
)


def get_model(case_path: Path, solver: str, base_command: list[str], stem: str) -> tuple[dict[str, object], dict[str, object]]:
    model_path = MODELS / f"{case_path.stem}.{solver}.model.smt2"
    text = case_path.read_text().replace("(exit)\n", "(get-model)\n(exit)\n")
    model_path.write_text(text)
    command = list(base_command)
    command[-1] = str(model_path)
    result = run_process(command, stem + ".model")
    values: dict[str, object] = {}
    stdout = (LOGS / f"{stem}.model.stdout.txt").read_text()
    values.update({name: value == "true" for name, value in DEFINE_BOOL.findall(stdout)})
    values.update({name: int(value) for name, value in DEFINE_INT.findall(stdout)})
    return result, values


def validate_confined(values: dict[str, object], active_reasons: set[str] | None) -> dict[str, object]:
    rows: dict[int, int] = {}
    missing: list[str] = []
    for center, c in zip(CENTERS, CENTER_NAMES):
        mask = 0
        for xi, x in enumerate(LABELS):
            name = bvar(c, x)
            if name not in values:
                missing.append(name)
            elif values[name]:
                mask |= 1 << xi
        rows[center] = mask
    checks = {
        "model_complete": not missing,
        "card_four": all(m.bit_count() == 4 for m in rows.values()),
        "q_free": all(not bit(m, Q) for m in rows.values()),
        "own_center_free": all(not bit(rows[c], c) for c in CENTERS),
        "pairwise_intersection_le_two": all(
            (rows[c] & rows[d]).bit_count() <= 2
            for i, c in enumerate(CENTERS) for d in CENTERS[i + 1:]
        ),
        "dangerous_p_circle_intersection_le_two": all(
            (rows[c] & P_CIRCLE_MASK).bit_count() <= 2 for c in CENTERS
        ),
        "dangerous_p_circle_complement_ge_two": all(
            (rows[c] & ~P_CIRCLE_MASK).bit_count() >= 2 for c in CENTERS
        ),
    }
    reason = prefilter_reason(rows) if not missing else None
    checks["active_nogood_avoided"] = active_reasons is None or reason not in active_reasons
    return {
        "valid": all(checks.values()),
        "checks": checks,
        "missing": missing,
        "rows": {LABELS[c]: rows[c] for c in CENTERS},
        "row_members": {
            LABELS[c]: [LABELS[x] for x in range(8) if bit(rows[c], x)] for c in CENTERS
        },
        "prefilter_reason": reason,
    }


def validate_live(values: dict[str, object]) -> dict[str, object]:
    modes: dict[str, int] = {}
    base_rows: dict[str, set[str]] = {}
    missing: list[str] = []
    for c in CENTER_NAMES:
        mname = f"mode_{c}"
        if mname not in values:
            missing.append(mname)
            continue
        modes[c] = int(values[mname])
        base_rows[c] = {x for x in LABELS if values.get(bvar(c, x)) is True}
        missing.extend(bvar(c, x) for x in LABELS if bvar(c, x) not in values)
    checks: dict[str, bool] = {
        "model_complete": not missing,
        "mode_range": len(modes) == 6 and all(m in (0, 1, 2) for m in modes.values()),
        "global_escape_or_shell": bool(modes) and any(m != 0 for m in modes.values()),
    }
    if len(modes) == 6:
        checks["mode_cardinality_abstraction"] = all(
            len(base_rows[c]) == (4 if modes[c] == 0 else 3 if modes[c] == 1 else 0)
            for c in CENTER_NAMES
        )
        checks["qdeleted_q_free"] = all(modes[c] == 2 or "q" not in base_rows[c] for c in CENTER_NAMES)
        checks["own_center_free"] = all(c not in base_rows[c] for c in CENTER_NAMES)
        checks["qdeleted_p_circle_cut"] = all(
            modes[c] == 2 or len(base_rows[c] & {"q", "t1", "t2", "t3"}) <= 2
            for c in CENTER_NAMES
        )
        checks["pair_intersection_bounds"] = all(
            0 <= int(values.get(f"inter_{c}_{d}", -1)) <= 2
            for i, c in enumerate(CENTER_NAMES) for d in CENTER_NAMES[i + 1:]
        )
    return {
        "valid": all(checks.values()),
        "checks": checks,
        "missing": missing,
        "modes": modes,
        "mode_names": {c: ("confined-qdeleted", "escape-qdeleted", "critical-shell")[m] for c, m in modes.items()},
        "named_members_only": {c: sorted(xs) for c, xs in base_rows.items()},
        "warning": "shell support is intentionally unlabeled; mode 1 has one abstract outside witness",
    }


def classify(case: Case, statuses: dict[str, str]) -> str:
    values = set(statuses.values())
    if len(values) != 1 or not values <= {"sat", "unsat"}:
        return "UNKNOWN"
    status = next(iter(values))
    if status == "sat":
        return "SAT-abstraction"
    if case.name in {"smoke_unsat", "confined_all_prefilters"}:
        return "semantic-UNSAT"
    return "relaxation-UNSAT"


def main() -> None:
    for directory in (MODELS, LOGS, READBACK):
        directory.mkdir(parents=True, exist_ok=True)

    patterns = structural_patterns()
    reason_counts = Counter(str(p["reason"]) for p in patterns)
    if len(patterns) != 468:
        raise RuntimeError(f"expected 468 strengthened structural patterns, got {len(patterns)}")
    if sum(reason_counts.values()) != 468:
        raise RuntimeError("reason count mismatch")
    (ROOT / "finite_nogoods.json").write_text(json.dumps({
        "schema": "U5AuditLabel.choices + pair overlaps + dangerous-p-circle cut",
        "patterns": patterns,
        "reason_counts": dict(reason_counts),
    }, indent=2, sort_keys=True) + "\n")

    source_hashes = {path: sha256_bytes((REPO / path).read_bytes()) for path in SOURCE_FILES}
    schema = {
        "namespace": "freshthird_u3_simultaneous_sixcenter_20260809",
        "labels": LABELS,
        "audit_centers": CENTER_NAMES,
        "choice_masks": {LABELS[k]: v for k, v in CHOICES.items()},
        "prefilter_reason_priority": REASONS,
        "live_modes": {"0": "confined-qdeleted", "1": "escape-qdeleted", "2": "critical-shell"},
        "shell_support_labels": None,
        "same_center_row_identity": "not encoded; unavailable for arbitrary q-deleted witnesses",
        "actual_blocker_fiber": "not encoded; CriticalShellSystem antecedent unavailable for U3 audit centers",
    }

    built: dict[str, str] = {}
    case_defs = cases()
    for case in case_defs:
        if case.name == "smoke_sat":
            smt = build_smoke(True)
        elif case.name == "smoke_unsat":
            smt = build_smoke(False)
        elif case.name == "confined_structural":
            smt = build_confined_case(case.name, patterns, None)
        elif case.name == "confined_all_prefilters":
            smt = build_confined_case(case.name, patterns, set(REASONS))
        elif case.name == "live_escape_or_shell":
            smt = build_live_case(patterns)
        else:
            smt = build_confined_case(case.name, patterns, set(REASONS) - {str(case.omitted_reason)})
        path = MODELS / f"{case.name}.smt2"
        path.write_text(smt)
        built[case.name] = sha256_bytes(smt.encode())

    case_matrix = [{
        "case": c.name,
        "family": c.family,
        "expected_control_or_probe": c.expected,
        "omitted_reason": c.omitted_reason,
        "smt_sha256": built[c.name],
    } for c in case_defs]
    (ROOT / "case_matrix.json").write_text(json.dumps(case_matrix, indent=2) + "\n")

    manifest = {
        "namespace": schema["namespace"],
        "created_utc": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
        "source_hashes": source_hashes,
        "schema_sha256": canonical_hash(schema),
        "schema": schema,
        "finite_nogoods_sha256": sha256_bytes((ROOT / "finite_nogoods.json").read_bytes()),
        "case_matrix_sha256": sha256_bytes((ROOT / "case_matrix.json").read_bytes()),
        "budgets": {
            "timeout_seconds_per_process": TIMEOUT_SECONDS,
            "concurrent_solver_processes": CONCURRENT_PROCESSES,
            "total_host_core_budget": TOTAL_HOST_CORE_BUDGET,
            "logical_cases": len(case_defs),
            "logical_case_budget": LOGICAL_CASE_BUDGET,
            "engines": ["z3", "cvc5"],
            "execution": "strictly sequential; never more than one solver process",
        },
        "fail_closed": "any timeout, crash, missing status, solver disagreement, or invalid SAT readback => UNKNOWN",
        "four_values": ["semantic-UNSAT", "relaxation-UNSAT", "SAT-abstraction", "UNKNOWN"],
    }
    (ROOT / "manifest.json").write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")

    results: list[dict[str, object]] = []
    commands_log = []
    for case in case_defs:
        case_path = MODELS / f"{case.name}.smt2"
        commands = solver_commands(case_path)
        engine_results: dict[str, dict[str, object]] = {}
        validations: dict[str, dict[str, object]] = {}
        for solver in ("z3", "cvc5"):
            result = run_process(commands[solver], f"{case.name}.{solver}")
            commands_log.append({"case": case.name, "solver": solver, **result})
            if result["status"] == "sat":
                model_result, values = get_model(case_path, solver, commands[solver], f"{case.name}.{solver}")
                result["model_run"] = model_result
                if case.name == "live_escape_or_shell":
                    validation = validate_live(values)
                elif case.family == "control":
                    validation = {"valid": True, "checks": {"control_status": True}}
                else:
                    active = None if case.name == "confined_structural" else set(REASONS) - ({case.omitted_reason} if case.omitted_reason else set())
                    validation = validate_confined(values, active)
                validation["value_count"] = len(values)
                validations[solver] = validation
                (READBACK / f"{case.name}.{solver}.json").write_text(json.dumps(validation, indent=2, sort_keys=True) + "\n")
                if not validation["valid"]:
                    result["status"] = "invalid-sat-readback"
            engine_results[solver] = result
        statuses = {solver: str(data["status"]) for solver, data in engine_results.items()}
        verdict = classify(case, statuses)
        results.append({
            "case": case.name,
            "family": case.family,
            "omitted_reason": case.omitted_reason,
            "statuses": statuses,
            "verdict": verdict,
            "engines": engine_results,
            "readback_valid": {k: bool(v["valid"]) for k, v in validations.items()},
        })

    (LOGS / "commands.jsonl").write_text("".join(json.dumps(x, sort_keys=True) + "\n" for x in commands_log))
    overall = "UNKNOWN"
    live = next(r for r in results if r["case"] == "live_escape_or_shell")
    finite = next(r for r in results if r["case"] == "confined_all_prefilters")
    controls_ok = all(
        next(r for r in results if r["case"] == name)["statuses"] == {"z3": status, "cvc5": status}
        for name, status in (("smoke_sat", "sat"), ("smoke_unsat", "unsat"))
    )
    if controls_ok and live["verdict"] == "SAT-abstraction":
        overall = "SAT-abstraction"
    summary = {
        "overall_live_boundary_verdict": overall,
        "finite_all_confined_verdict": finite["verdict"],
        "controls_ok": controls_ok,
        "structural_pattern_count": len(patterns),
        "prefilter_reason_counts": dict(reason_counts),
        "results": results,
        "scope": {
            "sat": "finite SAT abstraction only",
            "unsat": "bounded all-confined finite schema only; not universal or Lean closure",
            "no_claims": ["counterexample", "universal closure", "Lean proof closure", "Euclidean realization"],
        },
    }
    (ROOT / "results.json").write_text(json.dumps(summary, indent=2, sort_keys=True) + "\n")

    rows = [
        "# Simultaneous six-center results",
        "",
        f"Overall live-boundary classification: **{overall}**.",
        f"All-confined finite classification: **{finite['verdict']}**.",
        "",
        "| case | z3 | cvc5 | four-valued classification |",
        "|---|---:|---:|---|",
    ]
    for result in results:
        rows.append(f"| `{result['case']}` | {result['statuses']['z3']} | {result['statuses']['cvc5']} | {result['verdict']} |")
    rows += [
        "",
        "The dangerous-p-circle cut leaves 468 structural confined patterns. "
        "Every one receives a named Lean prefilter reason; the counts are "
        + ", ".join(f"{k}={reason_counts.get(k, 0)}" for k in REASONS) + ".",
        "",
        "A SAT result is a SAT abstraction, not a Euclidean realization or counterexample. "
        "The all-prefilter UNSAT result is confined to the bounded all-q-deleted schema "
        "whose clauses are traced in `SOURCE_ORIGINS.md`; it is not a universal or Lean closure claim.",
    ]
    (ROOT / "RESULTS.md").write_text("\n".join(rows) + "\n")
    print(json.dumps({
        "root": str(ROOT),
        "overall": overall,
        "finite_all_confined": finite["verdict"],
        "patterns": len(patterns),
        "reason_counts": dict(reason_counts),
        "cases": len(results),
        "unknown_cases": [r["case"] for r in results if r["verdict"] == "UNKNOWN"],
    }, sort_keys=True))


if __name__ == "__main__":
    main()
