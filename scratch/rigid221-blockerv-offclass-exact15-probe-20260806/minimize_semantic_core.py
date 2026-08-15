"""Greedily minimize a trimmed core by source-level semantic constraint groups."""

from __future__ import annotations

import argparse
import json
import random
import subprocess
from collections import Counter, defaultdict, deque
from pathlib import Path

import classify_static_core


def grouped_core(long_order_index: int, order_variant: int, core_path: Path):
    instance, labels, _schema_keys = classify_static_core.build_with_ledger(
        long_order_index, order_variant
    )
    positions: dict[tuple[int, ...], deque[int]] = defaultdict(deque)
    for index, clause in enumerate(instance.cnf.clauses):
        positions[classify_static_core.normalized(tuple(clause))].append(index)

    groups: dict[str, list[tuple[int, ...]]] = defaultdict(list)
    for clause in classify_static_core.read_dimacs(core_path):
        key = classify_static_core.normalized(clause)
        if not positions[key]:
            raise RuntimeError(f"core clause absent from reconstruction: {clause}")
        index = positions[key].popleft()
        primary, detail = labels[index]
        groups[f"{primary}/{detail}"].append(clause)
    return instance.cnf.n_variables, dict(groups)


def write_cnf(path: Path, n_variables: int, clauses: list[tuple[int, ...]]) -> None:
    path.write_text(
        f"p cnf {n_variables} {len(clauses)}\n"
        + "".join(" ".join(map(str, clause)) + " 0\n" for clause in clauses),
        encoding="utf-8",
    )


def is_unsat(path: Path) -> bool:
    run = subprocess.run(
        ["cadical", "-q", str(path)],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
        timeout=30,
        check=False,
    )
    if run.returncode not in (10, 20):
        raise RuntimeError(f"CaDiCaL failed with exit {run.returncode}")
    return run.returncode == 20


def minimize(
    groups: dict[str, list[tuple[int, ...]]],
    n_variables: int,
    work_path: Path,
    order: list[str],
) -> set[str]:
    active = set(groups)
    for group in order:
        candidate = active - {group}
        clauses = [clause for key in candidate for clause in groups[key]]
        write_cnf(work_path, n_variables, clauses)
        if is_unsat(work_path):
            active = candidate
    return active


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("long_order_index", type=int)
    parser.add_argument("order_variant", type=int)
    parser.add_argument("--core-suffix", default="core.cnf")
    parser.add_argument("--random-runs", type=int, default=4)
    args = parser.parse_args()

    directory = Path(__file__).parent
    stem = f"three-pair-static-o{args.long_order_index}-v{args.order_variant}"
    core_path = directory / f"{stem}.{args.core_suffix}"
    n_variables, groups = grouped_core(
        args.long_order_index, args.order_variant, core_path
    )
    work_path = directory / f"{stem}.semantic-minimize.work.cnf"

    orders: list[tuple[str, list[str]]] = [
        ("largest_first", sorted(groups, key=lambda key: -len(groups[key]))),
        ("smallest_first", sorted(groups, key=lambda key: len(groups[key]))),
    ]
    for seed in range(args.random_runs):
        order = list(groups)
        random.Random(seed).shuffle(order)
        orders.append((f"random_{seed}", order))

    results: list[dict[str, object]] = []
    best: set[str] | None = None
    for name, order in orders:
        active = minimize(groups, n_variables, work_path, order)
        clause_count = sum(len(groups[key]) for key in active)
        result = {
            "order": name,
            "semantic_group_count": len(active),
            "clause_count": clause_count,
            "family_counts": dict(
                sorted(Counter(key.split("/", 1)[0] for key in active).items())
            ),
        }
        results.append(result)
        if best is None or (len(active), clause_count) < (
            len(best),
            sum(len(groups[key]) for key in best),
        ):
            best = active
        print(json.dumps(result, sort_keys=True), flush=True)

    assert best is not None
    final_clauses = [clause for key in best for clause in groups[key]]
    final_path = directory / f"{stem}.semantic-minimal.cnf"
    write_cnf(final_path, n_variables, final_clauses)
    if not is_unsat(final_path):
        raise RuntimeError("persisted semantic core is not UNSAT")

    output = {
        "source_core": core_path.name,
        "source_semantic_group_count": len(groups),
        "source_clause_count": sum(map(len, groups.values())),
        "runs": results,
        "best_semantic_group_count": len(best),
        "best_clause_count": len(final_clauses),
        "best_family_counts": dict(
            sorted(Counter(key.split("/", 1)[0] for key in best).items())
        ),
        "best_groups": sorted(best),
        "final_cnf": final_path.name,
    }
    output_path = directory / f"{stem}.semantic-minimal.json"
    output_path.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(json.dumps({key: value for key, value in output.items() if key != "best_groups"}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
