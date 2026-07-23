#!/usr/bin/env python3
"""Replay the exact p5-v3 terminal CNF and optional CaDiCaL DRAT proof.

This checker is independent of the CEGAR driver's Python objects.  It streams
the emitted DIMACS, checks the checkpoint and encoder hashes, reconstructs all
seeded row-instance cuts, verifies their preserved source occurrences and Lean
consumer declarations, and optionally runs ``drat-trim``.

The result concerns only the hashed fixed ``n = 11`` Boolean projection.  It is
not an arbitrary-cardinality occurrence theorem and does not close a Lean
``sorry``.
"""

from __future__ import annotations

import argparse
from collections import Counter, deque
import hashlib
import itertools
import json
from pathlib import Path
import re
import subprocess
import time
from typing import Any


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
STAR = HERE.parent / "unique4-star-producer"
DEFAULT_CHECKPOINT = STAR / "seeded_v3_full_linear_cegar_p5.json"
DEFAULT_SCHEMA_BANK = STAR / "kalmanson_row_instance_schemas_seeded_v3.json"
LEAN_SOURCES = {
    "Problem97.CorrectedOwnCapKalmansonCoresScratch.false_of_four_endpoint_k2_three_row_instances": (
        HERE.parent
        / "unique4-source-field-audit"
        / "CorrectedOwnCapKalmansonCores.lean"
    ),
    "Problem97.CorrectedOwnCapKalmansonCoresScratch.false_of_two_k1_two_k2_four_row_instances": (
        HERE.parent
        / "unique4-source-field-audit"
        / "CorrectedOwnCapKalmansonCores.lean"
    ),
    "Problem97.UniqueFourKalmansonOccurrenceScratch.false_of_two_k2_three_row_triangle": (
        HERE.parent
        / "unique4-kalmanson-occurrence"
        / "SixRoleKalmansonTriangle.lean"
    ),
}


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(8 * 1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def canonical_json_sha256(value: Any) -> str:
    encoded = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(encoded).hexdigest()


def relative(path: Path) -> str:
    return str(path.resolve().relative_to(ROOT))


def parse_dimacs(path: Path, tail_count: int) -> dict[str, Any]:
    header: tuple[int, int] | None = None
    metadata: dict[str, Any] = {}
    variable_names: dict[str, int] = {}
    clauses: deque[tuple[int, ...]] = deque(maxlen=tail_count)
    actual_clause_count = 0
    max_variable = 0
    with path.open("r", encoding="ascii") as stream:
        for line_number, raw in enumerate(stream, 1):
            line = raw.strip()
            if not line:
                continue
            if line.startswith("c var "):
                parts = line.split(maxsplit=3)
                if len(parts) != 4:
                    raise AssertionError(f"malformed variable comment at {line_number}")
                variable_id = int(parts[2])
                name = parts[3]
                if variable_id <= 0 or name in variable_names:
                    raise AssertionError(f"duplicate/invalid variable at {line_number}")
                variable_names[name] = variable_id
                continue
            if line.startswith("c "):
                match = re.fullmatch(r"c ([A-Za-z0-9_]+) (.+)", line)
                if match:
                    key, encoded = match.groups()
                    try:
                        metadata[key] = json.loads(encoded)
                    except json.JSONDecodeError:
                        metadata[key] = encoded
                continue
            if line.startswith("p cnf "):
                if header is not None:
                    raise AssertionError("multiple DIMACS headers")
                parts = line.split()
                if len(parts) != 4:
                    raise AssertionError("malformed DIMACS header")
                header = (int(parts[2]), int(parts[3]))
                continue
            if header is None:
                raise AssertionError(f"clause before header at {line_number}")
            values = tuple(int(value) for value in line.split())
            if not values or values[-1] != 0 or 0 in values[:-1]:
                raise AssertionError(f"malformed clause at {line_number}")
            clause = values[:-1]
            if not clause:
                raise AssertionError("input CNF already contains the empty clause")
            max_variable = max(max_variable, *(abs(literal) for literal in clause))
            if max_variable > header[0]:
                raise AssertionError(f"literal exceeds header at {line_number}")
            clauses.append(clause)
            actual_clause_count += 1
    if header is None:
        raise AssertionError("missing DIMACS header")
    if actual_clause_count != header[1]:
        raise AssertionError(
            f"header says {header[1]} clauses, parsed {actual_clause_count}"
        )
    if len(clauses) != tail_count:
        raise AssertionError("CNF shorter than requested tail")
    return {
        "variable_count": header[0],
        "clause_count": header[1],
        "max_variable_used": max_variable,
        "metadata": metadata,
        "variable_names": variable_names,
        "tail_clauses": list(clauses),
    }


def normalized_record(record: dict[str, Any]) -> dict[str, Any]:
    record_id = record.get("id")
    role_count = record.get("core_vertex_count")
    if not isinstance(record_id, str) or not isinstance(role_count, int):
        raise AssertionError("malformed seed record")
    row_ids: set[str] = set()
    centers: set[int] = set()
    pairs: list[tuple[int, int]] = []
    for row in record.get("row_instances", []):
        row_id = row.get("row_instance_id")
        center = row.get("center_role")
        members = row.get("member_roles")
        if (
            not isinstance(row_id, str)
            or row_id in row_ids
            or not isinstance(center, int)
            or center in centers
            or not isinstance(members, list)
            or not members
        ):
            raise AssertionError(f"{record_id}: unsafe row-instance record")
        row_ids.add(row_id)
        centers.add(center)
        if not 0 <= center < role_count:
            raise AssertionError(f"{record_id}: center role out of range")
        if (
            any(not isinstance(member, int) for member in members)
            or members != sorted(members)
            or len(set(members)) != len(members)
            or center in members
            or any(not 0 <= member < role_count for member in members)
        ):
            raise AssertionError(f"{record_id}: invalid member roles")
        pairs.extend((center, member) for member in members)
    forward = tuple(sorted(pairs))
    legacy = tuple(
        sorted(tuple(int(value) for value in pair) for pair in record["legacy_center_point_schema"])
    )
    if forward != legacy:
        raise AssertionError(f"{record_id}: flattened audit mismatch")
    reflected = tuple(
        sorted(
            (role_count - 1 - center, role_count - 1 - member)
            for center, member in forward
        )
    )
    return {
        "id": record_id,
        "role_count": role_count,
        "forward": forward,
        "reflected": reflected,
        "record_sha256": canonical_json_sha256(record),
    }


def reconstruct_seed_cuts(
    checkpoint: dict[str, Any],
    bank: dict[str, Any],
    variable_names: dict[str, int],
) -> dict[str, Any]:
    n = int(checkpoint["n"])
    all_clauses: set[tuple[int, ...]] = set()
    summaries: list[dict[str, Any]] = []
    checkpoint_records = {
        record["id"]: record for record in checkpoint["seeded_cuts"]["records"]
    }
    total_oriented = 0
    for record in bank["records"]:
        normalized = normalized_record(record)
        role_count = normalized["role_count"]
        schemas = {normalized["forward"], normalized["reflected"]}
        record_clauses: set[tuple[int, ...]] = set()
        oriented = 0
        for targets in itertools.combinations(range(n), role_count):
            for schema in schemas:
                transformed = tuple(
                    sorted(
                        (targets[center], targets[member])
                        for center, member in schema
                    )
                )
                try:
                    clause = tuple(
                        sorted(
                            -variable_names[f"m_{center}_{member}"]
                            for center, member in transformed
                        )
                    )
                except KeyError as error:
                    raise AssertionError(f"missing DIMACS variable {error}") from error
                record_clauses.add(clause)
                oriented += 1
        prior_overlap = all_clauses.intersection(record_clauses)
        all_clauses.update(record_clauses)
        total_oriented += oriented
        stored = checkpoint_records.get(normalized["id"])
        if stored is None:
            raise AssertionError(f"checkpoint omits seed {normalized['id']}")
        cut_hash = canonical_json_sha256(
            [list(clause) for clause in sorted(record_clauses)]
        )
        expected_fields = {
            "record_sha256": normalized["record_sha256"],
            "covered_oriented_embedding_count": oriented,
            "unique_record_cut_count": len(record_clauses),
            "overlap_with_prior_record_cut_count": len(prior_overlap),
            "cut_set_sha256": cut_hash,
        }
        for key, expected in expected_fields.items():
            if stored.get(key) != expected:
                raise AssertionError(f"{normalized['id']}: checkpoint {key} drift")
        summaries.append(
            {
                "id": normalized["id"],
                "record_sha256": normalized["record_sha256"],
                "covered_oriented_embedding_count": oriented,
                "unique_record_cut_count": len(record_clauses),
                "overlap_with_prior_record_cut_count": len(prior_overlap),
                "cut_set_sha256": cut_hash,
            }
        )
    combined_hash = canonical_json_sha256(
        [list(clause) for clause in sorted(all_clauses)]
    )
    stored_seed = checkpoint["seeded_cuts"]
    if stored_seed.get("total_covered_oriented_embedding_count") != total_oriented:
        raise AssertionError("total oriented-embedding count drift")
    if stored_seed.get("total_unique_cut_count") != len(all_clauses):
        raise AssertionError("total unique-cut count drift")
    if stored_seed.get("combined_cut_set_sha256") != combined_hash:
        raise AssertionError("combined seed-cut hash drift")
    return {
        "record_count": len(summaries),
        "records": summaries,
        "total_covered_oriented_embedding_count": total_oriented,
        "total_unique_cut_count": len(all_clauses),
        "combined_cut_set_sha256": combined_hash,
        "clauses": all_clauses,
    }


def verify_occurrences(bank_path: Path, bank: dict[str, Any]) -> dict[str, Any]:
    source_cache: dict[Path, dict[int, set[int]]] = {}
    lean_checks: dict[str, dict[str, Any]] = {}
    occurrences: list[dict[str, Any]] = []
    for record in bank["records"]:
        record_id = record["id"]
        source = (ROOT / record["source_artifact"]).resolve()
        if sha256(source) != record["source_artifact_sha256"]:
            raise AssertionError(f"{record_id}: source artifact hash drift")
        if source not in source_cache:
            payload = json.loads(source.read_text())
            source_cache[source] = {
                int(center): {int(member) for member in support}
                for center, support in payload["decoded"]["rows"].items()
            }
        rows = source_cache[source]
        vertices = tuple(int(vertex) for vertex in record["source_vertices_by_role"])
        if vertices != tuple(sorted(vertices)) or len(vertices) != record["core_vertex_count"]:
            raise AssertionError(f"{record_id}: invalid source role order")
        checked: list[list[int]] = []
        for row in record["row_instances"]:
            center = vertices[int(row["center_role"])]
            for member_role in row["member_roles"]:
                member = vertices[int(member_role)]
                if member not in rows[center]:
                    raise AssertionError(f"{record_id}: source row omits membership")
                checked.append([center, member])
        consumer = record["lean_consumer"]
        lean_path = LEAN_SOURCES.get(consumer)
        if lean_path is None:
            raise AssertionError(f"{record_id}: unknown Lean consumer")
        lean_text = lean_path.read_text()
        theorem_name = consumer.rsplit(".", 1)[1]
        if f"theorem {theorem_name}" not in lean_text:
            raise AssertionError(f"{record_id}: Lean theorem declaration missing")
        if "sorry" in lean_text or "admit" in lean_text:
            raise AssertionError(f"{record_id}: Lean consumer file has a proof hole")
        lean_checks[relative(lean_path)] = {
            "sha256": sha256(lean_path),
            "textual_hole_scan": "PASS",
        }
        if "transport_replay" in record:
            replay = (ROOT / record["transport_replay"]["path"]).resolve()
            if sha256(replay) != record["transport_replay"]["sha256"]:
                raise AssertionError(f"{record_id}: transport replay hash drift")
            replay_payload = json.loads(replay.read_text())
            if replay_payload.get("lean_consumer") != consumer:
                raise AssertionError(f"{record_id}: transport consumer mismatch")
            if replay_payload.get("exact_endpoint_replay", {}).get("residual_coefficients") != {}:
                raise AssertionError(f"{record_id}: transport exact replay failed")
        occurrences.append(
            {
                "record_id": record_id,
                "record_sha256": canonical_json_sha256(record),
                "source_artifact": relative(source),
                "source_artifact_sha256": sha256(source),
                "source_vertices_by_role": list(vertices),
                "checked_memberships": sorted(checked),
                "lean_consumer": consumer,
                "status": "VERIFIED_PRESERVED_ORDERED_OCCURRENCE",
            }
        )
    return {
        "schema_bank": relative(bank_path),
        "schema_bank_sha256": sha256(bank_path),
        "record_count": len(occurrences),
        "records": occurrences,
        "lean_consumer_sources": lean_checks,
        "status": "VERIFIED_ALL_DISTINCT_ROW_INSTANCE_OCCURRENCES",
    }


def run_drat_trim(cnf: Path, proof: Path, timeout_seconds: int) -> dict[str, Any]:
    started = time.monotonic()
    result = subprocess.run(
        ["drat-trim", str(cnf), str(proof)],
        capture_output=True,
        text=True,
        timeout=timeout_seconds,
        check=False,
    )
    output = result.stdout + result.stderr
    if result.returncode != 0 or output.splitlines().count("s VERIFIED") != 1:
        raise AssertionError(
            f"drat-trim failed (exit {result.returncode}):\n{output[-4000:]}"
        )
    return {
        "checker": "drat-trim",
        "command": ["drat-trim", "<exact-cnf>", "<exact-proof>"],
        "returncode": result.returncode,
        "verdict": "s VERIFIED",
        "elapsed_seconds": time.monotonic() - started,
        "output_sha256": hashlib.sha256(output.encode()).hexdigest(),
        "output_tail": output.splitlines()[-20:],
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cnf", required=True, type=Path)
    parser.add_argument("--solver-log", required=True, type=Path)
    parser.add_argument("--proof", type=Path)
    parser.add_argument("--checkpoint", type=Path, default=DEFAULT_CHECKPOINT)
    parser.add_argument("--schema-bank", type=Path, default=DEFAULT_SCHEMA_BANK)
    parser.add_argument("--run-drat-trim", action="store_true")
    parser.add_argument("--drat-trim-timeout", type=int, default=3600)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    checkpoint = json.loads(args.checkpoint.read_text())
    if checkpoint.get("terminal_status") != "BOOLEAN_UNSAT_PENDING_PROOF_REPLAY":
        raise AssertionError("checkpoint is not a bare-UNSAT terminal")
    if checkpoint.get("n") != 11 or checkpoint.get("opp1_card") != 5:
        raise AssertionError("checkpoint is not fixed n=11 p5")
    if checkpoint.get("refinements") != []:
        raise AssertionError("p5-v3 terminal must have zero refinements")
    if sha256(args.cnf) != checkpoint.get("terminal_cnf_sha256"):
        raise AssertionError("terminal CNF hash mismatch")
    if sha256(args.solver_log) != checkpoint.get("terminal_solver_log_sha256"):
        raise AssertionError("stored solver-log hash mismatch")
    solver_log = args.solver_log.read_text(errors="replace")
    if solver_log.count("s UNSATISFIABLE") != 1 or "c exit 20" not in solver_log:
        raise AssertionError("stored solver log does not report exit-20 UNSAT")

    source_hashes: dict[str, str] = {}
    for relative_path, expected in checkpoint["source_hashes"].items():
        path = ROOT / relative_path
        actual = sha256(path)
        if actual != expected:
            raise AssertionError(f"checkpoint source drift: {relative_path}")
        source_hashes[relative_path] = actual

    bank_path = args.schema_bank.resolve()
    bank = json.loads(bank_path.read_text())
    if sha256(bank_path) != checkpoint["seed_bank"]["sha256"]:
        raise AssertionError("checkpoint seed-bank hash mismatch")
    tail_count = int(checkpoint["seeded_cuts"]["total_unique_cut_count"])
    dimacs = parse_dimacs(args.cnf, tail_count)
    if dimacs["variable_count"] != checkpoint["final_variable_count"]:
        raise AssertionError("DIMACS variable-count drift")
    if dimacs["clause_count"] != checkpoint["final_clause_count"]:
        raise AssertionError("DIMACS clause-count drift")
    if dimacs["metadata"].get("seeded_full_linear_cut_count") != tail_count:
        raise AssertionError("DIMACS seed-cut metadata drift")
    if dimacs["metadata"].get("full_linear_refinement_count") != 0:
        raise AssertionError("DIMACS unexpectedly records a refinement")

    cuts = reconstruct_seed_cuts(checkpoint, bank, dimacs["variable_names"])
    if Counter(dimacs["tail_clauses"]) != Counter(cuts["clauses"]):
        raise AssertionError("DIMACS tail is not exactly the seeded cut set")
    cuts.pop("clauses")
    occurrences = verify_occurrences(bank_path, bank)

    proof_result: dict[str, Any] | None = None
    if args.proof is not None:
        if not args.proof.is_file() or args.proof.stat().st_size == 0:
            raise AssertionError("missing or empty CaDiCaL proof")
        proof_result = {
            "path_role": "external replay artifact; intentionally not tracked",
            "byte_count": args.proof.stat().st_size,
            "sha256": sha256(args.proof),
            "format": "CaDiCaL binary DRAT",
        }
        if args.run_drat_trim:
            proof_result["verification"] = run_drat_trim(
                args.cnf, args.proof, args.drat_trim_timeout
            )

    payload = {
        "schema": "p97-unique4-p5-v3-full-linear-drat-certificate-v1",
        "epistemic_status": (
            "EXACT_DRAT_VERIFIED_BOOLEAN_UNSAT_FOR_HASHED_FIXED_N11_CNF"
            if proof_result and "verification" in proof_result
            else "EXACT_HASH_AND_SEED_REPLAY; DRAT_NOT_RECHECKED_IN_THIS_RUN"
        ),
        "scope": (
            "The hashed fixed n=11 opp1_card=5 Boolean projection only; not an "
            "arbitrary-cardinality theorem and not a Lean sorry closure."
        ),
        "checkpoint": {
            "path": relative(args.checkpoint),
            "sha256": sha256(args.checkpoint),
            "stored_terminal_status": checkpoint["terminal_status"],
        },
        "cnf": {
            "sha256": sha256(args.cnf),
            "byte_count": args.cnf.stat().st_size,
            "variable_count": dimacs["variable_count"],
            "clause_count": dimacs["clause_count"],
            "max_variable_used": dimacs["max_variable_used"],
            "syntax_status": "VERIFIED_STREAMING_DIMACS",
        },
        "stored_bare_solver_log": {
            "sha256": sha256(args.solver_log),
            "status": "VERIFIED_EXIT20_UNSAT_TEXT",
        },
        "encoder_source_hashes": source_hashes,
        "seeded_cut_replay": cuts,
        "kernel_consumer_occurrences": occurrences,
        "proof": proof_result,
        "trust_boundary": [
            "drat-trim verifies UNSAT of the exact hashed CNF, not the mathematics",
            "the encoding-to-fixed-projection map remains an audited Python contract",
            "the seed cuts use separately kernel-checked generic consumers and exact transport replay",
            "no arbitrary-cardinality occurrence/coverage theorem is supplied",
        ],
    }
    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.check:
        if not args.output.exists() or args.output.read_text() != rendered:
            raise SystemExit(f"stale or missing replay artifact: {args.output}")
    else:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(rendered)
    print(
        json.dumps(
            {
                "status": payload["epistemic_status"],
                "cnf_sha256": payload["cnf"]["sha256"],
                "seeded_cut_count": cuts["total_unique_cut_count"],
                "consumer_occurrences": occurrences["status"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
