#!/usr/bin/env python3
"""Emit a fully pinned, finite SMT-LIB check of the corrected v2 projection."""

from pathlib import Path

OUT = Path(__file__).parent
D = range(15)
CEN = {
    0: 9,
    1: 9,
    2: 10,
    3: 10,
    4: 11,
    5: 11,
    6: 11,
    7: 11,
    8: 12,
    11: 12,
    14: 12,
    9: 13,
    12: 13,
    10: 14,
    13: 14,
}
ROWS = {
    9: {0, 1, 12, 13},
    10: {2, 3, 12, 14},
    11: {4, 5, 6, 7},
    12: {8, 11, 14, 0},
    13: {9, 12, 1, 2},
    14: {10, 13, 0, 3},
}
NAMES = {
    "pa": 0,
    "pb": 1,
    "ra": 2,
    "rb": 3,
    "qa": 4,
    "qb": 5,
    "ca": 6,
    "cb": 7,
    "oa": 8,
    "co": 0,
    **{f"g{i}": i for i in range(15)},
}


def a(s):
    return f"(assert {s})"


def mem(u, v):
    return f"(mem {u} {v})"


def blocked(u, c):
    return f"(blocked {u} {c})"


def cen(u):
    return f"(cen {u})"


def sum_ite(terms):
    return "(+ " + " ".join(f"(ite {t} 1 0)" for t in terms) + ")"


def query(extra=(), *, get_model=True):
    q = [
        "; exact finite expansion of every firstnonhit_v2.in clause family",
        "(set-logic QF_UFLIA)",
    ]
    if get_model:
        q.append("(set-option :produce-models true)")
    q += [
        "(declare-fun cen (Int) Int)",
        "(declare-fun mem (Int Int) Bool)",
        "(declare-fun blocked (Int Int) Bool)",
    ]
    for name in NAMES:
        q.append(f"(declare-const {name} Int)")
    # Pin the explicit carrier and all named values.
    for u in D:
        q.append(a(f"(= {cen(u)} {CEN[u]})"))
        for v in D:
            q.append(a(f"(= {mem(u, v)} {'true' if v in ROWS[CEN[u]] else 'false'})"))
            q.append(a(f"(= {blocked(u, v)} {'true' if v == CEN[u] else 'false'})"))
    for name, value in NAMES.items():
        q.append(a(f"(= {name} {value})"))

    # Universal carrier/row schema, expanded over 0..14.
    for u in D:
        q.append(a(f"(not (= {cen(u)} {u}))"))
        q.append(a(mem(u, u)))
        q.append(a(f"(= {sum_ite([mem(u, v) for v in D])} 4)"))
        q.append(a(blocked(u, CEN[u])))
    for u in D:
        for v in D:
            if CEN[u] == CEN[v]:
                for w in D:
                    q.append(a(f"(= {mem(u, w)} {mem(v, w)})"))
            else:
                q.append(
                    a(
                        f"(<= {sum_ite([f'(and {mem(u, w)} {mem(v, w)})' for w in D])} 2)"
                    )
                )
        for v in D:
            # blocked(v, cen(u)) -> mem(u,v)
            q.append(a(f"(or (not {blocked(v, CEN[u])}) {mem(u, v)})"))
    # Every actual blocker fiber has at most four carrier sources.
    for c in D:
        q.append(a(f"(<= {sum_ite([f'(= (cen {u}) {c})' for u in D])} 4)"))

    pa, pb, ra, rb = (NAMES[x] for x in ("pa", "pb", "ra", "rb"))
    qa, qb, ca, cb, oa, co = (NAMES[x] for x in ("qa", "qb", "ca", "cb", "oa", "co"))
    for x, y in ((pa, pb), (ra, rb)):
        q.append(a(f"(not (= {x} {y}))"))
    for x in (pa, pb):
        for y in (ra, rb):
            q.append(a(f"(not (= {x} {y}))"))
    q += [a(f"(not (= {qa} {qb}))"), a(f"(not (= {ca} {cb}))")]
    for x in (qa, qb):
        for y in (pa, pb, ra, rb):
            q.append(a(f"(not (= {x} {y}))"))
    for x in (ca, cb):
        for y in (pa, pb, ra, rb):
            q.append(a(f"(not (= {x} {y}))"))
    for x in (ca, cb, pa, pb, ra, rb):
        q.append(a(f"(not (= {x} {oa}))"))

    # Q/C same-blocker branch.
    q += [
        a(mem(qa, qb)),
        a(mem(qb, qa)),
        a(f"(not (= {cen(qa)} {cen(pa)}))"),
        a(f"(not (= {cen(qa)} {cen(ra)}))"),
        a(f"(= {cen(qa)} {cen(qb)})"),
        a(f"(= {cen(ca)} {cen(qa)})"),
        a(f"(= {cen(cb)} {cen(qa)})"),
        a(f"(not (= {cen(ca)} {oa}))"),
        a(f"(not (= {cen(cb)} {oa}))"),
    ]
    for c in (ca, cb):
        q.append(a(f"(or (not (and {mem(c, pa)} {mem(c, pb)})))"))
        q.append(a(f"(or (not (and {mem(c, ra)} {mem(c, rb)})))"))
        q.append(a(f"(not {mem(c, co)})"))
        for v in (pa, pb, ra, rb):
            q.append(a(f"(= (not {mem(c, v)}) (not {blocked(v, CEN[c])}))"))
    q += [
        a(f"(or (= {co} {pa}) (= {co} {pb}) (= {co} {ra}) (= {co} {rb}))"),
        a(f"(not {blocked(pa, oa)})"),
        a(f"(not {blocked(ra, oa)})"),
        a(f"(= {cen(pa)} {cen(pb)})"),
        a(f"(= {cen(ra)} {cen(rb)})"),
        a(f"(not (= {cen(ra)} {cen(pa)}))"),
    ]
    gs = [NAMES[f"g{i}"] for i in range(15)]
    q.append(a("(distinct " + " ".join(str(g) for g in gs) + ")"))
    q.extend(extra)
    q.append("(check-sat)")
    if get_model:
        q.append("(get-model)")
    return "\n".join(q) + "\n"


def main():
    (OUT / "pinned_model.smt2").write_text(query())
    (OUT / "malformed_unsat.smt2").write_text(
        query(("(assert (not (= (cen 0) 9)))",), get_model=False)
    )
    (OUT / "known_sat.smt2").write_text(
        "(set-logic QF_LIA)\n(declare-const x Int)\n(assert (= x 0))\n(check-sat)\n"
    )


if __name__ == "__main__":
    main()
