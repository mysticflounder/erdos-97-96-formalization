#!/usr/bin/env python3
"""Close every label permutation for Kalmanson pairs seen in PIQD models.

Unlike the one-model CEGAR appenders, this admission generalizes each observed
*inequality pair*: the cardinality-independent Lean consumer rules out all 24
possible matchings of the four left and four right distance labels.  The
progress receipt is written before and after every bounded HTTP mutation, so a
restart can distinguish an unsubmitted batch from a submitted-but-unrecorded
batch using the live PIQD clause count.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import os
from collections import defaultdict
from pathlib import Path
from typing import Any

import piqd_formula_chain as formula_chain

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
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


generator = load_module("piqd_two_k_pair_closure_generator_v3", GENERATOR)
uploader = load_module("piqd_two_k_pair_closure_uploader_v3", UPLOADER)


def atomic_json(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")
    os.replace(temporary, path)


def digest_lines(lines: list[str]) -> str:
    digest = hashlib.sha256()
    for line in lines:
        digest.update(line.encode())
    return digest.hexdigest()


def pair_digest(pairs: tuple[tuple[int, int], ...]) -> str:
    return digest_lines([f"{first} {second}\n" for first, second in pairs])


def clauses_digest(clauses: tuple[tuple[int, ...], ...]) -> str:
    return digest_lines([" ".join(map(str, clause)) + " 0\n" for clause in clauses])


def cancelling_pairs(
    order: tuple[int, ...], assignment: dict[int, bool]
) -> set[tuple[int, int]]:
    inequalities = generator.static.inequalities(order)
    labels = {
        edge: generator.label_value(bits, assignment)
        for edge, bits in generator.label_variables().items()
    }
    groups: dict[tuple[tuple[int, int], ...], list[int]] = defaultdict(list)
    for index, inequality in enumerate(inequalities):
        signature = generator.delta_signature(
            tuple(labels[edge] for edge in inequality[0]),
            tuple(labels[edge] for edge in inequality[1]),
        )
        groups[signature].append(index)
    result: set[tuple[int, int]] = set()
    for signature, first_indices in groups.items():
        opposite = generator.negate_signature(signature)
        if opposite not in groups or signature > opposite:
            continue
        result.update(
            tuple(sorted((first_index, second_index)))
            for first_index in first_indices
            for second_index in groups[opposite]
            if first_index != second_index
        )
    return result


def source_hashes() -> dict[str, str]:
    paths = {
        *generator.SOURCE_FILES,
        UPLOADER.resolve(),
        Path(formula_chain.__file__).resolve(),
        Path(__file__).resolve(),
    }
    return {
        formula_chain.relative(path): uploader.sha256(path)
        for path in sorted(paths)
    }


def require_session(
    value: dict[str, Any], *, session_id: str, clauses: int, variables: int
) -> None:
    formula_chain.require_fields(
        value,
        {
            "id": session_id,
            "lane": "sat",
            "state": "live",
            "clauses": clauses,
            "max_var": variables,
        },
        "live PIQD session",
    )


def make_batches(
    clauses: tuple[tuple[int, ...], ...], byte_limit: int
) -> tuple[tuple[tuple[int, ...], ...], ...]:
    batches: list[tuple[tuple[int, ...], ...]] = []
    current: list[tuple[int, ...]] = []
    payload_bytes = 0
    for clause in clauses:
        entry = uploader.encode_clause(clause)
        candidate_payload = payload_bytes + len(entry) + (1 if current else 0)
        body_bytes = (
            len(uploader.BATCH_PREFIX)
            + candidate_payload
            + len(uploader.BATCH_SUFFIX)
        )
        if body_bytes > byte_limit and current:
            batches.append(tuple(current))
            current = []
            payload_bytes = 0
            candidate_payload = len(entry)
            body_bytes = (
                len(uploader.BATCH_PREFIX)
                + candidate_payload
                + len(uploader.BATCH_SUFFIX)
            )
        if body_bytes > byte_limit:
            raise ValueError("one clause exceeds the configured request-size cap")
        current.append(clause)
        payload_bytes = candidate_payload
    if current:
        batches.append(tuple(current))
    return tuple(batches)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--session-id", required=True)
    parser.add_argument("--root-cnf", type=Path, required=True)
    parser.add_argument("--root-cnf-sha256", required=True)
    parser.add_argument("--variables", type=int, required=True)
    parser.add_argument("--root-clauses", type=int, required=True)
    parser.add_argument("--cut-receipt", type=Path, action="append", required=True)
    parser.add_argument("--receipt", type=Path, required=True)
    parser.add_argument("--base-url", default="http://127.0.0.1:7272")
    parser.add_argument("--batch-byte-limit", type=int, default=1_500_000)
    parser.add_argument("--timeout-seconds", type=float, default=300.0)
    parser.add_argument("--prepare-only", action="store_true")
    args = parser.parse_args()

    generator.static.require_lean_consumer()
    frozen_sources = source_hashes()
    chain = formula_chain.validate_formula_chain(
        root_cnf=args.root_cnf,
        root_cnf_sha256=args.root_cnf_sha256,
        variables=args.variables,
        root_clauses=args.root_clauses,
        receipt_paths=args.cut_receipt,
        expected_session_id=args.session_id,
    )
    order: tuple[int, ...] | None = None
    selected_pairs: set[tuple[int, int]] = set()
    model_evidence: list[dict[str, object]] = []
    for path in chain.receipt_paths:
        value = json.loads(path.read_text())
        receipt_order = tuple(value.get("order", ()))
        if order is None:
            order = receipt_order
        elif order != receipt_order:
            raise ValueError("cut receipts disagree on cyclic order")
        model_path = formula_chain.repo_path(value["model_log"])
        model_hash = formula_chain.sha256(model_path)
        if model_hash != value.get("model_log_sha256"):
            raise ValueError("cut receipt model custody failed")
        assignment = generator.parse_model(model_path, chain.variables)
        pairs = cancelling_pairs(receipt_order, assignment)
        selected_pairs.update(pairs)
        model_evidence.append(
            {
                "cut_receipt": formula_chain.relative(path),
                "cut_receipt_sha256": formula_chain.sha256(path),
                "model_log": formula_chain.relative(model_path),
                "model_log_sha256": model_hash,
                "cancelling_pair_count": len(pairs),
            }
        )
    if order is None or not selected_pairs:
        raise ValueError("no observed cancelling inequality pair")

    pairs = tuple(sorted(selected_pairs))
    inequalities = generator.static.inequalities(order)
    comparisons = generator.static.comparison_variables(chain.variables)
    prior = {clause for batch in chain.appended_batches for clause in batch}
    generated = {
        clause
        for first, second in pairs
        for clause in generator.static.clauses_for_pair(
            inequalities[first], inequalities[second], comparisons
        )
    }
    clauses = tuple(sorted(generated - prior))
    if not clauses:
        raise ValueError("pair closure produces no new clauses")
    batches = make_batches(clauses, args.batch_byte_limit)
    batch_specs = [
        {"count": len(batch), "sha256": clauses_digest(batch)} for batch in batches
    ]
    static = {
        "schema": SCHEMA,
        "session_id": chain.session_id,
        "variables": chain.variables,
        "base_clauses": chain.clauses,
        "root_cnf": formula_chain.relative(chain.root_cnf),
        "root_cnf_sha256": chain.root_cnf_sha256,
        "root_clauses": chain.root_clauses,
        "parent_cut_receipts": [
            formula_chain.relative(path) for path in chain.receipt_paths
        ],
        "parent_cut_receipt_sha256s": list(chain.receipt_sha256s),
        "order": list(order),
        "selected_pairs": [list(pair) for pair in pairs],
        "selected_pair_count": len(pairs),
        "selected_pair_sha256": pair_digest(pairs),
        "model_evidence": model_evidence,
        "generated_clause_count_before_prior_dedup": len(generated),
        "prior_clause_count": len(prior),
        "appended_clause_count": len(clauses),
        "appended_clause_sha256": clauses_digest(clauses),
        "batch_byte_limit": args.batch_byte_limit,
        "batch_specs": batch_specs,
        "lean_consumer": generator.LEAN_CONSUMER,
        "generation_source_hashes": frozen_sources,
    }

    receipt_path = args.receipt.resolve()
    if receipt_path.exists():
        progress = json.loads(receipt_path.read_text())
        for key, expected in static.items():
            if progress.get(key) != expected:
                raise ValueError(f"existing progress receipt disagrees on {key}")
    else:
        progress = {
            **static,
            "status": "prepared",
            "session_before": None,
            "batches": [],
            "session_after": None,
        }
        atomic_json(receipt_path, progress)

    if args.prepare_only:
        print(
            json.dumps(
                {
                    "status": "PREPARED",
                    "selected_pairs": len(pairs),
                    "generated_clauses": len(generated),
                    "appended_clauses": len(clauses),
                    "batches": len(batches),
                    "receipt": str(receipt_path),
                },
                sort_keys=True,
            )
        )
        return 0

    admitted = sum(batch["count"] for batch in progress["batches"] if batch["status"] == "committed")
    session_path = f"/sessions/{chain.session_id}"
    live = uploader.request_json(
        args.base_url, "GET", session_path, timeout_s=args.timeout_seconds
    )
    expected_live = chain.clauses + admitted
    if progress["batches"] and progress["batches"][-1]["status"] == "pending":
        pending = progress["batches"][-1]
        pending_index = pending["index"]
        pending_count = batch_specs[pending_index]["count"]
        if live.get("clauses") == expected_live + pending_count:
            pending["status"] = "committed"
            pending["add_response"] = {
                "added": pending_count,
                "clauses": expected_live + pending_count,
                "max_var": chain.variables,
            }
            pending["session_after"] = live
            admitted += pending_count
            expected_live += pending_count
            progress["status"] = "admitting"
            atomic_json(receipt_path, progress)
        elif live.get("clauses") != expected_live:
            raise ValueError("live PIQD state is neither side of pending batch")
        else:
            progress["batches"].pop()
            atomic_json(receipt_path, progress)
    require_session(
        live,
        session_id=chain.session_id,
        clauses=chain.clauses + admitted,
        variables=chain.variables,
    )
    if progress["session_before"] is None:
        progress["session_before"] = live
        atomic_json(receipt_path, progress)

    committed = len(progress["batches"])
    for index in range(committed, len(batches)):
        batch = batches[index]
        before_count = chain.clauses + admitted
        pending = {
            "index": index,
            **batch_specs[index],
            "before_clauses": before_count,
            "status": "pending",
        }
        progress["status"] = "admitting"
        progress["batches"].append(pending)
        atomic_json(receipt_path, progress)
        response = uploader.request_json(
            args.base_url,
            "POST",
            f"{session_path}/clauses",
            uploader.encode_batch([uploader.encode_clause(clause) for clause in batch]),
            timeout_s=args.timeout_seconds,
        )
        expected_response = {
            "added": len(batch),
            "clauses": before_count + len(batch),
            "max_var": chain.variables,
        }
        if response != expected_response:
            raise ValueError("PIQD add response disagrees with the pending batch")
        after = uploader.request_json(
            args.base_url, "GET", session_path, timeout_s=args.timeout_seconds
        )
        require_session(
            after,
            session_id=chain.session_id,
            clauses=expected_response["clauses"],
            variables=chain.variables,
        )
        pending["status"] = "committed"
        pending["add_response"] = response
        pending["session_after"] = after
        admitted += len(batch)
        atomic_json(receipt_path, progress)

    final = uploader.request_json(
        args.base_url, "GET", session_path, timeout_s=args.timeout_seconds
    )
    require_session(
        final,
        session_id=chain.session_id,
        clauses=chain.clauses + len(clauses),
        variables=chain.variables,
    )
    if source_hashes() != frozen_sources:
        raise RuntimeError("generation sources changed during PIQD admission")
    progress["status"] = "complete"
    progress["session_after"] = final
    atomic_json(receipt_path, progress)
    print(
        json.dumps(
            {
                "status": "PASS",
                "selected_pairs": len(pairs),
                "generated_clauses": len(generated),
                "appended_clauses": len(clauses),
                "batches": len(batches),
                "after_clauses": final["clauses"],
                "receipt": str(receipt_path),
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
