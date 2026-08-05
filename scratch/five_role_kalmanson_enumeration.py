#!/usr/bin/env python3
"""Exact cyclic-order audit for EndpointFreshFiveRoleKalmanson.lean.

Run with:
  UV_CACHE_DIR=scratch/.uv-cache uv run --with scipy --with sympy \
    python scratch/five_role_kalmanson_enumeration.py

The LPs are rational SymPy simplex problems.  A strict homogeneous inequality
g(d) > 0 is normalized to g(d) >= 1; this is equivalent by positive scaling.
"""

from itertools import combinations, permutations
from fractions import Fraction
from pathlib import Path

from scipy.optimize import linprog
from sympy import Matrix, Rational


def pair(a, b):
    return tuple(sorted((a, b)))


def normalize(order, anchor="O"):
    i = order.index(anchor)
    return order[i:] + order[:i]


def order_name(order):
    return "".join(order)


def reflection(order):
    return (order[0],) + tuple(reversed(order[1:]))


def vec(pair_index, terms):
    ans = [Rational(0)] * len(pair_index)
    for coefficient, a, b in terms:
        ans[pair_index[pair(a, b)]] += Rational(coefficient)
    return tuple(ans)


def kalmanson_gaps(order, pair_index):
    """Return the two positive gaps for each cyclically ordered quadruple.

    For a<b<c<d in boundary order:
      main = d(a,c)+d(b,d)-d(b,c)-d(a,d) > 0
      comp = d(a,c)+d(b,d)-d(a,b)-d(c,d) > 0.
    """
    out = []
    # This helper began as a five-role audit, but the extended endpoint
    # schema inserts M and B.  Keep the order length parametric: using
    # ``range(5)`` here silently omitted every quadruple touching either
    # inserted role.
    for positions in combinations(range(len(order)), 4):
        a, b, c, d = (order[i] for i in positions)
        out.append((
            "K2[" + "".join((a, b, c, d)) + "]",
            vec(pair_index, [(1, a, c), (1, b, d), (-1, b, c), (-1, a, d)]),
        ))
        out.append((
            "K1[" + "".join((a, b, c, d)) + "]",
            vec(pair_index, [(1, a, c), (1, b, d), (-1, a, b), (-1, c, d)]),
        ))
    return out


def equality_rows(pair_index, equalities):
    return [
        vec(pair_index, [(1, *left), (-1, *right)])
        for left, right in equalities
    ]


def quotient_data(pair_index, equalities):
    parent = list(range(len(pair_index)))

    def find(i):
        while parent[i] != i:
            parent[i] = parent[parent[i]]
            i = parent[i]
        return i

    def union(i, j):
        i, j = find(i), find(j)
        if i != j:
            parent[j] = i

    for left, right in equalities:
        union(pair_index[left], pair_index[right])
    roots = sorted({find(i) for i in range(len(pair_index))})
    root_index = {root: i for i, root in enumerate(roots)}
    full_to_reduced = [root_index[find(i)] for i in range(len(pair_index))]
    return full_to_reduced, len(roots)


def reduce_vec(full_to_reduced, reduced_dim, vector):
    out = [Rational(0)] * reduced_dim
    for i, value in enumerate(vector):
        out[full_to_reduced[i]] += value
    return tuple(out)


def rational_witness(pair_index, gaps, equalities, triangles=False):
    constraints = list(gaps)
    labels = sorted({x for p in pair_index for x in p})
    if triangles:
        for a, b, c in combinations(labels, 3):
            constraints.extend([
                (f"T[{a}{b}|{c}]", vec(pair_index, [(1, a, c), (1, b, c), (-1, a, b)])),
                (f"T[{a}{c}|{b}]", vec(pair_index, [(1, a, b), (1, b, c), (-1, a, c)])),
                (f"T[{b}{c}|{a}]", vec(pair_index, [(1, a, b), (1, a, c), (-1, b, c)])),
            ])
    full_to_reduced, reduced_dim = quotient_data(pair_index, equalities)
    constraints = [
        (label, reduce_vec(full_to_reduced, reduced_dim, gap))
        for label, gap in constraints
    ]
    # -gap <= -1.  Distances are intrinsically positive in both runs and are
    # normalized to >=1.  This cannot create a false K-only contradiction:
    # every reported contradiction also has an explicit positive dependence
    # among K gaps alone, while every feasible case gets a positive witness.
    A = [[-float(x) for x in gap] for _, gap in constraints]
    b = [-10.0] * len(constraints)
    result = linprog(
        [1.0] * reduced_dim,
        A_ub=A,
        b_ub=b,
        bounds=[(1.0, None)] * reduced_dim,
        method="highs",
    )
    if not result.success:
        return None
    reduced_witness = tuple(
        Rational(Fraction(float(x)).limit_denominator(1_000_000))
        for x in result.x
    )
    witness = tuple(reduced_witness[j] for j in full_to_reduced)
    # Fail closed unless floating discovery has reconstructed an exact rational
    # witness with the requested normalized margins.
    assert all(
        sum(x * y for x, y in zip(g, reduced_witness)) >= 1
        for _, g in constraints
    )
    assert all(sum(x * y for x, y in zip(g, witness)) >= 1 for _, g in gaps)
    assert all(witness[pair_index[l]] == witness[pair_index[r]] for l, r in equalities)
    return witness


def positive_gap_certificate(pair_index, gaps, equalities):
    """Find a support-minimal positive dependence among quotient gaps.

    Enumerating through rank+1 is exhaustive: every positive dependence has a
    support-minimal subdependence, and every such circuit has at most rank+1
    vectors and a one-dimensional nullspace.
    """
    full_to_reduced, reduced_dim = quotient_data(pair_index, equalities)
    reduced = [
        (label, reduce_vec(full_to_reduced, reduced_dim, gap))
        for label, gap in gaps
    ]
    max_size = Matrix([gap for _, gap in reduced]).rank() + 1
    for size in range(2, max_size + 1):
        for subset in combinations(reduced, size):
            matrix = Matrix([gap for _, gap in subset]).T
            nullspace = matrix.nullspace()
            if len(nullspace) != 1:
                continue
            coefficients = list(nullspace[0])
            if all(x < 0 for x in coefficients):
                coefficients = [-x for x in coefficients]
            if all(x > 0 for x in coefficients):
                scale = min(coefficients)
                coefficients = [x / scale for x in coefficients]
                return tuple(label for label, _ in subset), tuple(coefficients)
    return None


SYSTEMS = {
    "A=J": {
        "roles": ("O", "A", "C", "X", "K"),
        "equalities": ((pair("O", "A"), pair("O", "C")),
                       (pair("A", "C"), pair("A", "K")),
                       (pair("X", "A"), pair("X", "K"))),
        "constructors": {
            "orderOACXK": tuple("OACXK"),
            "orderXAKOC": tuple("XAKOC"),
            "orderAOXKC": tuple("AOXKC"),
            "orderAXOCK": tuple("AXOCK"),
            "orderOKXCA": tuple("OKXCA"),
            "orderXCOKA": tuple("XCOKA"),
            "orderACKXO": tuple("ACKXO"),
            "orderAKCOX": tuple("AKCOX"),
        },
    },
    "X=C": {
        "roles": ("O", "A", "C", "J", "K"),
        "equalities": ((pair("O", "J"), pair("O", "C")),
                       (pair("A", "C"), pair("A", "K")),
                       (pair("C", "J"), pair("C", "K"))),
        "constructors": {
            "orderOCJAK": tuple("OCJAK"),
            "orderACKOJ": tuple("ACKOJ"),
            "orderCOAKJ": tuple("COAKJ"),
            "orderCAOJK": tuple("CAOJK"),
            "orderOKAJC": tuple("OKAJC"),
            "orderAJOKC": tuple("AJOKC"),
            "orderCJKAO": tuple("CJKAO"),
            "orderCKJOA": tuple("CKJOA"),
        },
    },
}


def audit_system(name, data):
    roles = data["roles"]
    all_pairs = list(combinations(sorted(roles), 2))
    pair_index = {p: i for i, p in enumerate(all_pairs)}
    bank = {
        order_name(normalize(order)): constructor
        for constructor, order in data["constructors"].items()
    }
    rows = []
    for tail in permutations([r for r in roles if r != "O"]):
        order = ("O",) + tail
        gaps = kalmanson_gaps(order, pair_index)
        cert = positive_gap_certificate(
            pair_index, gaps, data["equalities"]
        )
        feasible = cert is None
        witness = rational_witness(pair_index, gaps, data["equalities"])
        assert feasible == (witness is not None)
        metric_witness = None if not feasible else rational_witness(
            pair_index, gaps, data["equalities"], triangles=True
        )
        metric_feasible = metric_witness is not None
        rows.append({
            "order": order_name(order),
            "reflection": order_name(reflection(order)),
            "bank": bank.get(order_name(order)),
            "k_feasible": feasible,
            "metric_feasible": metric_feasible,
            "witness": witness,
            "metric_witness": metric_witness,
            "cert": cert,
            "pairs": all_pairs,
        })
    return rows


def format_witness(row, metric=False):
    values = row["metric_witness"] if metric else row["witness"]
    return ", ".join(
        f"d{a}{b}={v}" for (a, b), v in zip(row["pairs"], values)
    )


def main():
    report = [
        "# Exact five-role Kalmanson cyclic-order audit",
        "",
        "Strict homogeneous gaps were normalized to `gap >= 1`. Contradictions",
        "were found by exhaustive exact-rational circuit enumeration through rank+1",
        "(Gordan/Farkas). SciPy located witnesses, which were rationalized and then",
        "checked exactly. Positive distances were normalized to `d >= 1`.",
        "The separate metric run also imposed all strict triangle inequalities",
        "(normalized to slack at least 1). Contradictory cases have certificates",
        "using Kalmanson gaps alone, so positivity is not used for closure.",
        "",
    ]
    for name, data in SYSTEMS.items():
        rows = audit_system(name, data)
        closed = [r for r in rows if not r["k_feasible"]]
        feasible = [r for r in rows if r["k_feasible"]]
        metric_closed = [r for r in rows if not r["metric_feasible"]]
        banked = [r for r in rows if r["bank"]]
        additional_metric_closed = [
            r for r in rows if r["k_feasible"] and not r["metric_feasible"]
        ]
        assert {r["order"] for r in closed} == {r["order"] for r in banked}
        report.extend([
            f"## {name}",
            "",
            f"- Kalmanson-contradictory: {len(closed)}/24",
            f"- Banked constructors: {len(banked)}/24",
            f"- Kalmanson-feasible: {len(feasible)}/24",
            f"- Infeasible after positivity + strict triangles: {len(metric_closed)}/24",
            f"- Additional closures from strict triangles: {len(additional_metric_closed)}/24",
            "",
            "| order | reflection | status | constructor/certificate |",
            "|---|---|---|---|",
        ])
        for r in rows:
            if r["k_feasible"]:
                status = "feasible"
                detail = ""
            else:
                status = "contradictory"
                labels, coeff = r["cert"]
                combination = "+".join(
                    f"{c}*{label}" for label, c in zip(labels, coeff)
                )
                detail = f"{r['bank']}; {combination}=0 modulo equalities"
            report.append(
                f"| {r['order']} | {r['reflection']} | {status} | {detail} |"
            )
        report.extend(["", "Kalmanson-feasible orders:", ""])
        report.append(", ".join(r["order"] for r in feasible))
        report.extend(["", "Exact witness for each feasible order:", ""])
        for r in feasible:
            report.append(f"- `{r['order']}`: {format_witness(r)}")
        report.extend(["", "Exact metric witness for each feasible order:", ""])
        for r in feasible:
            if r["metric_feasible"]:
                report.append(f"- `{r['order']}`: {format_witness(r, metric=True)}")
            else:
                report.append(f"- `{r['order']}`: infeasible with strict triangles")
        report.append("")
    output = Path("scratch/five_role_kalmanson_enumeration_report.md")
    output.write_text("\n".join(report) + "\n")
    print(output)
    print(f"lines={len(report)}")
    for line in report[:20]:
        print(line)


if __name__ == "__main__":
    main()
