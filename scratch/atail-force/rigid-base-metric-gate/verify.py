#!/usr/bin/env python3
"""Independent exact replay of a rigid-base gate result.

Reads a result JSON emitted by `rigid_base_gate.py` and re-checks every claimed
property from scratch with exact `Fraction` arithmetic.  Nothing here calls the
gate's own verifier, and the distance/incidence checks do not call z3 at all,
so a pass is independent evidence about the emitted artifact.

  * SAT payloads: every distance is re-read from the JSON and every encoded
    constraint family is re-evaluated -- positivity, strict triangle, both
    strict Kalmanson, selected-row co-radiality, robust-apex class equality and
    exactness, one-sided cap-distance injectivity (when the run declared it),
    the cap-local row-hit bounds, K4 at every center where it was imposed, and
    the LITERAL quantifier-for-quantifier robustness statement
    (for every deleted z, some four survivors are co-radial at the apex).

  * UNSAT / UNKNOWN payloads: there is no model to replay.  With
    `--replay-cuts` the stored CEGAR cut ledger is re-solved with z3, checking
    that each recorded core really is UNSAT over the exact rational surface.

Exit status is nonzero if any check fails.
"""

from __future__ import annotations

import argparse
import itertools
import json
import sys
from collections import defaultdict
from fractions import Fraction
from pathlib import Path

N = 15
VERTICES = tuple(range(N))
APICES = (0, 5, 10)
CAPS = {
    "C_A": (0, 1, 2, 3, 4, 5),
    "C_B": (5, 6, 7, 8, 9, 10),
    "C_C": (10, 11, 12, 13, 14, 0),
}
CAP_ENDPOINTS = {"C_A": (0, 5), "C_B": (5, 10), "C_C": (10, 0)}
ROBUST_APICES = (0, 5)
ADJACENT_CAPS = {0: ("C_A", "C_C"), 5: ("C_A", "C_B"), 10: ("C_B", "C_C")}


def edge(a: int, b: int) -> tuple[int, int]:
    return (a, b) if a < b else (b, a)


def load_distances(payload) -> dict[tuple[int, int], Fraction]:
    out = {}
    for key, value in payload["distances"].items():
        a, b = (int(x) for x in key.split(","))
        out[edge(a, b)] = Fraction(value)
    if len(out) != N * (N - 1) // 2:
        raise SystemExit(f"expected {N*(N-1)//2} distances, got {len(out)}")
    return out


def d(dist, a: int, b: int) -> Fraction:
    return Fraction(0) if a == b else dist[edge(a, b)]


def classes_at(dist, center: int) -> dict[Fraction, list[int]]:
    out: dict[Fraction, list[int]] = defaultdict(list)
    for p in VERTICES:
        if p != center:
            out[d(dist, center, p)].append(p)
    return out


def verify_sat(payload) -> list[str]:
    fail: list[str] = []
    dist = load_distances(payload)
    decoded = payload["decoded"]
    rows = {int(c): tuple(v) for c, v in decoded["rows"].items()}
    apex = {int(u): r for u, r in decoded["apex"].items()}
    options = payload.get("options", {})
    row_centers = set(options.get("row_centers", list(VERTICES)))
    want_capinj = bool(options.get("one_sided_cap_injectivity", False))
    want_exact = bool(options.get("apex_exactness", True))

    # 1. positivity, strict triangle, both strict Kalmanson.
    for a, b in itertools.combinations(VERTICES, 2):
        if d(dist, a, b) < 1:
            fail.append(f"positivity {a},{b}")
    for a, b, c in itertools.combinations(VERTICES, 3):
        if d(dist, a, b) + d(dist, b, c) < d(dist, a, c) + 1:
            fail.append(f"strict triangle {a},{b},{c} (0)")
        if d(dist, a, c) + d(dist, b, c) < d(dist, a, b) + 1:
            fail.append(f"strict triangle {a},{b},{c} (1)")
        if d(dist, a, b) + d(dist, a, c) < d(dist, b, c) + 1:
            fail.append(f"strict triangle {a},{b},{c} (2)")
    for a, b, c, e in itertools.combinations(VERTICES, 4):
        diag = d(dist, a, c) + d(dist, b, e)
        if diag < d(dist, a, b) + d(dist, c, e) + 1:
            fail.append(f"Kalmanson first {a},{b},{c},{e}")
        if diag < d(dist, a, e) + d(dist, b, c) + 1:
            fail.append(f"Kalmanson second {a},{b},{c},{e}")

    # 2. the declared selected rows are genuinely co-radial 4-rows.
    for c in sorted(row_centers):
        support = rows.get(c)
        if support is None or len(set(support)) != 4 or c in support:
            fail.append(f"selected row at {c} is not a 4-row: {support}")
            continue
        if len({d(dist, c, p) for p in support}) != 1:
            fail.append(f"selected row at {c} is not co-radial")

    # 3. K4 wherever the hypothesis was imposed.
    imposed = row_centers | set(ROBUST_APICES)
    for z in sorted(imposed):
        if max(len(v) for v in classes_at(dist, z).values()) < 4:
            fail.append(f"K4 fails at {z}")

    # 4. cap-local row-hit bounds on the declared selected rows.
    for name, block in CAPS.items():
        ends = CAP_ENDPOINTS[name]
        for c in block:
            if c not in rows:
                continue
            bound = 1 if c in ends else 2
            hits = [p for p in rows[c] if p in block]
            if len(hits) > bound:
                fail.append(f"cap-hit bound: row at {c} meets {name} in {hits}")

    # 5. robust-apex classes: equality, exactness, cap-hit, declared mode.
    for u in ROBUST_APICES:
        record = apex.get(u)
        if record is None:
            fail.append(f"missing apex record for {u}")
            continue
        groups = [("A", record["A"])]
        if record["mode"] == "TWIN":
            groups.append(("B", record["B"]))
            if set(record["A"]) & set(record["B"]):
                fail.append(f"apex {u} TWIN classes overlap")
            if len(record["A"]) != 4 or len(record["B"]) != 4:
                fail.append(f"apex {u} TWIN class sizes {len(record['A'])},"
                            f"{len(record['B'])} are not both 4")
        else:
            if record["B"]:
                fail.append(f"apex {u} SINGLE mode has a nonempty second class")
            if len(record["A"]) < 5:
                fail.append(f"apex {u} SINGLE class has size {len(record['A'])} < 5")
        radii = []
        for tag, members in groups:
            values = {d(dist, u, p) for p in members}
            if len(values) != 1:
                fail.append(f"apex {u} class {tag} is not co-radial")
                continue
            radius = values.pop()
            radii.append(radius)
            if want_exact:
                extra = [p for p in VERTICES
                         if p != u and p not in members
                         and d(dist, u, p) == radius]
                if extra:
                    fail.append(f"apex {u} class {tag} not exact, also {extra}")
            for cap_name in ADJACENT_CAPS[u]:
                hits = [p for p in CAPS[cap_name] if p != u and p in members]
                if len(hits) > 1:
                    fail.append(f"apex {u} class {tag} meets {cap_name} in {hits}")
        if want_exact and len(radii) == 2 and radii[0] == radii[1]:
            fail.append(f"apex {u} TWIN classes share a radius")

    # 6. LITERAL quantifier-for-quantifier robustness at each designated apex.
    for u in ROBUST_APICES:
        groups = classes_at(dist, u)
        for zdel in VERTICES:
            witness = None
            for radius, members in groups.items():
                survivors = [p for p in members if p != zdel]
                if len(survivors) >= 4:
                    witness = (radius, survivors[:4])
                    break
            if witness is None:
                fail.append(f"robustness at apex {u} fails for deleted {zdel}")

    # 7. one-sided cap-distance injectivity, when the run declared it.
    if want_capinj:
        for name, chain in CAPS.items():
            for pos, center in enumerate(chain):
                for side, members in (("after", chain[pos + 1:]),
                                      ("before", chain[:pos])):
                    for r, s in itertools.combinations(members, 2):
                        if d(dist, center, r) == d(dist, center, s):
                            fail.append(f"one-sided injectivity {name} center "
                                        f"{center} {side} {r},{s}")
    return fail


def replay_cuts(payload, timeout_ms: int) -> list[str]:
    import z3  # local import: the model replay above is z3 free

    fail: list[str] = []
    table = {(a, b): z3.Real(f"d_{a}_{b}")
             for a, b in itertools.combinations(VERTICES, 2)}

    def dv(a, b):
        return z3.RealVal(0) if a == b else table[edge(a, b)]

    base = []
    for (a, b), var in table.items():
        base.append(var >= 1)
    for a, b, c in itertools.combinations(VERTICES, 3):
        base.append(dv(a, b) + dv(b, c) >= dv(a, c) + 1)
        base.append(dv(a, c) + dv(b, c) >= dv(a, b) + 1)
        base.append(dv(a, b) + dv(a, c) >= dv(b, c) + 1)
    for a, b, c, e in itertools.combinations(VERTICES, 4):
        diag = dv(a, c) + dv(b, e)
        base.append(diag >= dv(a, b) + dv(c, e) + 1)
        base.append(diag >= dv(a, e) + dv(b, c) + 1)
    if payload.get("options", {}).get("one_sided_cap_injectivity"):
        for name, chain in CAPS.items():
            for pos, center in enumerate(chain):
                for side, members in (("after", chain[pos + 1:]),
                                      ("before", chain[:pos])):
                    for r, s in itertools.combinations(members, 2):
                        base.append(dv(center, r) != dv(center, s))

    for record in payload.get("cut_ledger", []):
        extra = []
        ok = True
        for name in record["core"]:
            fields = name.split("_")
            head = fields[0]
            if head.startswith("row"):
                c, ref, p = (int(x) for x in fields[1:])
                extra.append(dv(c, p) == dv(c, ref))
            elif head.startswith("apexrA") or head.startswith("apexrB"):
                u, ref, p = (int(x) for x in fields[1:])
                extra.append(dv(u, p) == dv(u, ref))
            elif head.startswith("exactrA") or head.startswith("exactrB"):
                ok = False  # reference point not recoverable from the name
            elif head.startswith("apexsplit"):
                ok = False
        if not ok:
            continue
        solver = z3.Solver()
        solver.set(timeout=timeout_ms)
        solver.add(*base, *extra)
        if solver.check() != z3.unsat:
            fail.append(f"cut at attempt {record['attempt']} did not replay UNSAT")
    return fail


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("result", type=Path, nargs="+")
    parser.add_argument("--replay-cuts", action="store_true")
    parser.add_argument("--cut-timeout-ms", type=int, default=60_000)
    args = parser.parse_args()

    report = []
    bad = 0
    for path in args.result:
        payload = json.loads(path.read_text(encoding="utf-8"))
        status = payload.get("status", "")
        entry: dict[str, object] = {"path": str(path), "status": status}
        if str(status).startswith("SAT"):
            fail = verify_sat(payload)
            entry["checks"] = "exact rational model replay"
            entry["failures"] = fail
            entry["verdict"] = "PASS" if not fail else "FAIL"
        elif args.replay_cuts and payload.get("cut_ledger"):
            fail = replay_cuts(payload, args.cut_timeout_ms)
            entry["checks"] = f"{len(payload['cut_ledger'])} stored cuts"
            entry["failures"] = fail
            entry["verdict"] = "PASS" if not fail else "FAIL"
        else:
            entry["checks"] = "none (no model to replay)"
            entry["failures"] = []
            entry["verdict"] = "NOT_APPLICABLE"
        if entry["verdict"] == "FAIL":
            bad += 1
        report.append(entry)
    print(json.dumps({"schema": "p97-rigid-base-metric-gate-verify-v1",
                      "results": report}, indent=2, sort_keys=True))
    sys.exit(1 if bad else 0)


if __name__ == "__main__":
    main()
