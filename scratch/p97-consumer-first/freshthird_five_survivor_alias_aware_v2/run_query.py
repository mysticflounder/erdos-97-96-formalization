#!/usr/bin/env python3
"""Exact-17 alias-aware incidence preflight for the live five-survivor arms.

This diagnostic checks that the eight source-mapped ingress packets are
consistent and that three previously proposed consumer predicates are in fact
incompatible with that ingress.  It emits QF_LIA/Boolean SMT, replays each
query with z3 and cvc5, and independently validates every SAT assignment.  It
does not encode metric realizability or a universal lift.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import subprocess
from collections.abc import Iterable
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parent
N = 17
POINTS = tuple(range(N))

ROLES = (
    "P1",
    "P2",
    "R1",
    "R2",
    "S0",
    "S1",
    "Q0",
    "Q1",
    "CS0",
    "CS1",
    "CP",
    "C0",
    "C1",
    "C2",
    "C3",
    "C4",
    "DB",
)
ROWS = (
    "Cap",
    "PRow",
    "PRhoRow",
    "S0Row",
    "S1Row",
    "R",
    "Rh",
    "B0",
    "B1",
    "B2",
    "B3",
    "B4",
    "DBRow",
)


@dataclass(frozen=True)
class Tag:
    orientation: str
    deleted: str
    b2_choice: str

    @property
    def name(self) -> str:
        return f"{self.orientation}_{self.deleted}_{self.b2_choice}"

    @property
    def active_row(self) -> str:
        return "S0Row" if self.orientation == "first" else "S1Row"

    @property
    def active_center(self) -> str:
        return "CS0" if self.orientation == "first" else "CS1"

    @property
    def other_center(self) -> str:
        return "CS1" if self.orientation == "first" else "CS0"

    @property
    def deleted_role(self) -> str:
        return "Q0" if self.deleted == "qsource" else "Q1"

    @property
    def chosen_retained(self) -> str:
        return "R" if self.b2_choice == "radius" else "Rh"


TAGS = tuple(
    Tag(o, d, b)
    for o in ("first", "second")
    for d in ("qsource", "qother")
    for b in ("radius", "rho")
)


def sym(row: str, i: int) -> str:
    return f"{row}_{i}"


def s_and(parts: Iterable[str]) -> str:
    xs = tuple(parts)
    if not xs:
        return "true"
    if len(xs) == 1:
        return xs[0]
    return f"(and {' '.join(xs)})"


def s_or(parts: Iterable[str]) -> str:
    xs = tuple(parts)
    if not xs:
        return "false"
    if len(xs) == 1:
        return xs[0]
    return f"(or {' '.join(xs)})"


def bool_sum(parts: Iterable[str]) -> str:
    xs = tuple(parts)
    return f"(+ {' '.join(f'(ite {x} 1 0)' for x in xs)})"


def card(row: str, k: int = 4) -> str:
    return f"(= {bool_sum(sym(row, i) for i in POINTS)} {k})"


def at(row: str, role: str) -> str:
    return s_or(f"(and (= {role} {i}) {sym(row, i)})" for i in POINTS)


def role_is_i(role: str, i: int) -> str:
    return f"(= {role} {i})"


def rows_equal(left: str, right: str) -> tuple[str, ...]:
    return tuple(f"(= {sym(left, i)} {sym(right, i)})" for i in POINTS)


def overlap_card(left: str, right: str) -> str:
    return bool_sum(f"(and {sym(left, i)} {sym(right, i)})" for i in POINTS)


def exact_intersection_with_cap(row: str, roles: tuple[str, ...]) -> tuple[str, ...]:
    return tuple(
        f"(= (and {sym(row, i)} {sym('Cap', i)}) "
        f"{s_or(role_is_i(role, i) for role in roles)})"
        for i in POINTS
    )


def selected_row_pairs() -> tuple[tuple[str, str], ...]:
    """Rows and centers known to be exact selected four-classes.

    B0/B1/B2 are omitted because they are definitionally linked to rows in
    this list.  R and Rh deliberately remain separate at their common center.
    """
    return (
        ("PRow", "CP"),
        ("PRhoRow", "C1"),
        ("S0Row", "CS0"),
        ("S1Row", "CS1"),
        ("R", "C2"),
        ("Rh", "C2"),
        ("B3", "C3"),
        ("B4", "C4"),
        ("DBRow", "DB"),
    )


def consumer_expressions(tag: Tag) -> dict[str, str]:
    eligible = ("S0Row", "S1Row", "PRhoRow")
    overlap_three = s_or(f"(>= {overlap_card(row, 'PRow')} 3)" for row in eligible)
    pair_hit = lambda row: s_or((at(row, "P1"), at(row, "P2")))
    both_outside_pair = s_or(
        s_and((at(row, "Q0"), at(row, "Q1"), pair_hit(row))) for row in eligible
    )
    cap_center_two_outside = s_or(
        s_and((at(row, "Q0"), at(row, "Q1"))) for row in (tag.active_row, "PRhoRow")
    )
    return {
        "explicit_overlap_ge_three": overlap_three,
        "both_outside_hits_and_pair_hit": both_outside_pair,
        "cap_center_two_outside_hits": cap_center_two_outside,
    }


def base_assertions(tag: Tag) -> list[str]:
    a: list[str] = []
    add = a.append

    for role in ROLES:
        add(f"(and (<= 0 {role}) (< {role} {N}))")

    # Named collision/source points.  Q-point separation from these follows
    # additionally from their opposite Cap memberships.
    named_inside = ("P1", "P2", "R1", "R2", "S0", "S1")
    for i, left in enumerate(named_inside):
        for right in named_inside[i + 1 :]:
            add(f"(not (= {left} {right}))")
    add("(not (= Q0 Q1))")

    # Source-entitled center inequalities from the live robust packet.  These
    # are listed individually; they are not assumed by the boundary record.
    add(f"(= C0 {tag.active_center})")
    add("(not (= CS0 CS1))")
    for source_center in ("CS0", "CS1"):
        for other in ("CP", "C1", "C2", "C3", "C4"):
            add(f"(not (= {source_center} {other}))")
    add("(not (= CP C1))")
    for blocker in ("CP", "C1"):
        for apex in ("C2", "C3", "C4"):
            add(f"(not (= {blocker} {apex}))")
    for left, right in (("C2", "C3"), ("C2", "C4"), ("C3", "C4")):
        add(f"(not (= {left} {right}))")
    for i, left in enumerate(("C0", "C1", "C2", "C3", "C4")):
        for right in ("C0", "C1", "C2", "C3", "C4")[i + 1 :]:
            add(f"(not (= {left} {right}))")

    # Actual deleted blocker is a genuine carrier role.  Q.source has the
    # first collision blocker; Q.other's blocker remains independent.
    add(f"(not (= DB {tag.deleted_role}))")
    for center in ("C0", "C1", "C2", "C3", "C4"):
        add(f"(not (= DB {center}))")
    if tag.deleted == "qsource":
        add("(= DB CP)")

    # First-cap facts used by the exact source orientation.
    add(f"(>= {bool_sum(sym('Cap', i) for i in POINTS)} 8)")
    for role in named_inside + ("CP", "C1", tag.active_center, "C0"):
        add(at("Cap", role))
    for role in ("Q0", "Q1", tag.other_center, "C2"):
        add(f"(not {at('Cap', role)})")

    # The first collision shell is the explicit four-point Q-shell.
    for i in POINTS:
        rhs = s_or(role_is_i(role, i) for role in ("P1", "P2", "Q0", "Q1"))
        add(f"(= {sym('PRow', i)} {rhs})")
    add(card("PRow"))

    # The retained collision shell and both canonical source shells.
    add(card("PRhoRow"))
    add(at("PRhoRow", "R1"))
    add(at("PRhoRow", "R2"))
    a.extend(exact_intersection_with_cap("PRhoRow", ("R1", "R2")))
    for row in ("S0Row", "S1Row"):
        add(card(row))
        add(at(row, "S0"))
        add(at(row, "S1"))
        add(f"(not (and {at(row, 'P1')} {at(row, 'P2')}))")
        add(f"(not (and {at(row, 'R1')} {at(row, 'R2')}))")
    a.extend(exact_intersection_with_cap(tag.active_row, ("S0", "S1")))
    for endpoint in ("P1", "P2", "R1", "R2"):
        add(f"(not {at(tag.active_row, endpoint)})")
    add(f"(not {at(tag.active_row, tag.active_center)})")
    for endpoint in ("P1", "P2"):
        add(f"(not {at('PRhoRow', endpoint)})")
    add(f"(not {at('PRhoRow', 'C1')})")

    # Two exact retained first-apex rows at different radii.
    for row in ("R", "Rh"):
        add(card(row))
        add(f"(not {at(row, 'S0')})")
        add(f"(not {at(row, 'S1')})")
    add(at("R", "P1"))
    add(at("R", "P2"))
    add(at("Rh", "R1"))
    add(at("Rh", "R2"))
    for i in POINTS:
        add(f"(not (and {sym('R', i)} {sym('Rh', i)}))")

    # Five exact q-deleted rows.  B0/B1 link to actual canonical shells; B2
    # is one named retained row.  B3/B4 remain independent witnesses.
    for row in ("B0", "B1", "B2", "B3", "B4"):
        add(card(row))
        add(f"(not {at(row, tag.deleted_role)})")
    a.extend(rows_equal("B0", tag.active_row))
    a.extend(rows_equal("B1", "PRhoRow"))
    a.extend(rows_equal("B2", tag.chosen_retained))

    # The actual blocker's unique original four-class contains the deleted
    # point; otherwise it would remain a four-class after deletion.
    add(card("DBRow"))
    add(at("DBRow", tag.deleted_role))

    # Exact Euclidean two-circle ingress: distinct centers give overlap <= 2.
    classes = selected_row_pairs()
    for i, (left_row, left_center) in enumerate(classes):
        for right_row, right_center in classes[i + 1 :]:
            add(
                f"(=> (not (= {left_center} {right_center})) "
                f"(<= {overlap_card(left_row, right_row)} 2))"
            )
    return a


def emit(tag: Tag, query: str, extra: str | None = None) -> tuple[str, list[str]]:
    assertions = base_assertions(tag)
    consumers = consumer_expressions(tag)
    if query == "survivor":
        assertions.extend(f"(not {expr})" for expr in consumers.values())
    elif query == "base":
        pass
    else:
        raise ValueError(f"unknown query {query}")
    if extra:
        assertions.append(extra)

    lines = [
        "(set-logic QF_LIA)",
        "(set-option :produce-models true)",
    ]
    lines.extend(f"(declare-fun {role} () Int)" for role in ROLES)
    for row in ROWS:
        lines.extend(f"(declare-fun {sym(row, i)} () Bool)" for i in POINTS)
    lines.extend(f"(assert {formula})" for formula in assertions)
    lines.append("(check-sat)")
    values = list(ROLES) + [sym(row, i) for row in ROWS for i in POINTS]
    lines.append(f"(get-value ({' '.join(values)}))")
    return "\n".join(lines) + "\n", assertions


PAIR_RE = re.compile(r"\(\s*([A-Za-z][A-Za-z0-9_]*)\s+(true|false|-?[0-9]+)\s*\)")


def parse_assignment(output: str) -> dict[str, int | bool]:
    result: dict[str, int | bool] = {}
    for name, raw in PAIR_RE.findall(output):
        if raw == "true":
            result[name] = True
        elif raw == "false":
            result[name] = False
        else:
            result[name] = int(raw)
    return result


def run_solver(binary: str, smt: str) -> tuple[str, str]:
    if Path(binary).name == "cvc5":
        args = [binary, "--lang=smt2", "--produce-models", "--tlimit=30000"]
    else:
        args = [binary, "-in", "-T:30"]
    # Check status without a model request first, so expected-UNSAT smoke logs
    # do not contain the solvers' benign "model unavailable" diagnostics.
    status_smt = (
        "\n".join(
            line for line in smt.splitlines() if not line.startswith("(get-value ")
        )
        + "\n"
    )
    proc = subprocess.run(
        args, input=status_smt, text=True, capture_output=True, timeout=40, check=False
    )
    output = proc.stdout + proc.stderr
    status = next(
        (
            line.strip()
            for line in output.splitlines()
            if line.strip() in {"sat", "unsat", "unknown"}
        ),
        "error",
    )
    if status == "sat":
        model_proc = subprocess.run(
            args, input=smt, text=True, capture_output=True, timeout=40, check=False
        )
        output = model_proc.stdout + model_proc.stderr
    return status, output


def validate_assignment(
    tag: Tag, query: str, model: dict[str, int | bool]
) -> list[str]:
    failures: list[str] = []

    def rv(name: str) -> int:
        value = model.get(name)
        if type(value) is not int:
            failures.append(f"missing integer {name}")
            return -999
        return value

    role = {name: rv(name) for name in ROLES}

    def row(name: str) -> set[int]:
        missing = [sym(name, i) for i in POINTS if sym(name, i) not in model]
        if missing:
            failures.append(f"missing booleans for {name}: {len(missing)}")
        return {i for i in POINTS if model.get(sym(name, i)) is True}

    rows = {name: row(name) for name in ROWS}

    def need(ok: bool, message: str) -> None:
        if not ok:
            failures.append(message)

    for name, value in role.items():
        need(0 <= value < N, f"{name} out of range: {value}")

    inside = ("P1", "P2", "R1", "R2", "S0", "S1")
    need(len({role[x] for x in inside}) == len(inside), "inside named points alias")
    need(role["Q0"] != role["Q1"], "Q points alias")
    need(role["C0"] == role[tag.active_center], "C0 not active source center")

    unequal: set[tuple[str, str]] = set()
    unequal.add(("CS0", "CS1"))
    for source_center in ("CS0", "CS1"):
        for other in ("CP", "C1", "C2", "C3", "C4"):
            unequal.add((source_center, other))
    unequal.add(("CP", "C1"))
    for blocker in ("CP", "C1"):
        for apex in ("C2", "C3", "C4"):
            unequal.add((blocker, apex))
    unequal.update({("C2", "C3"), ("C2", "C4"), ("C3", "C4")})
    boundary = ("C0", "C1", "C2", "C3", "C4")
    for i, left in enumerate(boundary):
        for right in boundary[i + 1 :]:
            unequal.add((left, right))
    for left, right in unequal:
        need(role[left] != role[right], f"forbidden center alias {left}={right}")

    deleted = role[tag.deleted_role]
    need(role["DB"] != deleted, "actual blocker equals deleted point")
    for center in boundary:
        need(role["DB"] != role[center], f"DB aliases {center}")
    if tag.deleted == "qsource":
        need(role["DB"] == role["CP"], "Q.source blocker is not CP")

    cap = rows["Cap"]
    need(len(cap) >= 8, "first cap has size < 8")
    for name in inside + ("CP", "C1", tag.active_center, "C0"):
        need(role[name] in cap, f"{name} missing from first cap")
    for name in ("Q0", "Q1", tag.other_center, "C2"):
        need(role[name] not in cap, f"{name} unexpectedly in first cap")

    expected_p = {role[x] for x in ("P1", "P2", "Q0", "Q1")}
    need(rows["PRow"] == expected_p, "PRow is not the explicit four shell")
    for name in (
        "PRow",
        "PRhoRow",
        "S0Row",
        "S1Row",
        "R",
        "Rh",
        "B0",
        "B1",
        "B2",
        "B3",
        "B4",
        "DBRow",
    ):
        need(len(rows[name]) == 4, f"{name} card is {len(rows[name])}")

    need({role["R1"], role["R2"]} <= rows["PRhoRow"], "PRho endpoints absent")
    need(rows["PRhoRow"] & cap == {role["R1"], role["R2"]}, "PRho cap trace wrong")
    need(
        role["P1"] not in rows["PRhoRow"] and role["P2"] not in rows["PRhoRow"],
        "PRho row contains P endpoint",
    )
    need(role["C1"] not in rows["PRhoRow"], "PRho row contains its center")
    for name in ("S0Row", "S1Row"):
        need({role["S0"], role["S1"]} <= rows[name], f"{name} lacks mutual sources")
        need(not ({role["P1"], role["P2"]} <= rows[name]), f"{name} contains P pair")
        need(not ({role["R1"], role["R2"]} <= rows[name]), f"{name} contains R pair")
    need(
        rows[tag.active_row] & cap == {role["S0"], role["S1"]},
        "active source row cap trace wrong",
    )
    for endpoint in ("P1", "P2", "R1", "R2"):
        need(
            role[endpoint] not in rows[tag.active_row],
            f"active source row contains {endpoint}",
        )
    need(
        role[tag.active_center] not in rows[tag.active_row],
        "active source row contains its center",
    )

    need({role["P1"], role["P2"]} <= rows["R"], "R lacks P pair")
    need({role["R1"], role["R2"]} <= rows["Rh"], "Rh lacks R pair")
    need(rows["R"].isdisjoint(rows["Rh"]), "retained rows intersect")
    for name in ("R", "Rh"):
        need(
            role["S0"] not in rows[name] and role["S1"] not in rows[name],
            f"{name} contains aligned source",
        )

    need(rows["B0"] == rows[tag.active_row], "B0 not active canonical shell")
    need(rows["B1"] == rows["PRhoRow"], "B1 not PRho canonical shell")
    need(rows["B2"] == rows[tag.chosen_retained], "B2 not chosen retained row")
    for name in ("B0", "B1", "B2", "B3", "B4"):
        need(deleted not in rows[name], f"deleted point occurs in {name}")
    need(deleted in rows["DBRow"], "deleted point absent from DBRow")

    classes = selected_row_pairs()
    for i, (left_row, left_center) in enumerate(classes):
        for right_row, right_center in classes[i + 1 :]:
            if role[left_center] != role[right_center]:
                n = len(rows[left_row] & rows[right_row])
                need(n <= 2, f"{left_row}/{right_row} distinct-center overlap {n}")

    overlap = lambda r: len(rows[r] & rows["PRow"])
    eligible = ("S0Row", "S1Row", "PRhoRow")
    detected = {
        "explicit_overlap_ge_three": any(overlap(r) >= 3 for r in eligible),
        "both_outside_hits_and_pair_hit": any(
            role["Q0"] in rows[r]
            and role["Q1"] in rows[r]
            and (role["P1"] in rows[r] or role["P2"] in rows[r])
            for r in eligible
        ),
        "cap_center_two_outside_hits": any(
            role["Q0"] in rows[r] and role["Q1"] in rows[r]
            for r in (tag.active_row, "PRhoRow")
        ),
    }
    if query == "survivor":
        for name, holds in detected.items():
            need(not holds, f"survivor triggers {name}")
    return failures


def solve_case(
    name: str,
    tag: Tag,
    query: str,
    extra: str | None,
    expected: str | None,
    solvers: tuple[str, ...],
) -> dict[str, object]:
    smt, assertions = emit(tag, query, extra)
    smt_path = ROOT / f"{name}.smt2"
    smt_path.write_text(smt)
    record: dict[str, object] = {
        "name": name,
        "tag": tag.__dict__,
        "query": query,
        "expected": expected,
        "assertion_count": len(assertions),
        "sha256": hashlib.sha256(smt.encode()).hexdigest(),
        "N": N,
        "solvers": {},
    }
    for binary in solvers:
        solver = Path(binary).name
        status, output = run_solver(binary, smt)
        (ROOT / f"{name}.{solver}.log").write_text(output)
        entry: dict[str, object] = {"status": status}
        if status == "sat":
            model = parse_assignment(output)
            failures = validate_assignment(tag, query, model)
            entry["model_values"] = len(model)
            entry["validator"] = "pass" if not failures else "fail"
            entry["validator_failures"] = failures
        record["solvers"][solver] = entry
    statuses = [entry["status"] for entry in record["solvers"].values()]
    validators = [
        entry.get("validator")
        for entry in record["solvers"].values()
        if entry["status"] == "sat"
    ]
    record["agreement"] = len(set(statuses)) == 1
    record["expected_ok"] = expected is None or all(
        status == expected for status in statuses
    )
    record["validators_ok"] = all(v == "pass" for v in validators)
    return record


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--z3", default="/Users/adam/bin/z3")
    parser.add_argument("--cvc5", default="/Users/adam/bin/cvc5")
    parser.add_argument("--skip-controls", action="store_true")
    args = parser.parse_args()
    solvers = (args.z3, args.cvc5)

    # Remove outputs from the superseded formulation that merely negated all
    # three unreachable consumer predicates.  Keeping those files beside the
    # corrected forced-predicate matrix would make the artifact ambiguous.
    for stale in ROOT.glob("main_*_survivor.*"):
        stale.unlink()

    records: list[dict[str, object]] = []
    if not args.skip_controls:
        smoke_tag = Tag("first", "qother", "radius")
        controls = (
            ("control_known_base_sat", smoke_tag, "base", None, "sat"),
            ("control_allowed_db_cp_alias_sat", smoke_tag, "base", "(= DB CP)", "sat"),
            ("control_deleted_in_B4_unsat", smoke_tag, "base", at("B4", "Q1"), "unsat"),
            (
                "control_b0_unlinked_unsat",
                smoke_tag,
                "base",
                "(not (= B0_0 S0Row_0))",
                "unsat",
            ),
            ("control_B3_card_three_unsat", smoke_tag, "base", card("B3", 3), "unsat"),
        )
        for spec in controls:
            record = solve_case(*spec, solvers)
            records.append(record)
            if not (
                record["agreement"]
                and record["expected_ok"]
                and record["validators_ok"]
            ):
                (ROOT / "results.json").write_text(json.dumps(records, indent=2) + "\n")
                raise SystemExit(f"smoke control failed: {record['name']}")

    for tag in TAGS:
        records.append(
            solve_case(f"main_{tag.name}_ingress", tag, "base", None, "sat", solvers)
        )
        for consumer_name, consumer in consumer_expressions(tag).items():
            records.append(
                solve_case(
                    f"main_{tag.name}_force_{consumer_name}",
                    tag,
                    "base",
                    consumer,
                    "unsat",
                    solvers,
                )
            )

    (ROOT / "results.json").write_text(json.dumps(records, indent=2) + "\n")
    summary = []
    for record in records:
        statuses = ",".join(
            f"{solver}={entry['status']}" for solver, entry in record["solvers"].items()
        )
        validators = ",".join(
            f"{solver}={entry.get('validator', '-')}"
            for solver, entry in record["solvers"].items()
        )
        summary.append(f"{record['name']}: {statuses}; validators {validators}")
    (ROOT / "run-summary.txt").write_text("\n".join(summary) + "\n")
    (ROOT / "file-list.txt").write_text(
        "\n".join(sorted(path.name for path in ROOT.iterdir() if path.is_file())) + "\n"
    )
    print(f"wrote {len(records)} records to {ROOT / 'results.json'}")
    print("\n".join(summary))
    bad = [
        r["name"]
        for r in records
        if not (r["agreement"] and r["expected_ok"] and r["validators_ok"])
    ]
    if bad:
        raise SystemExit(f"solver/validator failure: {', '.join(bad)}")


if __name__ == "__main__":
    main()
