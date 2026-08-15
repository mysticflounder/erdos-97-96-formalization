#!/usr/bin/env python3
"""Bounded exact-17 source-packet preflight for the seventh blocker arms."""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import subprocess
from pathlib import Path

from z3 import Bool, Int, If, Solver, sat, unsat, is_true

ROOT = Path(__file__).resolve().parent
N = 17
POINTS = range(N)
SOURCE = ROOT.parents[2] / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFirstFiberCollision.lean"


def exact4(row: list) -> object:
    return sum(If(x, 1, 0) for x in row) == 4


def rows(prefix: str) -> list:
    return [Bool(f"{prefix}_{i}") for i in POINTS]


def base_equal(control: bool = False):
    e7, ab7 = rows("E7"), rows("AB7")
    ce, ca, e = Int("centerE7"), Int("centerAB7"), Int("escapePoint")
    a = [exact4(e7), exact4(ab7), e == 0, e7[0], ab7[0], ce == ca,
         ab7[0] == e7[0], ce == 7, ca == 7]
    # Source theorem transports complete support; the control deliberately
    # contradicts that equality at one point.
    if control:
        a += [e7[i] == ab7[i] for i in POINTS]
        a += [e7[3], Not(ab7[3])]
    else:
        a += [e7[i] == ab7[i] for i in POINTS]
    return {"E7": e7, "AB7": ab7, "centerE7": ce, "centerAB7": ca, "escapePoint": e}, a


def base_apex(control: bool = False):
    e7, kz, kw = rows("E7"), rows("Kz"), rows("Kw")
    z, w, esc, cz, cw = Int("z"), Int("w"), Int("escapeCenter"), Int("centerZ"), Int("centerW")
    a = [exact4(e7), exact4(kz), exact4(kw), z == 0, w == 1,
         e7[0], e7[1], z != w, Not(kz[1]), Not(kw[0]),
         esc == 10, cz == 11, cw == 12, cz != cw]
    if control:
        a += [cz == cw]
    return {"E7": e7, "Kz": kz, "Kw": kw, "z": z, "w": w,
            "escapeCenter": esc, "centerZ": cz, "centerW": cw}, a


def Not(x):
    # Keep the encoder's source map readable without importing every Z3 name.
    from z3 import Not as znot
    return znot(x)


def smt2(name: str, data: dict, assertions: list) -> str:
    s = Solver()
    s.add(*assertions)
    # Solver.sexpr is intentionally the exact pre-solver formula dump.
    return "; schema=freshthird_seventh_blocker_two_arm_v1\n" + s.sexpr() + "\n(check-sat)\n(get-model)\n"


def z3_run(assertions: list):
    s = Solver()
    s.add(*assertions)
    result = s.check()
    model = {}
    if result == sat:
        for d in s.model().decls():
            model[d.name()] = str(s.model()[d])
    return str(result), model


def cvc5_run(path: Path):
    p = subprocess.run(["cvc5", "--lang", "smt2", "--quiet", "--produce-models", str(path)],
                       text=True, capture_output=True, check=False)
    lines = [x.strip() for x in p.stdout.splitlines() if x.strip()]
    return (lines[0] if lines else "error"), p.stdout, p.stderr


def cvc5_readback(packet: str, status: str, output: str) -> bool:
    if status != "sat":
        return True
    if packet == "equal_center":
        return all(re.search(rf"\(define-fun {name} \(\) Int\s+(-?\d+)\)", output)
                   for name in ("escapePoint", "centerE7", "centerAB7"))
    return all(re.search(rf"\(define-fun {name} \(\) Int\s+(-?\d+)\)", output)
               for name in ("z", "w", "escapeCenter", "centerZ", "centerW"))


def readback(packet: str, model: dict) -> bool:
    if packet == "equal_center":
        return model.get("centerE7") == model.get("centerAB7") and model.get("escapePoint") == "0"
    return (model.get("z") == "0" and model.get("w") == "1" and
            model.get("centerZ") != model.get("centerW") and model.get("escapeCenter") == "10")


CASES = (
    ("equal_center", False),
    ("first_apex", False),
    ("equal_center_support_mismatch", True),
    ("first_apex_center_collapse", True),
)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--validate-only", action="store_true")
    args = ap.parse_args()
    if args.validate_only:
        return subprocess.call([str(ROOT / "validate_artifacts.py")])
    source_hash = hashlib.sha256(SOURCE.read_bytes()).hexdigest()
    manifest = json.loads((ROOT / "source-origin.json").read_text())
    manifest["source_sha256_at_audit"] = source_hash
    (ROOT / "source-origin.json").write_text(json.dumps(manifest, indent=2) + "\n")
    clause_map = {}
    source_clauses = {
        "equal_center": {
            "theorem": "FirstFiberCrossedSeventhBlockerBoundary.escapeRow_support_eq_actualBlockerRow_of_center_eq",
            "lines": "1216-1239",
            "clauses": ["exact4(E7)", "exact4(AB7)", "escapePoint=0 and escapePoint∈E7∩AB7", "centerE7=centerAB7", "∀i, E7_i↔AB7_i"],
        },
        "first_apex": {
            "theorem": "FirstFiberCrossedSeventhBlockerBoundary.exists_mutualCrossDeletionRows_of_escapeCenter_eq_oppApex1",
            "lines": "1296-1334",
            "clauses": ["exact4(E7)", "z,w∈E7", "z≠w", "exact4(Kz), exact4(Kw)", "w∉Kz and z∉Kw", "escapeCenter=oppApex1", "centerZ≠centerW"],
        },
    }
    results = []
    for case, control in CASES:
        packet = "equal_center" if case.startswith("equal_center") else "first_apex"
        data, assertions = base_equal(control) if packet == "equal_center" else base_apex(control)
        artifact = ROOT / f"{case}.smt2"
        artifact.write_text(smt2(case, data, assertions))
        z3_status, model = z3_run(assertions)
        cvc5_status, cvc5_out, cvc5_err = cvc5_run(artifact)
        (ROOT / f"{case}.z3.json").write_text(json.dumps({"status": z3_status, "model": model}, indent=2) + "\n")
        (ROOT / f"{case}.cvc5.log").write_text(cvc5_out + ("\n" + cvc5_err if cvc5_err else ""))
        expected = "unsat" if control else "sat"
        z3_ok = readback(packet, model) if z3_status == "sat" else True
        cvc5_ok = cvc5_readback(packet, cvc5_status, cvc5_out)
        results.append({"case": case, "packet": packet, "z3": z3_status,
                        "cvc5": cvc5_status, "expected": expected,
                        "exact_match": z3_status == cvc5_status == expected,
                        "readback": z3_ok and cvc5_ok,
                        "assertions": len(assertions), "variables": len(data)})
        clause_map[case] = {
            "source": source_clauses[packet],
            "assertion_count": len(assertions),
            "explicit_control": control,
            "omissions": ["metric", "universal_lift", "frozen_survivor"],
        }
    (ROOT / "clause-source-map.json").write_text(json.dumps(clause_map, indent=2) + "\n")
    (ROOT / "results.json").write_text(json.dumps(results, indent=2) + "\n")
    print(json.dumps(results, indent=2))
    return 0 if all(x["exact_match"] and x["readback"] for x in results) else 1


if __name__ == "__main__":
    raise SystemExit(main())
