#!/usr/bin/env python3
"""Replay the exact p4 terminal CNF and its transported Lean consumer.

This checker is deliberately independent of the CEGAR driver's Python
objects.  It streams the emitted DIMACS, checks its checkpoint and source
hashes, reconstructs the final 22 transported clauses, and verifies that the
transported ten-role schema restricts to the kernel-checked eight-role p4
consumer.  Optionally it invokes ``drat-trim`` on a CaDiCaL proof.

The result is about the hashed fixed ``n = 11`` Boolean projection only.  It
is not an arbitrary-cardinality occurrence theorem and does not close a Lean
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
DEFAULT_CHECKPOINT = (
    HERE.parent / "unique4-star-producer" / "full_linear_cegar_p4.json"
)
DEFAULT_SOURCE_ASSIGNMENT = (
    HERE.parent / "unique4-star-producer" / "direct_owncap_endpoint_p4.json"
)
DEFAULT_SCHEMA_BANK = (
    HERE.parent / "unique4-source-field-audit" / "kalmanson_row_instance_schemas.json"
)
DEFAULT_LEAN_CONSUMERS = (
    HERE.parent / "unique4-source-field-audit" / "CorrectedOwnCapKalmansonCores.lean"
)
P4_RECORD_ID = "corrected-owncap-p4-four-k2"
P4_CONSUMER = (
    "Problem97.CorrectedOwnCapKalmansonCoresScratch."
    "false_of_four_endpoint_k2_three_row_instances"
)


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(8 * 1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def canonical_json_sha256(value: Any) -> str:
    encoded = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(encoded).hexdigest()


def parse_dimacs(path: Path, tail_count: int) -> dict[str, Any]:
    """Stream-check DIMACS syntax and retain only metadata and tail clauses."""

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
                if name in variable_names or variable_id <= 0:
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
            max_variable = max(max_variable, *(abs(lit) for lit in clause))
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


def reconstruct_terminal_cuts(
    checkpoint: dict[str, Any], variable_names: dict[str, int]
) -> dict[str, Any]:
    refinements = checkpoint.get("refinements")
    if not isinstance(refinements, list) or len(refinements) != 1:
        raise AssertionError("p4 terminal must have exactly one refinement")
    refinement = refinements[0]
    core_vertices = tuple(int(v) for v in refinement["core_vertices"])
    required = tuple(
        (int(center), int(member))
        for center, member in refinement["required_memberships"]
    )
    role = {vertex: index for index, vertex in enumerate(core_vertices)}
    if len(role) != len(core_vertices) or core_vertices != tuple(sorted(core_vertices)):
        raise AssertionError("core vertices are not strictly boundary ordered")
    forward = tuple(sorted((role[center], role[member]) for center, member in required))
    reflected = tuple(
        sorted(
            (len(core_vertices) - 1 - center, len(core_vertices) - 1 - member)
            for center, member in forward
        )
    )
    canonical = min(forward, reflected)
    stored_canonical = tuple(tuple(pair) for pair in refinement["canonical_order_schema"])
    if canonical != stored_canonical:
        raise AssertionError("checkpoint canonical schema does not replay")

    expected: list[tuple[int, ...]] = []
    oriented_embedding_count = 0
    for targets in itertools.combinations(range(int(checkpoint["n"])), len(core_vertices)):
        for schema in {forward, reflected}:
            transformed = tuple(
                sorted((targets[center], targets[member]) for center, member in schema)
            )
            try:
                clause = tuple(-variable_names[f"m_{center}_{member}"] for center, member in transformed)
            except KeyError as error:
                raise AssertionError(f"missing DIMACS membership variable {error}") from error
            expected.append(clause)
            oriented_embedding_count += 1
    if oriented_embedding_count != int(refinement["order_embedding_cut_count"]):
        raise AssertionError("checkpoint transported-cut count does not replay")
    return {
        "core_vertices": list(core_vertices),
        "required_memberships": [list(pair) for pair in sorted(required)],
        "forward_order_schema": [list(pair) for pair in forward],
        "reflected_order_schema": [list(pair) for pair in reflected],
        "canonical_order_schema": [list(pair) for pair in canonical],
        "oriented_embedding_count": oriented_embedding_count,
        "unique_clause_count": len(set(expected)),
        "duplicate_clause_count": oriented_embedding_count - len(set(expected)),
        "clauses": expected,
        "cut_set_sha256": canonical_json_sha256(
            [list(clause) for clause in sorted(expected)]
        ),
    }


def verify_p4_consumer_occurrence(
    checkpoint: dict[str, Any], schema_bank_path: Path, source_path: Path
) -> dict[str, Any]:
    bank = json.loads(schema_bank_path.read_text())
    records = [record for record in bank.get("records", []) if record.get("id") == P4_RECORD_ID]
    if len(records) != 1:
        raise AssertionError("expected one p4 row-instance schema")
    record = records[0]
    if record.get("lean_consumer") != P4_CONSUMER:
        raise AssertionError("p4 schema names a different Lean consumer")
    if record.get("profile") != 4:
        raise AssertionError("p4 schema has the wrong profile")
    if record.get("source_artifact") != str(source_path.relative_to(ROOT)):
        raise AssertionError("p4 schema points at a different source assignment")
    if record.get("source_artifact_sha256") != sha256(source_path):
        raise AssertionError("p4 schema source-assignment hash mismatch")

    source = json.loads(source_path.read_text())
    rows = {
        int(center): {int(member) for member in support}
        for center, support in source["decoded"]["rows"].items()
    }
    source_vertices = tuple(int(v) for v in record["source_vertices_by_role"])
    if source_vertices != tuple(sorted(source_vertices)):
        raise AssertionError("p4 consumer vertices are not boundary ordered")
    flattened: set[tuple[int, int]] = set()
    checked_memberships: list[list[int]] = []
    centers: set[int] = set()
    for row in record["row_instances"]:
        center_role = int(row["center_role"])
        if center_role in centers:
            raise AssertionError("repeated center would lose row-instance identity")
        centers.add(center_role)
        center = source_vertices[center_role]
        for member_role_raw in row["member_roles"]:
            member_role = int(member_role_raw)
            member = source_vertices[member_role]
            if member not in rows[center]:
                raise AssertionError(f"source row {center} omits member {member}")
            flattened.add((center, member))
            checked_memberships.append([center, member])

    refinement = checkpoint["refinements"][0]
    required = {
        (int(center), int(member))
        for center, member in refinement["required_memberships"]
    }
    if flattened != required:
        raise AssertionError(
            "transported CEGAR memberships are not exactly the p4 consumer occurrence"
        )
    core_vertices = tuple(int(v) for v in refinement["core_vertices"])
    if not set(source_vertices).issubset(core_vertices):
        raise AssertionError("p4 consumer roles do not restrict the transported core")
    restriction_roles = [core_vertices.index(vertex) for vertex in source_vertices]
    if restriction_roles != sorted(restriction_roles):
        raise AssertionError("p4 restriction is not order preserving")

    return {
        "schema_bank": str(schema_bank_path.relative_to(ROOT)),
        "schema_bank_sha256": sha256(schema_bank_path),
        "record_id": P4_RECORD_ID,
        "record_sha256": canonical_json_sha256(record),
        "lean_consumer": P4_CONSUMER,
        "source_assignment": str(source_path.relative_to(ROOT)),
        "source_assignment_sha256": sha256(source_path),
        "source_vertices_by_role": list(source_vertices),
        "transported_core_restriction_roles": restriction_roles,
        "checked_memberships": sorted(checked_memberships),
        "status": "VERIFIED_EXACT_ORDER_PRESERVING_CONSUMER_OCCURRENCE",
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
    verified_lines = [line for line in output.splitlines() if line == "s VERIFIED"]
    if result.returncode != 0 or len(verified_lines) != 1:
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
    parser.add_argument("--source-assignment", type=Path, default=DEFAULT_SOURCE_ASSIGNMENT)
    parser.add_argument("--lean-consumers", type=Path, default=DEFAULT_LEAN_CONSUMERS)
    parser.add_argument("--run-drat-trim", action="store_true")
    parser.add_argument("--drat-trim-timeout", type=int, default=3600)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    checkpoint = json.loads(args.checkpoint.read_text())
    if checkpoint.get("terminal_status") != "BOOLEAN_UNSAT_PENDING_PROOF_REPLAY":
        raise AssertionError("checkpoint is not the expected bare-UNSAT terminal")
    if checkpoint.get("n") != 11 or checkpoint.get("opp1_card") != 4:
        raise AssertionError("checkpoint is not the fixed n=11 p4 profile")
    if sha256(args.cnf) != checkpoint.get("terminal_cnf_sha256"):
        raise AssertionError("terminal CNF hash mismatch")
    if sha256(args.solver_log) != checkpoint.get("terminal_solver_log_sha256"):
        raise AssertionError("stored bare solver-log hash mismatch")
    solver_log = args.solver_log.read_text(errors="replace")
    if solver_log.count("s UNSATISFIABLE") != 1 or "c exit 20" not in solver_log:
        raise AssertionError("stored bare solver log does not report exit-20 UNSAT")

    source_hashes: dict[str, str] = {}
    for relative, expected_hash in checkpoint["source_hashes"].items():
        path = ROOT / relative
        actual_hash = sha256(path)
        if actual_hash != expected_hash:
            raise AssertionError(f"checkpoint source drift: {relative}")
        source_hashes[relative] = actual_hash

    dimacs = parse_dimacs(
        args.cnf, int(checkpoint["refinements"][0]["order_embedding_cut_count"])
    )
    if dimacs["variable_count"] != int(checkpoint["final_variable_count"]):
        raise AssertionError("DIMACS/checkpoint variable count mismatch")
    if dimacs["clause_count"] != int(checkpoint["final_clause_count"]):
        raise AssertionError("DIMACS/checkpoint clause count mismatch")
    if dimacs["metadata"].get("full_linear_refinement_count") != 1:
        raise AssertionError("DIMACS metadata does not record one refinement")

    cuts = reconstruct_terminal_cuts(checkpoint, dimacs["variable_names"])
    if Counter(dimacs["tail_clauses"]) != Counter(cuts["clauses"]):
        raise AssertionError("final DIMACS clauses are not the transported schema cuts")
    cuts.pop("clauses")

    occurrence = verify_p4_consumer_occurrence(
        checkpoint, args.schema_bank.resolve(), args.source_assignment.resolve()
    )
    lean_text = args.lean_consumers.read_text()
    short_theorem = P4_CONSUMER.rsplit(".", 1)[1]
    if f"theorem {short_theorem}" not in lean_text:
        raise AssertionError("kernel consumer declaration missing from Lean source")
    if "sorry" in lean_text or "admit" in lean_text:
        raise AssertionError("Lean consumer source contains a textual proof hole")

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
        "schema": "p97-unique4-p4-full-linear-drat-certificate-v1",
        "epistemic_status": (
            "EXACT_DRAT_VERIFIED_BOOLEAN_UNSAT_FOR_HASHED_FIXED_N11_CNF"
            if proof_result and "verification" in proof_result
            else "EXACT_HASH_AND_TRANSPORT_REPLAY; DRAT_NOT_RECHECKED_IN_THIS_RUN"
        ),
        "scope": (
            "The hashed fixed n=11 opp1_card=4 Boolean projection only; "
            "not an arbitrary-cardinality theorem and not a Lean sorry closure."
        ),
        "checkpoint": {
            "path": str(args.checkpoint.resolve().relative_to(ROOT)),
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
        "transported_cut_replay": cuts,
        "kernel_consumer_occurrence": occurrence,
        "lean_consumer_source": {
            "path": str(args.lean_consumers.resolve().relative_to(ROOT)),
            "sha256": sha256(args.lean_consumers),
            "textual_hole_scan": "PASS",
            "kernel_check": (
                "Run the recorded Werror Lean command in REPORT.md; this Python "
                "checker does not substitute for the Lean kernel."
            ),
        },
        "proof": proof_result,
        "trust_boundary": [
            "drat-trim verifies UNSAT of the exact hashed CNF, not the mathematics",
            "the encoding-to-fixed-projection map remains an audited Python contract",
            "the new schema cut is justified by a separately kernel-checked generic consumer",
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
                "transported_cut_count": cuts["oriented_embedding_count"],
                "consumer_occurrence": occurrence["status"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
