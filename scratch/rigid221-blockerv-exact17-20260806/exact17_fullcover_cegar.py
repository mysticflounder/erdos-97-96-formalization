#!/usr/bin/env python3
"""CEGAR for the exact-17 full pinned-multiplicity shadow.

The Boolean layer chooses one four-point co-radial support at every carrier
centre, imposes the two-centre/common-hit bound, and requires every carrier
point to occur in some chosen support.  The five source-entitled full shells
are pinned exactly.  Each Boolean model is then replayed against strict
Kalmanson and triangle inequalities and the existing formalized core bank.

This is intentionally a projection of ``CriticalShellSystem``.  A surviving
model is not a geometric counterexample; it identifies which source-level
critical-deletion information must be added next.
"""

from __future__ import annotations

import argparse
import glob
import importlib.util
import json
import sys
from itertools import combinations
from pathlib import Path

import z3

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO))

from census.atail_force import producer_bank
from census.global_confinement.metric_realizability_probe import MetricRow

HERE = Path(__file__).resolve().parent
BASE_SPEC = importlib.util.spec_from_file_location(
    "exact17_kalmanson", HERE / "exact17_kalmanson.py"
)
if BASE_SPEC is None or BASE_SPEC.loader is None:
    raise RuntimeError("could not load exact17_kalmanson.py")
base = importlib.util.module_from_spec(BASE_SPEC)
BASE_SPEC.loader.exec_module(base)

POINTS = tuple(range(17))
ORDER = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
NAMED_ROWS = (
    MetricRow(8, (6, 9, 1, 3), True),
    MetricRow(9, (6, 7, 4, 5), True),
    MetricRow(10, (8, 9, 13, 14), True),
    MetricRow(11, (8, 10, 15, 16), True),
    MetricRow(0, (11, 1, 2, 15), True),
)
NAMED_BY_CENTER = {row.center: frozenset(row.support) for row in NAMED_ROWS}

# Every entry is (number of cyclicly ordered points, shell equalities), where
# one equality (c, x, y) means d(c,x) = d(c,y).  These are the checked theorem
# statements in KalmansonThreeEqualitySchemas.lean, including the exact-17
# orientation added by this audit.
THREE_SHELL_SCHEMAS = (
    (6, ((0, 1, 3), (4, 1, 2), (5, 2, 3))),
    (6, ((0, 1, 2), (3, 2, 5), (4, 1, 5))),
    (5, ((0, 1, 2), (1, 2, 4), (3, 1, 4))),
    (6, ((0, 1, 3), (2, 3, 5), (4, 1, 5))),
    (6, ((1, 4, 0), (2, 5, 0), (3, 5, 4))),
    (6, ((4, 1, 5), (3, 0, 5), (2, 0, 1))),
    (5, ((0, 4, 3), (1, 4, 0), (2, 0, 3))),
    (5, ((4, 1, 0), (3, 0, 4), (2, 4, 1))),
    (5, ((1, 0, 3), (2, 4, 3), (3, 4, 0))),
    (5, ((3, 4, 1), (2, 0, 1), (1, 0, 4))),
    (4, ((0, 1, 2), (1, 0, 2), (3, 0, 1))),
    (5, ((0, 1, 2), (1, 2, 3), (4, 1, 3))),
    (6, ((3, 0, 1), (4, 1, 5), (2, 0, 5))),
    (6, ((1, 0, 4), (2, 4, 5), (3, 0, 5))),
    (6, ((2, 1, 5), (3, 0, 5), (4, 0, 1))),
    (5, ((1, 2, 4), (3, 0, 4), (4, 0, 2))),
    (6, ((1, 0, 5), (2, 4, 5), (3, 0, 4))),
    (5, ((1, 0, 3), (3, 0, 2), (4, 2, 3))),
    (6, ((2, 1, 5), (3, 0, 1), (4, 0, 5))),
    (6, ((1, 0, 4), (2, 0, 3), (5, 3, 4))),
    (6, ((1, 4, 5), (2, 0, 5), (3, 0, 4))),
    (6, ((3, 0, 2), (4, 0, 1), (5, 1, 2))),
    (6, ((1, 0, 5), (3, 0, 2), (4, 2, 5))),
    (6, ((3, 1, 2), (4, 0, 1), (5, 0, 2))),
    (5, ((1, 3, 2), (2, 3, 4), (0, 2, 4))),
    (6, ((5, 0, 1), (2, 4, 1), (3, 0, 4))),
    (6, ((4, 2, 1), (3, 0, 1), (5, 2, 0))),
    (6, ((5, 4, 1), (0, 3, 1), (2, 3, 4))),
    (4, ((0, 1, 2), (0, 1, 3), (1, 2, 3))),
    (5, ((0, 1, 2), (0, 1, 3), (4, 2, 3))),
    (5, ((0, 1, 2), (0, 2, 3), (4, 1, 3))),
    (5, ((0, 1, 2), (3, 1, 4), (3, 2, 4))),
    (5, ((0, 1, 3), (0, 2, 3), (4, 1, 2))),
    (4, ((0, 1, 3), (0, 2, 3), (3, 1, 2))),
    (4, ((0, 1, 3), (1, 0, 3), (2, 0, 1))),
    (5, ((0, 1, 2), (4, 1, 3), (4, 2, 3))),
    (5, ((0, 1, 3), (4, 1, 2), (4, 2, 3))),
    (5, ((0, 1, 4), (0, 2, 4), (3, 1, 2))),
    (5, ((0, 2, 3), (0, 2, 4), (1, 3, 4))),
    (6, ((0, 3, 5), (2, 1, 5), (4, 1, 3))),
)


def rotate_three_shell_schema(arity, equalities, shift):
    """Rotate one checked schema without reversing the CCW orientation."""

    return tuple(sorted(
        (
            (center + shift) % arity,
            min((left + shift) % arity, (right + shift) % arity),
            max((left + shift) % arity, (right + shift) % arity),
        )
        for center, left, right in equalities
    ))


# `isCcwConvexPolygon_cyclicShift` transports each checked fixed-order theorem
# around the cyclic order.  The exact classifier verifies that this closure is
# precisely the 16 + 60 + 40 irreducible literal patterns on 4, 5, and 6 points.
THREE_SHELL_ROTATION_SCHEMAS = tuple(sorted({
    (arity, rotate_three_shell_schema(arity, equalities, shift))
    for arity, equalities in THREE_SHELL_SCHEMAS
    for shift in range(arity)
}))


def add_kalmanson_core_exclusions(solver, selected):
    """Forbid every instance of the checked three-row/five-point consumer."""

    clause_count = 0
    for start in range(len(ORDER)):
        rotated = ORDER[start:] + ORDER[:start]
        point_o = rotated[0]
        for positions in combinations(range(1, len(rotated)), 4):
            point_a, point_y, point_e, point_c = (
                rotated[position] for position in positions
            )
            solver.add(z3.Or(
                z3.Not(selected[point_y, point_o]),
                z3.Not(selected[point_y, point_e]),
                z3.Not(selected[point_o, point_e]),
                z3.Not(selected[point_o, point_c]),
                z3.Not(selected[point_a, point_c]),
                z3.Not(selected[point_a, point_o]),
            ))
            clause_count += 1
    return clause_count


def add_two_circle_bisector_exclusions(solver, selected):
    """Forbid direct instances of the checked same-side bisector theorem."""

    clauses = set()
    for cyclic_order in (ORDER, tuple(reversed(ORDER))):
        for start in range(len(cyclic_order)):
            rotated = cyclic_order[start:] + cyclic_order[:start]
            point_q = rotated[0]
            for positions in combinations(range(1, len(rotated)), 3):
                point_u, point_y, point_v = (
                    rotated[position] for position in positions
                )
                atoms = tuple(sorted((
                    (point_q, point_u),
                    (point_q, point_y),
                    (point_v, point_u),
                    (point_v, point_y),
                )))
                clauses.add(atoms)
    for atoms in clauses:
        solver.add(z3.Or(*(z3.Not(selected[atom]) for atom in atoms)))
    return len(clauses)


def add_three_shell_301_415_205_exclusions(solver, selected):
    """Forbid direct instances of the checked six-point shell schema."""

    clause_count = 0
    for positions in combinations(range(len(ORDER)), 6):
        point_0, point_1, point_2, point_3, point_4, point_5 = (
            ORDER[position] for position in positions
        )
        atoms = (
            (point_3, point_0),
            (point_3, point_1),
            (point_4, point_1),
            (point_4, point_5),
            (point_2, point_0),
            (point_2, point_5),
        )
        solver.add(z3.Or(*(z3.Not(selected[atom]) for atom in atoms)))
        clause_count += 1
    return clause_count


def add_three_shell_bank_exclusions(solver, selected):
    """Forbid every cyclic rotation of every checked three-shell schema."""

    clauses = set()
    for arity, equalities in THREE_SHELL_ROTATION_SCHEMAS:
        for positions in combinations(range(len(ORDER)), arity):
            points = tuple(ORDER[position] for position in positions)
            atoms = tuple(sorted(
                (points[center], points[endpoint])
                for center, left, right in equalities
                for endpoint in (left, right)
            ))
            clauses.add(atoms)
    for atoms in clauses:
        solver.add(z3.Or(*(z3.Not(selected[atom]) for atom in atoms)))
    return len(clauses)


def add_seven_point_schema_c_exclusions(solver, selected):
    """Forbid every dihedral occurrence of checked seven-point schema C."""

    clauses = set()
    for cyclic_order in (ORDER, tuple(reversed(ORDER))):
        for start in range(len(cyclic_order)):
            rotated = cyclic_order[start:] + cyclic_order[:start]
            for positions in combinations(range(len(rotated)), 7):
                point_a, point_b, point_c, point_d, point_e, point_f, point_g = (
                    rotated[position] for position in positions
                )
                clauses.add(tuple(sorted((
                    (point_a, point_f),
                    (point_a, point_b),
                    (point_f, point_a),
                    (point_f, point_d),
                    (point_f, point_g),
                    (point_c, point_d),
                    (point_c, point_g),
                    (point_e, point_f),
                    (point_e, point_b),
                ))))
    for atoms in clauses:
        solver.add(z3.Or(*(z3.Not(selected[atom]) for atom in atoms)))
    return len(clauses)


def add_seven_point_schema_f_exclusions(solver, selected):
    """Forbid every dihedral occurrence of checked seven-point schema F."""

    clauses = set()
    for cyclic_order in (ORDER, tuple(reversed(ORDER))):
        for start in range(len(cyclic_order)):
            rotated = cyclic_order[start:] + cyclic_order[:start]
            for positions in combinations(range(len(rotated)), 7):
                point_a, point_b, point_c, point_d, point_e, point_f, point_g = (
                    rotated[position] for position in positions
                )
                clauses.add(tuple(sorted((
                    (point_a, point_f), (point_a, point_c),
                    (point_f, point_a), (point_f, point_g), (point_f, point_c),
                    (point_b, point_f), (point_b, point_e),
                    (point_d, point_b), (point_d, point_e), (point_d, point_g),
                ))))
    for atoms in clauses:
        solver.add(z3.Or(*(z3.Not(selected[atom]) for atom in atoms)))
    return len(clauses)


def add_six_point_schema_de_exclusions(solver, selected):
    """Forbid every dihedral occurrence of checked six-point schemas D/E."""

    clauses = {"d": set(), "e": set()}
    for cyclic_order in (ORDER, tuple(reversed(ORDER))):
        for start in range(len(cyclic_order)):
            rotated = cyclic_order[start:] + cyclic_order[:start]
            for positions in combinations(range(len(rotated)), 6):
                point_a, point_b, point_c, point_d, point_e, point_f = (
                    rotated[position] for position in positions
                )
                clauses["d"].add(tuple(sorted((
                    (point_a, point_e), (point_a, point_b),
                    (point_e, point_a), (point_e, point_c), (point_e, point_f),
                    (point_b, point_e), (point_b, point_f),
                    (point_d, point_e), (point_d, point_b), (point_d, point_c),
                ))))
                clauses["e"].add(tuple(sorted((
                    (point_a, point_f), (point_a, point_d),
                    (point_e, point_b), (point_e, point_c),
                    (point_b, point_a), (point_b, point_c), (point_b, point_d),
                    (point_c, point_f), (point_c, point_b),
                ))))
    for schema_clauses in clauses.values():
        for atoms in schema_clauses:
            solver.add(z3.Or(*(z3.Not(selected[atom]) for atom in atoms)))
    return len(clauses["d"]), len(clauses["e"])


def build_cover_solver(
    *,
    forbid_kalmanson: bool,
    forbid_two_circle_bisector: bool,
    forbid_three_shell_301_415_205: bool,
    forbid_three_shell_bank: bool,
    forbid_seven_point_schema_c: bool,
    forbid_seven_point_schema_f: bool,
    forbid_six_point_schema_de: bool,
):
    solver = z3.Solver()
    selected = {
        (center, point): z3.Bool(f"selected_{center}_{point}")
        for center in POINTS
        for point in POINTS
        if center != point
    }

    for center in POINTS:
        row = [selected[center, point] for point in POINTS if point != center]
        solver.add(z3.PbEq([(literal, 1) for literal in row], 4))

    # Two distinct Euclidean circles have at most two common carrier hits.
    for left, right in combinations(POINTS, 2):
        possible_common = tuple(
            point for point in POINTS if point not in (left, right)
        )
        for triple in combinations(possible_common, 3):
            solver.add(z3.Or(*(
                z3.Not(selected[center, point])
                for center in (left, right)
                for point in triple
            )))

    # Every deleted source has a critical blocker centre, whose selected K4
    # support must contain that source.
    for source in POINTS:
        solver.add(z3.Or(*(
            selected[center, source] for center in POINTS if center != source
        )))

    for center, support in NAMED_BY_CENTER.items():
        for point in POINTS:
            if point != center:
                solver.add(selected[center, point] == (point in support))
    kalmanson_clauses = (
        add_kalmanson_core_exclusions(solver, selected)
        if forbid_kalmanson else 0
    )
    bisector_clauses = (
        add_two_circle_bisector_exclusions(solver, selected)
        if forbid_two_circle_bisector else 0
    )
    three_shell_clauses = (
        add_three_shell_301_415_205_exclusions(solver, selected)
        if forbid_three_shell_301_415_205 else 0
    )
    three_shell_bank_clauses = (
        add_three_shell_bank_exclusions(solver, selected)
        if forbid_three_shell_bank else 0
    )
    seven_point_schema_c_clauses = (
        add_seven_point_schema_c_exclusions(solver, selected)
        if forbid_seven_point_schema_c else 0
    )
    seven_point_schema_f_clauses = (
        add_seven_point_schema_f_exclusions(solver, selected)
        if forbid_seven_point_schema_f else 0
    )
    six_point_schema_d_clauses, six_point_schema_e_clauses = (
        add_six_point_schema_de_exclusions(solver, selected)
        if forbid_six_point_schema_de else (0, 0)
    )
    return (
        solver,
        selected,
        kalmanson_clauses,
        bisector_clauses,
        three_shell_clauses,
        three_shell_bank_clauses,
        seven_point_schema_c_clauses,
        seven_point_schema_f_clauses,
        six_point_schema_d_clauses,
        six_point_schema_e_clauses,
    )


def selected_rows(model, selected) -> tuple[MetricRow, ...]:
    rows = []
    for center in POINTS:
        support = tuple(
            point
            for point in POINTS
            if point != center and z3.is_true(model.eval(selected[center, point]))
        )
        rows.append(MetricRow(center, support, center in NAMED_BY_CENTER))
    return tuple(rows)


def block_model(solver, selected, rows):
    solver.add(z3.Or(*(
        selected[row.center, point] != (point in row.support)
        for row in rows
        for point in POINTS
        if point != row.center
    )))


def record_key(record):
    return json.dumps(record, sort_keys=True, separators=(",", ":"))


def bank_stage_present(rows, target_record) -> bool:
    """Recheck one bank family without rescanning every expensive matcher."""

    stage = target_record["stage"]
    source = target_record["source"]
    orientation = target_record["orientation"]
    if stage == "equality-convex-two-kalmanson-cancellation":
        try:
            checked = producer_bank.certify_two_kalmanson_cancellation(
                rows, 17, ORDER, target_record.get("core", {})
            )
        except (TypeError, ValueError):
            return False
        return checked == target_record
    if source == "common-system-bank":
        bank = producer_bank._load_common_system_probe()
        if stage == "equality-nested-equal-chord":
            return bank.nested_equal_chord_core(rows, 17, ORDER) is not None
        for function_name, reverse_stage, _consumer in (
            producer_bank._COMMON_ORDERED_MATCHERS
        ):
            matcher = getattr(bank, function_name)
            if orientation == "forward":
                match = matcher(rows, 17, ORDER)
                if match is not None and match["stage"] == stage:
                    return True
            if orientation == "reverse" and stage == reverse_stage:
                return matcher(rows, 17, tuple(reversed(ORDER))) is not None

    # The first three structural families are the common hot path and can be
    # checked without the extended or cyclic matcher banks.
    basic_stages = {
        "equality-duplicate-center",
        "equality-exact-off-circle",
        "equality-perpendicular-bisector-convex",
    }
    records = producer_bank.scan_all_formalized_cores(
        rows,
        17,
        ORDER,
        include_extended=stage not in basic_stages,
        include_ordered=(
            orientation != "invariant"
            or stage.startswith("equality-convex-")
        ),
        include_common_system=False,
    )
    return any(
        hit["stage"] == stage and hit["orientation"] == orientation
        for hit in records
    )


def minimize_bank_witness(rows, target_record):
    """Greedily retain only row incidences forcing the accepted core family."""

    kept = list(rows)
    changed = True
    while changed:
        changed = False
        for row in tuple(kept):
            trial = [candidate for candidate in kept if candidate is not row]
            if bank_stage_present(trial, target_record):
                kept = trial
                changed = True
    # Equality-only consumers generally need two hits from a selected row, not
    # its two irrelevant completion points.  Shrink non-exact supports so the
    # learned clause records the actual theorem premise.  Exact rows stay whole:
    # deleting one of their hits would turn a known zero into an off-shell fact.
    changed = True
    while changed:
        changed = False
        for row_index, row in enumerate(tuple(kept)):
            if row.exact or len(row.support) <= 2:
                continue
            for point in tuple(row.support):
                support = tuple(hit for hit in row.support if hit != point)
                trial = list(kept)
                trial[row_index] = MetricRow(row.center, support, False)
                if bank_stage_present(trial, target_record):
                    kept = trial
                    changed = True
                    break
            if changed:
                break
    return tuple(kept)


def block_row_pattern(solver, selected, rows):
    """Forbid simultaneous occurrence of the displayed selected supports."""

    literals = [
        z3.Not(selected[row.center, point])
        for row in rows
        for point in row.support
    ]
    solver.add(z3.Or(*literals))


def linear_replay(rows, timeout_ms: int):
    solver, ds, ss = base.build_solver(ORDER)
    solver.set(timeout=timeout_ms)
    for row in rows:
        base.add_exact_row(
            solver,
            ds,
            ss,
            ORDER,
            row.center,
            row.support,
            row.exact,
            False,
            False,
        )
    return str(solver.check())


def linear_replay_core(rows, timeout_ms: int):
    """Return a row-incidence core for a strict metric LP contradiction."""

    def solve_core(include_exact_nonmembership: bool):
        solver, ds, _ss = base.build_solver(ORDER)
        solver.set(timeout=timeout_ms)
        assumptions = []
        provenance = {}
        for row_index, row in enumerate(rows):
            anchor = row.support[0]
            radius = base.dist(ds, row.center, anchor)
            if row.exact and include_exact_nonmembership:
                tag = z3.Bool(f"linear_exact_row_{row_index}")
                constraints = [
                    base.dist(ds, row.center, point) == radius
                    for point in row.support[1:]
                ]
                constraints.extend(
                    base.dist(ds, row.center, point) != radius
                    for point in POINTS
                    if point != row.center and point not in row.support
                )
                solver.add(z3.Implies(tag, z3.And(*constraints)))
                assumptions.append(tag)
                provenance[tag.decl().name()] = (row_index, None)
                continue
            for point in row.support[1:]:
                tag = z3.Bool(f"linear_row_{row_index}_hit_{point}")
                solver.add(z3.Implies(
                    tag,
                    base.dist(ds, row.center, point) == radius,
                ))
                assumptions.append(tag)
                provenance[tag.decl().name()] = (row_index, point)

        verdict = solver.check(*assumptions)
        if verdict != z3.unsat:
            return str(verdict), None
        core = list(solver.unsat_core())
        # Z3's returned assumption core is sound but need not be minimal.
        index = 0
        while index < len(core):
            trial = core[:index] + core[index + 1:]
            if solver.check(*trial) == z3.unsat:
                core = trial
            else:
                index += 1
        used = {tag.decl().name() for tag in core}
        support_by_row = {}
        for name in used:
            row_index, point = provenance[name]
            row = rows[row_index]
            if point is None:
                support_by_row[row_index] = tuple(row.support)
            else:
                support_by_row.setdefault(row_index, {row.support[0]}).add(point)
        core_rows = []
        for row_index in sorted(support_by_row):
            row = rows[row_index]
            support = support_by_row[row_index]
            if isinstance(support, set):
                support = tuple(sorted(support))
            # Equality-first cores do not consume off-shell exactness.
            exact = row.exact and include_exact_nonmembership
            core_rows.append(MetricRow(row.center, tuple(support), exact))
        return "unsat", tuple(core_rows)

    equality_verdict, equality_core = solve_core(False)
    if equality_verdict != "sat":
        return equality_verdict, equality_core
    return solve_core(True)


def row_payload(rows):
    return [row.as_dict() for row in rows]


def rows_from_payload(payload):
    return tuple(
        MetricRow(
            int(row["center"]),
            tuple(int(point) for point in row["support"]),
            bool(row.get("exact", False)),
        )
        for row in payload
    )


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--models", type=int, default=100)
    parser.add_argument("--timeout-ms", type=int, default=30_000)
    parser.add_argument("--stop-on-survivor", action="store_true")
    parser.add_argument("--forbid-kalmanson", action="store_true")
    parser.add_argument("--forbid-two-circle-bisector", action="store_true")
    parser.add_argument("--forbid-three-shell-301-415-205", action="store_true")
    parser.add_argument("--forbid-three-shell-bank", action="store_true")
    parser.add_argument("--forbid-seven-point-schema-c", action="store_true")
    parser.add_argument("--forbid-seven-point-schema-f", action="store_true")
    parser.add_argument("--forbid-six-point-schema-de", action="store_true")
    parser.add_argument("--learn-bank-clauses", action="store_true")
    parser.add_argument("--learn-linear-clauses", action="store_true")
    parser.add_argument("--initial-patterns", type=Path, action="append", default=[])
    parser.add_argument("--initial-patterns-glob")
    parser.add_argument("--seed", type=int, default=0)
    args = parser.parse_args()

    (
        solver,
        selected,
        kalmanson_clauses,
        bisector_clauses,
        three_shell_clauses,
        three_shell_bank_clauses,
        seven_point_schema_c_clauses,
        seven_point_schema_f_clauses,
        six_point_schema_d_clauses,
        six_point_schema_e_clauses,
    ) = build_cover_solver(
        forbid_kalmanson=args.forbid_kalmanson,
        forbid_two_circle_bisector=args.forbid_two_circle_bisector,
        forbid_three_shell_301_415_205=(
            args.forbid_three_shell_301_415_205
        ),
        forbid_three_shell_bank=args.forbid_three_shell_bank,
        forbid_seven_point_schema_c=args.forbid_seven_point_schema_c,
        forbid_seven_point_schema_f=args.forbid_seven_point_schema_f,
        forbid_six_point_schema_de=args.forbid_six_point_schema_de,
    )
    solver.set(random_seed=args.seed)
    learned_patterns = []
    initial_keys = set()
    initial_paths = list(args.initial_patterns)
    if args.initial_patterns_glob:
        initial_paths.extend(
            Path(path) for path in sorted(glob.glob(args.initial_patterns_glob))
        )
    for initial_path in initial_paths:
        # Parallel shards create their redirected output files before they load
        # the shared clause glob.  Ignore those not-yet-written siblings.
        if initial_path.stat().st_size == 0:
            continue
        with initial_path.open() as handle:
            initial = json.load(handle)
        if isinstance(initial, dict):
            initial = initial["learned_patterns"]
        for payload in initial:
            key = json.dumps(payload, sort_keys=True, separators=(",", ":"))
            if key in initial_keys:
                continue
            initial_keys.add(key)
            pattern = rows_from_payload(payload)
            block_row_pattern(solver, selected, pattern)
            learned_patterns.append(pattern)
    counts = {
        "boolean_models": 0,
        "bank_rejected": 0,
        "linear_unsat": 0,
        "linear_unknown": 0,
        "survivors": 0,
        "learned_bank_clauses": 0,
        "learned_linear_clauses": 0,
    }
    examples: dict[str, list] = {key: [] for key in counts if key != "boolean_models"}

    while counts["boolean_models"] < args.models and solver.check() == z3.sat:
        rows = selected_rows(solver.model(), selected)
        counts["boolean_models"] += 1

        bank_hits = producer_bank.scan_all_formalized_cores(rows, 17, ORDER)
        if bank_hits:
            counts["bank_rejected"] += 1
            minimized = None
            if args.learn_bank_clauses:
                minimized = minimize_bank_witness(rows, bank_hits[0])
                block_row_pattern(solver, selected, minimized)
                learned_patterns.append(minimized)
                counts["learned_bank_clauses"] += 1
            if len(examples["bank_rejected"]) < 3:
                examples["bank_rejected"].append({
                    "rows": row_payload(rows),
                    "cores": list(bank_hits),
                    "minimized_rows": (
                        row_payload(minimized) if minimized is not None else None
                    ),
                })
            if not args.learn_bank_clauses:
                block_model(solver, selected, rows)
            continue

        verdict, linear_core = linear_replay_core(rows, args.timeout_ms)
        if verdict == "unsat":
            counts["linear_unsat"] += 1
            if len(examples["linear_unsat"]) < 3:
                examples["linear_unsat"].append({
                    "rows": row_payload(rows),
                    "core_rows": row_payload(linear_core),
                })
            if args.learn_linear_clauses:
                block_row_pattern(solver, selected, linear_core)
                learned_patterns.append(linear_core)
                counts["learned_linear_clauses"] += 1
            else:
                block_model(solver, selected, rows)
            continue
        if verdict == "unknown":
            counts["linear_unknown"] += 1
            if len(examples["linear_unknown"]) < 3:
                examples["linear_unknown"].append(row_payload(rows))
            block_model(solver, selected, rows)
            continue

        counts["survivors"] += 1
        if len(examples["survivors"]) < 3:
            examples["survivors"].append(row_payload(rows))
        if args.stop_on_survivor:
            break
        block_model(solver, selected, rows)

    print(json.dumps({
        "counts": counts,
        "examples": examples,
        "forbid_kalmanson": args.forbid_kalmanson,
        "kalmanson_clauses": kalmanson_clauses,
        "bisector_clauses": bisector_clauses,
        "three_shell_301_415_205_clauses": three_shell_clauses,
        "three_shell_bank_clauses": three_shell_bank_clauses,
        "seven_point_schema_c_clauses": seven_point_schema_c_clauses,
        "seven_point_schema_f_clauses": seven_point_schema_f_clauses,
        "six_point_schema_d_clauses": six_point_schema_d_clauses,
        "six_point_schema_e_clauses": six_point_schema_e_clauses,
        "seed": args.seed,
        "learned_patterns": [row_payload(pattern) for pattern in learned_patterns],
        "boolean_terminal": str(solver.check()),
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
