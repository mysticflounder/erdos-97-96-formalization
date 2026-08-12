"""Independent checker for the finite Mace4 interpretation in v2-mace4.log."""

import re
from pathlib import Path

LOG = Path(__file__).with_name("v2-mace4.log").read_text()
if "interpretation(" not in LOG:
    print("NO SAT MODEL TO VALIDATE: Mace4 result is fail-closed UNKNOWN")
    raise SystemExit(0)


def ints(text):
    return [int(x) for x in re.findall(r"\d+", text)]


def function(name):
    m = re.search(rf"function\({re.escape(name)}, \[([^]]+)\]\)", LOG, re.DOTALL)
    assert m, name
    vals = ints(m.group(1))
    assert len(vals) == 1, (name, vals)
    return vals[0]


def array(kind, name):
    m = re.search(rf"{kind}\({re.escape(name)}, \[(.*?)\]\)(?:,|\s*\])", LOG, re.DOTALL)
    assert m, name
    return ints(m.group(1))


n = int(re.search(r"interpretation\(\s*(\d+)", LOG).group(1))
cen = array("function", "cen(_)")
car = array("relation", "car(_)")
blocked = array("relation", "blocked(_,_)")
mem = array("relation", "mem(_,_)")
assert n == 15 and len(cen) == len(car) == n
assert len(blocked) == len(mem) == n * n


def C(x):
    return car[x] == 1


def B(x, y):
    return blocked[x * n + y] == 1


def M(x, y):
    return mem[x * n + y] == 1


def F(name):
    return function(name)


checks = 0


def ok(condition, label):
    global checks
    checks += 1
    assert condition, label


for u in range(n):
    if C(u):
        ok(C(cen[u]), f"car(cen({u}))")
        ok(cen[u] != u, f"cen({u}) != {u}")
        ok(M(u, u), f"mem({u},{u})")
        support = {v for v in range(n) if M(u, v)}
        ok(len(support) == 4, f"exact-four support {u}: {support}")
for u in range(n):
    for v in range(n):
        if M(u, v):
            ok(C(u) and C(v), f"carrier support {u},{v}")
        if C(u) and C(v) and cen[u] == cen[v]:
            ok(
                [M(u, w) for w in range(n)] == [M(v, w) for w in range(n)],
                f"equal-center support {u},{v}",
            )
        if C(u) and C(v) and B(v, cen[u]):
            ok(M(u, v), f"blocked support {u},{v}")
    if C(u):
        ok(B(u, cen[u]), f"own blocked {u}")
for u in range(n):
    for v in range(n):
        if C(u) and C(v) and cen[u] != cen[v]:
            ok(
                sum(M(u, w) and M(v, w) for w in range(n)) <= 2,
                f"three-common-center guard {u},{v}",
            )
for u in range(n):
    for v in range(n):
        for w in range(n):
            for x in range(n):
                for y in range(n):
                    if (
                        all(C(z) for z in (u, v, w, x, y))
                        and len({cen[u], cen[v], cen[w], cen[x], cen[y]}) == 1
                    ):
                        ok(len({u, v, w, x, y}) <= 4, f"fiber bound {u, v, w, x, y}")

pa, pb, ra, rb = map(F, ("pa", "pb", "ra", "rb"))
qa, qb, ca, cb, oa, co = map(F, ("qa", "qb", "ca", "cb", "oa", "co"))
gs = [F(f"g{i}") for i in range(15)]
for z in (pa, pb, ra, rb, qa, qb, ca, cb, oa, *gs):
    ok(C(z), f"car named {z}")
for x, y in (
    (pa, pb),
    (ra, rb),
    (pa, ra),
    (pa, rb),
    (pb, ra),
    (pb, rb),
    (qa, qb),
    (ca, cb),
    (qa, pa),
    (qa, pb),
    (qa, ra),
    (qa, rb),
    (qb, pa),
    (qb, pb),
    (qb, ra),
    (qb, rb),
    (ca, pa),
    (ca, pb),
    (ca, ra),
    (ca, rb),
    (cb, pa),
    (cb, pb),
    (cb, ra),
    (cb, rb),
    (ca, oa),
    (cb, oa),
    (pa, oa),
    (pb, oa),
    (ra, oa),
    (rb, oa),
):
    ok(x != y, f"distinct {x},{y}")
ok(len(set(gs)) == 15, "fifteen distinct carrier witnesses")
ok(M(qa, qb) and M(qb, qa), "Q mutual shell incidence")
ok(cen[qa] != cen[pa] and cen[qa] != cen[ra], "Q blocker inequalities")
ok(cen[qa] == cen[qb] == cen[ca] == cen[cb], "Q/C same-blocker arm")
ok(cen[ca] != oa and cen[cb] != oa, "C apex inequalities")
for s in (ca, cb):
    ok(not (M(s, pa) and M(s, pb)), f"{s} omits P endpoint")
    ok(not (M(s, ra) and M(s, rb)), f"{s} omits P-rho endpoint")
ok(co in (pa, pb, ra, rb) and not M(ca, co) and not M(cb, co), "common omission")
for s in (ca, cb):
    for v in (pa, pb, ra, rb):
        ok((not M(s, v)) == (not B(v, cen[s])), f"omission/survival {s},{v}")
ok(not B(pa, oa) and not B(ra, oa), "opposite-apex no-blocked clauses")
ok(cen[pa] == cen[pb], "P RetainedInteriorBlockerCollision.blockers_eq")
ok(cen[ra] == cen[rb], "P-rho RetainedInteriorBlockerCollision.blockers_eq")
ok(cen[ra] != cen[pa], "hblockersNe")
print(f"VALIDATED clauses/instances: {checks}; domain={n}; carriers={sum(car)}")
