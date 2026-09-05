#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Extract a positive weighted Kalmanson dependence through PIQD.

The source event supplies one replayed Boolean exact-13 cell.  This producer
projects every strict cyclic Kalmanson form through that cell's provider-row
equalities and asks PIQD for a nonzero nonnegative rational dependence.  A SAT
weight model is replayed with ``Fraction``, scaled to primitive natural
weights, and expanded into provider-tagged equality paths.  The resulting cut
is source-sound for this one decoded cell; it is not a source-coverage claim.
"""

from __future__ import annotations

import argparse
import json
import math
import re
from collections import Counter, defaultdict
from fractions import Fraction
from pathlib import Path

import cardge13_exact13_coarse_cell_batch_piqd as one_form_batch
import cardge13_exact13_coarse_cell_boolean_piqd as coarse
import cardge13_exact13_coarse_cell_three_form_batch_piqd as three_form
import cardge13_exact13_global_source_cell_boolean_path_cegar_piqd as path_cegar
import cardge13_exact13_global_source_cell_csp_piqd as base
import cardge13_exact13_tight_cover_lra_piqd as piqd_core

SCHEMA = "cardge13-exact13-coarse-cell-conic-batch-piqd/v2"
SELF_PATH = "scripts/cardge13_exact13_coarse_cell_conic_batch_piqd.py"
EXTRA_SOURCE_PATHS = (
    SELF_PATH,
    "scripts/cardge13_exact13_coarse_cell_batch_piqd.py",
    "scripts/cardge13_exact13_coarse_cell_three_form_batch_piqd.py",
    "scripts/cardge13_exact13_tight_cover_lra_piqd.py",
)
MAX_DENOMINATOR_BITS = 256
MAX_TOTAL_NATURAL_WEIGHT = 100_000
Edge = tuple[int, int]
FormVector = tuple[tuple[Edge, int], ...]


class ConicBatchError(RuntimeError):
    """A manifest, PIQD model, or reconstructed cone certificate is invalid."""


def selected_forms(
    forms: tuple[tuple[FormVector, dict[str, object]], ...], *, exclude_zero: bool
) -> tuple[tuple[FormVector, dict[str, object]], ...]:
    """Optionally remove ordinary one-form zero projections from a cone query."""
    if not exclude_zero:
        return forms
    return tuple((vector, form) for vector, form in forms if vector)


def cone_commands(forms: tuple[tuple[FormVector, dict[str, object]], ...]) -> tuple[str, ...]:
    """Encode a normalized nonnegative dependence among projected forms."""
    if not forms:
        raise ConicBatchError("the projected form family is empty")
    weights = tuple(f"w_{index}" for index in range(len(forms)))
    commands = ["(set-logic QF_LRA)"]
    for weight in weights:
        commands.extend((f"(declare-const {weight} Real)", f"(assert (>= {weight} 0))"))
    commands.append(f"(assert (= {base.linear_sum(weights)} 1))")
    coordinates = sorted({edge for vector, _form in forms for edge, _coefficient in vector})
    for coordinate in coordinates:
        terms = []
        for index, (vector, _form) in enumerate(forms):
            coefficient = dict(vector).get(coordinate, 0)
            if coefficient:
                terms.append(f"(* {coefficient} {weights[index]})")
        commands.append(f"(assert (= {base.linear_sum(terms)} 0))")
    return tuple(commands)


def _parse_sexprs(text: str) -> list[object]:
    """Parse the small SMT-LIB S-expression subset used by PIQD models."""
    tokens = re.findall(r"\(|\)|[^\s()]+", text)
    roots: list[object] = []
    stack: list[list[object]] = []
    for token in tokens:
        if token == "(":
            value: list[object] = []
            if stack:
                stack[-1].append(value)
            else:
                roots.append(value)
            stack.append(value)
        elif token == ")":
            if not stack:
                raise ConicBatchError("unbalanced PIQD model")
            stack.pop()
        elif stack:
            stack[-1].append(token)
        else:
            roots.append(token)
    if stack:
        raise ConicBatchError("unbalanced PIQD model")
    return roots


def _fraction(value: object) -> Fraction:
    """Decode one exact rational SMT model value."""
    if isinstance(value, str):
        try:
            return Fraction(value)
        except ValueError as exc:
            raise ConicBatchError(f"unsupported rational atom: {value}") from exc
    if isinstance(value, list) and len(value) == 2 and value[0] == "-":
        return -_fraction(value[1])
    if isinstance(value, list) and len(value) == 3 and value[0] == "/":
        denominator = _fraction(value[2])
        if denominator == 0:
            raise ConicBatchError("zero model denominator")
        return _fraction(value[1]) / denominator
    raise ConicBatchError(f"unsupported rational expression: {value!r}")


def model_weights(model: str, count: int) -> tuple[Fraction, ...]:
    """Read every normalized cone weight from a PIQD SMT model."""
    found: dict[int, Fraction] = {}

    def visit(value: object) -> None:
        if isinstance(value, list):
            if (
                len(value) == 5
                and value[0] == "define-fun"
                and isinstance(value[1], str)
                and re.fullmatch(r"w_\d+", value[1])
                and value[2] == []
                and value[3] == "Real"
            ):
                found[int(value[1][2:])] = _fraction(value[4])
            for child in value:
                visit(child)

    for root in _parse_sexprs(model):
        visit(root)
    if set(found) != set(range(count)):
        raise ConicBatchError("PIQD cone model omitted or added weight variables")
    weights = tuple(found[index] for index in range(count))
    if any(weight < 0 for weight in weights) or sum(weights) != 1:
        raise ConicBatchError("PIQD cone weights fail normalization replay")
    return weights


def primitive_natural_weights(weights: tuple[Fraction, ...]) -> tuple[int, ...]:
    """Scale normalized rational weights to a primitive natural vector."""
    if any(weight.denominator.bit_length() > MAX_DENOMINATOR_BITS for weight in weights):
        raise ConicBatchError("cone weight denominator exceeds the certificate budget")
    denominator = math.lcm(*(weight.denominator for weight in weights))
    scaled = tuple(int(weight * denominator) for weight in weights)
    divisor = math.gcd(*scaled)
    if divisor <= 0:
        raise ConicBatchError("cone model has no positive weight")
    primitive = tuple(weight // divisor for weight in scaled)
    if sum(primitive) > MAX_TOTAL_NATURAL_WEIGHT:
        raise ConicBatchError("cone natural weights exceed the certificate budget")
    return primitive


def replay_weighted_zero(
    forms: tuple[tuple[FormVector, dict[str, object]], ...], weights: tuple[int, ...]
) -> None:
    """Independently replay the primitive weighted projected-vector sum."""
    if len(forms) != len(weights) or not any(weights) or any(weight < 0 for weight in weights):
        raise ConicBatchError("malformed primitive cone weights")
    total: Counter[Edge] = Counter()
    for (vector, _form), weight in zip(forms, weights, strict=True):
        for edge, coefficient in vector:
            total[edge] += weight * coefficient
    if +total or -total:
        raise ConicBatchError("primitive cone weights do not sum to zero")


def weighted_conflict(
    cell: dict[str, object],
    forms: tuple[tuple[FormVector, dict[str, object]], ...],
    weights: tuple[int, ...],
) -> dict[str, object]:
    """Compile one weighted dependence to deterministic provider paths."""
    replay_weighted_zero(forms, weights)
    roots = base.edge_roots_for_rows(base.cell_rows(cell))
    left_by_root: dict[Edge, list[Edge]] = defaultdict(list)
    right_by_root: dict[Edge, list[Edge]] = defaultdict(list)
    terms: list[dict[str, object]] = []
    for (_vector, form), weight in zip(forms, weights, strict=True):
        if not weight:
            continue
        form_id = form.get("form")
        positive = form.get("positive")
        negative = form.get("negative")
        if not isinstance(form_id, tuple) or not isinstance(positive, tuple) or not isinstance(negative, tuple):
            raise ConicBatchError("malformed representative Kalmanson form")
        terms.append({"form": form_id, "weight": weight})
        for _copy in range(weight):
            for edge in positive:
                canonical = base.distance_edge(*edge)
                left_by_root[roots[canonical]].append(canonical)
            for edge in negative:
                canonical = base.distance_edge(*edge)
                right_by_root[roots[canonical]].append(canonical)
    if set(left_by_root) != set(right_by_root):
        raise ConicBatchError("weighted edge components differ")
    graph = path_cegar.equality_graph(cell)
    pairings: list[dict[str, object]] = []
    atoms: set[str] = set()
    for root in sorted(left_by_root):
        lefts = sorted(left_by_root[root])
        rights = sorted(right_by_root[root])
        if len(lefts) != len(rights):
            raise ConicBatchError("weighted edge multiplicities differ")
        for left, right in zip(lefts, rights, strict=True):
            witness = path_cegar.shortest_incidence_path(graph, left, right)
            if witness is None:
                raise ConicBatchError("projected-equal edges have no provider path")
            path_atoms, steps = witness
            atoms.update(path_atoms)
            pairings.append({"left": left, "right": right, "steps": steps})
    if not atoms:
        raise ConicBatchError("weighted conflict has no source atoms")
    return {
        "kind": "positive-conic-incidence-path",
        "terms": tuple(terms),
        "pairings": tuple(pairings),
        "atoms": tuple(sorted(atoms)),
    }


def compact_direct_solve(record: dict[str, object]) -> dict[str, object]:
    """Retain direct PIQD custody without embedding the full rational model."""
    solved = record.get("solved")
    if not isinstance(solved, dict):
        raise ConicBatchError("PIQD solve response is malformed")
    solve_summary = {
        key: solved.get(key)
        for key in (
            "status",
            "solve_index",
            "solve_ms",
            "result_sha256",
            "solver_sha256",
            "solver_signature",
            "timeout_ms",
            "model_replay",
        )
        if key in solved
    }
    receipts = record.get("receipts")
    receipt_summary = {}
    if isinstance(receipts, dict):
        receipt_summary = {
            key: receipts.get(key)
            for key in ("count", "journal_path", "lane", "receipts_path", "session_id")
            if key in receipts
        }
    return {
        "solver": record.get("solver"),
        "created": record.get("created"),
        "asserted": record.get("asserted"),
        "solved": solve_summary,
        "receipts": receipt_summary,
        "closed": record.get("closed"),
    }


def _repo_relative(repo_root: Path, path: Path, label: str) -> tuple[str, Path]:
    resolved = path.resolve()
    try:
        relative = resolved.relative_to(repo_root)
    except ValueError as exc:
        raise ConicBatchError(f"{label} is outside the repository") from exc
    return relative.as_posix(), resolved


def main() -> int:
    """Run one authenticated cone query and emit its checked conflict data."""
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--run-manifest", type=Path, required=True)
    parser.add_argument("--source-event", type=Path, required=True)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--event", type=Path, required=True)
    parser.add_argument("--solver", action="append", choices=("z3", "cvc5"), required=True)
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    parser.add_argument("--exclude-zero", action="store_true")
    args = parser.parse_args()

    repo_root = args.repo_root.resolve()
    manifest, manifest_sha256, run_root = coarse.load_run_manifest(repo_root, args.run_manifest)
    source_digests = manifest.get("source_digests")
    if not isinstance(source_digests, dict):
        raise ConicBatchError("run manifest has no source digest map")
    for source in EXTRA_SOURCE_PATHS:
        if source_digests.get(source) != coarse.sha256_bytes((repo_root / source).read_bytes()):
            raise ConicBatchError(f"run manifest does not anchor {source}")
    source_relative, source_path = _repo_relative(repo_root, args.source_event, "source event")
    source_bytes = source_path.read_bytes()
    input_digests = manifest.get("input_digests")
    if not isinstance(input_digests, dict) or input_digests.get(source_relative) != coarse.sha256_bytes(source_bytes):
        raise ConicBatchError("run manifest does not anchor the source event")
    source_event = json.loads(source_bytes)
    coarse_cell = one_form_batch.source_coarse_cell(source_event)
    cell = one_form_batch.final_replayed_cell(source_event)
    coarse.validate_decoded_cell(coarse_cell, cell)
    order = base.DIRECT_ORDER if coarse_cell.orientation == "direct" else base.MIRROR_ORDER
    all_forms = three_form.representative_projected_forms(cell, order)
    forms = selected_forms(all_forms, exclude_zero=args.exclude_zero)
    commands = cone_commands(forms)
    journal = ("\n".join(commands) + "\n").encode("ascii")
    journal_path = coarse.require_under_run_root(args.out, run_root, "cone journal")
    event_path = coarse.require_under_run_root(args.event, run_root, "cone event")
    coarse.write_new(journal_path, journal)
    solves = piqd_core.run_piqd(
        journal_path,
        commands,
        tuple(args.solver),
        args.timeout_ms,
        label=f"cardge13-exact13-cone-{coarse_cell.cell_id}",
    )
    results: list[dict[str, object]] = []
    for solve in solves:
        solved = solve.get("solved")
        if not isinstance(solved, dict):
            raise ConicBatchError("PIQD solve response is malformed")
        status = solved.get("status")
        entry: dict[str, object] = {
            "solver": solve.get("solver"),
            "solve": compact_direct_solve(solve),
        }
        if status == "SAT":
            replay = solved.get("model_replay")
            model = solved.get("model")
            if not isinstance(replay, dict) or replay.get("outcome") != "SATISFIED" or not isinstance(model, str):
                raise ConicBatchError("PIQD SAT cone model did not replay")
            rational = model_weights(model, len(forms))
            natural = primitive_natural_weights(rational)
            conflict = weighted_conflict(cell, forms, natural)
            entry.update(
                nonzero_weight_count=sum(weight > 0 for weight in natural),
                natural_weight_sum=sum(natural),
                linear_conflict=conflict,
                cut=base.transitive_conflict_clause(conflict),
            )
        results.append(entry)
    payload: dict[str, object] = {
        "schema": SCHEMA,
        "claim_scope": {
            "classification": "one-replayed-model-positive-cone-discovery",
            "source_coverage": False,
            "theorem_promotion": False,
        },
        "cell": coarse_cell.to_json(int(source_event["cell"].get("index", 0))),
        "exclude_zero_projected_forms": args.exclude_zero,
        "all_projected_form_count": len(all_forms),
        "projected_form_count": len(forms),
        "command_count": len(commands),
        "journal": journal_path.relative_to(repo_root).as_posix(),
        "journal_sha256": coarse.sha256_bytes(journal),
        "run_manifest_sha256": manifest_sha256,
        "source_event": source_relative,
        "source_event_sha256": coarse.sha256_bytes(source_bytes),
        "solves": results,
    }
    payload["event_sha256"] = coarse.sha256_bytes(coarse.canonical_json_bytes(payload))
    coarse.write_new(event_path, coarse.canonical_json_bytes(payload))
    print(json.dumps({
        "event": event_path.relative_to(repo_root).as_posix(),
        "statuses": [entry["solve"]["solved"]["status"] for entry in results],
        "nonzero_weight_counts": [entry.get("nonzero_weight_count") for entry in results],
        "natural_weight_sums": [entry.get("natural_weight_sum") for entry in results],
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
