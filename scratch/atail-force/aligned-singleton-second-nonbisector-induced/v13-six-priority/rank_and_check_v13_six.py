#!/usr/bin/env python3
"""Priority search of all six-class subsets of the pinned v13 survivor.

This is a scratch discovery lane.  It imports the existing exact Euclidean
subset core miner for source validation, convexity encoding, and independent
solver replay, but replaces its raw-equality/lexicographic enumeration with a
structural rank.

Equalities are viewed as edges in a graph whose vertices are squared-distance
variables.  The primary score is the graphic rank of those equalities, followed
by overlap between distinct equidistance-center families, the largest connected
leaf family around one center, distance-variable reuse, pairwise equation
support overlap, and finally raw equality count.  The quotient tuple is used
only as the final deterministic tie-break.

Every timeout/UNKNOWN/error is fail-closed.  A Z3 SAT model is substituted back
into the exact asserted records.  Any Z3 UNSAT is replayed from exact SMT-LIB by
fresh Z3 and independent cvc5 before it is accepted.  On accepted UNSAT, only
positive-row equalities are deletion-shrunk; gauge, strict cyclic convexity, and
pairwise distinctness remain fixed background.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
import math
import sys
import time
from collections import Counter, defaultdict
from pathlib import Path
from typing import Any, Iterable, Sequence

import z3


HERE = Path(__file__).resolve().parent
LANE = HERE.parent
MINER_PATH = LANE / "exact_euclidean_subset_core_miner.py"
PROBE = LANE / "euclidean-survivor-probe-v13-local-critical-reuse-second.json"
POSITIVE_SMT2 = (
    LANE
    / "euclidean-survivor-probe-v13-local-critical-reuse-second.positive_rows.smt2"
)
CEGAR_RESULT = LANE / "cegar-v13-local-critical-reuse-second.json"
CHECKPOINT = LANE / "cegar-v13-local-critical-reuse-second.checkpoint.json"
CEGAR_SCRIPT = LANE / "cegar.py"

EXPECTED = {
    "probe": "0ae9731498e8f42748e994df5a08bf376a59cc709a07b328dbe65b3d267e6ca5",
    "positive_smt2": "72c2ff63f22811bcac1bd4acd40deb3b351b88d7b9d14fdb74277c872dbd621b",
    "cegar_result": "9cd24ead3bb06cd8bec88ace811eeb102dc5e8be46be1d9e1a4a1820d20a1832",
    "checkpoint": "ad37fe94d08af00786e67759bbdd21359f3647d227d93e9417b9b8b4842de0b9",
    "recorded_cegar": "5b8a0377568ea1cad18467dc7ece9db7cfcd76bafec50936a578368899f2fafe",
}


def load_miner() -> Any:
    spec = importlib.util.spec_from_file_location("v13_exact_subset_miner", MINER_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load miner: {MINER_PATH}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def json_dump(value: Any, path: Path) -> None:
    path.write_text(
        json.dumps(value, indent=2, sort_keys=True, allow_nan=False) + "\n"
    )


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


class UnionFind:
    def __init__(self) -> None:
        self.parent: dict[Any, Any] = {}

    def add(self, item: Any) -> None:
        self.parent.setdefault(item, item)

    def find(self, item: Any) -> Any:
        self.add(item)
        root = item
        while self.parent[root] != root:
            root = self.parent[root]
        while self.parent[item] != item:
            nxt = self.parent[item]
            self.parent[item] = root
            item = nxt
        return root

    def union(self, left: Any, right: Any) -> None:
        a = self.find(left)
        b = self.find(right)
        if a != b:
            self.parent[b] = a

    def components(self) -> list[list[Any]]:
        groups: dict[Any, list[Any]] = defaultdict(list)
        for item in self.parent:
            groups[self.find(item)].append(item)
        return [sorted(group) for group in groups.values()]


def canon_edge(edge: Iterable[int]) -> tuple[int, int]:
    a, b = edge
    return (a, b) if a < b else (b, a)


def choose2(n: int) -> int:
    return n * (n - 1) // 2


def structural_features(
    subset: tuple[int, ...], equations: Sequence[Any]
) -> dict[str, Any]:
    distance_uf = UnionFind()
    distance_degree: Counter[tuple[int, int]] = Counter()
    equation_supports: list[frozenset[int]] = []
    center_leaf_edges: dict[int, list[tuple[int, int]]] = defaultdict(list)

    for equation in equations:
        left = canon_edge(equation.left_edge)
        right = canon_edge(equation.right_edge)
        distance_uf.union(left, right)
        distance_degree[left] += 1
        distance_degree[right] += 1
        equation_supports.append(frozenset((*left, *right)))
        common = set(left) & set(right)
        if len(common) == 1:
            center = next(iter(common))
            left_leaf = next(vertex for vertex in left if vertex != center)
            right_leaf = next(vertex for vertex in right if vertex != center)
            center_leaf_edges[center].append(
                tuple(sorted((left_leaf, right_leaf)))
            )

    distance_components = distance_uf.components()
    distance_rank = sum(len(component) - 1 for component in distance_components)
    redundant_equalities = len(equations) - distance_rank
    edge_reuse_excess = sum(max(0, count - 1) for count in distance_degree.values())

    center_components: list[dict[str, Any]] = []
    for center, leaf_edges in sorted(center_leaf_edges.items()):
        leaf_uf = UnionFind()
        for a, b in leaf_edges:
            leaf_uf.union(a, b)
        for leaves in leaf_uf.components():
            leaf_set = set(leaves)
            edge_count = sum(
                1 for edge in leaf_edges if set(edge) <= leaf_set
            )
            center_components.append(
                {
                    "center": center,
                    "leaves": leaves,
                    "leaf_count": len(leaves),
                    "equality_count": edge_count,
                    "independent_rank": len(leaves) - 1,
                    "clique_fill": (
                        edge_count / choose2(len(leaves))
                        if len(leaves) >= 2
                        else 0.0
                    ),
                    "support": sorted({center, *leaves}),
                }
            )

    cross_center_support_overlap = 0
    cross_center_overlap_pairs = 0
    for left, right in itertools.combinations(center_components, 2):
        if left["center"] == right["center"]:
            continue
        overlap = len(set(left["support"]) & set(right["support"]))
        cross_center_support_overlap += max(0, overlap - 1)
        cross_center_overlap_pairs += int(overlap >= 2)

    equation_pair_support_overlap = sum(
        max(0, len(left & right) - 1)
        for left, right in itertools.combinations(equation_supports, 2)
    )
    active_vertices = sorted(set().union(*equation_supports)) if equations else []
    max_center_leaf_component = max(
        (component["leaf_count"] for component in center_components), default=0
    )
    multi_center_component_count = sum(
        1
        for component in center_components
        if component["independent_rank"] >= 2
    )
    full_four_leaf_center_count = sum(
        1 for component in center_components if component["leaf_count"] >= 4
    )

    priority_tuple = (
        distance_rank,
        multi_center_component_count,
        cross_center_support_overlap,
        cross_center_overlap_pairs,
        max_center_leaf_component,
        edge_reuse_excess,
        equation_pair_support_overlap,
        len(equations),
        -redundant_equalities,
        len(active_vertices),
    )
    return {
        "subset": list(subset),
        "induced_source_equation_indices": [
            equation.source_index for equation in equations
        ],
        "induced_equality_count": len(equations),
        "distance_variable_count": len(distance_degree),
        "independent_equality_rank": distance_rank,
        "redundant_equality_count": redundant_equalities,
        "distance_component_sizes": sorted(
            (len(component) for component in distance_components), reverse=True
        ),
        "distance_edge_reuse_excess": edge_reuse_excess,
        "active_equality_vertices": active_vertices,
        "active_equality_vertex_count": len(active_vertices),
        "center_components": center_components,
        "multi_center_component_count": multi_center_component_count,
        "full_four_leaf_center_count": full_four_leaf_center_count,
        "max_center_leaf_component": max_center_leaf_component,
        "cross_center_support_overlap": cross_center_support_overlap,
        "cross_center_overlap_pairs": cross_center_overlap_pairs,
        "equation_pair_support_overlap": equation_pair_support_overlap,
        "priority_tuple": list(priority_tuple),
    }


def rank_all(equations: Sequence[Any], miner: Any) -> list[dict[str, Any]]:
    rows = []
    for subset in itertools.combinations(range(19), 6):
        induced = miner.induced_equations(subset, equations)
        rows.append(structural_features(subset, induced))
    rows.sort(
        key=lambda row: (
            *(-value for value in row["priority_tuple"]),
            tuple(row["subset"]),
        )
    )
    for rank, row in enumerate(rows, start=1):
        row["rank"] = rank
    return rows


def exact_z3_check(problem: Any, names: Sequence[str], timeout_ms: int) -> dict[str, Any]:
    by_name = problem.record_by_name
    records = [by_name[name] for name in names]
    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=timeout_ms)
    solver.set(random_seed=0)
    solver.add(*(record.expression for record in records))
    started = time.monotonic()
    try:
        verdict = solver.check()
        exception = None
    except z3.Z3Exception as exc:
        verdict = z3.unknown
        exception = f"Z3Exception: {exc}"
    result: dict[str, Any] = {
        "solver": "Z3 Python API QF_NRA",
        "status": str(verdict).upper(),
        "timeout_ms": timeout_ms,
        "elapsed_seconds": time.monotonic() - started,
        "fail_closed": True,
    }
    if verdict == z3.sat:
        model = solver.model()
        valid, failures = miner_module.model_satisfies(model, records)
        result["model_substitution_status"] = "PASS" if valid else "FAIL"
        result["model_substitution_failures"] = failures[:20]
        result["exact_coordinate_model"] = [
            {
                "local_vertex": index,
                "global_class": problem.subset[index],
                "x_exact_smt2": model.eval(
                    problem.x[index], model_completion=True
                ).sexpr(),
                "y_exact_smt2": model.eval(
                    problem.y[index], model_completion=True
                ).sexpr(),
            }
            for index in range(len(problem.subset))
        ]
        if not valid:
            result["status"] = "ERROR_INVALID_MODEL"
    elif verdict == z3.unknown:
        result["reason_unknown"] = exception or solver.reason_unknown()
    return result


def replay_exact(
    miner: Any,
    problem: Any,
    names: Sequence[str],
    stem: Path,
    timeout_ms: int,
) -> dict[str, Any]:
    smt2_path = stem.with_suffix(".smt2")
    smt2_path.write_text(miner.direct_smt2(problem, names))
    z3_replay = miner.run_solver_file("z3", smt2_path, timeout_ms)
    cvc5_replay = miner.run_solver_file("cvc5", smt2_path, timeout_ms)
    return {
        "smt2": str(smt2_path),
        "smt2_sha256": sha256(smt2_path),
        "z3_fresh_cli": z3_replay,
        "cvc5_independent": cvc5_replay,
        "status": (
            "VALIDATED_EXACT_UNSAT"
            if z3_replay["status"] == "UNSAT"
            and cvc5_replay["status"] == "UNSAT"
            else "UNCONFIRMED_FAIL_CLOSED"
        ),
    }


def shrink_equalities(
    miner: Any,
    problem: Any,
    timeout_ms: int,
    deadline: float,
) -> dict[str, Any]:
    fixed = [
        record.name
        for record in problem.records
        if record.family != "positive_row_equality"
    ]
    current = [
        record.name
        for record in problem.records
        if record.family == "positive_row_equality"
    ]
    log = []
    for equality in list(current):
        if time.monotonic() + timeout_ms / 1000 + 20 >= deadline:
            log.append(
                {
                    "candidate": equality,
                    "status": "SKIPPED_GLOBAL_BUDGET",
                    "removed": False,
                }
            )
            continue
        trial = [name for name in current if name != equality]
        check = exact_z3_check(problem, [*fixed, *trial], timeout_ms)
        removed = check["status"] == "UNSAT"
        if removed:
            current = trial
        log.append(
            {
                "candidate": equality,
                "trial_equality_count": len(trial),
                "status": check["status"],
                "elapsed_seconds": check["elapsed_seconds"],
                "removed": removed,
                "policy": "remove only on exact Z3 UNSAT; retain SAT/UNKNOWN/error",
            }
        )
    final_names = [*fixed, *current]
    final_check = exact_z3_check(problem, final_names, timeout_ms)
    decisive_irredundancy = all(
        entry["status"] == "SAT"
        for entry in log
        if entry["candidate"] in current
    )
    return {
        "fixed_background_families": [
            "gauge",
            "strict_cyclic_orientation",
            "pairwise_distinct",
        ],
        "initial_equality_record_names": [
            record.name
            for record in problem.records
            if record.family == "positive_row_equality"
        ],
        "final_equality_record_names": current,
        "final_equality_source_indices": [
            int(name.removeprefix("eq_source_")) for name in current
        ],
        "log": log,
        "final_record_names": final_names,
        "final_check": final_check,
        "equality_subset_minimal_by_decisive_deletion_checks": (
            final_check["status"] == "UNSAT" and decisive_irredundancy
        ),
    }


def source_config(miner: Any) -> Any:
    return miner.SourceConfig(
        probe_result=PROBE,
        positive_smt2=POSITIVE_SMT2,
        cegar_result=CEGAR_RESULT,
        checkpoint=CHECKPOINT,
        cegar_script=CEGAR_SCRIPT,
        expected_probe_sha256=EXPECTED["probe"],
        expected_positive_smt2_sha256=EXPECTED["positive_smt2"],
        expected_cegar_result_sha256=EXPECTED["cegar_result"],
        expected_checkpoint_sha256=EXPECTED["checkpoint"],
        expected_recorded_cegar_sha256=EXPECTED["recorded_cegar"],
        expected_class_count=19,
        expected_equation_count=35,
    )


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--start-rank", type=int, default=1)
    parser.add_argument("--candidate-limit", type=int, default=12)
    parser.add_argument(
        "--run-tag",
        default="",
        help="suffix for result/report/core artifacts (ranking remains canonical)",
    )
    parser.add_argument(
        "--ranks",
        default="",
        help="optional comma-separated exact structural ranks to check",
    )
    parser.add_argument("--per-query-ms", type=int, default=15_000)
    parser.add_argument("--replay-ms", type=int, default=30_000)
    parser.add_argument("--wall-seconds", type=float, default=500.0)
    parser.add_argument("--ranking-only", action="store_true")
    args = parser.parse_args()
    if args.start_rank <= 0 or args.candidate_limit <= 0:
        parser.error("--start-rank and --candidate-limit must be positive")
    if args.run_tag and (
        any(not (char.isalnum() or char in "-_") for char in args.run_tag)
        or args.run_tag in {".", ".."}
    ):
        parser.error("--run-tag may contain only letters, digits, '-' and '_'")
    if args.ranks:
        try:
            ranks = [int(item) for item in args.ranks.split(",")]
        except ValueError:
            parser.error("--ranks must be a comma-separated list of integers")
        if not ranks or any(rank <= 0 for rank in ranks) or len(set(ranks)) != len(ranks):
            parser.error("--ranks must be distinct positive integers")
    if args.per_query_ms <= 0 or args.replay_ms <= 0:
        parser.error("timeouts must be positive")
    if not 0 < args.wall_seconds <= 540:
        parser.error("--wall-seconds must lie in (0, 540]")
    return args


def report(payload: dict[str, Any]) -> str:
    lines = [
        "# v13 six-class structural-priority exact search",
        "",
        f"- Terminal status: `{payload['terminal_status']}`",
        f"- Ranked subsets: `{payload['ranking']['subset_count']}`",
        f"- Solver-tested candidates: `{len(payload['checks'])}`",
        (
            "- Ordering: independent squared-distance equality rank; "
            "multi-center overlap; center-star structure; edge reuse; "
            "equation-support overlap; raw equality density; quotient tuple "
            "only as final tie-break."
        ),
        "",
        "## Candidate results",
        "",
    ]
    for row in payload["checks"]:
        lines.append(
            f"- rank {row['rank']}, subset `{tuple(row['subset'])}`, "
            f"eq/rank `{row['induced_equality_count']}/"
            f"{row['independent_equality_rank']}`: "
            f"`{row['terminal_status']}`"
        )
    if payload.get("validated_core"):
        core = payload["validated_core"]
        lines.extend(
            [
                "",
                "## Validated equality core",
                "",
                f"- Subset: `{tuple(core['subset'])}`",
                (
                    "- Source equalities: `"
                    + str(core["shrink"]["final_equality_source_indices"])
                    + "`"
                ),
                f"- Replay: `{core['replay']['status']}`",
                (
                    "- Trust boundary: exact Z3 plus independent cvc5 solver "
                    "evidence; not Lean/kernel closure."
                ),
            ]
        )
    lines.extend(
        [
            "",
            "## Scope ledger",
            "",
            "- Encoded: pinned positive quotient equalities induced on the six "
            "classes; exact gauge; strict cyclic convex support; pairwise "
            "distinctness.",
            "- Omitted: all pinned false-row disequalities and all global facts "
            "not represented by those induced positive equalities.",
            "- A SAT result is therefore a witness for this exact induced "
            "positive-equality abstraction, not for the full survivor formula.",
        ]
    )
    return "\n".join(lines) + "\n"


def main() -> int:
    args = parse_args()
    HERE.mkdir(parents=True, exist_ok=True)
    started = time.monotonic()
    deadline = started + args.wall_seconds
    miner = load_miner()
    global miner_module
    miner_module = miner
    probe, equations, validation = miner.validate_source(source_config(miner))
    smoke = miner.self_test(min(10_000, args.per_query_ms))
    ranking = rank_all(equations, miner)
    ranking_path = HERE / "v13-six-structural-ranking.json"
    ranking_payload = {
        "schema": "p97-v13-six-structural-priority-ranking-v1",
        "source_validation": validation,
        "source_alias_classes_in_order": probe["target"]["alias_classes_in_order"],
        "ordering_schema": {
            "descending_priority_tuple": [
                "independent_equality_rank",
                "multi_center_component_count",
                "cross_center_support_overlap",
                "cross_center_overlap_pairs",
                "max_center_leaf_component",
                "distance_edge_reuse_excess",
                "equation_pair_support_overlap",
                "induced_equality_count",
                "negative_redundant_equality_count",
                "active_equality_vertex_count",
            ],
            "final_tie_break": "quotient subset tuple lexicographic",
            "note": (
                "The quotient tuple is not a search signal; it is only the "
                "last deterministic tie-break after structural features."
            ),
        },
        "subset_count": len(ranking),
        "nonempty_induced_subset_count": sum(
            row["induced_equality_count"] > 0 for row in ranking
        ),
        "priority_tuple_histogram": dict(
            sorted(
                Counter(
                    ",".join(map(str, row["priority_tuple"])) for row in ranking
                ).items()
            )
        ),
        "rows": ranking,
    }
    json_dump(ranking_payload, ranking_path)

    checks = []
    validated_core = None
    unconfirmed_unsat = []
    suffix = f"-{args.run_tag}" if args.run_tag else ""
    requested_ranks = (
        {int(item) for item in args.ranks.split(",")} if args.ranks else None
    )
    if not args.ranking_only:
        for row in (
            candidate
            for candidate in ranking
            if candidate["induced_equality_count"] > 0
            and candidate["rank"] >= args.start_rank
            and (
                requested_ranks is None
                or candidate["rank"] in requested_ranks
            )
        ):
            if len(checks) >= args.candidate_limit:
                break
            if time.monotonic() + args.per_query_ms / 1000 + 20 >= deadline:
                break
            subset = tuple(row["subset"])
            induced = miner.induced_equations(subset, equations)
            problem = miner.build_problem(subset, induced)
            names = [record.name for record in problem.records]
            z3_check = exact_z3_check(problem, names, args.per_query_ms)
            item = {key: value for key, value in row.items() if key != "center_components"}
            item["z3"] = z3_check
            item["terminal_status"] = z3_check["status"]

            if z3_check["status"] == "UNSAT":
                stem = HERE / f"candidate-rank-{row['rank']}{suffix}-full"
                replay = replay_exact(
                    miner, problem, names, stem, args.replay_ms
                )
                item["full_replay"] = replay
                if replay["status"] == "VALIDATED_EXACT_UNSAT":
                    shrink = shrink_equalities(
                        miner, problem, args.per_query_ms, deadline
                    )
                    core_replay = replay_exact(
                        miner,
                        problem,
                        shrink["final_record_names"],
                        HERE
                        / f"candidate-rank-{row['rank']}{suffix}-equality-core",
                        args.replay_ms,
                    )
                    if (
                        shrink["final_check"]["status"] == "UNSAT"
                        and core_replay["status"] == "VALIDATED_EXACT_UNSAT"
                    ):
                        item["terminal_status"] = "VALIDATED_EXACT_UNSAT"
                        validated_core = {
                            "rank": row["rank"],
                            "subset": row["subset"],
                            "features": row,
                            "shrink": shrink,
                            "replay": core_replay,
                        }
                    else:
                        item["terminal_status"] = "UNCONFIRMED_FAIL_CLOSED"
                        unconfirmed_unsat.append(item)
                else:
                    item["terminal_status"] = "UNCONFIRMED_FAIL_CLOSED"
                    unconfirmed_unsat.append(item)
            elif z3_check["status"] == "UNKNOWN":
                smt2 = miner.direct_smt2(problem, names)
                cvc5_check = miner.run_cvc5_text(smt2, args.per_query_ms)
                item["cvc5_fallback"] = cvc5_check
                item["terminal_status"] = f"CVC5_{cvc5_check['status']}"
                if cvc5_check["status"] == "UNSAT":
                    replay = replay_exact(
                        miner,
                        problem,
                        names,
                        HERE
                        / f"candidate-rank-{row['rank']}{suffix}-cvc5-unsat-full",
                        args.replay_ms,
                    )
                    item["full_replay"] = replay
                    if replay["status"] != "VALIDATED_EXACT_UNSAT":
                        item["terminal_status"] = "UNCONFIRMED_FAIL_CLOSED"
                        unconfirmed_unsat.append(item)
            checks.append(item)
            if validated_core is not None:
                break

    if validated_core is not None:
        terminal = "VALIDATED_EXACT_UNSAT_CORE"
    elif args.ranking_only:
        terminal = "RANKING_ONLY_NO_SOLVER_SEARCH"
    elif len(checks) < args.candidate_limit:
        terminal = "UNKNOWN_GLOBAL_BUDGET"
    elif unconfirmed_unsat:
        terminal = "UNKNOWN_UNCONFIRMED_UNSAT"
    elif any(
        check["terminal_status"] in {"UNKNOWN", "CVC5_UNKNOWN"}
        for check in checks
    ):
        terminal = "UNKNOWN_NO_VALIDATED_CORE"
    else:
        terminal = "NO_UNSAT_IN_PRIORITY_PREFIX"

    payload = {
        "schema": "p97-v13-six-structural-priority-search-v1",
        "terminal_status": terminal,
        "epistemic_status": (
            "trusted exact-solver discovery evidence only; not Lean/kernel closure"
        ),
        "elapsed_seconds": time.monotonic() - started,
        "configuration": vars(args),
        "inputs": {
            "probe": str(PROBE),
            "probe_sha256": sha256(PROBE),
            "positive_smt2": str(POSITIVE_SMT2),
            "positive_smt2_sha256": sha256(POSITIVE_SMT2),
            "cegar_result": str(CEGAR_RESULT),
            "cegar_result_sha256": sha256(CEGAR_RESULT),
            "checkpoint": str(CHECKPOINT),
            "checkpoint_sha256": sha256(CHECKPOINT),
            "miner": str(MINER_PATH),
            "miner_sha256": sha256(MINER_PATH),
        },
        "source_validation": validation,
        "self_test": smoke,
        "ranking": {
            "artifact": str(ranking_path),
            "artifact_sha256": sha256(ranking_path),
            "subset_count": len(ranking),
            "nonempty_induced_subset_count": sum(
                row["induced_equality_count"] > 0 for row in ranking
            ),
            "top_20": ranking[:20],
        },
        "checks": checks,
        "validated_core": validated_core,
        "unconfirmed_unsat": unconfirmed_unsat,
        "encoded_omitted_ledger": {
            "encoded": [
                "pinned v13 positive quotient equalities induced on each six-class subset",
                "sound exact similarity gauge p0=(0,0), p1=(1,0)",
                "strict cyclic convex support in inherited quotient order",
                "pairwise distinctness",
            ],
            "omitted": [
                "pinned false-row disequalities",
                "all global CEGAR facts not represented by induced positive equalities",
            ],
            "sat_scope": (
                "SAT witnesses only the exact induced positive-equality abstraction"
            ),
        },
        "trust_warning": (
            "Exact Z3/cvc5 agreement is trusted external solver evidence. "
            "It is not a certificate replayed by Lean's kernel."
        ),
    }
    result_path = HERE / f"v13-six-priority-search{suffix}.json"
    report_path = HERE / f"v13-six-priority-search{suffix}-report.md"
    json_dump(payload, result_path)
    report_path.write_text(report(payload))
    print(
        json.dumps(
            {
                "terminal_status": terminal,
                "elapsed_seconds": payload["elapsed_seconds"],
                "ranked_subsets": len(ranking),
                "checked_candidates": len(checks),
                "status_counts": dict(
                    sorted(Counter(row["terminal_status"] for row in checks).items())
                ),
                "result": str(result_path),
                "report": str(report_path),
                "ranking": str(ranking_path),
            },
            sort_keys=True,
        )
    )
    return 0 if terminal != "UNKNOWN_UNCONFIRMED_UNSAT" else 2


if __name__ == "__main__":
    raise SystemExit(main())
