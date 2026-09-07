"""Exact 44-point local control with actual blockers for u and q.

Only a partial critical-shell assignment is supplied. Global K4 and total H
fail. This is finite diagnostic evidence, not a physical-source counterexample.
"""
import contextlib
import hashlib
import io
import json
from pathlib import Path
import runpy


PARENT = Path(__file__).with_name("verify_exactfive_mutual_endpoint_control.py")
PARENT_SHA256 = "1c3445ba21fdebc2c2ac9d3f77333b7bae630ed2e6c0e26ad523b92227faf542"
assert hashlib.sha256(PARENT.read_bytes()).hexdigest() == PARENT_SHA256
with contextlib.redirect_stdout(io.StringIO()):
    base = runpy.run_path(str(PARENT))
A = base["A"]
Q = base["Q"]
add, sub, mul, dot, rot, orient, d2, p = (
    base[name] for name in ("add", "sub", "mul", "dot", "rot", "orient", "d2", "p")
)
old_names = set(A)
edge = sub(A["V"], A["aR"])
out = p(edge[1], -edge[0])
for name, t in (("d0", Q(1, 3)), ("d1", Q(2, 3))):
    A[name] = add(
        add(mul(1 - t, A["aR"]), mul(t, A["V"])),
        mul(Q(1, 10**8) * t * (1 - t), out),
    )
for center, source, stem, parameter in (
    ("d0", "u", "S", Q(101, 1000)),
    ("d1", "q", "J", Q(127, 1000)),
):
    for i, numerator in enumerate((-1, 0, 1)):
        A[f"{stem}{i}"] = add(
            A[center],
            rot(sub(A[source], A[center]), parameter + Q(numerator, 10**7)),
        )

# Preserve W as the unique surplus apex after adding six left-cap points.
edge = sub(A["d"], A["b"])
out = p(edge[1], -edge[0])
parabola_order = list(base["parabola_order"])
for i, t in ((4, Q(9, 12)), (5, Q(11, 12)), (6, Q(1, 24)), (7, Q(3, 24))):
    name = f"G{i}"
    A[name] = add(
        add(mul(1 - t, A["b"]), mul(t, A["d"])),
        mul(Q(1, 10**7) * t * (1 - t), out),
    )
    parabola_order.append((t, name))
ORDER = []
for name in base["ORDER"]:
    if name.startswith(("F", "G")):
        continue
    ORDER.append(name)
    if name == "b":
        ORDER.extend(point for _, point in sorted(parabola_order))
    if name == "aR":
        ORDER.extend(("d0", "d1"))
    if name == "U2":
        ORDER.extend(("S0", "S1", "S2"))
    if name == "Q2":
        ORDER.extend(("J0", "J1", "J2"))
assert len(A) == len(ORDER) == len(set(A.values())) == 44
assert set(ORDER) == set(A)
support_checks = 0
for i, a in enumerate(ORDER):
    b = ORDER[(i + 1) % len(ORDER)]
    for name in ORDER:
        if name not in (a, b):
            assert orient(A[a], A[b], A[name]).sign() > 0, (a, b, name)
            support_checks += 1
assert support_checks == 1848
M, Rm2 = base["M"], base["Rm2"]
slack = {name: Rm2 - d2(M, point) for name, point in A.items()}
assert all(value.sign() >= 0 for value in slack.values())
assert {name for name, value in slack.items() if value.sign() == 0} == {"O", "V", "W"}
caps = {}
for apex, a, b in (("O", "V", "W"), ("V", "W", "O"), ("W", "O", "V")):
    sign = orient(A[a], A[b], A[apex]).sign()
    caps[apex] = {name for name in A if orient(A[a], A[b], A[name]).sign() == -sign}
assert {apex: len(cap) for apex, cap in caps.items()} == {"O": 6, "V": 17, "W": 18}
assert set.union(*caps.values()) == set(A) - {"O", "V", "W"}
assert sum(map(len, caps.values())) == len(A) - 3

# Recompute all full classes on the enlarged carrier through shared A.
classes, rich = base["classes"], base["rich"]
expected_rows = dict(base["expected_rows"])
expected_rows.update({"d0": [{"u", "S0", "S1", "S2"}], "d1": [{"q", "J0", "J1", "J2"}]})
actual_rows = {name: rich(name) for name in A if rich(name)}
canonical = lambda rows: {frozenset(row) for row in rows}
assert set(actual_rows) == set(expected_rows)
for center, rows in expected_rows.items():
    assert canonical(actual_rows[center]) == canonical(rows), center
I = expected_rows["O"][0] & caps["O"]
assert I == {"u", "q", "w"}
assert expected_rows["c"][0] & caps["O"] == {"q", "w"}
assert "c" in caps["O"] and "b" not in caps["O"]
assert d2(A["c"], A["w"]) == d2(A["b"], A["c"]) == d2(A["b"], A["w"])

def survives(center, deleted):
    return any(len(row - deleted) >= 4 for row in classes(center).values())

assert all(survives(center, {name}) for center in ("O", "V") for name in A if name != center)
assert not survives("V", {"u", "q"})
assert survives("V", {"q", "w"}) and survives("V", {"u", "w"})
r2 = d2(A["O"], A["q"])
assert (d2(A["q"], A["w"]) - r2).sign() > 0
assert (d2(A["u"], A["w"]) - d2(A["q"], A["w"])).sign() > 0
actual_centers = {
    center: rows[0] for center, rows in actual_rows.items()
    if len(rows) == 1 and len(rows[0]) == 4
}
assert set(actual_centers) == {"b", "c", "w", "d0", "d1"}
for center, row in actual_centers.items():
    for name in row:
        assert not survives(center, {name})
partial_H = {"q": "d1", "w": "b", "b": "c", "c": "b", "u": "d0"}
for source, center in partial_H.items():
    assert source != center and source in actual_centers[center]
assert partial_H["q"] != partial_H["w"]
assert partial_H["b"] == "c" and "c" not in {partial_H["q"], partial_H["w"]}
# Finite counterparts of the physical selected-row data. The fresh source
# is b, and its actual blocker center is c; these are different roles.
normal_rows = {
    "O": expected_rows["O"][0] - {"q"},
    "b": expected_rows["b"][0],
    "V": base["parent"]["Lu"],
}
retained_rows = {"O": expected_rows["O"][0] - {"w"}, "V": base["parent"]["Lq"]}
for center, row in normal_rows.items():
    assert len(row) == 4 and center not in row and {"q", "b"}.isdisjoint(row)
    assert len({d2(A[center], A[name]) for name in row}) == 1
    assert survives(center, {"q"}) and survives(center, {"b"})
assert "w" in normal_rows["O"] & normal_rows["b"] and "w" not in normal_rows["V"]
assert len(normal_rows["b"] & normal_rows["V"]) <= 2
assert partial_H["q"] not in {"b", "V"} and partial_H["b"] not in set(normal_rows)
for center, row in retained_rows.items():
    assert len(row) == 4 and center not in row and "w" not in row
    assert len({d2(A[center], A[name]) for name in row}) == 1
    assert survives(center, {"w"})
assert len(retained_rows["O"] & retained_rows["V"]) <= 2
assert partial_H["w"] not in set(retained_rows)
assert actual_centers[partial_H["u"]] & I == {"u"}
assert "d0" not in {"O", "V", "b", "c"}
assert (d2(A["d0"], A["u"]) - r2).sign() > 0
assert {center for center, row in actual_centers.items() if "q" in row} == {"c", "d1"}
covered_sources = set.union(*actual_centers.values())
missing_sources = set(A) - covered_sources
assert len(covered_sources) == 18 and len(missing_sources) == 26
assert {"O", "V", "W", "d0", "d1"} <= missing_sources

def exact(value):
    return [str(value.a), str(value.b)]

summary = {
    "status": "PASS: finite exact partial-H control only",
    "parent_checker_sha256": PARENT_SHA256,
    "point_count": len(A), "strict_supporting_edge_checks": support_checks,
    "MEC_boundary": ["O", "V", "W"],
    "strict_cap_cardinalities": {name: len(cap) for name, cap in caps.items()},
    "closed_cap_cardinalities": {name: len(cap) + 2 for name, cap in caps.items()},
    "unique_surplus_apex": "W", "I": sorted(I),
    "rich_rows": {name: sorted([sorted(row) for row in rows]) for name, rows in sorted(actual_rows.items())},
    "actual_nonrobust_centers": sorted(actual_centers),
    "partial_H": partial_H, "c_fresh_relative_partial_endpoint_assignment": True,
    "local_selected_row_mapping": {
        "deleted": "q", "retained": "w", "blocker": "b",
        "fresh_source": "b", "fresh_source_actual_center": "c",
        "normal_selected_rows": {center: sorted(row) for center, row in normal_rows.items()},
        "retained_deletion_rows": {center: sorted(row) for center, row in retained_rows.items()},
        "production_structures_instantiated": False,
    },
    "third_anchor_trace": ["u"], "third_anchor_row_radius_exceeds_r": True,
    "minimum_admissible_pair": ["q", "w"], "V_bad_pair": ["u", "q"],
    "global_K4": False, "centers_failing_K4": sorted(set(A) - set(actual_rows)),
    "total_H_possible": False, "sources_without_actual_blocker": sorted(missing_sources),
    "original_physical_source_instantiated": False,
    "cyclic_order": ORDER,
    "added_coordinates_exact_Qsqrt3": {
        name: [exact(value) for value in A[name]] for name in sorted(set(A) - old_names)
    },
}
print(json.dumps(summary, indent=2) + "\n", end="")
