#!/usr/bin/env python3
"""Independent parser and semantic validator for the wave artifacts."""

from __future__ import annotations

import json
import re
from pathlib import Path


HERE = Path(__file__).resolve().parent
CASES = ("retained", "common", "common_sameblocker")
QROWS = ("q0", "q1", "q2", "q3")
BASE_ROWS = QROWS + ("first", "second")
ACTIVE = {
    "retained": BASE_ROWS + ("retz", "retw"),
    "common": BASE_ROWS,
    "common_sameblocker": BASE_ROWS + ("w0", "w1", "w2", "w3"),
}
BLOCKER = {
    "q0": "b0", "q1": "b1", "q2": "b2", "q3": "b3",
    "first": "blk_first", "second": "blk_second",
    "retz": "blk_retz", "retw": "blk_retw",
    "w0": "blk_w0", "w1": "blk_w1", "w2": "blk_w2", "w3": "blk_w3",
}
SOURCE = {row: f"v_{row}" for row in BLOCKER}
NOFIX = {row: f"nofix_{row}" for row in BLOCKER}
CENTERS = ("p1", "p2", "p3", "p4", "p5", "p8", "p9")
ROLES = CENTERS + ("p6", "p11")
EDGES = (
    ("p1", "p3"), ("p1", "p6"), ("p1", "p9"),
    ("p2", "p3"), ("p2", "p8"), ("p2", "p11"),
    ("p3", "p1"), ("p3", "p5"), ("p3", "p6"), ("p3", "p9"),
    ("p4", "p2"), ("p4", "p6"), ("p4", "p8"), ("p4", "p11"),
    ("p5", "p3"), ("p5", "p9"), ("p5", "p11"),
    ("p8", "p1"), ("p8", "p3"),
    ("p9", "p2"), ("p9", "p3"), ("p9", "p8"),
)
DEGREE = {role: sum(a == role for a, _ in EDGES) for role in CENTERS}
ORDER = ("p3", "p4", "p1", "p2", "p5", "p9", "p8", "p6", "p11")


def mname(row: str, label: str) -> str:
    return f"M_{row}__{label}"


def point_specs(case: str):
    rows = ACTIVE[case]
    return ([(f"S_{row}", SOURCE[row]) for row in rows] +
            [(f"B_{row}", BLOCKER[row]) for row in rows])


def validate_legacy(case: str, d: dict[str, int | bool]) -> None:
    first, second = int(d["first_tag"]), int(d["second_tag"])
    assert 0 <= first <= 1 and 0 <= second <= 3
    assert (first == 0) == (d["first_ov"] == 4)
    assert first == 0 or d["first_ov"] <= 2
    assert (second == 0) == (d["second_ov"] == 4)
    assert second == 0 or d["second_ov"] <= 2
    if second in (2, 3):
        assert d["second_ov"] == 2
    assert 0 <= d["first_deleted_q"] <= 1 and 0 <= d["second_deleted_q"] <= 1
    if first == 1:
        assert not d["first_contains_deleted"] and d["first_deletion_survives"]
    if second == 1:
        assert not d["second_contains_deleted"] and d["second_deletion_survives"]
    assert 0 <= d["second_source_cap"] <= 2 and 0 <= d["second_q_cap"] <= 2
    if second == 2:
        assert d["second_source_cap"] != d["second_q_cap"]
    if second == 3:
        assert d["second_source_cap"] == d["second_q_cap"] and d["second_internal_q_in_cap"]
    for i in range(4):
        bits = [d[f"m{i}{j}"] for j in range(4)]
        assert bits[i] is True
        assert d[f"ov{i}"] == sum(bits)
        assert 0 <= d[f"cap{i}"] <= 2
        if d[f"b{i}"] == 0:
            assert d[f"ov{i}"] == 4
        else:
            assert d[f"ov{i}"] <= 2
    assert d["b0"] == 0 and d["b1"] == 0
    for i in range(4):
        for j in range(i + 1, 4):
            if d[f"b{i}"] == d[f"b{j}"]:
                assert all(d[f"m{i}{k}"] == d[f"m{j}{k}"] for k in range(4))
    qb, qd = d["q_boundary"], d["qdist"]
    assert qb in (0, 1) and 0 <= qd <= 3 and 2 <= d["qfiber_card"] <= 4
    if qb == 0:
        assert d["qfiber_card"] == 4 and d["qfiber_image_support"]
        assert all(d[f"b{i}"] == 0 for i in range(4))
    else:
        assert d["qfiber_card"] <= 3 and not d["qfiber_image_support"]
        assert any(d[f"b{i}"] != 0 for i in range(4))
        assert d[f"b{qd}"] != 0 and d[f"ov{qd}"] <= 2
    z, w, out = d["repeat_z"], d["repeat_w"], d["repeat_outcome"]
    assert 0 <= z <= 3 and 0 <= w <= 3 and z != w
    assert d[f"cap{z}"] == d[f"cap{w}"]
    arms = [d[f"b{z}"] == d[f"b{w}"], d[f"srcincap{z}"], d[f"srcincap{w}"],
            not d[f"m{z}{w}"], not d[f"m{w}{z}"]]
    assert 0 <= out <= 4 and arms[out]
    assert 0 <= d["ret_location"] <= 3
    assert not (d["ret_z_eq_q"] and d["ret_w_eq_q"])
    for side in ("z", "w"):
        assert d[f"ret_{side}_eq_q"] == (d[f"ret_{side}_ov"] == 4)
        if not d[f"ret_{side}_eq_q"]:
            assert 0 <= d[f"ret_{side}_ov"] <= 2
    assert not d["ret_z_contains_w"] and not d["ret_w_contains_z"]
    active = case == "common_sameblocker"
    assert d["common_helper_active"] == active
    if active:
        assert first == second == 0
        assert d["qcenter_in_canonical_cap"] and d["common_witnesses_distinct"]
        assert d["qrow_canonical_cap_count"] == 2
        for i in range(4):
            assert 0 <= d[f"common_w{i}_ov"] <= 2
            for kind in ("source_in_cap", "off_q", "blocker_ne_q"):
                assert d[f"common_w{i}_{kind}"]
    else:
        assert not d["qcenter_in_canonical_cap"] and not d["common_witnesses_distinct"]
        assert d["qrow_canonical_cap_count"] == 0


def validate_bridges(case: str, d: dict[str, int | bool]) -> None:
    rows = ACTIVE[case]
    assert len({d[f"v_q{i}"] for i in range(4)}) == 4
    for row in rows:
        assert d[mname(row, f"S_{row}")] is True
        assert d[mname(row, f"B_{row}")] is False
        assert d[NOFIX[row]] == (d[BLOCKER[row]] != d[SOURCE[row]])
    for i in range(4):
        for j in range(4):
            assert d[f"m{i}{j}"] == d[mname(f"q{i}", f"S_q{j}")]
    for row, prefix in (("first", "first"), ("second", "second")):
        qbits = [d[mname(row, f"S_q{j}")] for j in range(4)]
        assert d[f"{prefix}_ov"] == sum(qbits)
        assert (d[f"{prefix}_tag"] == 0) == (d[BLOCKER[row]] == 0)
        assert d[f"{prefix}_contains_deleted"] == qbits[d[f"{prefix}_deleted_q"]]
    if case == "retained":
        assert d["v_retz"] != d["v_retw"]
        for row, side in (("retz", "z"), ("retw", "w")):
            assert d[f"ret_{side}_ov"] == sum(d[mname(row, f"S_q{j}")] for j in range(4))
            assert d[f"ret_{side}_eq_q"] == (d[BLOCKER[row]] == 0)
        assert d["ret_z_contains_w"] == d[mname("retz", "S_retw")]
        assert d["ret_w_contains_z"] == d[mname("retw", "S_retz")]
    if case == "common_sameblocker":
        assert len({d[f"v_w{i}"] for i in range(4)}) == 4
        for i in range(4):
            row = f"w{i}"
            assert d[f"common_w{i}_ov"] == sum(d[mname(row, f"S_q{j}")] for j in range(4))
            assert d[f"common_w{i}_off_q"] == (not d[mname("q0", f"S_w{i}")])
            assert d[f"common_w{i}_blocker_ne_q"] == (d[BLOCKER[row]] != 0)


def motif_embedding(case: str, d: dict[str, int | bool]) -> dict[str, int] | None:
    points: dict[int, str] = {}
    for label, term in point_specs(case):
        points.setdefault(int(d[term]), label)
    centers: dict[int, str] = {}
    for row in ACTIVE[case]:
        centers.setdefault(int(d[BLOCKER[row]]), row)

    def edge(c: int, p: int) -> bool:
        return bool(d[mname(centers[c], points[p])])

    pvals, cvals = sorted(points), sorted(centers)
    outgoing = {c: {p for p in pvals if edge(c, p)} for c in cvals}
    choices = {role: [c for c in cvals if len(outgoing[c]) >= DEGREE[role]] for role in CENTERS}
    choices.update({"p6": pvals, "p11": pvals})
    assignment: dict[str, int] = {}

    def visit(depth: int) -> bool:
        if depth == len(ORDER):
            return True
        role = ORDER[depth]
        for value in choices[role]:
            if value in assignment.values():
                continue
            assignment[role] = value
            okay = all(a not in assignment or b not in assignment or edge(assignment[a], assignment[b])
                       for a, b in EDGES)
            if okay and visit(depth + 1):
                return True
            del assignment[role]
        return False

    return dict(assignment) if visit(0) else None


def tokenize(text: str) -> list[str]:
    return re.findall(r"\(|\)|[^\s()]+", text)


def parse_many(text: str):
    tokens = tokenize(text)
    pos = 0

    def one():
        nonlocal pos
        token = tokens[pos]
        pos += 1
        if token != "(":
            return token
        value = []
        while tokens[pos] != ")":
            value.append(one())
        pos += 1
        return value

    values = []
    while pos < len(tokens):
        values.append(one())
    return values


def scalar(value):
    if value == "true":
        return True
    if value == "false":
        return False
    if isinstance(value, list) and len(value) == 2 and value[0] == "-":
        return -int(value[1])
    return int(value)


def parse_solver_output(path: Path):
    values = parse_many(path.read_text())
    status = next(value for value in values if value in ("sat", "unsat", "unknown"))
    if status != "sat":
        return status, {}
    pair_block = next(value for value in values if isinstance(value, list) and value and
                      all(isinstance(pair, list) and len(pair) == 2 for pair in value))
    return status, {pair[0]: scalar(pair[1]) for pair in pair_block}


def validate_iterations() -> int:
    count = 0
    for path in sorted((HERE / "iterations").glob("*.json")):
        record = json.loads(path.read_text())
        case, d = record["case"], record["readback"]
        validate_legacy(case, d)
        validate_bridges(case, d)
        independently_found = motif_embedding(case, d)
        recorded = record["motif_embedding"]
        assert (independently_found is None) == (recorded is None)
        if recorded is not None:
            vals = recorded["values"]
            assert len(set(vals.values())) == 9
            assert all(d[name] is True for name in recorded["edge_atoms"])
        count += 1
    return count


def validate_detector_smoke() -> None:
    """Hand-built positive motif and empty-graph negative control."""
    record = json.loads((HERE / "iterations" / "retained-00.json").read_text())
    d = dict(record["readback"])
    for name in list(d):
        if name.startswith("M_"):
            d[name] = False
    center_rows = {
        "p1": "q0", "p2": "q2", "p3": "q3", "p4": "first",
        "p5": "second", "p8": "retz", "p9": "retw",
    }
    point_labels = {role: f"B_{row}" for role, row in center_rows.items()}
    point_labels.update({"p6": "S_q0", "p11": "S_q1"})
    role_values = {
        role: d[BLOCKER[row]] for role, row in center_rows.items()
    }
    role_values.update({"p6": d["v_q0"], "p11": d["v_q1"]})
    assert len(set(role_values.values())) == 9
    for source, target in EDGES:
        d[mname(center_rows[source], point_labels[target])] = True
    assert motif_embedding("retained", d) is not None
    for name in list(d):
        if name.startswith("M_"):
            d[name] = False
    assert motif_embedding("retained", d) is None


def main() -> int:
    terminal = json.loads((HERE / "TERMINAL.json").read_text())
    validate_detector_smoke()
    iteration_count = validate_iterations()
    solver_checks = 0
    for result in terminal["cases"]:
        case = result["case"]
        for solver in ("z3", "cvc5"):
            status, d = parse_solver_output(HERE / "logs" / f"terminal_{case}.{solver}.out")
            if result["status"] == "SAT":
                assert status == "sat"
                validate_legacy(case, d)
                validate_bridges(case, d)
                assert motif_embedding(case, d) is None
            elif result["status"] == "UNSAT":
                assert status == "unsat"
            else:
                assert status == "unknown"
            solver_checks += 1
    controls = {}
    for solver in ("z3", "cvc5"):
        status, _ = parse_solver_output(HERE / "logs" / f"control_unsat.{solver}.out")
        assert status == "unsat"
        controls[solver] = status
    report = {
        "status": "VALID",
        "detector_smoke": {"positive_motif": "PASS", "empty_graph": "PASS"},
        "independent_iteration_readbacks": iteration_count,
        "terminal_solver_readbacks": solver_checks,
        "terminal_models_motif_free": all(r["status"] != "SAT" or r["terminal"] == "motif-free survivor"
                                           for r in terminal["cases"]),
        "contradiction_controls": controls,
    }
    (HERE / "VALIDATION.json").write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(f"VALID iterations={iteration_count} terminal_solver_readbacks={solver_checks}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
