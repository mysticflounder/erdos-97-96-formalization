"""One bounded cap-eight/common-radius/same-blocker diagnostic wave.

The six strict-cap vertices are represented by pair-radius times rational unit
directions after translating the common apex to zero, normalizing the first
pair radius, and rotating the first cap ray to ``t_0 = 0``.  The finite gate
keeps source-compatible aliases of the Q blocker and two retained-pair
blockers, together with the exact same-cap betweenness consequence.
Surviving aliases are checked by independent Z3 and cvc5 QF_NRA queries.

This is a bounded diagnostic, not a universal proof or a Lean closure.
"""

from __future__ import annotations

import hashlib
import json
import subprocess
import time
from concurrent.futures import ThreadPoolExecutor
from itertools import combinations
from pathlib import Path
from typing import Any

import z3

ROOT = Path(__file__).resolve().parent
ART = ROOT / "artifacts"
ART.mkdir(exist_ok=True)
N = 6
TIMEOUT_MS = 5_000
PAIR_NAMES = ("P", "R", "C")


def rev_pairing(p: tuple[int, ...]) -> tuple[int, ...]:
    return tuple(5 - i for i in p)


def pairings() -> list[tuple[tuple[int, int], tuple[int, int], tuple[int, int]]]:
    out: set[tuple[tuple[int, int], tuple[int, int], tuple[int, int]]] = set()
    slots = set(range(N))
    for p in combinations(range(N), 2):
        rem = sorted(slots - set(p))
        for r in combinations(rem, 2):
            c = tuple(sorted(set(rem) - set(r)))
            q = (tuple(sorted(p)), tuple(sorted(r)), c)
            rq = tuple(tuple(sorted(5 - i for i in pair)) for pair in q)
            out.add(min(q, rq))
    return sorted(out)


def between(pair: tuple[int, int], center: int) -> bool:
    return min(pair) < center < max(pair)


def aliases() -> list[dict[str, Any]]:
    rows: list[dict[str, Any]] = []
    for pairs in pairings():
        P, R, C = pairs
        retained = set(P) | set(R)
        for q in sorted(retained):
            for bp in range(N):
                for br in range(N):
                    if len({q, bp, br}) != 3:
                        continue
                    if bp in P or br in R:
                        continue
                    if not between(P, bp) or not between(R, br):
                        continue
                    # q is the common Q blocker center and is one of the four
                    # retained vertices; the C pair is the canonical source pair.
                    rows.append({"P": P, "R": R, "C": C, "q": q, "bp": bp, "br": br})
    return rows


def d2(x: list[z3.ArithRef], y: list[z3.ArithRef], i: int, j: int) -> z3.ArithRef:
    return (x[i] - x[j]) ** 2 + (y[i] - y[j]) ** 2


def orient(x: list[z3.ArithRef], y: list[z3.ArithRef], a: int, b: int, c: int) -> z3.ArithRef:
    return (x[b] - x[a]) * (y[c] - y[a]) - (y[b] - y[a]) * (x[c] - x[a])


def direction_dot_num(ti: z3.ArithRef, tj: z3.ArithRef) -> z3.ArithRef:
    return (1 - ti ** 2) * (1 - tj ** 2) + 4 * ti * tj


def direction_equidistant(t: list[z3.ArithRef], center: int,
                          left: int, right: int) -> z3.ArithRef:
    """Denominator-free equal-dot-product equation for blocker directions."""
    return direction_dot_num(t[center], t[left]) * (1 + t[right] ** 2) \
        - direction_dot_num(t[center], t[right]) * (1 + t[left] ** 2)


def build(alias: dict[str, Any], include_metric: bool = True,
          extra: list[z3.BoolRef] | None = None) -> z3.Solver:
    s = z3.Solver()
    s.set(timeout=TIMEOUT_MS)
    t = [z3.Real(f"t{i}") for i in range(N)]
    x = [z3.Real(f"x{i}") for i in range(N)]
    y = [z3.Real(f"y{i}") for i in range(N)]
    sR, sC = z3.Reals("sR sC")
    radii = [1 if i in alias["P"] else sR if i in alias["R"] else sC for i in range(N)]
    # Translate apex to zero, normalize the P pair radius to one, and rotate
    # the first cap ray to t_0 = 0.  No t-order or coordinate box is added.
    s.add(t[0] == 0, sR > 0, sC > 0, sR != 1, sC != 1, sR != sC)
    for i in range(N):
        den = 1 + t[i] ** 2
        s.add(den * x[i] == radii[i] * (1 - t[i] ** 2))
        s.add(den * y[i] == radii[i] * (2 * t[i]))
    # The source gives the six vertices as an increasing cyclic subsequence.
    # We leave the apex order unconstrained and use every increasing triple.
    for a, b, c in combinations(range(N), 3):
        s.add(orient(x, y, a, b, c) > 0)
    if not include_metric:
        if extra:
            s.add(*extra)
        return s
    P, R, C = alias["P"], alias["R"], alias["C"]
    q, bp, br = alias["q"], alias["bp"], alias["br"]
    # Equal pair radii make actual-blocker equal distances equivalent to
    # equal dot products of directions; all scale factors are positive.
    s.add(direction_equidistant(t, bp, P[0], P[1]) == 0)
    s.add(direction_equidistant(t, br, R[0], R[1]) == 0)
    s.add(direction_equidistant(t, q, C[0], C[1]) == 0)
    if extra:
        s.add(*extra)
    return s


def smt2(alias: dict[str, Any], include_metric: bool = True,
         extra: list[z3.BoolRef] | None = None) -> str:
    # Ask Z3 for the canonical SMT2 text; this keeps cvc5's query identical.
    return build(alias, include_metric, extra).sexpr().replace(
        f"(set-option :timeout {TIMEOUT_MS})", ""
    ) + "\n(check-sat)\n"


def run(cmd: list[str], path: Path) -> tuple[str, str, float]:
    t0 = time.monotonic()
    p = subprocess.run(cmd + [str(path)], capture_output=True, text=True,
                       timeout=TIMEOUT_MS / 1000 + 8)
    out, err = p.stdout.strip(), p.stderr.strip()
    if not out:
        out = "timeout" if "timeout" in err.lower() else "unknown"
    return out, err, time.monotonic() - t0


def one_query(idx: int, row: dict[str, Any]) -> dict[str, Any]:
    path = ART / f"survivor_{idx:03d}.smt2"
    zout, zerr, zsec = run(["/Users/adam/bin/z3", "-smt2", f"-T:{TIMEOUT_MS // 1000}"], path)
    cout, cerr, csec = run(["/Users/adam/bin/cvc5", "--lang", "smt2", "--tlimit", str(TIMEOUT_MS)], path)
    return {"index": idx, "alias": row, "z3": zout, "cvc5": cout,
            "z3_seconds": round(zsec, 3), "cvc5_seconds": round(csec, 3),
            "z3_stderr": zerr[-300:], "cvc5_stderr": cerr[-300:]}


def main() -> None:
    rows = aliases()
    # Artifacts are intentionally limited to the finite gate survivors.
    for idx, row in enumerate(rows):
        (ART / f"survivor_{idx:03d}.smt2").write_text(smt2(row))
    with ThreadPoolExecutor(max_workers=12) as pool:
        outcomes = list(pool.map(lambda p: one_query(*p), enumerate(rows)))
    # Exact-rational model readback is deliberately serial because the Python
    # Z3 context is process-global.  It runs only for external SAT results.
    for outcome in outcomes:
        outcome["z3_exact_rational_model"] = False
        if outcome["z3"] == "sat":
            for seed in (0, 1, 4, 9):
                check = build(rows[outcome["index"]])
                check.set(timeout=20_000, random_seed=seed)
                if check.check() == z3.sat:
                    model = check.model()
                    outcome["z3_exact_rational_model"] = all(
                        z3.is_true(model.eval(a, model_completion=True)) for a in check.assertions()
                    )
                    if outcome["z3_exact_rational_model"]:
                        break
    controls: list[dict[str, Any]] = []
    if rows:
        known = ART / "control_known_sat_geometry.smt2"
        known_t = [z3.Real(f"t{i}") for i in range(N)]
        known_extra = [known_t[i] == z3.RealVal(i) / 10 for i in range(N)]
        known_extra += [z3.Real("sR") == z3.RealVal(101) / 100,
                        z3.Real("sC") == z3.RealVal(51) / 50]
        known.write_text(smt2(rows[0], include_metric=False, extra=known_extra))
        bad = ART / "control_bad_orientation.smt2"
        x0, y0, x1, y1, x2, y2 = z3.Reals("x0 y0 x1 y1 x2 y2")
        bad.write_text(smt2(rows[0], include_metric=False,
                             extra=[orient([x0, x1, x2, *z3.Reals("x3 x4 x5")],
                                           [y0, y1, y2, *z3.Reals("y3 y4 y5")], 0, 1, 2) <= 0]))
        for label, control in (("known_sat_geometry", known), ("bad_orientation", bad)):
            for name, cmd in (("z3", ["/Users/adam/bin/z3", "-smt2", f"-T:{TIMEOUT_MS // 1000}" ]),
                              ("cvc5", ["/Users/adam/bin/cvc5", "--lang", "smt2", "--tlimit", str(TIMEOUT_MS)])):
                out, err, sec = run(cmd, control)
                controls.append({"control": label, "solver": name, "result": out,
                                 "seconds": round(sec, 3), "stderr": err[-300:]})
        check = build(rows[0], include_metric=False, extra=known_extra)
        model_ok = check.check() == z3.sat and all(
            z3.is_true(check.model().eval(a, model_completion=True)) for a in check.assertions()
        )
        for item in controls:
            if item["control"] == "known_sat_geometry" and item["solver"] == "z3":
                item["z3_exact_rational_model"] = model_ok
    result = {
        "wave": "freshthird_firstnonhit_cap8_blocker_cycle_v1",
        "scope": "cap-card=8, common-radius, sameBlocker; six general planar strict-convex vertices; source-compatible aliases only",
        "finite_gate": {"pairings_up_to_reversal": len(pairings()), "survivors": len(rows),
                        "rule": "same-cap equidistant center strictly between own pair; q in retained pair union; centers pairwise distinct",
                        "omitted": ["ambient carrier beyond six cap vertices", "all K4 rows", "global cyclic order outside cap", "finite-to-universal lift"]},
        "outcomes": outcomes,
        "controls": controls,
        "classification": "diagnostic only; no universal producer or Lean closure",
    }
    (ROOT / "results.json").write_text(json.dumps(result, indent=2) + "\n")
    hashes = {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest()
              for p in sorted(ART.glob("*.smt2"))}
    (ROOT / "SHA256SUMS.json").write_text(json.dumps(hashes, indent=2) + "\n")
    print(json.dumps({"pairings": len(pairings()), "survivors": len(rows),
                      "results": len(outcomes), "controls": len(controls)}))


if __name__ == "__main__":
    main()
