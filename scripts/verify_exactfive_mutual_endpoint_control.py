"""Exact 32-point local control: mutual rows plus K4 at their endpoint w.

This is finite evidence, not a global K4 counterexample or a physical source.
Run from any directory; only the authenticated adjacent parent checker is read.
"""
import contextlib
import hashlib
import io
import json
from pathlib import Path
import runpy


PARENT = Path(__file__).with_name("verify_exactfive_three_anchor_mutual_control.py")
PARENT_SHA256 = "41a95b68836059e9230b9f8ba305c40f345634e312cb541521aa10d93a9eaefb"
assert hashlib.sha256(PARENT.read_bytes()).hexdigest() == PARENT_SHA256
with contextlib.redirect_stdout(io.StringIO()):
    parent = runpy.run_path(str(PARENT))

A = parent["A"]
Q = parent["Q"]
add, sub, mul, dot, rot, orient, d2, p = (
    parent[name] for name in ("add", "sub", "mul", "dot", "rot", "orient", "d2", "p")
)
old_names = set(A)
e, x = A["w"], A["Q3"]
edge = sub(A["O"], x)
foot_parameter = dot(sub(e, x), edge) / dot(edge, edge)
assert foot_parameter.sign() > 0 and (1 - foot_parameter).sign() > 0
foot = add(x, mul(foot_parameter, edge))
anchor = add(e, mul(1 + Q(1, 10**6), sub(foot, e)))
T = {f"T{i}" for i in range(4)}
for i, numerator in enumerate((-3, -1, 1, 3)):
    A[f"T{i}"] = add(e, rot(sub(anchor, e), Q(numerator, 10**8)))

# Restore W as the unique surplus cap after adding four points in V's cap.
# These use the parent's same outward parabola on b--d.
edge = sub(A["d"], A["b"])
out = p(edge[1], -edge[0])
parabola_order = [(Q(i, 6), f"F{i}") for i in range(1, 6)]
for i, numerator in enumerate((1, 3, 5, 7)):
    t = Q(numerator, 12)
    name = f"G{i}"
    A[name] = add(
        add(mul(1 - t, A["b"]), mul(t, A["d"])),
        mul(Q(1, 10**7) * t * (1 - t), out),
    )
    parabola_order.append((t, name))
ORDER = (
    ["Q3", "T0", "T1", "T2", "T3", "O", "b"]
    + [name for _, name in sorted(parabola_order)]
    + parent["ORDER"][8:]
)
assert len(A) == len(ORDER) == len(set(A.values())) == 32
assert set(ORDER) == set(A)
support_checks = 0
for i, a in enumerate(ORDER):
    b = ORDER[(i + 1) % len(ORDER)]
    for name in ORDER:
        if name not in (a, b):
            assert orient(A[a], A[b], A[name]).sign() > 0, (a, b, name)
            support_checks += 1
assert support_checks == 960

M, Rm2 = parent["M"], parent["Rm2"]
slack = {name: Rm2 - d2(M, point) for name, point in A.items()}
assert all(value.sign() >= 0 for value in slack.values())
assert {name for name, value in slack.items() if value.sign() == 0} == {"O", "V", "W"}
# The unchanged acute support triangle certifies the same minimum disk.
caps = {}
for apex, a, b in (("O", "V", "W"), ("V", "W", "O"), ("W", "O", "V")):
    sign = orient(A[a], A[b], A[apex]).sign()
    caps[apex] = {name for name in A if orient(A[a], A[b], A[name]).sign() == -sign}
assert {apex: len(cap) for apex, cap in caps.items()} == {"O": 6, "V": 11, "W": 12}
assert set.union(*caps.values()) == set(A) - {"O", "V", "W"}
assert sum(map(len, caps.values())) == len(A) - 3
assert T <= caps["V"]
assert {f"G{i}" for i in range(4)} <= caps["W"]

# The parent's functions reference this same enlarged A: compute every full
# ambient class again; never reuse the parent's 24-point rich-row census.
classes, rich = parent["classes"], parent["rich"]
expected_rows = {
    "O": [parent["E"]], "V": [parent["Lu"], parent["Lq"]],
    "b": [parent["Kb"]], "c": [parent["Kc"]], "w": [T],
}
actual_rows = {name: rich(name) for name in A if rich(name)}
canonical = lambda rows: {frozenset(row) for row in rows}
assert set(actual_rows) == set(expected_rows)
for name, rows in expected_rows.items():
    assert canonical(actual_rows[name]) == canonical(rows), name
I = parent["E"] & caps["O"]
assert I == {"u", "q", "w"}
assert parent["Kc"] & caps["O"] == {"q", "w"}
assert "c" in caps["O"] and "b" not in caps["O"]
assert d2(A["c"], A["w"]) == d2(A["b"], A["c"]) == d2(A["b"], A["w"])

def survives(center, deleted):
    return any(len(row - deleted) >= 4 for row in classes(center).values())

assert all(survives(center, {name}) for center in ("O", "V") for name in A if name != center)
assert not survives("V", {"u", "q"})
assert survives("V", {"q", "w"}) and survives("V", {"u", "w"})
assert (d2(A["q"], A["w"]) - parent["r2"]).sign() > 0
assert (d2(A["u"], A["w"]) - d2(A["q"], A["w"])).sign() > 0
for center in ("b", "c", "w"):
    for name in expected_rows[center][0]:
        assert not survives(center, {name})
actual_centers = {
    name: rows[0] for name, rows in actual_rows.items()
    if len(rows) == 1 and len(rows[0]) == 4
}
assert set(actual_centers) == {"b", "c", "w"}
assert all("u" not in row for row in actual_centers.values())
assert {name for name, row in actual_centers.items() if "q" in row} == {"c"}

def exact(value):
    return [str(value.a), str(value.b)]

summary = {
    "status": "PASS: finite exact local endpoint-K4 control only",
    "parent_checker_sha256": PARENT_SHA256,
    "point_count": len(A), "strict_supporting_edge_checks": support_checks,
    "MEC_boundary": ["O", "V", "W"],
    "strict_cap_cardinalities": {name: len(cap) for name, cap in caps.items()},
    "closed_cap_cardinalities": {name: len(cap) + 2 for name, cap in caps.items()},
    "unique_surplus_apex": "W",
    "E": sorted(parent["E"]), "I": sorted(I),
    "rich_rows": {name: sorted([sorted(row) for row in rows]) for name, rows in sorted(actual_rows.items())},
    "actual_nonrobust_centers": sorted(actual_centers),
    "minimum_admissible_pair": ["q", "w"], "V_bad_pair": ["u", "q"],
    "mutual_endpoint": "w", "endpoint_K4": True,
    "endpoint_row_radius_squared": exact(d2(e, A["T0"])),
    "global_K4": False, "centers_failing_K4": sorted(set(A) - set(actual_rows)),
    "total_H_possible": False, "missing_actual_blocker_for_third_anchor": "u",
    "only_actual_blocker_for_q": "c", "original_fresh_center_source_instantiated": False,
    "cyclic_order": ORDER,
    "added_coordinates_exact_Qsqrt3": {
        name: [exact(value) for value in A[name]] for name in sorted(set(A) - old_names)
    },
}
print(json.dumps(summary, indent=2) + "\n", end="")
