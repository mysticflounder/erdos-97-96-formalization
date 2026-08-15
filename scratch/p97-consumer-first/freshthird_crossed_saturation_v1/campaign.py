#!/usr/bin/env python3
"""FreshThird crossed-row saturation v1 structural CEGAR round.

This bounded QF_LIA model is an exact finite presentation of the named
incidence/order ingress for one crossed constructor.  It is not a universal
Lean proof: an UNSAT result still needs a source-level extraction/lift and a
kernel-checked consumer.
"""

from __future__ import annotations

import argparse
import json
import subprocess
import time
from collections import Counter, defaultdict
from concurrent.futures import ProcessPoolExecutor
from pathlib import Path

from z3 import And, Bool, BoolVal, Distinct, If, Implies, Int, Not, Or, Solver, Sum, is_true, sat, unknown


HERE = Path(__file__).resolve().parent
ARTIFACTS = HERE / "artifacts"
RESULTS = HERE / "results"
DOMAIN_SIZE = 27

ROLES = (
    "p1", "p2", "r1", "r2", "s0", "s1", "x", "y", "wc", "wo",
    "F", "O", "C0", "C1", "Kc", "Ko", "apex1", "apex2", "apexS",
)
ROWS = ("F", "O", "C0", "C1", "Kc", "Ko")
BLOCKED_AT = {"F": "p1", "O": "r1", "C0": "s0", "C1": "s1", "Kc": "wc", "Ko": "wo"}
ENDPOINT_ARMS = (("p1", "r1"), ("p1", "r2"), ("p2", "r1"), ("p2", "r2"))
COMMON_ARM_PAIRS = tuple(
    (a0, a1)
    for a0 in range(4)
    for a1 in range(4)
    if a0 // 2 == a1 // 2 or a0 % 2 == a1 % 2
)
CHOICES = ("omit_s0", "omit_s1", "equal_source_blocker")
SATURATION_BRANCHES = ("shared",) + tuple(f"{a}__{b}" for a in CHOICES for b in CHOICES)


def bool_sum(items):
    return Sum([If(item, 1, 0) for item in items])


def selected(vector, index):
    return Or([And(index == slot, vector[slot]) for slot in range(DOMAIN_SIZE)])


def value_at(values, index):
    return Sum([If(index == slot, values[slot], 0) for slot in range(DOMAIN_SIZE)])


def between(a, b, k):
    return Or(And(a < k, k < b), And(b < k, k < a))


def set_exact(solver, row, role_ids):
    for slot in range(DOMAIN_SIZE):
        solver.add(row[slot] == Or([role == slot for role in role_ids]))


def require_distinct(solver, role, names):
    solver.add(Distinct(*[role[name] for name in names]))


def build_case(
    orientation: str,
    branch: str,
    arm_pair: tuple[int, int],
    negative: str | None = None,
    kalmanson_two_row: bool = False,
    kalmanson_four_row: bool = False,
):
    if orientation not in {"XY", "YX"}:
        raise ValueError(orientation)
    if branch not in SATURATION_BRANCHES:
        raise ValueError(branch)

    solver = Solver()
    solver.set(timeout=10_000)
    role = {name: Int(f"id_{name}") for name in ROLES}
    rows = {name: [Bool(f"row_{name}_{slot}") for slot in range(DOMAIN_SIZE)] for name in ROWS}
    used = [Bool(f"used_{slot}") for slot in range(DOMAIN_SIZE)]
    rank = [Int(f"rank_{slot}") for slot in range(DOMAIN_SIZE)]
    cap = [Int(f"cap_{slot}") for slot in range(DOMAIN_SIZE)]
    direct = Bool("direct_boundary_blocks")

    for identifier in role.values():
        solver.add(0 <= identifier, identifier < DOMAIN_SIZE)

    for slot in range(DOMAIN_SIZE):
        occurrences = [identifier == slot for identifier in role.values()]
        occurrences += [rows[name][slot] for name in ROWS]
        solver.add(used[slot] == Or(occurrences))
        solver.add(0 <= rank[slot], rank[slot] < DOMAIN_SIZE)
        solver.add(-1 <= cap[slot], cap[slot] < 3)
    for left in range(DOMAIN_SIZE):
        for right in range(left + 1, DOMAIN_SIZE):
            solver.add(Implies(And(used[left], used[right]), rank[left] != rank[right]))

    # Every canonical selected row has exactly four physical support points,
    # contains its blocked point, and omits its center.
    for name in ROWS:
        solver.add(bool_sum(rows[name]) == 4)
        solver.add(selected(rows[name], role[BLOCKED_AT[name]]))
        solver.add(Not(selected(rows[name], role[name])))

    common_outside, opposite_outside = (("x", "y") if orientation == "XY" else ("y", "x"))
    set_exact(solver, rows["F"], [role[x] for x in ("p1", "p2", "x", "y")])
    set_exact(solver, rows["C0"], [role[x] for x in ("s0", "s1", common_outside, "wc")])
    set_exact(solver, rows["O"], [role[x] for x in ("r1", "r2", opposite_outside, "wo")])
    solver.add(selected(rows["C1"], role["s0"]), selected(rows["C1"], role["s1"]))

    # Exact named support packets and their stated nonmemberships.
    require_distinct(solver, role, ("p1", "p2", "x", "y"))
    require_distinct(solver, role, ("s0", "s1", common_outside, "wc"))
    require_distinct(solver, role, ("r1", "r2", opposite_outside, "wo"))
    # The live ingress has disjoint source endpoint pairs, not merely
    # distinct endpoints within each pair.
    for first_endpoint in ("p1", "p2"):
        for second_endpoint in ("r1", "r2"):
            solver.add(role[first_endpoint] != role[second_endpoint])
    for source in ("s0", "s1"):
        for endpoint in ("p1", "p2", "r1", "r2"):
            solver.add(role[source] != role[endpoint])
    solver.add(role[opposite_outside] != role["s0"], role[opposite_outside] != role["s1"])
    solver.add(role[opposite_outside] != role[common_outside], role[opposite_outside] != role["wc"])
    solver.add(role[common_outside] != role["r1"], role[common_outside] != role["r2"])
    solver.add(role[common_outside] != role[opposite_outside], role[common_outside] != role["wo"])

    # Actual blocker equality is functional in the blocked point, while equal
    # actual blockers give equal selected supports.  This is the only row
    # equality mechanism; unlike the old canary, distinct source blockers do
    # not receive unconditional equal rows.
    for i, first in enumerate(ROWS):
        for second in ROWS[i + 1 :]:
            same_blocked = role[BLOCKED_AT[first]] == role[BLOCKED_AT[second]]
            same_center = role[first] == role[second]
            solver.add(Implies(same_blocked, same_center))
            for slot in range(DOMAIN_SIZE):
                solver.add(Implies(same_blocked, rows[first][slot] == rows[second][slot]))
                solver.add(Implies(same_center, rows[first][slot] == rows[second][slot]))

    # Distinct source blockers and the source-clean blocker-avoidance frontier.
    solver.add(role["C0"] != role["C1"], role["F"] != role["O"])
    for center in ("C0", "C1"):
        solver.add(role[center] != role["F"], role[center] != role["O"])
        solver.add(role[center] != role["apex1"], role[center] != role["apex2"])

    # Source-level pair-deletion views and the common-deletion-core pair.
    for row_name, arm_index in (("C0", arm_pair[0]), ("C1", arm_pair[1])):
        p_endpoint, r_endpoint = ENDPOINT_ARMS[arm_index]
        solver.add(Not(selected(rows[row_name], role[p_endpoint])))
        solver.add(Not(selected(rows[row_name], role[r_endpoint])))

    # Boundary/cap packet.  Finite ranks are an order-compression of the
    # distinguished points, not an upper bound on the ambient carrier.
    for center in ROWS:
        solver.add(0 <= value_at(cap, role[center]), value_at(cap, role[center]) < 3)
    for endpoint in ("p1", "p2", "r1", "r2", "s0", "s1"):
        solver.add(value_at(cap, role[endpoint]) == 0)
    solver.add(value_at(cap, role["C0"]) == 0)
    solver.add(Or(value_at(cap, role["C1"]) == 1, value_at(cap, role["C1"]) == 2))
    for outside in ("x", "y", "wc", "wo"):
        solver.add(value_at(cap, role[outside]) != 0)
    for apex in ("apex1", "apex2", "apexS"):
        solver.add(value_at(cap, role[apex]) == -1)

    iv = value_at(rank, role["apex1"])
    iw = value_at(rank, role["apex2"])
    solver.add(value_at(rank, role["apexS"]) == 0)
    solver.add(If(direct, And(0 < iv, iv < iw), And(0 < iw, iw < iv)))
    for slot in range(DOMAIN_SIZE):
        solver.add(
            Implies(
                And(used[slot], cap[slot] == 0),
                If(direct, iw < rank[slot], And(0 < rank[slot], rank[slot] < iw)),
            )
        )
        solver.add(
            Implies(
                And(used[slot], cap[slot] == 1),
                If(direct, And(0 < rank[slot], rank[slot] < iv), iv < rank[slot]),
            )
        )
        solver.add(
            Implies(
                And(used[slot], cap[slot] == 2),
                If(direct, And(iv < rank[slot], rank[slot] < iw), And(iw < rank[slot], rank[slot] < iv)),
            )
        )

    c0_rank, c1_rank = value_at(rank, role["C0"]), value_at(rank, role["C1"])
    s0_rank, s1_rank = value_at(rank, role["s0"]), value_at(rank, role["s1"])
    solver.add(between(c0_rank, c1_rank, s0_rank) == Not(between(c0_rank, c1_rank, s1_rank)))

    # Share selected-row center ranks across the order cuts.  Keeping the
    # 27-slot lookup as one definition preserves the exact compressed order
    # semantics while avoiding thousands of repeated arithmetic terms.
    kalmanson_center_rank = {}
    if kalmanson_two_row or kalmanson_four_row:
        for row_name in ROWS:
            center_rank = Int(f"rank_center_{row_name}")
            solver.add(center_rank == value_at(rank, role[row_name]))
            kalmanson_center_rank[row_name] = center_rank

    # Source-entitled global cut from
    # CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair.
    # Every row here is the canonical selectedAt row at its physical center.
    # The finite ranks are an order-preserving compression of BoundaryIndexing,
    # so an increasing center-center-point-point quadruple shared by two rows
    # is impossible.  No metric variables or invented memberships are added.
    if kalmanson_two_row:
        for first_row in ROWS:
            for second_row in ROWS:
                first_center_rank = kalmanson_center_rank[first_row]
                second_center_rank = kalmanson_center_rank[second_row]
                for late_first in range(DOMAIN_SIZE):
                    for late_second in range(DOMAIN_SIZE):
                        solver.add(
                            Not(
                                And(
                                    first_center_rank < second_center_rank,
                                    second_center_rank < rank[late_first],
                                    rank[late_first] < rank[late_second],
                                    rows[first_row][late_first],
                                    rows[first_row][late_second],
                                    rows[second_row][late_first],
                                    rows[second_row][late_second],
                                )
                            )
                        )

    # Source-entitled global cut from
    # CapCrossingKalmansonBridge.false_of_four_selected_rows_chained_late_pair.
    # For every choice of four materialized actual selected rows and every
    # possible `ic`, forbid the exact ordered support-incidence antecedent.
    if kalmanson_four_row:
        # Share the 36 dynamic row-at-center membership lookups.  Expanding
        # each lookup into its 27-slot selector inside every four-row clause
        # is logically identical but produces a needlessly enormous SMT file.
        row_center_mem = {}
        for support_row in ROWS:
            for center_row in ROWS:
                atom = Bool(f"row_{support_row}_contains_center_{center_row}")
                solver.add(atom == selected(rows[support_row], role[center_row]))
                row_center_mem[support_row, center_row] = atom
        for bridge_row in ROWS:
            for early_row in ROWS:
                early_rank = kalmanson_center_rank[early_row]
                for middle_row in ROWS:
                    middle_rank = kalmanson_center_rank[middle_row]
                    for late_row in ROWS:
                        late_rank = kalmanson_center_rank[late_row]
                        for ic in range(DOMAIN_SIZE):
                            solver.add(
                                Not(
                                    And(
                                        early_rank < middle_rank,
                                        middle_rank < rank[ic],
                                        rank[ic] < late_rank,
                                        row_center_mem[bridge_row, early_row],
                                        row_center_mem[bridge_row, middle_row],
                                        row_center_mem[early_row, bridge_row],
                                        rows[early_row][ic],
                                        row_center_mem[middle_row, bridge_row],
                                        rows[middle_row][ic],
                                        row_center_mem[late_row, early_row],
                                        row_center_mem[late_row, middle_row],
                                    )
                                )
                            )

    if branch == "shared":
        solver.add(role["wc"] == role["wo"])
    else:
        common_choice, opposite_choice = branch.split("__", maxsplit=1)
        solver.add(role["wc"] != role["wo"])
        solver.add(role["Ko"] != role["F"], role["Ko"] != role["C0"])
        solver.add(role["Kc"] != role["F"], role["Kc"] != role["O"])
        if common_choice == "omit_s0":
            solver.add(Not(selected(rows["Kc"], role["s0"])))
        elif common_choice == "omit_s1":
            solver.add(Not(selected(rows["Kc"], role["s1"])))
        else:
            solver.add(role["Kc"] == role["C0"])
        if opposite_choice == "omit_s0":
            solver.add(Not(selected(rows["Ko"], role["s0"])))
        elif opposite_choice == "omit_s1":
            solver.add(Not(selected(rows["Ko"], role["s1"])))
        else:
            solver.add(role["Ko"] == role["C1"])

    if negative == "overfull_common_row":
        solver.add(bool_sum(rows["C0"]) == 5)
    elif negative == "equal_source_blockers":
        solver.add(role["C0"] == role["C1"])
    elif negative is not None:
        raise ValueError(negative)

    return solver, {"role": role, "rows": rows, "rank": rank, "cap": cap, "direct": direct}


def emit(solver, path: Path):
    path.write_text("(set-logic QF_LIA)\n" + solver.sexpr() + "\n(check-sat)\n", encoding="utf-8")


def cvc5_status(path: Path):
    try:
        proc = subprocess.run(
            ["cvc5", "--tlimit=30000", str(path)], capture_output=True, text=True, timeout=40, check=False
        )
    except (FileNotFoundError, subprocess.TimeoutExpired) as exc:
        return f"unavailable:{type(exc).__name__}"
    lines = [line.strip() for line in proc.stdout.splitlines()]
    return next((line for line in lines if line in {"sat", "unsat", "unknown"}), "malformed")


def model_snapshot(model, context):
    role = {name: model.eval(var, model_completion=True).as_long() for name, var in context["role"].items()}
    rank = context["rank"]
    cap = context["cap"]
    rows = {}
    for name, vector in context["rows"].items():
        rows[name] = [
            slot
            for slot, member in enumerate(vector)
            if is_true(model.eval(member, model_completion=True))
        ]
    return {
        "roles": role,
        "role_ranks": {name: model.eval(rank[slot], model_completion=True).as_long() for name, slot in role.items()},
        "role_caps": {name: model.eval(cap[slot], model_completion=True).as_long() for name, slot in role.items()},
        "direct": is_true(model.eval(context["direct"], model_completion=True)),
        "rows": rows,
    }


def run_one(
    orientation,
    branch,
    arm_pair,
    label,
    negative=None,
    kalmanson_two_row=False,
    kalmanson_four_row=False,
):
    solver, context = build_case(
        orientation,
        branch,
        arm_pair,
        negative=negative,
        kalmanson_two_row=kalmanson_two_row,
        kalmanson_four_row=kalmanson_four_row,
    )
    if kalmanson_four_row:
        artifact_profile = "kalmanson_two_four_row" if kalmanson_two_row else "kalmanson_four_row"
    else:
        artifact_profile = "kalmanson_two_row" if kalmanson_two_row else "structural"
    artifact_dir = ARTIFACTS / artifact_profile
    artifact_dir.mkdir(parents=True, exist_ok=True)
    path = artifact_dir / f"{label}.smt2"
    emit(solver, path)
    started = time.monotonic()
    result = solver.check()
    elapsed = round(time.monotonic() - started, 4)
    if result == unknown:
        raise RuntimeError(f"{label}: z3 unknown: {solver.reason_unknown()}")
    status = "sat" if result == sat else "unsat"
    replay = cvc5_status(path)
    if replay != status:
        raise RuntimeError(f"{label}: z3={status}, cvc5={replay}")
    row = {
        "label": label,
        "orientation": orientation,
        "branch": branch,
        "arm_pair": list(arm_pair),
        "negative": negative,
        "z3": status,
        "z3_seconds": elapsed,
        "cvc5": replay,
        "artifact": str(path.relative_to(HERE)),
    }
    if result == sat:
        row["model"] = model_snapshot(solver.model(), context)
    return row


def run_branch(task):
    orientation, branch, kalmanson_two_row, kalmanson_four_row, branch_survival = task
    rows = []
    for first_arm, second_arm in COMMON_ARM_PAIRS:
        label = f"{orientation}_{branch}_arms{first_arm}{second_arm}"
        rows.append(
            run_one(
                orientation,
                branch,
                (first_arm, second_arm),
                label,
                kalmanson_two_row=kalmanson_two_row,
                kalmanson_four_row=kalmanson_four_row,
            )
        )
        # The live arm pair is existential.  One SAT witness proves this
        # orientation/branch remains open, so later arms cannot change its
        # closure classification.
        if branch_survival and rows[-1]["z3"] == "sat":
            break
    return rows


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--kalmanson-two-row", action="store_true")
    parser.add_argument("--kalmanson-four-row", action="store_true")
    parser.add_argument(
        "--branch-survival",
        action="store_true",
        help="stop each branch at its first SAT deletion-arm witness",
    )
    parser.add_argument(
        "--jobs",
        type=int,
        default=1,
        help="parallel orientation/branch workers (1-12)",
    )
    args = parser.parse_args()
    if not 1 <= args.jobs <= 12:
        parser.error("--jobs must be between 1 and 12")
    ARTIFACTS.mkdir(parents=True, exist_ok=True)
    RESULTS.mkdir(parents=True, exist_ok=True)
    if args.kalmanson_four_row:
        profile = "kalmanson_two_four_row" if args.kalmanson_two_row else "kalmanson_four_row"
    else:
        profile = "kalmanson_two_row" if args.kalmanson_two_row else "structural"
    if args.branch_survival:
        profile += "_branch_survival"
    result_dir = RESULTS / profile
    result_dir.mkdir(parents=True, exist_ok=True)
    tasks = [
        (
            orientation,
            branch,
            args.kalmanson_two_row,
            args.kalmanson_four_row,
            args.branch_survival,
        )
        for orientation in ("XY", "YX")
        for branch in SATURATION_BRANCHES
    ]
    if args.jobs == 1:
        branch_rows = map(run_branch, tasks)
        rows = [row for group in branch_rows for row in group]
    else:
        with ProcessPoolExecutor(max_workers=args.jobs) as pool:
            rows = [row for group in pool.map(run_branch, tasks) for row in group]
    rows.sort(key=lambda row: (row["orientation"], row["branch"], row["arm_pair"]))

    controls = [
        run_one(
            "XY", "omit_s0__omit_s0", (0, 0), "negative_overfull",
            "overfull_common_row", args.kalmanson_two_row, args.kalmanson_four_row,
        ),
        run_one(
            "XY", "omit_s0__omit_s0", (0, 0), "negative_equal_source_blockers",
            "equal_source_blockers", args.kalmanson_two_row, args.kalmanson_four_row,
        ),
    ]
    if any(row["z3"] != "unsat" for row in controls):
        raise RuntimeError("negative control unexpectedly satisfiable")

    counts = Counter(row["z3"] for row in rows)
    branch_counts = defaultdict(Counter)
    for row in rows:
        branch_counts[f"{row['orientation']}:{row['branch']}"][row["z3"]] += 1
    summary = {
        "campaign": f"freshthird_crossed_saturation_v1_{profile}",
        "claim_scope": "bounded structural CEGAR diagnostic; no universal Lean closure",
        "domain_semantics": "27-slot compression of named points plus at most eight selected-row fillers; not an ambient-cardinality bound",
        "cases": len(rows),
        "logical_case_space": 2 * len(SATURATION_BRANCHES) * len(COMMON_ARM_PAIRS),
        "enumeration_mode": (
            "first SAT witness per orientation/branch"
            if args.branch_survival else "exhaustive"
        ),
        "jobs": args.jobs,
        "counts": dict(counts),
        "branch_counts": {key: dict(value) for key, value in sorted(branch_counts.items())},
        "negative_controls": [{key: row[key] for key in ("label", "z3", "cvc5")} for row in controls],
        "unknown_policy": "fail closed",
        "admitted_global_cuts": (
            (["false_of_two_selected_rows_shared_late_pair"] if args.kalmanson_two_row else [])
            + (["false_of_four_selected_rows_chained_late_pair"] if args.kalmanson_four_row else [])
        ),
        "closure": "none",
    }
    (result_dir / "cases.json").write_text(json.dumps(rows, indent=2) + "\n", encoding="utf-8")
    (result_dir / "summary.json").write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(summary, indent=2))


if __name__ == "__main__":
    main()
