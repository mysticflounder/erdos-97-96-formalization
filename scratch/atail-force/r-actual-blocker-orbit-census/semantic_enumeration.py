#!/usr/bin/env python3
"""Enumerate a projected incidence-signature quotient at one finite bound.

Each emitted signature has at least one equality-color completion satisfying
the encoded constraints.  Equality-color details outside the projection are
existentially forgotten.  This discovery harness does not decide Euclidean
realizability, and terminal Z3 UNSAT is not proof-producing.  Every emitted
completion is checked again by the solver-free ``domain.py``.
"""

from __future__ import annotations

import argparse
import hashlib
from itertools import combinations, permutations
import json
from math import comb
import os
from pathlib import Path
import platform
import shutil
import sys
import tempfile
from typing import Any, Iterable

import z3

from domain import (
    CAP_ROLES,
    SCHEMA_VERSION,
    apex_row,
    pair_key,
    shell,
    validate_orbit_model,
)

LANE = Path(__file__).resolve().parent
SEMANTIC_SCHEMA_VERSION = 2
DEFAULT_MAX_CIRCLE_TRIPLES = 100_000
DEFAULT_MAX_SYMMETRY_VARIANTS = 100_000


class ResourceBudgetError(ValueError):
    """Raised before construction when a combinatorial preflight cap is exceeded."""


def _bounded_symmetry_variant_count(
    period: int, residual_points: int, cap: int
) -> tuple[int, bool]:
    """Return the exact count under ``cap``, or a witnessed lower bound above it."""

    count = period
    if count > cap:
        return count, True
    for factor in range(2, residual_points + 1):
        if count > cap // factor:
            return count * factor, True
        count *= factor
    return count, False


def resource_preflight(
    point_count: int,
    period: int,
    *,
    max_circle_triples: int,
    max_symmetry_variants: int,
) -> dict[str, int | bool]:
    """Compute exact construction bounds and reject oversized runs fail-closed."""

    if max_circle_triples <= 0 or max_symmetry_variants <= 0:
        raise ValueError("resource caps must be positive")
    structural_feasible = point_count >= max(5, period + 1)
    circle_triples = (
        comb(point_count, 2) * comb(point_count - 2, 3)
        if structural_feasible
        else 0
    )
    if circle_triples > max_circle_triples:
        raise ResourceBudgetError(
            "circle-triple constraint budget exceeded: "
            f"required={circle_triples}, cap={max_circle_triples}; "
            "raise --max-circle-triples deliberately"
        )
    residual_points = point_count - period - 1 if structural_feasible else 0
    symmetry_variants, symmetry_exceeded = _bounded_symmetry_variant_count(
        period if structural_feasible else 0,
        residual_points,
        max_symmetry_variants,
    )
    if symmetry_exceeded:
        raise ResourceBudgetError(
            "symmetry-variant budget exceeded: "
            f"required_at_least={symmetry_variants}, "
            f"cap={max_symmetry_variants}; "
            "raise --max-symmetry-variants deliberately"
        )
    return {
        "structural_feasible": structural_feasible,
        "circle_triple_constraints": circle_triples,
        "residual_points": residual_points,
        "symmetry_variant_upper_bound": symmetry_variants,
    }


def _edge(
    variables: dict[tuple[int, int], z3.ArithRef], a: int, b: int
) -> z3.ArithRef:
    if a == b:
        raise ValueError("self-distance has no positive-radius color")
    return variables[min(a, b), max(a, b)]


def _mate_has_color(
    variables: dict[tuple[int, int], z3.ArithRef],
    center: int,
    mate: z3.ArithRef,
    fixed_point: int,
    point_count: int,
) -> z3.BoolRef:
    return z3.Or(
        *(
            z3.And(
                mate == candidate,
                _edge(variables, center, candidate)
                == _edge(variables, center, fixed_point),
            )
            for candidate in range(point_count)
            if candidate != center
        )
    )


def _build_solver(
    point_count: int,
    period: int,
    query: str,
    *,
    fixed_apex_radius: bool,
    timeout_ms: int,
    seed: int,
) -> tuple[
    z3.Solver,
    dict[tuple[int, int], z3.ArithRef],
    list[z3.ArithRef],
    list[list[z3.BoolRef | bool]],
    list[list[z3.BoolRef | bool]],
    list[str],
]:
    solver = z3.SolverFor("QF_LIA")
    solver.set(timeout=timeout_ms, random_seed=seed)
    apex = 0
    sources = list(range(1, period + 1))
    pair_count = point_count * (point_count - 1) // 2
    colors = {
        (a, b): z3.Int(f"sem_d_{a}_{b}")
        for a, b in combinations(range(point_count), 2)
    }
    for variable in colors.values():
        solver.add(variable >= 0, variable < pair_count)

    mates = [z3.Int(f"sem_mate_{index}") for index in range(period)]
    shell_members: list[list[z3.BoolRef | bool]] = []
    apex_members: list[list[z3.BoolRef | bool]] = []
    hits: list[z3.BoolRef] = []

    for index, source in enumerate(sources):
        blocker = sources[(index + 1) % period]
        mate = mates[index]
        solver.add(mate >= 0, mate < point_count, mate != apex, mate != source)
        solver.add(_mate_has_color(colors, apex, mate, source, point_count))

        shell_row: list[z3.BoolRef | bool] = []
        for point in range(point_count):
            if point == blocker:
                shell_row.append(False)
            else:
                shell_row.append(
                    _edge(colors, blocker, point)
                    == _edge(colors, blocker, source)
                )
        solver.add(
            z3.Sum(*(z3.If(member, 1, 0) for member in shell_row)) == 4
        )
        shell_members.append(shell_row)

        apex_row_members: list[z3.BoolRef | bool] = []
        for point in range(point_count):
            if point == apex:
                apex_row_members.append(False)
            else:
                apex_row_members.append(
                    _edge(colors, apex, point) == _edge(colors, apex, source)
                )
        apex_members.append(apex_row_members)

        hit = _mate_has_color(colors, blocker, mate, source, point_count)
        hits.append(hit)

    # Two distinct Euclidean circles cannot have three distinct common points.
    for center_a, center_b in combinations(range(point_count), 2):
        candidates = [p for p in range(point_count) if p not in (center_a, center_b)]
        for p, q, r in combinations(candidates, 3):
            solver.add(
                z3.Not(
                    z3.And(
                        _edge(colors, center_a, p)
                        == _edge(colors, center_a, q),
                        _edge(colors, center_a, p)
                        == _edge(colors, center_a, r),
                        _edge(colors, center_b, p)
                        == _edge(colors, center_b, q),
                        _edge(colors, center_b, p)
                        == _edge(colors, center_b, r),
                    )
                )
            )

    if query == "some_hit":
        solver.add(z3.Or(*hits))
    else:
        solver.add(z3.And(*(z3.Not(hit) for hit in hits)))

    assumptions = ["proved_orbit_shadow", "two_circle_rigidity"]
    if fixed_apex_radius:
        for source in sources[1:]:
            solver.add(
                _edge(colors, apex, source)
                == _edge(colors, apex, sources[0])
            )
        assumptions.append("fixed_apex_radius")

    return solver, colors, mates, shell_members, apex_members, assumptions


def _truth(model: z3.ModelRef, expression: z3.BoolRef | bool) -> bool:
    if isinstance(expression, bool):
        return expression
    return z3.is_true(model.eval(expression, model_completion=True))


def _decode_model(
    z3_model: z3.ModelRef,
    *,
    point_count: int,
    period: int,
    query: str,
    colors: dict[tuple[int, int], z3.ArithRef],
    mates: list[z3.ArithRef],
    assumptions: list[str],
) -> dict[str, Any]:
    decoded_mates = [z3_model.eval(mate).as_long() for mate in mates]
    decoded_colors = {
        pair_key(a, b): z3_model.eval(variable, model_completion=True).as_long()
        for (a, b), variable in colors.items()
    }
    partial = {
        "schema_version": SCHEMA_VERSION,
        "query": query,
        "point_count": point_count,
        "period": period,
        "apex": 0,
        "sources": list(range(1, period + 1)),
        "mates": decoded_mates,
        "edge_colors": decoded_colors,
        "assumptions": assumptions,
    }
    decoded_hits = [
        decoded_mates[index] in shell(partial, index) for index in range(period)
    ]
    model = {
        **partial,
        "hits": decoded_hits,
        # These are consequences/labels required by the independent checker,
        # not enumerated semantic degrees of freedom.
        "hit_opposite_side": decoded_hits.copy(),
        "cap_roles": [CAP_ROLES[0] for _ in range(period)],
        "opaque_witnesses": [
            {
                "source_erased": True,
                "robust_pair": True,
                "double_deletion_k4": True,
            }
            for _ in range(period)
        ],
    }
    validate_orbit_model(model)
    return model


def semantic_signature(model: dict[str, Any]) -> dict[str, Any]:
    """Project one completion to incidences, excluding unobserved color data."""

    validate_orbit_model(model)
    period = model["period"]
    supports = [sorted(shell(model, index)) for index in range(period)]
    apex_rows = [sorted(apex_row(model, index)) for index in range(period)]
    sources = model["sources"]
    mates = model["mates"]
    return {
        "mates": mates.copy(),
        "hits": model["hits"].copy(),
        "shell_supports": supports,
        "apex_rows": apex_rows,
        "inter_shell": {
            "intersection_sizes": [
                [
                    len(set(supports[i]) & set(supports[j]))
                    for j in range(period)
                ]
                for i in range(period)
            ],
            "source_in_shell": [
                [sources[j] in supports[i] for j in range(period)]
                for i in range(period)
            ],
            "mate_in_shell": [
                [mates[j] in supports[i] for j in range(period)]
                for i in range(period)
            ],
        },
    }


def _semantic_variants(
    model: dict[str, Any],
    *,
    max_variants: int = DEFAULT_MAX_SYMMETRY_VARIANTS,
) -> Iterable[tuple[tuple[int, ...], tuple[tuple[bool, ...], ...], tuple[tuple[bool, ...], ...]]]:
    """Yield all source-rotation/residual-relabeling variants in standard labels."""

    point_count = model["point_count"]
    period = model["period"]
    apex = model["apex"]
    sources = model["sources"]
    source_set = set(sources)
    residual = [p for p in range(point_count) if p != apex and p not in source_set]
    variant_upper_bound, variant_exceeded = _bounded_symmetry_variant_count(
        period, len(residual), max_variants
    )
    if variant_exceeded:
        raise ResourceBudgetError(
            "symmetry-variant budget exceeded before permutation: "
            f"required_at_least={variant_upper_bound}, cap={max_variants}"
        )
    supports = [shell(model, index) for index in range(period)]
    apex_rows = [apex_row(model, index) for index in range(period)]

    seen: set[
        tuple[
            tuple[int, ...],
            tuple[tuple[bool, ...], ...],
            tuple[tuple[bool, ...], ...],
        ]
    ] = set()
    for shift in range(period):
        rotated_indices = [(shift + index) % period for index in range(period)]
        rotated_sources = [sources[index] for index in rotated_indices]
        for residual_order in permutations(residual):
            old_to_new = {apex: 0}
            old_to_new.update(
                {old: index + 1 for index, old in enumerate(rotated_sources)}
            )
            old_to_new.update(
                {
                    old: period + 1 + index
                    for index, old in enumerate(residual_order)
                }
            )
            inverse = {new: old for old, new in old_to_new.items()}
            variant = (
                tuple(old_to_new[model["mates"][old_index]] for old_index in rotated_indices),
                tuple(
                    tuple(
                        inverse[new_point] in supports[old_index]
                        for new_point in range(point_count)
                    )
                    for old_index in rotated_indices
                ),
                tuple(
                    tuple(
                        inverse[new_point] in apex_rows[old_index]
                        for new_point in range(point_count)
                    )
                    for old_index in rotated_indices
                ),
            )
            if variant not in seen:
                seen.add(variant)
                yield variant


def semantic_canonical_key(
    model: dict[str, Any],
    *,
    max_symmetry_variants: int = DEFAULT_MAX_SYMMETRY_VARIANTS,
) -> tuple[Any, ...]:
    validate_orbit_model(model)
    return (
        model["point_count"],
        model["period"],
        model["query"],
        "fixed_apex_radius" in model["assumptions"],
        min(_semantic_variants(model, max_variants=max_symmetry_variants)),
    )


def _block_variant(
    solver: z3.Solver,
    variant: tuple[
        tuple[int, ...],
        tuple[tuple[bool, ...], ...],
        tuple[tuple[bool, ...], ...],
    ],
    mates: list[z3.ArithRef],
    shell_members: list[list[z3.BoolRef | bool]],
    apex_members: list[list[z3.BoolRef | bool]],
) -> None:
    mate_values, shell_values, apex_values = variant
    differences: list[z3.BoolRef] = [
        mate != value for mate, value in zip(mates, mate_values, strict=True)
    ]
    for expressions, values in (
        (shell_members, shell_values),
        (apex_members, apex_values),
    ):
        for expression_row, value_row in zip(expressions, values, strict=True):
            for expression, value in zip(expression_row, value_row, strict=True):
                if isinstance(expression, bool):
                    if expression != value:
                        # This transformed signature cannot occur in the
                        # standard labeling, so its block is tautological.
                        return
                else:
                    differences.append(expression != z3.BoolVal(value))
    solver.add(z3.Or(*differences))


def _atomic_json(path: Path, payload: Any) -> None:
    _atomic_text(path, json.dumps(payload, indent=2, sort_keys=True) + "\n")


def _atomic_jsonl(path: Path, records: list[dict[str, Any]]) -> None:
    _atomic_text(
        path,
        "".join(json.dumps(record, sort_keys=True) + "\n" for record in records)
    )


def _atomic_text(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    descriptor, temporary_name = tempfile.mkstemp(
        dir=path.parent,
        prefix=f".{path.name}.",
        suffix=".tmp",
        text=True,
    )
    temporary = Path(temporary_name)
    try:
        with os.fdopen(descriptor, "w") as stream:
            stream.write(content)
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary, path)
    finally:
        if temporary.exists():
            temporary.unlink()


def _prepare_output_dir(output_dir: Path, *, overwrite: bool) -> None:
    resolved = output_dir.resolve()
    if LANE.is_relative_to(resolved):
        raise ValueError(
            f"refusing output directory that contains the census lane: {resolved}"
        )
    if resolved.exists() and not resolved.is_dir():
        raise ValueError(f"output path exists and is not a directory: {resolved}")
    if resolved.exists() and any(resolved.iterdir()):
        if not overwrite:
            raise ValueError(
                f"output directory is nonempty: {resolved}; pass --overwrite "
                "to replace it"
            )
        shutil.rmtree(resolved)
    resolved.mkdir(parents=True, exist_ok=True)


def _source_hashes() -> dict[str, str]:
    return {
        "domain.py": hashlib.sha256((LANE / "domain.py").read_bytes()).hexdigest(),
        "semantic_enumeration.py": hashlib.sha256(
            Path(__file__).read_bytes()
        ).hexdigest(),
    }


def enumerate_semantics(
    point_count: int,
    period: int,
    query: str,
    *,
    fixed_apex_radius: bool = False,
    timeout_ms: int = 20_000,
    seed: int = 0,
    max_signatures: int = 1_000,
    output_dir: Path | None = None,
    overwrite: bool = False,
    max_circle_triples: int = DEFAULT_MAX_CIRCLE_TRIPLES,
    max_symmetry_variants: int = DEFAULT_MAX_SYMMETRY_VARIANTS,
) -> dict[str, Any]:
    """Enumerate the projected quotient or stop fail-closed at a stated bound."""

    if query not in {"some_hit", "all_omission"}:
        raise ValueError(f"unknown query: {query}")
    if point_count < 4 or period < 2 or timeout_ms <= 0 or max_signatures <= 0:
        raise ValueError("invalid enumeration bounds")

    preflight = resource_preflight(
        point_count,
        period,
        max_circle_triples=max_circle_triples,
        max_symmetry_variants=max_symmetry_variants,
    )
    parameters = {
        "point_count": point_count,
        "period": period,
        "query": query,
        "fixed_apex_radius": fixed_apex_radius,
        "timeout_ms_per_check": timeout_ms,
        "seed": seed,
        "max_signatures": max_signatures,
        "max_circle_triples": max_circle_triples,
        "max_symmetry_variants": max_symmetry_variants,
    }
    source_hashes = _source_hashes()
    manifest_base = {
        "semantic_schema_version": SEMANTIC_SCHEMA_VERSION,
        "scope": (
            "projected incidence-signature quotient; every admitted signature "
            "has an existential equality-color completion satisfying the encoding"
        ),
        "not_claimed": [
            "enumeration of full equality-color partitions",
            "Euclidean realizability",
            "CounterexampleData realization",
            "Lean theorem closure",
            "proof-producing UNSAT",
        ],
        "trust_boundary": {
            "emitted_models": (
                "one existential equality-color completion independently checked "
                "by solver-free domain.py per projected signature"
            ),
            "COMPLETE": (
                "Z3 exhausted the projected incidence-signature quotient modulo "
                "the stated symmetries; equality colors outside the projection "
                "remain existential; discovery evidence only"
            ),
            "PARTIAL_LIMIT": "more projected signatures exist past the model cap",
            "UNKNOWN": "nonterminal solver result",
            "RUNNING": "artifact is incomplete and nonterminal",
        },
        "parameters": parameters,
        "preflight": preflight,
        "signature_fields": [
            "mates",
            "hits (derived)",
            "shell_supports",
            "apex_rows",
            "inter_shell.intersection_sizes",
            "inter_shell.source_in_shell",
            "inter_shell.mate_in_shell",
        ],
        "excluded_projection_fields": [
            "full equality-color partition outside recorded incidences",
            "cap_roles",
            "hit_opposite_side labels",
        ],
        "source_sha256": source_hashes,
    }
    if output_dir is not None:
        output_dir = output_dir.resolve()
        _prepare_output_dir(output_dir, overwrite=overwrite)
        _atomic_json(
            output_dir / "manifest.json",
            {
                **manifest_base,
                "status": "RUNNING",
                "signature_count": 0,
                "solver_model_count": 0,
                "reason": None,
            },
        )
        _atomic_jsonl(output_dir / "signatures.jsonl", [])

    records: list[dict[str, Any]] = []
    seen_keys: set[tuple[Any, ...]] = set()
    solver_models = 0
    reason: str | None = None
    status = "COMPLETE"

    if not preflight["structural_feasible"]:
        solver = None
    else:
        (
            solver,
            colors,
            mates,
            shell_members,
            apex_members,
            assumptions,
        ) = _build_solver(
            point_count,
            period,
            query,
            fixed_apex_radius=fixed_apex_radius,
            timeout_ms=timeout_ms,
            seed=seed,
        )

        while True:
            verdict = solver.check()
            if verdict == z3.unsat:
                break
            if verdict == z3.unknown:
                status = "UNKNOWN"
                reason = solver.reason_unknown()
                break

            solver_models += 1
            model = _decode_model(
                solver.model(),
                point_count=point_count,
                period=period,
                query=query,
                colors=colors,
                mates=mates,
                assumptions=assumptions,
            )
            key = semantic_canonical_key(
                model, max_symmetry_variants=max_symmetry_variants
            )
            if key in seen_keys:
                raise RuntimeError("canonical duplicate escaped symmetry blocking")
            seen_keys.add(key)
            variants = tuple(
                _semantic_variants(
                    model, max_variants=max_symmetry_variants
                )
            )
            for variant in variants:
                _block_variant(
                    solver, variant, mates, shell_members, apex_members
                )

            record = {
                "semantic_schema_version": SEMANTIC_SCHEMA_VERSION,
                "index": len(records),
                "canonical_key_sha256": hashlib.sha256(
                    repr(key).encode("utf-8")
                ).hexdigest(),
                "signature": semantic_signature(model),
                "model": model,
                "symmetry_orbit_size": len(variants),
                "trust": (
                    "one independently verified existential equality-color "
                    "completion of this projected signature"
                ),
            }
            records.append(record)
            if output_dir is not None:
                _atomic_jsonl(output_dir / "signatures.jsonl", records)

            if len(records) >= max_signatures:
                next_verdict = solver.check()
                if next_verdict == z3.unsat:
                    status = "COMPLETE"
                elif next_verdict == z3.unknown:
                    status = "UNKNOWN"
                    reason = solver.reason_unknown()
                else:
                    status = "PARTIAL_LIMIT"
                break

    manifest = {
        **manifest_base,
        "status": status,
        "signature_count": len(records),
        "solver_model_count": solver_models,
        "reason": reason,
        "runtime": {
            "python": platform.python_version(),
            "z3": z3.get_version_string(),
            "platform": platform.platform(),
        },
    }
    if output_dir is not None:
        _atomic_jsonl(output_dir / "signatures.jsonl", records)
        # The terminal manifest is intentionally the last publication step.
        _atomic_json(output_dir / "manifest.json", manifest)
    return manifest


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--point-count", type=int, required=True)
    parser.add_argument("--period", type=int, required=True)
    parser.add_argument(
        "--query", choices=("some_hit", "all_omission"), required=True
    )
    parser.add_argument("--fixed-apex-radius", action="store_true")
    parser.add_argument("--timeout-ms", type=int, default=20_000)
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument("--max-signatures", type=int, default=1_000)
    parser.add_argument(
        "--max-circle-triples", type=int, default=DEFAULT_MAX_CIRCLE_TRIPLES
    )
    parser.add_argument(
        "--max-symmetry-variants",
        type=int,
        default=DEFAULT_MAX_SYMMETRY_VARIANTS,
    )
    parser.add_argument("--output-dir", type=Path, default=LANE / "semantic-out")
    parser.add_argument(
        "--overwrite",
        action="store_true",
        help="replace a nonempty output directory instead of refusing the run",
    )
    args = parser.parse_args()
    try:
        manifest = enumerate_semantics(
            args.point_count,
            args.period,
            args.query,
            fixed_apex_radius=args.fixed_apex_radius,
            timeout_ms=args.timeout_ms,
            seed=args.seed,
            max_signatures=args.max_signatures,
            output_dir=args.output_dir.resolve(),
            overwrite=args.overwrite,
            max_circle_triples=args.max_circle_triples,
            max_symmetry_variants=args.max_symmetry_variants,
        )
    except ValueError as error:
        parser.error(str(error))
    print(
        json.dumps(
            {
                "status": manifest["status"],
                "signature_count": manifest["signature_count"],
                "solver_model_count": manifest["solver_model_count"],
                "manifest": str((args.output_dir / "manifest.json").resolve()),
            },
            sort_keys=True,
        )
    )
    return 0 if manifest["status"] == "COMPLETE" else 2


if __name__ == "__main__":
    sys.exit(main())
