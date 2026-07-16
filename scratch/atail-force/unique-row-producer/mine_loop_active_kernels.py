#!/usr/bin/env python3
"""Mine certificate-active equality kernels from the live 555/654 loop bank.

This is a theorem-discovery pass, not a proof certificate.  For each selected
banked core it asks Singular for a lift of ``1``:

* unit cores use the row-equality ideal directly;
* forced-pair cores use the row-equality ideal plus the Rabinowitsch generator
  ``1 - t * dist²(a,b)`` for the banked forced pair.

The script records only which lift coefficients are nonzero, together with
Singular's internal replay ``sum coefficient_i * generator_i - 1 = 0``.  It
does not retain the coefficient polynomials and does not independently replay
the identity.  A repeated active kernel found here is therefore a candidate
for the repository's full coefficient-emission and independent-check pipeline,
not an admission-grade certificate by itself.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import importlib.util
import json
import subprocess
import sys
import time
from collections import defaultdict
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Iterable, Mapping, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
BANK_PATH = HERE / "card_five_interior_shadow_search.py"
ORACLE_PATH = ROOT / "scratch/atail-force/second_center_metric_oracle/oracle.py"

SMOKE_CORE_IDS = (
    "unit-core-555-63",
    "unit-core-555-64",
    "unit-core-555-26",
    "unit-core-555-38",
    "forced-pair-core-654-35",
    "forced-pair-core-654-37",
    "forced-pair-core-654-45",
    "forced-pair-core-654-46",
)


def require(condition: bool, message: str) -> None:
    if not condition:
        raise AssertionError(message)


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    require(spec is not None and spec.loader is not None, f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def load_bank() -> dict[str, dict[str, Any]]:
    if str(ROOT) not in sys.path:
        sys.path.insert(0, str(ROOT))
    module = load_module("loop_active_kernel_bank", BANK_PATH)
    cores = {
        str(core["id"]): {
            **core,
            "rows": {
                int(center): tuple(sorted(map(int, support)))
                for center, support in core["rows"].items()
            },
        }
        for core in module.REAL_INFEASIBLE_ROW_CORES
    }
    require(len(cores) == len(module.REAL_INFEASIBLE_ROW_CORES),
            "duplicate core id in live bank")
    return cores


def natural_core_key(core_id: str) -> tuple[str, int]:
    prefix, _, suffix = core_id.rpartition("-")
    try:
        number = int(suffix)
    except ValueError:
        number = 0
    return prefix, number


def core_grade(core_id: str) -> str:
    if core_id.startswith("unit-core-"):
        return "unit-ideal"
    if core_id.startswith("forced-pair-core-"):
        return "radical-forced-pair"
    raise AssertionError(f"unsupported loop core id: {core_id}")


def forced_pair(core_id: str) -> tuple[int, int] | None:
    if core_id.startswith("forced-pair-core-654-"):
        return 7, 8
    if core_id.startswith("forced-pair-core-555-"):
        return (7, 8) if core_id == "forced-pair-core-555-09" else (6, 7)
    return None


def points_of(rows: Mapping[int, Sequence[int]]) -> set[int]:
    points = set(rows)
    for support in rows.values():
        points.update(support)
    return points


def equality_generator_names(
    rows: Mapping[int, Sequence[int]],
) -> list[str]:
    result: list[str] = []
    for center, support_raw in sorted(rows.items()):
        support = tuple(sorted(support_raw))
        require(center not in support, f"center {center} occurs in its support")
        require(len(support) >= 2, f"row {center} has fewer than two points")
        pivot, *members = support
        result.extend(f"ROW_{center}_{pivot}_{member}" for member in members)
    return result


def active_rows(generator_names: Iterable[str]) -> dict[int, tuple[int, ...]]:
    pivots: dict[int, int] = {}
    members: dict[int, set[int]] = defaultdict(set)
    for name in generator_names:
        tag, center_text, pivot_text, member_text = name.split("_")
        require(tag == "ROW", f"unexpected equality generator: {name}")
        center, pivot, member = map(int, (center_text, pivot_text, member_text))
        if center in pivots:
            require(pivots[center] == pivot,
                    f"active row {center} uses multiple pivots")
        else:
            pivots[center] = pivot
        members[center].add(member)
    return {
        center: tuple([pivots[center], *sorted(members[center])])
        for center in sorted(pivots)
    }


def singular_lift_support(
    core_id: str,
    core: Mapping[str, Any],
    *,
    timeout_seconds: float,
    lift_algorithm: str,
) -> dict[str, Any]:
    oracle = load_module(
        f"loop_active_kernel_oracle_{core_id.replace('-', '_')}",
        ORACLE_PATH,
    )
    rows = tuple(
        oracle.MetricRow(center, tuple(support), exact=False)
        for center, support in sorted(core["rows"].items())
    )
    variables = [str(variable) for variable in oracle.variable_symbols(12)]
    polynomials = list(oracle.serialized_system(12, rows))
    names = equality_generator_names(core["rows"])
    require(len(names) == len(polynomials),
            f"generator/name arity drift for {core_id}")

    pair = forced_pair(core_id)
    if pair is not None:
        t_symbol = oracle.sp.Symbol("t")
        points = oracle.coordinate_symbols(12)
        coordinate_variables = oracle.variable_symbols(12)
        rabinowitsch = oracle.sp.Poly(
            oracle.sp.expand(
                1 - t_symbol * oracle.squared_distance(points, *pair)
            ),
            *coordinate_variables,
            t_symbol,
            domain=oracle.sp.QQ,
        )
        variables.append("t")
        polynomials.append(oracle.serialize_poly(rabinowitsch))
        names.append(f"RAB_{pair[0]}_{pair[1]}")

    lift_lines = (
        ["matrix U;", 'matrix L=lift(I,T,U,"slimgb");']
        if lift_algorithm == "slimgb"
        else ["matrix L=lift(I,T);"]
    )
    lines = [
        f"ring R=0,({','.join(variables)}),dp;",
        f"ideal I={','.join(polynomials)};",
        "ideal T=1;",
        *lift_lines,
    ]
    lines.extend(
        f'if (L[{index},1]!=0) {{ print("ACTIVE_{index - 1}"); }}'
        for index in range(1, len(polynomials) + 1)
    )
    lines.extend([
        "poly C=0;",
        *(
            f"C=C+L[{index},1]*I[{index}];"
            for index in range(1, len(polynomials) + 1)
        ),
        'if (C-1==0) { print("STATUS_UNIT"); }',
        'else { print("STATUS_NONUNIT"); }',
        'print("LIFT_CHECK="+string(C-1));',
        "quit;",
    ])

    started = time.monotonic()
    try:
        process = subprocess.run(
            ["Singular", "-q"],
            input="\n".join(lines) + "\n",
            capture_output=True,
            text=True,
            timeout=timeout_seconds,
            check=False,
        )
    except subprocess.TimeoutExpired:
        return {
            "core_id": core_id,
            "grade": core_grade(core_id),
            "pair": list(pair) if pair is not None else None,
            "status": "TIMEOUT",
            "elapsed_seconds": time.monotonic() - started,
            "timeout_seconds": timeout_seconds,
            "lift_algorithm": lift_algorithm,
            "nominal_row_count": len(core["rows"]),
            "nominal_equality_count": int(core["equality_count"]),
        }

    elapsed = time.monotonic() - started
    output = [
        line.strip() for line in process.stdout.splitlines() if line.strip()
    ]
    status = next(
        (
            line.removeprefix("STATUS_")
            for line in output
            if line.startswith("STATUS_")
        ),
        "ERROR",
    )
    active_indices = sorted(
        int(line.removeprefix("ACTIVE_"))
        for line in output
        if line.startswith("ACTIVE_")
    )
    lift_check = next(
        (
            line.removeprefix("LIFT_CHECK=")
            for line in output
            if line.startswith("LIFT_CHECK=")
        ),
        None,
    )
    active_names = [names[index] for index in active_indices]
    active_equality_names = [
        name for name in active_names if name.startswith("ROW_")
    ]
    reduced_rows = active_rows(active_equality_names)
    active_rabinowitsch = any(
        name.startswith("RAB_") for name in active_names
    )
    active_points = points_of(reduced_rows)
    if pair is not None:
        active_points.update(pair)
    expected_generator_count = int(core["equality_count"]) + int(pair is not None)
    valid = (
        process.returncode == 0
        and status == "UNIT"
        and lift_check == "0"
        and len(names) == expected_generator_count
        and bool(active_equality_names)
        and (pair is None or active_rabinowitsch)
    )
    return {
        "core_id": core_id,
        "grade": core_grade(core_id),
        "pair": list(pair) if pair is not None else None,
        "status": "SINGULAR_INTERNAL_LIFT_REPLAY"
        if valid else "INVALID_OR_INCOMPLETE",
        "singular_membership_status": status,
        "singular_lift_check": lift_check,
        "singular_returncode": process.returncode,
        "singular_stderr": process.stderr,
        "elapsed_seconds": elapsed,
        "timeout_seconds": timeout_seconds,
        "lift_algorithm": lift_algorithm,
        "nominal_row_count": len(core["rows"]),
        "nominal_equality_count": int(core["equality_count"]),
        "generator_count": len(names),
        "active_generator_positions_zero_based": active_indices,
        "active_generator_names": active_names,
        "active_rabinowitsch_generator": active_rabinowitsch,
        "active_row_count": len(reduced_rows),
        "active_equality_count": len(active_equality_names),
        "active_label_count": len(active_points),
        "active_rows": [
            {"center": center, "support": list(support)}
            for center, support in sorted(reduced_rows.items())
        ],
        "trust_boundary": (
            "Singular lift support plus Singular internal identity replay only; "
            "coefficient polynomials were not retained or independently replayed"
        ),
    }


def embedding_exists(
    pattern_rows: Mapping[int, Sequence[int]],
    candidate_rows: Mapping[int, Sequence[int]],
    *,
    pattern_pair: tuple[int, int] | None = None,
    candidate_pair: tuple[int, int] | None = None,
) -> bool:
    """Check an injective row-support embedding, optionally preserving a pair."""

    pattern_support = {
        int(center): frozenset(map(int, support))
        for center, support in pattern_rows.items()
    }
    candidate_support = {
        int(center): frozenset(map(int, support))
        for center, support in candidate_rows.items()
    }
    pattern_points = points_of(pattern_support)
    candidate_points = points_of(candidate_support)
    if pattern_pair is not None:
        pattern_points.update(pattern_pair)
    if candidate_pair is not None:
        candidate_points.update(candidate_pair)
    if len(pattern_points) > len(candidate_points):
        return False
    if len(pattern_support) > len(candidate_support):
        return False

    if pattern_pair is None or candidate_pair is None:
        require(pattern_pair is None and candidate_pair is None,
                "distinguished pairs must occur on both sides")
        fixed_maps: list[dict[int, int]] = [{}]
    else:
        fixed_maps = [
            {
                pattern_pair[0]: candidate_pair[0],
                pattern_pair[1]: candidate_pair[1],
            },
            {
                pattern_pair[0]: candidate_pair[1],
                pattern_pair[1]: candidate_pair[0],
            },
        ]

    pattern_centers = tuple(
        sorted(
            pattern_support,
            key=lambda center: (
                -len(pattern_support[center]),
                -sum(
                    other in pattern_support[center]
                    for other in pattern_support
                ),
                center,
            ),
        )
    )

    def try_fixed(fixed: Mapping[int, int]) -> bool:
        if len(set(fixed.values())) != len(fixed):
            return False
        if not set(fixed).issubset(pattern_points):
            return False
        if not set(fixed.values()).issubset(candidate_points):
            return False

        image = dict(fixed)
        used_images = set(fixed.values())
        selected_support: dict[int, frozenset[int]] = {}

        def remaining_points_embed() -> bool:
            unassigned = set(pattern_points) - set(image)

            def point_domain(point: int) -> set[int]:
                domain = set(candidate_points) - used_images
                for center, support in pattern_support.items():
                    if point in support:
                        domain.intersection_update(selected_support[center])
                return domain

            def assign_points(points: set[int]) -> bool:
                if not points:
                    return True
                point = min(
                    points, key=lambda item: (len(point_domain(item)), item)
                )
                for target in sorted(point_domain(point)):
                    image[point] = target
                    used_images.add(target)
                    if assign_points(points - {point}):
                        return True
                    used_images.remove(target)
                    del image[point]
                return False

            return assign_points(unassigned)

        def assign_centers(index: int) -> bool:
            if index == len(pattern_centers):
                return remaining_points_embed()
            center = pattern_centers[index]
            was_fixed = center in image
            targets = (
                (image[center],)
                if was_fixed
                else tuple(
                    target
                    for target in candidate_support
                    if target not in used_images
                )
            )
            for target in targets:
                if target not in candidate_support:
                    continue
                target_support = candidate_support[target]
                if len(target_support) < len(pattern_support[center]):
                    continue
                if any(
                    point in pattern_support[center]
                    and target_point not in target_support
                    for point, target_point in image.items()
                ):
                    continue
                if any(
                    center in pattern_support[other_center]
                    and target not in selected_support[other_center]
                    for other_center in selected_support
                ):
                    continue
                if not was_fixed:
                    image[center] = target
                    used_images.add(target)
                selected_support[center] = target_support
                if assign_centers(index + 1):
                    return True
                del selected_support[center]
                if not was_fixed:
                    used_images.remove(target)
                    del image[center]
            return False

        return assign_centers(0)

    return any(try_fixed(fixed) for fixed in fixed_maps)


def rows_from_result(result: Mapping[str, Any]) -> dict[int, tuple[int, ...]]:
    return {
        int(row["center"]): tuple(map(int, row["support"]))
        for row in result["active_rows"]
    }


def pair_from_result(result: Mapping[str, Any]) -> tuple[int, int] | None:
    pair = result.get("pair")
    return tuple(map(int, pair)) if pair is not None else None


def nontrivial_classes(
    names: Sequence[str],
    mutual_edges: set[tuple[str, str]],
) -> list[list[str]]:
    parent = {name: name for name in names}

    def find(name: str) -> str:
        while parent[name] != name:
            parent[name] = parent[parent[name]]
            name = parent[name]
        return name

    def union(left: str, right: str) -> None:
        left_root = find(left)
        right_root = find(right)
        if left_root != right_root:
            parent[right_root] = left_root

    for left, right in mutual_edges:
        union(left, right)
    groups: dict[str, list[str]] = defaultdict(list)
    for name in names:
        groups[find(name)].append(name)
    return sorted(
        (
            sorted(group, key=natural_core_key)
            for group in groups.values()
            if len(group) >= 2
        ),
        key=lambda group: natural_core_key(group[0]),
    )


def quotient_results(
    results: Sequence[Mapping[str, Any]],
) -> dict[str, Any]:
    valid = [
        result
        for result in results
        if result.get("status") == "SINGULAR_INTERNAL_LIFT_REPLAY"
    ]
    embeddings: set[tuple[str, str]] = set()
    for pattern in valid:
        for candidate in valid:
            if pattern["core_id"] == candidate["core_id"]:
                continue
            if pattern["grade"] != candidate["grade"]:
                continue
            if embedding_exists(
                rows_from_result(pattern),
                rows_from_result(candidate),
                pattern_pair=pair_from_result(pattern),
                candidate_pair=pair_from_result(candidate),
            ):
                embeddings.add((str(pattern["core_id"]), str(candidate["core_id"])))
    mutual = {
        edge for edge in embeddings if (edge[1], edge[0]) in embeddings
    }
    strict = {
        edge for edge in embeddings if (edge[1], edge[0]) not in embeddings
    }
    names = [str(result["core_id"]) for result in valid]
    return {
        "valid_kernel_count": len(valid),
        "directed_embedding_count": len(embeddings),
        "nontrivial_isomorphism_classes": nontrivial_classes(names, mutual),
        "strict_embedding_edges": [
            {"pattern": left, "candidate": right}
            for left, right in sorted(
                strict, key=lambda edge: (
                    natural_core_key(edge[0]),
                    natural_core_key(edge[1]),
                )
            )
        ],
    }


def raw_unit_555_representatives(
    cores: Mapping[str, Mapping[str, Any]],
) -> list[str]:
    unit_ids = sorted(
        (
            core_id
            for core_id in cores
            if core_id.startswith("unit-core-555-")
        ),
        key=natural_core_key,
    )
    mutual: set[tuple[str, str]] = set()
    for index, left in enumerate(unit_ids):
        for right in unit_ids[index + 1:]:
            left_to_right = embedding_exists(
                cores[left]["rows"], cores[right]["rows"]
            )
            right_to_left = embedding_exists(
                cores[right]["rows"], cores[left]["rows"]
            )
            if left_to_right and right_to_left:
                mutual.add((left, right))
                mutual.add((right, left))
    classes = nontrivial_classes(unit_ids, mutual)
    covered = {name for group in classes for name in group}
    representatives = [group[0] for group in classes]
    representatives.extend(name for name in unit_ids if name not in covered)
    return sorted(representatives, key=natural_core_key)


def select_core_ids(
    selection: str,
    explicit: Sequence[str],
    cores: Mapping[str, Mapping[str, Any]],
) -> list[str]:
    if explicit:
        selected = list(dict.fromkeys(explicit))
    elif selection == "smoke":
        selected = list(SMOKE_CORE_IDS)
    elif selection == "latest":
        selected = [
            "unit-core-555-63",
            "unit-core-555-64",
            "forced-pair-core-654-45",
            "forced-pair-core-654-46",
        ]
    elif selection == "recommended":
        selected = raw_unit_555_representatives(cores)
        selected.extend(
            f"forced-pair-core-654-{number:02d}"
            for number in range(35, 47)
        )
    elif selection == "all":
        selected = sorted(cores, key=natural_core_key)
    else:
        raise AssertionError(selection)
    missing = [core_id for core_id in selected if core_id not in cores]
    require(not missing, f"selected core ids absent from live bank: {missing}")
    return selected


def markdown_report(payload: Mapping[str, Any]) -> str:
    valid_count = int(payload["quotient"]["valid_kernel_count"])
    lines = [
        "# Live-loop certificate-active kernel mining",
        "",
        "This is theorem-discovery evidence. For successful rows below, Singular",
        "exposed the nonzero coefficient positions of a lift and internally",
        "replayed the identity. The coefficient polynomials were not retained or",
        "independently replayed, so repeated kernels are candidates for full",
        "certificate extraction, not kernel-checked Lean theorems.",
        "",
        f"- Selection: `{payload['selection']}`",
        f"- Selected cores: {len(payload['selected_core_ids'])}",
        f"- Successful internal lift replays: "
        f"{valid_count}",
        f"- Singular timeout per core: {payload['timeout_seconds']} s",
        f"- Singular lift algorithm: `{payload['lift_algorithm']}`",
        "",
        "## Per-core extraction",
        "",
        "| Core | Grade | Nominal | Active | Pair | Result | Seconds |",
        "|---|---|---:|---:|---|---|---:|",
    ]
    for result in payload["results"]:
        nominal = (
            f"{result.get('nominal_row_count', '?')}r/"
            f"{result.get('nominal_equality_count', '?')}e"
        )
        active = (
            f"{result.get('active_row_count', '?')}r/"
            f"{result.get('active_equality_count', '?')}e"
        )
        pair = result.get("pair")
        pair_text = "—" if pair is None else f"({pair[0]},{pair[1]})"
        lines.append(
            f"| `{result['core_id']}` | `{result['grade']}` | {nominal} | "
            f"{active} | {pair_text} | `{result['status']}` | "
            f"{result.get('elapsed_seconds', 0):.2f} |"
        )

    classes = payload["quotient"]["nontrivial_isomorphism_classes"]
    strict = payload["quotient"]["strict_embedding_edges"]
    lines.extend([
        "",
        "## Quotient under injective relabeling",
        "",
    ])
    if valid_count == 0:
        lines.append("No valid extracted kernels were available to quotient.")
    elif classes:
        lines.append("Nontrivial pair-preserving isomorphism classes:")
        lines.append("")
        for group in classes:
            lines.append("- " + ", ".join(f"`{name}`" for name in group))
    else:
        lines.append("No nontrivial active-kernel isomorphism class was found.")
    lines.append("")
    if valid_count == 0:
        pass
    elif strict:
        lines.append("Strict active-kernel embeddings:")
        lines.append("")
        for edge in strict:
            lines.append(
                f"- `{edge['pattern']}` embeds into `{edge['candidate']}`"
            )
    else:
        lines.append("No strict active-kernel embedding was found.")

    lines.extend([
        "",
        "## Active row systems",
        "",
    ])
    for result in payload["results"]:
        if result.get("status") != "SINGULAR_INTERNAL_LIFT_REPLAY":
            continue
        rows = "; ".join(
            f"{row['center']}:{{{','.join(map(str, row['support']))}}}"
            for row in result["active_rows"]
        )
        rab = (
            f"; Rabinowitsch pair {tuple(result['pair'])}"
            if result.get("pair") is not None
            else ""
        )
        lines.append(f"- `{result['core_id']}`: {rows}{rab}")

    lines.extend([
        "",
        "## Reading",
        "",
    ])
    if valid_count == 0:
        lines.append(
            "All selected lifts were unresolved within the stated timeout. This "
            "supports no conclusion about active-kernel recurrence or collapse."
        )
    elif classes or strict:
        lines.append(
            "At least one structural collapse occurred. The smallest repeated or "
            "covering kernel should now be rerun with full coefficient emission "
            "and independent exact replay."
        )
    else:
        lines.append(
            "This sample did not collapse after zero-cofactor removal. That is "
            "evidence for a generic certificate adapter rather than a single "
            "small geometric contradiction, but it is not a nonexistence theorem."
        )
    lines.append("")
    return "\n".join(lines)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--selection",
        choices=("smoke", "latest", "recommended", "all"),
        default="smoke",
    )
    parser.add_argument("--core-id", action="append", default=[])
    parser.add_argument("--timeout-seconds", type=float, default=600.0)
    parser.add_argument("--jobs", type=int, default=2)
    parser.add_argument(
        "--lift-algorithm",
        choices=("std", "slimgb"),
        default="std",
    )
    parser.add_argument("--output", type=Path)
    parser.add_argument("--markdown", type=Path)
    args = parser.parse_args()
    require(args.timeout_seconds > 0, "timeout must be positive")
    require(args.jobs > 0, "jobs must be positive")

    cores = load_bank()
    selected = select_core_ids(args.selection, args.core_id, cores)
    results: list[dict[str, Any]] = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs) as executor:
        futures = {
            executor.submit(
                singular_lift_support,
                core_id,
                cores[core_id],
                timeout_seconds=args.timeout_seconds,
                lift_algorithm=args.lift_algorithm,
            ): core_id
            for core_id in selected
        }
        for future in concurrent.futures.as_completed(futures):
            core_id = futures[future]
            try:
                result = future.result()
            except Exception as error:
                result = {
                    "core_id": core_id,
                    "grade": core_grade(core_id),
                    "pair": (
                        list(forced_pair(core_id))
                        if forced_pair(core_id) is not None else None
                    ),
                    "status": "ERROR",
                    "error": f"{type(error).__name__}: {error}",
                    "nominal_row_count": len(cores[core_id]["rows"]),
                    "nominal_equality_count": int(
                        cores[core_id]["equality_count"]
                    ),
                }
            results.append(result)
            print(
                f"{core_id}: {result['status']} "
                f"({result.get('elapsed_seconds', 0):.2f}s)",
                file=sys.stderr,
                flush=True,
            )
    results.sort(key=lambda result: natural_core_key(str(result["core_id"])))

    payload = {
        "schema": "p97-atail-loop-active-kernel-mining-v1",
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "evidence_scope": (
            "theorem-discovery only; nonzero Singular lift positions and "
            "Singular internal replay, without retained coefficients or "
            "independent exact replay"
        ),
        "selection": args.selection if not args.core_id else "explicit",
        "selected_core_ids": selected,
        "timeout_seconds": args.timeout_seconds,
        "lift_algorithm": args.lift_algorithm,
        "jobs": args.jobs,
        "bank_path": str(BANK_PATH.relative_to(ROOT)),
        "bank_sha256": sha256_file(BANK_PATH),
        "results": results,
        "quotient": quotient_results(results),
    }
    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered, encoding="utf-8")
    if args.markdown is not None:
        args.markdown.write_text(markdown_report(payload), encoding="utf-8")
    print(rendered, end="")


if __name__ == "__main__":
    main()
