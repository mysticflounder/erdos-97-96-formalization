"""Mandatory controls for ``PHASE3-SPEC.md`` v0.1."""

from __future__ import annotations

import hashlib
import itertools
import json
import shutil
import subprocess
import sys
import time
import traceback
from pathlib import Path
from typing import Any, Callable, Mapping

_HERE = Path(__file__).resolve().parent
_REPO = _HERE.parents[1]
_OUT = _HERE / "out" / "phase3-gates"
if str(_HERE) not in sys.path:
    sys.path.insert(0, str(_HERE))

import controls2  # noqa: E402
from annotations import AnnotatedNode, BlockerAnnotation, CapAnnotation  # noqa: E402
from cells import Cell  # noqa: E402
from node import Node  # noqa: E402
from sat_generate import (  # noqa: E402
    Phase3Error,
    SatEncoding,
    SolverResult,
    enumerate_cell,
    run_cadical,
    run_drat_trim,
    verify_run_artifacts,
)
from seeds import S_K3_9  # noqa: E402


class GateFailure(AssertionError):
    pass


def _reset(name: str) -> Path:
    path = _OUT / name.lower()
    if path.exists():
        shutil.rmtree(path)
    path.mkdir(parents=True)
    return path


def _hash(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _write_json(path: Path, value: Any) -> None:
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")


def _run_regression(script: str) -> str:
    result = subprocess.run(
        ["uv", "run", "python", str(_HERE / script)],
        cwd=_REPO,
        capture_output=True,
        text=True,
        timeout=180,
        check=False,
    )
    if result.returncode != 0 or "ALL_GATES_PASS = True" not in result.stdout:
        raise GateFailure(
            f"{script} failed (exit {result.returncode}); "
            f"stdout tail={result.stdout.splitlines()[-8:]!r}; "
            f"stderr tail={result.stderr.splitlines()[-8:]!r}"
        )
    pass_rows = sum("PASS" in line for line in result.stdout.splitlines())
    return f"{script}: ALL_GATES_PASS=True ({pass_rows} PASS rows)"


def gate_p1_regress() -> str:
    return _run_regression("controls.py")


def gate_p2_regress() -> str:
    return _run_regression("controls2.py")


def gate_canon_joint_invar() -> str:
    return controls2.gate_canon_ann()


def gate_canon_joint_exact() -> str:
    return controls2.gate_canon_joint_exact()


def gate_iter_combined() -> str:
    return controls2.gate_iter_combined()


def _combined_fixture() -> AnnotatedNode:
    n, k = 10, 4
    offsets = (1, 2, 3, 5)
    node = Node(
        n=n,
        k=k,
        shells=tuple(
            frozenset((p + offset) % n for offset in offsets) for p in range(n)
        ),
    )
    blocker = BlockerAnnotation(
        node=node, c=tuple((x - 1) % n for x in range(n))
    )
    caps = CapAnnotation(
        node=node,
        M=frozenset({0, 1, 2}),
        f={3: 0, 4: 0, 5: 1, 6: 1, 7: 2, 8: 2, 9: 2},
    )
    return AnnotatedNode(node=node, blocker=blocker, caps=caps)


def _assignment_for(
    encoding: SatEncoding, obj: Node | AnnotatedNode
) -> dict[int, bool]:
    node = obj if isinstance(obj, Node) else obj.node
    blocker = obj.blocker if isinstance(obj, AnnotatedNode) else None
    caps = obj.caps if isinstance(obj, AnnotatedNode) else None
    assignment: dict[int, bool] = {}
    for var in encoding.semantic_vars:
        key = encoding.key_for[var]
        if key[0] == "s":
            _, p, q = key
            assignment[var] = q in node.shell(p)
        elif key[0] == "b":
            assert blocker is not None
            _, x, d = key
            assignment[var] = blocker.c[x] == d
        else:
            assert key[0] == "f" and caps is not None
            _, x, i = key
            assignment[var] = caps.f[x] == i
    return assignment


def _units_for(
    encoding: SatEncoding, obj: Node | AnnotatedNode
) -> list[tuple[int]]:
    assignment = _assignment_for(encoding, obj)
    return [(var if assignment[var] else -var,) for var in encoding.semantic_vars]


def _solve_gate(
    name: str,
    encoding: SatEncoding,
    assumptions: list[tuple[int, ...]],
    expected: str,
) -> tuple[SolverResult, Node | AnnotatedNode | None]:
    path = _reset(name)
    cnf = path / "problem.cnf"
    proof = path / "proof.drat"
    cnf.write_bytes(encoding.cnf_bytes(assumptions))
    result = run_cadical(cnf, 30, proof)
    (path / "solver.log").write_text(
        result.stdout + ("\nSTDERR\n" + result.stderr if result.stderr else "")
    )
    decoded = None
    checker_verified = False
    if result.verdict == "SAT":
        decoded = encoding.decode(result.assignment)
        witness = {
            "semantic_assignment": encoding.semantic_record(result.assignment),
            "claim": "validated SAT witness for the constrained structural CNF",
        }
        _write_json(path / "witness.json", witness)
        proof.unlink(missing_ok=True)
    elif result.verdict == "UNSAT":
        if not proof.is_file() or proof.stat().st_size == 0:
            raise GateFailure(f"{name}: UNSAT without DRAT proof")
        checked = run_drat_trim(cnf, proof, 30)
        (path / "proof.drat.check").write_text(
            checked.stdout + ("\nSTDERR\n" + checked.stderr if checked.stderr else "")
        )
        checker_verified = checked.verified
        if not checker_verified:
            raise GateFailure(f"{name}: drat-trim did not verify")
    if result.verdict != expected:
        raise GateFailure(f"{name}: expected {expected}, got {result.verdict}")
    result_json = {
        "gate": name,
        "verdict": result.verdict,
        "returncode": result.returncode,
        "checker_verified": checker_verified,
        "claim": (
            "validated SAT witness"
            if result.verdict == "SAT"
            else "verified UNSAT for the exact emitted gate CNF"
        ),
        "cell": {
            "k": encoding.cell.k,
            "n": encoding.cell.n,
            "profile": encoding.cell.profile,
            "exact": encoding.cell.exact,
        },
        "mode": encoding.mode,
        "semantic_variables": len(encoding.semantic_vars),
        "variables": encoding.num_vars,
        "base_clauses": len(encoding.clauses),
        "assumption_clauses": len(assumptions),
        "clause_tags": encoding.clause_counts,
        "artifacts": {
            p.name: _hash(p)
            for p in sorted(path.iterdir())
            if p.is_file() and p.name != "result.json"
        },
    }
    _write_json(path / "result.json", result_json)
    return result, decoded


def gate_clause_audit() -> str:
    encodings = (
        SatEncoding(Cell(3, 9, None, exact=True)),
        SatEncoding(Cell(4, 10, (4, 4, 5), exact=True), blocker=True),
    )
    expected = {
        "S-D1",
        "S-EXACT",
        "S-CIRC2",
        "B-TOTAL",
        "B-MEM",
        "CAP-TOTAL",
        "CAP-PROFILE",
    }
    for encoding in encodings:
        if set(encoding.clause_counts) != expected:
            raise GateFailure(f"unexpected clause tags: {encoding.clause_counts}")
        if any(tag.startswith("R-P") for tag in encoding.clause_counts):
            raise GateFailure("forbidden R-P1..R-P4 clause tag emitted")
        if encoding.clause_counts["S-D1"] != 0:
            raise GateFailure("S-D1 must be implemented by absent diagonal variables")
        if any(key[0] == "s" and key[1] == key[2] for key in encoding.var_for):
            raise GateFailure("diagonal shell variable was allocated")
    return "only PHASE3-SPEC hard-clause tags emitted; R-P1..R-P4 absent"


def gate_sat_k3_seed() -> str:
    encoding = SatEncoding(Cell(3, 9, None, exact=True))
    _, decoded = _solve_gate(
        "G-SAT-K3-SEED", encoding, _units_for(encoding, S_K3_9.node), "SAT"
    )
    if not isinstance(decoded, Node) or decoded.shells != S_K3_9.node.shells:
        raise GateFailure("decoded SAT model does not reproduce S-K3-9")
    return "SAT; validating decode exactly reproduces all S-K3-9 shells"


def gate_sat_combined() -> str:
    fixture = _combined_fixture()
    encoding = SatEncoding(
        Cell(4, 10, (4, 4, 5), exact=True), blocker=True
    )
    _, decoded = _solve_gate(
        "G-SAT-COMBINED", encoding, _units_for(encoding, fixture), "SAT"
    )
    if not isinstance(decoded, AnnotatedNode):
        raise GateFailure("combined model decoded without annotations")
    if (
        decoded.node.shells != fixture.node.shells
        or decoded.blocker is None
        or decoded.blocker.c != fixture.blocker.c  # type: ignore[union-attr]
        or decoded.caps is None
        or dict(decoded.caps.f) != dict(fixture.caps.f)  # type: ignore[union-attr]
    ):
        raise GateFailure("combined decode does not reproduce the fixture")
    return "SAT; validating decode reproduces shell, B1 blocker, and cap assignment"


def gate_sat_card_unsat() -> str:
    encoding = SatEncoding(Cell(2, 4, None, exact=True))
    assumptions = [(encoding.var("s", 0, q),) for q in (1, 2, 3)]
    _solve_gate("G-SAT-CARD-UNSAT", encoding, assumptions, "UNSAT")
    return "forced k+1 row members; UNSAT with verified DRAT"


def gate_sat_circ2_unsat() -> str:
    encoding = SatEncoding(Cell(3, 5, None, exact=True))
    assumptions = [
        (encoding.var("s", p, x),) for p in (0, 1) for x in (2, 3, 4)
    ]
    _solve_gate("G-SAT-CIRC2-UNSAT", encoding, assumptions, "UNSAT")
    return "forced a three-point intersection; UNSAT with verified DRAT"


def gate_sat_b1_unsat() -> str:
    encoding = SatEncoding(Cell(1, 4, None, exact=True), blocker=True)
    assumptions = [
        (encoding.var("b", 0, 1),),
        (-encoding.var("s", 1, 0),),
    ]
    _solve_gate("G-SAT-B1-UNSAT", encoding, assumptions, "UNSAT")
    return "forced b[0,1] and not s[1,0]; UNSAT with verified DRAT"


def gate_sat_profile_unsat() -> str:
    encoding = SatEncoding(Cell(4, 10, (4, 4, 5), exact=True))
    assumptions = [(encoding.var("f", x, 0),) for x in (3, 4, 5, 6)]
    _solve_gate("G-SAT-PROFILE-UNSAT", encoding, assumptions, "UNSAT")
    return "forced strict cap fiber size >=4 outside multiset (2,2,3); verified UNSAT"


def _brute_tiny() -> set[tuple[bool, ...]]:
    encoding = SatEncoding(Cell(2, 4, None, exact=True))
    out: set[tuple[bool, ...]] = set()
    rows = [
        tuple(itertools.combinations([q for q in range(4) if q != p], 2))
        for p in range(4)
    ]
    for choices in itertools.product(*rows):
        node = Node(
            n=4, k=2, shells=tuple(frozenset(choice) for choice in choices)
        )
        # With exact two-element rows R-CIRC2 is automatic, but retain the
        # independent semantic predicate for clarity and future gate changes.
        if any(
            len(node.shell(p) & node.shell(q)) > 2
            for p, q in itertools.combinations(range(4), 2)
        ):
            continue
        assignment = _assignment_for(encoding, node)
        out.add(tuple(assignment[var] for var in encoding.semantic_vars))
    return out


def gate_sat_tiny_complete() -> str:
    path = _reset("G-SAT-TINY-COMPLETE")
    cell = Cell(2, 4, None, exact=True)
    encoding = SatEncoding(cell)
    manifest = enumerate_cell(cell, path, timeout_s=30)
    if manifest["status"] != "COMPLETE" or not manifest["unsat_verified"]:
        raise GateFailure(f"tiny enumeration did not complete: {manifest}")
    verified = verify_run_artifacts(path)
    models = [
        json.loads(line)
        for line in (path / "models.jsonl").read_text().splitlines()
        if line.strip()
    ]
    observed = {
        tuple(
            encoding.assignment_from_record(record)[var]
            for var in encoding.semantic_vars
        )
        for record in models
    }
    expected = _brute_tiny()
    if observed != expected:
        raise GateFailure(
            f"tiny raw assignment mismatch: SAT={len(observed)}, brute={len(expected)}, "
            f"missing={len(expected-observed)}, extra={len(observed-expected)}"
        )
    if verified["raw_count"] != len(expected):
        raise GateFailure("verified manifest raw_count mismatch")
    return (
        f"COMPLETE: SAT raw set = independent brute set = {len(expected)}; "
        "terminal DRAT reverified"
    )


def gate_sat_partial() -> str:
    path = _reset("G-SAT-PARTIAL")
    manifest = enumerate_cell(
        Cell(1, 3, None, exact=True), path, timeout_s=30, model_limit=1
    )
    if manifest["status"] != "PARTIAL" or manifest["raw_count"] != 1:
        raise GateFailure(f"model-limit run was not exactly PARTIAL: {manifest}")
    verify_run_artifacts(path)
    return "one validated SAT witness then model limit => PARTIAL, never COMPLETE"


def gate_resume_tamper() -> str:
    root = _reset("G-RESUME-TAMPER")
    run = root / "run"
    cell = Cell(1, 3, None, exact=True)
    partial = enumerate_cell(cell, run, timeout_s=30, model_limit=1)
    if partial["status"] != "PARTIAL" or partial["raw_count"] != 1:
        raise GateFailure(f"resume seed was not exactly PARTIAL: {partial}")
    complete = enumerate_cell(cell, run, timeout_s=30, resume=True)
    if complete["status"] != "COMPLETE" or complete["raw_count"] != 8:
        raise GateFailure(f"resumed run did not reach expected COMPLETE/8: {complete}")
    verify_run_artifacts(run)

    tamper_base = root / "tamper-base"
    shutil.copytree(run, tamper_base)
    (tamper_base / "base.cnf").write_bytes(
        (tamper_base / "base.cnf").read_bytes() + b"c tampered\n"
    )
    tamper_model = root / "tamper-model"
    shutil.copytree(run, tamper_model)
    records = [
        json.loads(line)
        for line in (tamper_model / "models.jsonl").read_text().splitlines()
        if line.strip()
    ]
    semantic = records[0]["semantic_assignment"]
    first_name = sorted(semantic)[0]
    semantic[first_name] = not semantic[first_name]
    (tamper_model / "models.jsonl").write_text(
        "".join(json.dumps(record, sort_keys=True) + "\n" for record in records)
    )
    for name, path in (("base", tamper_base), ("model", tamper_model)):
        try:
            verify_run_artifacts(path)
        except Phase3Error:
            continue
        raise GateFailure(f"tampered {name} artifact was accepted")
    return "PARTIAL resumed to COMPLETE/8; base-CNF and model tampering rejected"


def gate_atomic_interrupt() -> str:
    path = _reset("G-ATOMIC-INTERRUPT")
    calls = 0

    def interrupt_after_one(
        cnf: Path, timeout: int, proof: Path | None
    ) -> SolverResult:
        nonlocal calls
        calls += 1
        if calls == 1:
            return run_cadical(cnf, timeout, proof)
        raise KeyboardInterrupt

    manifest = enumerate_cell(
        Cell(1, 3, None, exact=True),
        path,
        timeout_s=30,
        solver_runner=interrupt_after_one,
    )
    if manifest["status"] != "PARTIAL" or manifest["raw_count"] != 1:
        raise GateFailure(f"interrupted run was not valid PARTIAL/1: {manifest}")
    verify_run_artifacts(path)
    return "interrupt after one decoded model => atomically revalidated PARTIAL"


def gate_fail_closed() -> str:
    cases: dict[str, Mapping[str, Any]] = {}

    def unknown_solver(_cnf: Path, _timeout: int, _proof: Path | None) -> SolverResult:
        return SolverResult("UNKNOWN", {}, 0, stderr="injected unknown")

    def malformed_solver(
        _cnf: Path, _timeout: int, _proof: Path | None
    ) -> SolverResult:
        return SolverResult("SAT", {1: True}, 10, stdout="injected short model")

    def missing_proof_solver(
        _cnf: Path, _timeout: int, _proof: Path | None
    ) -> SolverResult:
        return SolverResult("UNSAT", {}, 20, stdout="injected UNSAT")

    def bogus_proof_solver(
        _cnf: Path, _timeout: int, proof: Path | None
    ) -> SolverResult:
        assert proof is not None
        proof.write_bytes(b"not a DRAT proof\n")
        return SolverResult("UNSAT", {}, 20, stdout="injected UNSAT")

    configurations = (
        ("solver-unknown", unknown_solver, run_drat_trim),
        ("malformed-model", malformed_solver, run_drat_trim),
        ("missing-drat", missing_proof_solver, run_drat_trim),
        ("failed-drat-trim", bogus_proof_solver, run_drat_trim),
    )
    for name, solver, checker in configurations:
        path = _reset(f"G-FAIL-CLOSED-{name}")
        manifest = enumerate_cell(
            Cell(1, 3, None, exact=True),
            path,
            timeout_s=5,
            solver_runner=solver,
            checker_runner=checker,
        )
        if manifest["status"] != "UNKNOWN":
            raise GateFailure(f"{name}: expected UNKNOWN, got {manifest['status']}")
        if manifest["unsat_verified"]:
            raise GateFailure(f"{name}: incorrectly marked UNSAT verified")
        cases[name] = {
            "status": manifest["status"],
            "diagnostic": manifest["diagnostic"],
        }
    summary = _OUT / "g-fail-closed"
    summary.mkdir(parents=True, exist_ok=True)
    _write_json(
        summary / "result.json",
        {
            "gate": "G-FAIL-CLOSED",
            "claim": "all injected failures stop UNKNOWN; none publish COMPLETE",
            "cases": cases,
        },
    )
    return "unknown, malformed model, missing DRAT, failed drat-trim => UNKNOWN"


GateFn = Callable[[], str]
GATES: tuple[tuple[str, GateFn], ...] = (
    ("G-P1-REGRESS", gate_p1_regress),
    ("G-P2-REGRESS", gate_p2_regress),
    ("G-CANON-JOINT-INVAR", gate_canon_joint_invar),
    ("G-CANON-JOINT-EXACT", gate_canon_joint_exact),
    ("G-ITER-COMBINED", gate_iter_combined),
    ("G-CLAUSE-AUDIT", gate_clause_audit),
    ("G-SAT-K3-SEED", gate_sat_k3_seed),
    ("G-SAT-COMBINED", gate_sat_combined),
    ("G-SAT-CARD-UNSAT", gate_sat_card_unsat),
    ("G-SAT-CIRC2-UNSAT", gate_sat_circ2_unsat),
    ("G-SAT-B1-UNSAT", gate_sat_b1_unsat),
    ("G-SAT-PROFILE-UNSAT", gate_sat_profile_unsat),
    ("G-SAT-TINY-COMPLETE", gate_sat_tiny_complete),
    ("G-SAT-PARTIAL", gate_sat_partial),
    ("G-RESUME-TAMPER", gate_resume_tamper),
    ("G-ATOMIC-INTERRUPT", gate_atomic_interrupt),
    ("G-FAIL-CLOSED", gate_fail_closed),
)


def main() -> int:
    _OUT.mkdir(parents=True, exist_ok=True)
    rows: list[tuple[str, str, str, float]] = []
    all_pass = True
    for name, fn in GATES:
        start = time.time()
        try:
            detail = fn()
            rows.append((name, "PASS", detail, time.time() - start))
        except Exception as exc:  # noqa: BLE001 - controls report every gate.
            all_pass = False
            rows.append((name, "FAIL", str(exc), time.time() - start))
            traceback.print_exc(file=sys.stderr)
    print(f"{'Gate':<27}{'Verdict':<8}Detail")
    print("-" * 110)
    for name, verdict, detail, elapsed in rows:
        print(f"{name:<27}{verdict:<8}{detail} ({elapsed:.2f}s)")
    print(f"artifact root: {_OUT}")
    print(f"ALL_GATES_PASS = {all_pass}")
    return 0 if all_pass else 1


if __name__ == "__main__":
    raise SystemExit(main())
