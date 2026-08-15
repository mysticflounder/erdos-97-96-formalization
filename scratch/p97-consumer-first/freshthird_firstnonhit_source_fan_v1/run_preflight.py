#!/usr/bin/env python3
"""Retained robust-class FirstNonHit/fan finite preflight.

This is deliberately a quotient: it checks only source-entitled four-row fan
incidence and names the live FirstNonHit/interaction constructors.  It does
not encode Euclidean realizability or a universal lift.
"""
from __future__ import annotations

import hashlib
import itertools
import json
import subprocess
from pathlib import Path
from typing import Any

from z3 import Bool, If, Int, Or, Solver, Sum, sat, unknown

ROOT = Path(__file__).resolve().parent
REPO = ROOT.parents[2]
U = tuple(f"u{i}" for i in range(6)) + ("source0", "source1")
SLOTS = range(4)
NONHIT = ("sameBlocker", "sourceRowOmission")
INTERACTION = ("sameBlocker", "sourceRowOmission", "distinctBlockersDifferentCaps", "sameCapWithInternalFiberSource")
MODES = tuple(itertools.product(NONHIT, INTERACTION))
ARMS = tuple(itertools.product(range(2), repeat=4))
SOURCE_FILES = {
    "fiber": REPO / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean",
    "residual": REPO / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean",
    "retained_producer": REPO / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdRetainedProducer.lean",
    "fan_source": REPO / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean",
}

def bsum(xs: Any) -> Any:
    return Sum([If(x, 1, 0) for x in xs])

def boolv(model: Any, x: Any) -> bool:
    return bool(model.eval(x, model_completion=True))

def build(*, mode: tuple[str, str] | None = None, arm: tuple[int, int, int, int] | None = None,
          overfull: bool = False, no_self: bool = False, source_present: bool = False,
          no_cross: bool = False) -> tuple[Solver, dict[str, Any]]:
    s = Solver(); s.set(timeout=10_000)
    rows = {(r, p): Bool(f"R{r}_{p}") for r in range(2) for p in U}
    shells = {(r, i, j): Bool(f"shell{r}_{i}_{j}") for r in range(2) for i in SLOTS for j in SLOTS}
    blockers = {(r, i): Int(f"blocker{r}_{i}") for r in range(2) for i in SLOTS}
    caps = {(r, i): Int(f"cap{r}_{i}") for r in range(2) for i in SLOTS}
    # Two exact-four retained classes. The two canonical sources are absent.
    for r in range(2):
        s.add(rows[r, "source0"] == False, rows[r, "source1"] == False)
        s.add(bsum(rows[r, p] for p in U) == 4)
        if overfull:
            s.add(bsum(rows[r, p] for p in U) == 5)
        for i in SLOTS:
            s.add(0 <= blockers[r, i], blockers[r, i] < 4, 0 <= caps[r, i], caps[r, i] < 3)
            s.add(shells[r, i, i])
            if no_self:
                s.add(~shells[r, i, i])
            s.add(bsum(shells[r, i, j] for j in SLOTS) <= 2)
    # All four quotient slots are occupied by each retained row; this is the
    # exact-four row quotient, not an asserted equality of physical supports.
    for r in range(2):
        for i in SLOTS:
            s.add(Bool(f"slot{r}_{i}"))
    # A robust row's fan has a mutually omitted pair. This is queried, never
    # strengthened to any >=3 overlap statement.
    cross = []
    for r in range(2):
        for i in SLOTS:
            for j in SLOTS:
                if i < j:
                    cross.append((~shells[r, i, j]) & (~shells[r, j, i]) & (blockers[r, i] != blockers[r, j]))
    s.add(Or(cross))
    if no_cross:
        s.add(~Or(cross))
    if mode is not None:
        nh, inter = mode
        # Constructor fields are live interface facts. Their only universal
        # content here is that the selected constructor has all its fields;
        # no unsupported bridge to the robust apex rows is invented.
        for name in (f"nh_{nh}_field{i}" for i in range(4)):
            s.add(Bool(name))
        for name in (f"interaction_{inter}_field{i}" for i in range(5)):
            s.add(Bool(name))
        s.add(Bool(f"nh_{nh}"), Bool(f"interaction_{inter}"))
    if arm is not None:
        # The endpoint tuple is metadata for the retained deletion packet.
        for r, (x, y) in enumerate(((arm[0], arm[1]), (arm[2], arm[3]))):
            s.add(Int(f"row{r}_xChoice") == x, Int(f"row{r}_yChoice") == y)
    if source_present:
        s.add(rows[0, "source0"])
    return s, {"rows": rows, "shells": shells, "blockers": blockers, "caps": caps}

def validate(model: Any, ctx: dict[str, Any], *, source_present: bool = False) -> dict[str, Any]:
    rows, shells, blockers, caps = (ctx[k] for k in ("rows", "shells", "blockers", "caps"))
    if source_present or boolv(model, rows[0, "source0"]):
        raise RuntimeError("validator: forbidden source membership")
    for r in range(2):
        support = [p for p in U if boolv(model, rows[r, p])]
        if len(support) != 4 or any(p.startswith("source") for p in support):
            raise RuntimeError(f"validator: row {r}={support}")
        for i in SLOTS:
            if not boolv(model, shells[r, i, i]):
                raise RuntimeError(f"validator: missing self shell R{r}/{i}")
            if sum(boolv(model, shells[r, i, j]) for j in SLOTS) > 2:
                raise RuntimeError("validator: fan overlap >2")
    return {"row_supports": [[p for p in U if boolv(model, rows[r, p])] for r in range(2)],
            "blocker_labels": [[model.eval(blockers[r, i], model_completion=True).as_long() for i in SLOTS] for r in range(2)],
            "cap_labels": [[model.eval(caps[r, i], model_completion=True).as_long() for i in SLOTS] for r in range(2)]}

def emit(s: Solver, path: Path) -> None:
    text = "(set-logic QF_LIA)\n" + s.sexpr() + "\n(check-sat)\n"
    if text.count("(check-sat)") != 1:
        raise RuntimeError("malformed SMT artifact")
    path.write_text(text, encoding="utf-8")

def cvc5(path: Path) -> str:
    p = subprocess.run(["cvc5", "--lang", "smt2", "--tlimit=10000", str(path)], capture_output=True, text=True, timeout=20, check=False)
    toks = [x.strip() for x in p.stdout.splitlines() if x.strip()]
    if len(toks) != 1 or toks[0] not in {"sat", "unsat"}:
        raise RuntimeError(f"cvc5 malformed/unknown: {p.stdout[:120]!r}")
    return toks[0]

def check(label: str, s: Solver, ctx: dict[str, Any], expected: str, *, source_present: bool = False) -> dict[str, Any]:
    path = ROOT / "artifacts" / f"{label}.smt2"; emit(s, path)
    z = s.check()
    if z == unknown: raise RuntimeError(f"z3 unknown: {label}: {s.reason_unknown()}")
    zs = "sat" if z == sat else "unsat"
    if zs != expected: raise RuntimeError(f"{label}: z3 {zs}, expected {expected}")
    readback = validate(s.model(), ctx, source_present=source_present) if expected == "sat" else None
    cs = cvc5(path)
    if cs != expected: raise RuntimeError(f"{label}: cvc5 {cs}, expected {expected}")
    return {"label": label, "z3": zs, "cvc5": cs, "readback": readback}

def enumerate_fan() -> dict[str, int]:
    graphs = []
    for other in range(5):
        # each row has self plus zero/one chosen off-diagonal edge
        g = {(i, j): (j == i or (other < 4 and j == other and i == 0)) for i in SLOTS for j in SLOTS}
        graphs.append(g)
    # Exact finite kernel: every allowed 4-row graph has a mutual omitted pair.
    total = mutual = 0
    for choices in itertools.product(range(5), repeat=4):
        g = {(i, j): (j == i or (choices[i] < 4 and j == choices[i])) for i in SLOTS for j in SLOTS}
        total += 1
        if any(not g[i, j] and not g[j, i] for i in SLOTS for j in SLOTS if i < j): mutual += 1
    return {"allowed_graphs": total, "with_mutual_omission": mutual}

def enumerate_modes() -> dict[str, int]:
    eq = cap = cross = 0
    for bs in itertools.product(range(4), repeat=4):
        for cs in itertools.product(range(3), repeat=4):
            eq += int(any(bs[i] == bs[j] for i in SLOTS for j in SLOTS if i < j))
            cap += int(any(cs[i] == cs[j] and bs[i] != bs[j] for i in SLOTS for j in SLOTS if i < j))
            cross += int(any(bs[i] != bs[j] for i in SLOTS for j in SLOTS if i < j))
    return {"blocker_equality_assignments": eq, "same_cap_distinct_blocker_assignments": cap, "distinct_blocker_assignments": cross}

def sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()

def main() -> None:
    results: dict[str, Any] = {"campaign": "freshthird_firstnonhit_source_fan_v1", "scope": "retained robust exact-four rows only", "enumeration": {"fan": enumerate_fan(), "modes": enumerate_modes()}, "positive": [], "controls": []}
    for nh, inter in MODES:
        mode_label = f"nh_{nh}__interaction_{inter}"
        for arm in ARMS:
            label = f"{mode_label}__arm{''.join(map(str, arm))}"
            s, ctx = build(mode=(nh, inter), arm=arm)
            results["positive"].append(check(label, s, ctx, "sat"))
    controls = (("negative_overfull_exact_four", dict(overfull=True)), ("negative_missing_self_shell", dict(no_self=True)), ("negative_forbidden_source_membership", dict(source_present=True)), ("negative_no_mutual_cross_pair", dict(no_cross=True)))
    for label, kw in controls:
        s, ctx = build(**kw)
        results["controls"].append(check(label, s, ctx, "unsat", source_present=kw.get("source_present", False)))
    results["source_hashes"] = {k: sha(v) for k, v in SOURCE_FILES.items()}
    artifact_paths = sorted((ROOT / "artifacts").glob("*.smt2"))
    results["artifact_count"] = len(artifact_paths)
    results["artifact_hashes"] = {str(p.relative_to(ROOT)): sha(p) for p in artifact_paths}
    (ROOT / "results.json").write_text(json.dumps(results, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    hash_lines = [f"{digest}  {name}" for name, digest in sorted({**results["source_hashes"], **results["artifact_hashes"]}.items())]
    (ROOT / "SHA256SUMS").write_text("\n".join(hash_lines) + "\n", encoding="utf-8")
    print(json.dumps({"positive_cases": len(results["positive"]), "controls": results["controls"], "enumeration": results["enumeration"]}, sort_keys=True))

if __name__ == "__main__":
    main()
