"""Bounded exact incidence/order probe for the FreshThird packet.

Labels are partitioned into a direct zero-cut boundary:
  z | U (fresh cap) | V (surplus) | W (canonical source cap).
The source shell Ks and fresh shell Kf have cardinality four and overlap
exactly in q1,q2.  We test whether these constraints force the strict
Kalmanson ingress ``max(c,f) < min(q1,q2)``.
"""

from itertools import permutations

U = ("f", "q1", "u")       # fresh center, endpoint q1, extra fresh-shell point
V = ("q2", "v")             # endpoint q2, extra fresh-shell point
W = ("c", "s", "t")        # source center, canonical source point, extra source point

KS = frozenset(("q1", "q2", "s", "t"))
KF = frozenset(("q1", "q2", "u", "v"))
assert len(KS) == len(KF) == 4 and KS & KF == frozenset(("q1", "q2"))


def packet_order(order):
    pos = {x: i for i, x in enumerate(order)}
    c, f, q1, q2 = (pos[x] for x in ("c", "f", "q1", "q2"))
    # Existing endpoint producer: exactly one endpoint lies between centers.
    between = lambda q: min(c, f) < q < max(c, f)
    alternating = between(q1) != between(q2)
    # Strict Kalmanson ingress needed by the proposed consumer.
    late = max(c, f) < min(q1, q2)
    return alternating, late, pos


orders = []
for u in permutations(U):
    for v in permutations(V):
        for w in permutations(W):
            order = ("z",) + u + v + w
            alt, late, pos = packet_order(order)
            if alt:
                orders.append((order, late, pos))

assert orders, "packet constraints unexpectedly inconsistent"
counter = next((x for x in orders if not x[1]), None)
forced = all(x[1] for x in orders)

print("Ks=", sorted(KS), "Kf=", sorted(KF), "overlap=", sorted(KS & KF))
print("packet-compatible orders=", len(orders))
print("strict-late forced?", forced)
if counter:
    order, late, pos = counter
    print("COUNTEREXAMPLE order=", order)
    print("indices=", {k: pos[k] for k in ("c", "f", "q1", "q2", "s")})
    print("alternation=True strict_late=", late)

# Exact rational square witness for the only forced packet order q1 < f < q2 < c.
# Both shared points are at equal distance from both centers, yet the generic
# Kalmanson inequality remains strict rather than contradictory.
xy = {"c": (0, 0), "f": (2, 0), "q1": (1, 1), "q2": (1, -1)}
sq = lambda a, b: (xy[a][0] - xy[b][0]) ** 2 + (xy[a][1] - xy[b][1]) ** 2
print("square shared radii d2(c,q1)=d2(c,q2)=d2(f,q1)=d2(f,q2)=", sq("c", "q1"))
print("Kalmanson q1<f<q2<c: lhs=2*sqrt(2), rhs=4, strict=", 2 * 2**0.5 < 4)
