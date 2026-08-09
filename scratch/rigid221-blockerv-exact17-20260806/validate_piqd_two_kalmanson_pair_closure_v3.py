#!/usr/bin/env python3
"""Independently replay a compact PIQD two-Kalmanson pair-closure receipt."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from collections import Counter, defaultdict
from itertools import combinations
from pathlib import Path

import piqd_formula_chain as formula_chain

HERE = Path(__file__).resolve().parent
GENERATOR = HERE / "append_violated_two_kalmanson_label_cuts.py"
UPLOADER = HERE / "upload_dimacs_to_piqd_session.py"
SCHEMA = "p97-piqd-two-kalmanson-pair-closure-admission-v3"


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


generator = load_module("piqd_two_k_pair_closure_validator_generator", GENERATOR)
uploader = load_module("piqd_two_k_pair_closure_validator_uploader", UPLOADER)


def digest_lines(lines) -> str:
    digest = hashlib.sha256()
    for line in lines:
        digest.update(line.encode())
    return digest.hexdigest()


def pair_digest(pairs) -> str:
    return digest_lines(f"{first} {second}\n" for first, second in pairs)


def clauses_digest(clauses) -> str:
    return digest_lines(
        " ".join(map(str, clause)) + " 0\n" for clause in clauses
    )


def label_variables() -> dict[tuple[int, int], tuple[int, ...]]:
    next_variable = max(generator.export.selected_variables().values()) + 1
    next_variable += len(generator.export.source.FIFTH_CENTER_CANDIDATES)
    result = {}
    for edge in combinations(generator.export.source.POINTS, 2):
        result[edge] = tuple(
            range(next_variable, next_variable + generator.static.DISTANCE_LABEL_BITS)
        )
        next_variable += generator.static.DISTANCE_LABEL_BITS
    return result


def label_value(bits: tuple[int, ...], assignment: dict[int, bool]) -> int:
    return sum(1 << index for index, variable in enumerate(bits) if assignment[variable])


def signature(left: tuple[int, int], right: tuple[int, int]):
    counts = Counter(left)
    counts.subtract(right)
    return tuple(sorted((label, count) for label, count in counts.items() if count))


def cancelling_pairs(order, assignment) -> set[tuple[int, int]]:
    inequalities = generator.static.inequalities(order)
    labels = {
        edge: label_value(bits, assignment) for edge, bits in label_variables().items()
    }
    groups = defaultdict(list)
    for index, inequality in enumerate(inequalities):
        groups[
            signature(
                tuple(labels[edge] for edge in inequality[0]),
                tuple(labels[edge] for edge in inequality[1]),
            )
        ].append(index)
    result = set()
    for value, first_indices in groups.items():
        opposite = tuple((label, -count) for label, count in value)
        if opposite not in groups or value > opposite:
            continue
        result.update(
            tuple(sorted((first, second)))
            for first in first_indices
            for second in groups[opposite]
            if first != second
        )
    return result


def make_batch_specs(clauses, byte_limit: int) -> list[dict[str, object]]:
    result = []
    current = []
    payload_bytes = 0
    for clause in clauses:
        entry = uploader.encode_clause(clause)
        candidate = payload_bytes + len(entry) + (1 if current else 0)
        body_bytes = len(uploader.BATCH_PREFIX) + candidate + len(uploader.BATCH_SUFFIX)
        if body_bytes > byte_limit and current:
            result.append({"count": len(current), "sha256": clauses_digest(current)})
            current = []
            payload_bytes = 0
            candidate = len(entry)
            body_bytes = (
                len(uploader.BATCH_PREFIX)
                + candidate
                + len(uploader.BATCH_SUFFIX)
            )
        if body_bytes > byte_limit:
            raise ValueError("one replayed clause exceeds the batch cap")
        current.append(clause)
        payload_bytes = candidate
    if current:
        result.append({"count": len(current), "sha256": clauses_digest(current)})
    return result


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--receipt", type=Path, required=True)
    parser.add_argument("--base-url", default="http://127.0.0.1:7272")
    parser.add_argument("--timeout-seconds", type=float, default=300.0)
    parser.add_argument("--allow-prepared", action="store_true")
    args = parser.parse_args()

    receipt = json.loads(args.receipt.resolve().read_text())
    if receipt.get("schema") != SCHEMA:
        raise ValueError("unexpected pair-closure receipt schema")
    status = receipt.get("status")
    if status != "complete" and not (status == "prepared" and args.allow_prepared):
        raise ValueError("pair-closure receipt is not complete")
    for path, expected in receipt.get("generation_source_hashes", {}).items():
        if formula_chain.sha256(formula_chain.repo_path(path)) != expected:
            raise ValueError(f"generation source changed: {path}")

    chain = formula_chain.validate_formula_chain(
        root_cnf=formula_chain.repo_path(receipt["root_cnf"]),
        root_cnf_sha256=receipt["root_cnf_sha256"],
        variables=receipt["variables"],
        root_clauses=receipt["root_clauses"],
        receipt_paths=[
            formula_chain.repo_path(path) for path in receipt["parent_cut_receipts"]
        ],
        expected_session_id=receipt["session_id"],
    )
    if list(chain.receipt_sha256s) != receipt["parent_cut_receipt_sha256s"]:
        raise ValueError("parent cut-receipt hashes disagree")
    if chain.clauses != receipt["base_clauses"]:
        raise ValueError("pair closure starts from the wrong formula size")

    order = tuple(receipt["order"])
    pairs: set[tuple[int, int]] = set()
    evidence = receipt["model_evidence"]
    if len(evidence) != len(chain.receipt_paths):
        raise ValueError("model evidence does not cover the parent chain")
    for item, parent_path, parent_hash in zip(
        evidence, chain.receipt_paths, chain.receipt_sha256s, strict=True
    ):
        if (
            formula_chain.repo_path(item["cut_receipt"]) != parent_path
            or item["cut_receipt_sha256"] != parent_hash
        ):
            raise ValueError("model evidence names the wrong parent receipt")
        model = formula_chain.repo_path(item["model_log"])
        if formula_chain.sha256(model) != item["model_log_sha256"]:
            raise ValueError("model evidence SHA-256 mismatch")
        assignment = generator.parse_model(model, chain.variables)
        model_pairs = cancelling_pairs(order, assignment)
        if len(model_pairs) != item["cancelling_pair_count"]:
            raise ValueError("model cancelling-pair count disagrees")
        pairs.update(model_pairs)

    ordered_pairs = tuple(sorted(pairs))
    recorded_pairs = tuple(tuple(pair) for pair in receipt["selected_pairs"])
    if ordered_pairs != recorded_pairs:
        raise ValueError("selected pair list does not replay")
    if (
        len(ordered_pairs) != receipt["selected_pair_count"]
        or pair_digest(ordered_pairs) != receipt["selected_pair_sha256"]
    ):
        raise ValueError("selected pair summary does not replay")

    inequalities = generator.static.inequalities(order)
    comparisons = generator.static.comparison_variables(chain.variables)
    prior = {clause for batch in chain.appended_batches for clause in batch}
    generated = {
        clause
        for first, second in ordered_pairs
        for clause in generator.static.clauses_for_pair(
            inequalities[first], inequalities[second], comparisons
        )
    }
    clauses = tuple(sorted(generated - prior))
    if len(generated) != receipt["generated_clause_count_before_prior_dedup"]:
        raise ValueError("raw generalized-clause count does not replay")
    if len(prior) != receipt["prior_clause_count"]:
        raise ValueError("prior-clause count does not replay")
    if (
        len(clauses) != receipt["appended_clause_count"]
        or clauses_digest(clauses) != receipt["appended_clause_sha256"]
    ):
        raise ValueError("appended pair-closure clause set does not replay")
    specs = make_batch_specs(clauses, receipt["batch_byte_limit"])
    if specs != receipt["batch_specs"]:
        raise ValueError("pair-closure batch partition does not replay")

    batches = receipt["batches"]
    if status == "prepared":
        if batches or receipt["session_before"] is not None or receipt["session_after"] is not None:
            raise ValueError("prepared receipt records a PIQD mutation")
        expected_live = chain.clauses
    else:
        if len(batches) != len(specs):
            raise ValueError("complete receipt does not cover every batch")
        running = chain.clauses
        for index, (batch, spec) in enumerate(zip(batches, specs, strict=True)):
            expected_after = running + spec["count"]
            expected_response = {
                "added": spec["count"],
                "clauses": expected_after,
                "max_var": chain.variables,
            }
            if (
                batch.get("index") != index
                or batch.get("count") != spec["count"]
                or batch.get("sha256") != spec["sha256"]
                or batch.get("before_clauses") != running
                or batch.get("status") != "committed"
                or batch.get("add_response") != expected_response
            ):
                raise ValueError(f"batch {index} custody does not replay")
            formula_chain.require_fields(
                batch.get("session_after", {}),
                {
                    "id": chain.session_id,
                    "lane": "sat",
                    "state": "live",
                    "clauses": expected_after,
                    "max_var": chain.variables,
                },
                f"batch {index} session-after",
            )
            running = expected_after
        expected_live = running
        formula_chain.require_fields(
            receipt.get("session_after", {}),
            {
                "id": chain.session_id,
                "clauses": expected_live,
                "max_var": chain.variables,
            },
            "final session",
        )

    live = uploader.request_json(
        args.base_url,
        "GET",
        f"/sessions/{chain.session_id}",
        timeout_s=args.timeout_seconds,
    )
    formula_chain.require_fields(
        live,
        {
            "id": chain.session_id,
            "lane": "sat",
            "state": "live",
            "clauses": expected_live,
            "max_var": chain.variables,
        },
        "live PIQD session",
    )
    print(
        json.dumps(
            {
                "status": "PASS",
                "receipt_status": status,
                "selected_pairs": len(ordered_pairs),
                "appended_clauses": len(clauses),
                "batches": len(specs),
                "live_clauses": expected_live,
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
