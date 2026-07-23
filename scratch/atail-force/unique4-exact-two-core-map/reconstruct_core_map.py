#!/usr/bin/env python3
"""Reconstruct exact p4/p5 terminal-clause provenance and map DRAT input cores.

The tool imports the hash-pinned encoder drivers which produced the two fixed
``n = 11`` exact-two terminal CNFs.  It does not run a SAT solver, DRAT
checker, or native executable.

No map is written until all of the following have been checked:

* an authenticated extraction manifest binds the exact terminal, proof,
  checker, ``drat-trim`` command/verdict, and input-core hash/count;
* every source hash recorded by the terminal checkpoint is current;
* the rebuilt variable names and clauses equal the terminal DIMACS in exact
  order (including duplicate clause occurrences and literal order);
* the terminal DIMACS SHA-256 equals the checkpoint hash; and
* the rebuilt variable/clause counts equal both the DIMACS header and the
  checkpoint.

Input-core clauses are matched by their canonical sorted signed-literal
multiset because ``drat-trim -c`` may reorder literals. Duplicate literals are
rejected, so canonicalization cannot erase multiplicity information. Duplicate
input occurrences are never silently collapsed: core multiplicity is allocated
injectively over increasing one-based terminal indices while every candidate
retains its original input order and is marked ambiguous. Over-multiplicity and
canonically unmatched clauses reject publication.
"""

from __future__ import annotations

import argparse
from collections import Counter, defaultdict
import hashlib
import importlib.util
import inspect
import itertools
import json
import os
from pathlib import Path
import re
import sys
import tempfile
import time
from typing import Any, Iterable


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
STAR = HERE.parent / "unique4-star-producer"

PROFILES: dict[int, dict[str, Path]] = {
    4: {
        "checkpoint": STAR / "full_linear_cegar_p4.json",
        "terminal": Path("/tmp/p97_u4_full_linear_cegar_p4.cnf"),
        "core": Path("/tmp/p4.input-core.cnf"),
        "output": HERE / "p4.input-core-map.json",
    },
    5: {
        "checkpoint": STAR / "seeded_v3_full_linear_cegar_p5.json",
        "terminal": Path("/tmp/p97_u4_seeded_v3_full_linear_p5.cnf"),
        "core": Path("/tmp/p5.input-core.cnf"),
        "output": HERE / "p5.input-core-map.json",
    },
}

P4_DRIVER = STAR / "run_full_linear_cegar.py"
P5_DRIVER = STAR / "run_seeded_full_linear_cegar.py"

EXTRACTION_MANIFEST_SCHEMA = (
    "p97-exacttwo-drat-core-extraction-v1"
)
MATCHING_POLICY = {
    "clause_identity": "sorted_signed_literal_multiset",
    "duplicate_literal_policy": "reject",
    "duplicate_occurrence_policy": (
        "allocate_canonical_input_occurrences_in_index_order"
    ),
    "schema_orientation_ambiguity_policy": "report_all_candidates",
    "unmatched_clause_policy": "reject",
    "unclassified_orientation_policy": "reject",
}
CHECKPOINT_POLICY = {
    4: {
        "schema": "p97-unique4-owncap-curvature-full-linear-cegar-v1",
        "refinement_count": 1,
    },
    5: {
        "schema": "p97-unique4-seeded-owncap-curvature-full-linear-cegar-v1",
        "refinement_count": 0,
    },
}


class TrustError(RuntimeError):
    """An input failed a publication-gate trust condition."""


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(8 * 1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def canonical_clause(
    clause: Iterable[int], context: str = "clause"
) -> tuple[int, ...]:
    values = tuple(clause)
    if len(set(values)) != len(values):
        raise TrustError(
            f"{context}: duplicate literal makes multiset matching unsafe"
        )
    return tuple(sorted(values))


def load_module(name: str, path: Path) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def jsonable_int_pairs(value: Any) -> list[list[int]] | None:
    if not isinstance(value, (tuple, list)):
        return None
    answer: list[list[int]] = []
    for pair in value:
        if (
            not isinstance(pair, (tuple, list))
            or len(pair) != 2
            or any(isinstance(item, bool) or not isinstance(item, int) for item in pair)
        ):
            return None
        answer.append([int(pair[0]), int(pair[1])])
    return answer


def orientation_label(
    oriented: Iterable[tuple[int, int]],
    forward: Iterable[tuple[int, int]],
    reflected: Iterable[tuple[int, int]],
) -> str:
    oriented_tuple = tuple(oriented)
    forward_tuple = tuple(forward)
    reflected_tuple = tuple(reflected)
    if forward_tuple == reflected_tuple == oriented_tuple:
        return "symmetric"
    if oriented_tuple == forward_tuple:
        return "forward"
    if oriented_tuple == reflected_tuple:
        return "reflected"
    raise TrustError(
        "oriented schema is neither forward, reflected, nor symmetric"
    )


def capture_semantics(
    block: str,
    frame: Any,
    context: dict[str, Any] | None,
) -> dict[str, Any]:
    """Capture lossless semantic loop parameters when the producer exposes them."""

    local = frame.f_locals
    result: dict[str, Any] = {
        "producer_function": frame.f_code.co_name,
    }
    if context:
        result.update(context)

    if frame.f_code.co_name == "add_exactly_k":
        result.update(
            {
                "cardinality_prefix": str(local.get("prefix")),
                "cardinality": int(local["k"]),
            }
        )

    if block.startswith("selected_row_own_cap_at_most_two_"):
        result.update(
            {
                "cap_index": int(local["cap_index"]),
                "cap_name": str(local["cap_name"]),
                "center": int(local["center"]),
                "selected_points": list(map(int, local["triple"])),
            }
        )
    elif block.startswith("selected_row_endpoint_own_cap_at_most_one_"):
        result.update(
            {
                "cap_index": int(local["cap_index"]),
                "cap_name": str(local["cap_name"]),
                "center": int(local["center"]),
                "selected_points": list(map(int, local["pair"])),
            }
        )
    elif block in {
        "direct_row_pattern_implies_membership",
        "direct_memberships_imply_row_pattern",
        "direct_row_pattern_implies_outer_arc",
    }:
        if "center" in local and "support" in local:
            result["center"] = int(local["center"])
            result["row_support"] = list(map(int, local["support"]))
        if "arc" in local:
            center, side, mask = local["arc"]
            result["outer_arc"] = {
                "center": int(center),
                "side": str(side),
                "turn_mask": int(mask),
            }
    elif block == "direct_outer_arc_implies_some_row_pattern":
        center, side, mask = local["arc"]
        result["outer_arc"] = {
            "center": int(center),
            "side": str(side),
            "turn_mask": int(mask),
        }
    elif block == "direct_no_four_turn_disjoint_outer_arcs":
        result["outer_arcs"] = [
            {"center": int(center), "side": str(side), "turn_mask": int(mask)}
            for center, side, mask in local["packing"]
        ]
    elif block == "verified_planar_schema_cut":
        result.update(
            {
                "schema_bank": "planar",
                "transport": "all_injective_role_maps",
                "role_count": int(local["k"]),
                "role_schema": jsonable_int_pairs(local["memberships"]),
                "target_vertices": list(map(int, local["targets"])),
            }
        )
    elif block == "verified_kalmanson_order_schema_cut":
        forward = tuple(local["schema"])
        reflected = tuple(local["reflected"])
        oriented = tuple(local["oriented"])
        result.update(
            {
                "schema_bank": "kalmanson",
                "transport": "order_preserving_and_reflected_injections",
                "role_count": int(local["k"]),
                "role_schema": jsonable_int_pairs(forward),
                "target_vertices": list(map(int, local["targets"])),
                "orientation": orientation_label(oriented, forward, reflected),
                "oriented_role_schema": jsonable_int_pairs(oriented),
            }
        )
    elif block == "verified_u5_signed_schema_cut":
        result.update(
            {
                "schema_bank": "u5",
                "transport": "all_injective_role_maps",
                "role_count": int(local["k"]),
                "positive_role_schema": jsonable_int_pairs(local["positive"]),
                "negative_role_schema": jsonable_int_pairs(local["negative"]),
                "target_vertices": list(map(int, local["targets"])),
            }
        )
    elif block == "full_linear_kalmanson_cegar_cut":
        forward = tuple(local["order_schema"])
        reflected = tuple(local["reflected"])
        oriented = tuple(local["schema"])
        result.update(
            {
                "schema_bank": "p4_terminal_refinement",
                "transport": "order_preserving_and_reflected_injections",
                "role_count": len(local["core_vertices"]),
                "role_schema": jsonable_int_pairs(forward),
                "target_vertices": list(map(int, local["targets"])),
                "orientation": orientation_label(oriented, forward, reflected),
                "oriented_role_schema": jsonable_int_pairs(oriented),
                "row_memberships": jsonable_int_pairs(local["transformed"]),
            }
        )
    return result


class TrackingFactory:
    """Create a drop-in CNF subclass retaining the family of every occurrence."""

    def __init__(self, original: type[Any], interesting: set[tuple[int, ...]]) -> None:
        self.original = original
        self.interesting_literal_sets = {
            frozenset(clause) for clause in interesting
        }

    def make(self) -> type[Any]:
        original = self.original
        interesting_literal_sets = self.interesting_literal_sets

        class TrackingCNF(original):  # type: ignore[misc, valid-type]
            def __init__(self) -> None:
                super().__init__()
                self.clause_families: list[str] = []
                self.interesting_semantics: dict[int, dict[str, Any]] = {}
                self.provenance_context: dict[str, Any] | None = None

            def add(
                self, block: str, literals: list[int] | tuple[int, ...]
            ) -> None:
                before = len(self.clauses)
                caller = inspect.currentframe()
                assert caller is not None and caller.f_back is not None
                producer_frame = caller.f_back
                super().add(block, literals)
                if len(self.clauses) == before:
                    return
                if len(self.clauses) != before + 1:
                    raise AssertionError("CNF.add appended an unexpected clause count")
                self.clause_families.append(block)
                clause = self.clauses[-1]
                if frozenset(clause) in interesting_literal_sets:
                    self.interesting_semantics[len(self.clauses)] = capture_semantics(
                        block, producer_frame, self.provenance_context
                    )

        TrackingCNF.__name__ = "ProvenanceTrackingCNF"
        return TrackingCNF


def verify_checkpoint_sources(checkpoint: dict[str, Any]) -> dict[str, str]:
    recorded = checkpoint.get("source_hashes")
    if not isinstance(recorded, dict) or not recorded:
        raise AssertionError("checkpoint has no source_hashes")
    verified: dict[str, str] = {}
    for relative_text, expected in recorded.items():
        path = (ROOT / relative_text).resolve()
        try:
            path.relative_to(ROOT)
        except ValueError as error:
            raise AssertionError(f"checkpoint source leaves repository: {path}") from error
        if not path.is_file():
            raise AssertionError(f"checkpoint source is absent: {path}")
        actual = sha256(path)
        if actual != expected:
            raise AssertionError(
                f"checkpoint source hash drift: {relative_text}: {actual} != {expected}"
            )
        verified[str(relative_text)] = actual
    return dict(sorted(verified.items()))


def validate_checkpoint(profile: int, checkpoint: dict[str, Any]) -> None:
    policy = CHECKPOINT_POLICY[profile]
    expected = {
        "schema": policy["schema"],
        "n": 11,
        "opp1_card": profile,
        "terminal_status": "BOOLEAN_UNSAT_PENDING_PROOF_REPLAY",
        "refinement_count": policy["refinement_count"],
    }
    for key, value in expected.items():
        if checkpoint.get(key) != value:
            raise TrustError(
                f"checkpoint {key} mismatch: {checkpoint.get(key)!r} != {value!r}"
            )
    refinements = checkpoint.get("refinements")
    if not isinstance(refinements, list) or len(refinements) != policy[
        "refinement_count"
    ]:
        raise TrustError("checkpoint refinement list violates profile policy")
    for key in ("final_variable_count", "final_clause_count"):
        value = checkpoint.get(key)
        if isinstance(value, bool) or not isinstance(value, int) or value <= 0:
            raise TrustError(f"checkpoint {key} must be a positive integer")
    terminal_hash = checkpoint.get("terminal_cnf_sha256")
    if (
        not isinstance(terminal_hash, str)
        or re.fullmatch(r"[0-9a-f]{64}", terminal_hash) is None
    ):
        raise TrustError("checkpoint terminal_cnf_sha256 is malformed")
    if profile == 5:
        seed = checkpoint.get("seed_bank")
        if (
            not isinstance(seed, dict)
            or seed.get("schema")
            != "p97-kalmanson-row-instance-schema-bank-v1"
            or seed.get("record_count") != 4
        ):
            raise TrustError("p5 checkpoint seed-bank contract drifted")


def manifest_bound_path(value: str) -> Path:
    path = Path(value)
    return path.resolve() if path.is_absolute() else (ROOT / path).resolve()


def resolved_token_paths(command: list[str]) -> set[Path]:
    paths: set[Path] = set()
    for token in command[1:]:
        try:
            candidate = Path(token)
        except TypeError:
            continue
        if candidate.is_absolute() or "/" in token:
            paths.add(manifest_bound_path(token))
    return paths


def authenticate_extraction(
    manifest_path: Path,
    profile: int,
    terminal_path: Path,
    proof_path_override: Path | None,
    core_path: Path,
    checkpoint: dict[str, Any],
    core: dict[str, Any],
) -> dict[str, Any]:
    if not manifest_path.is_file():
        raise TrustError(f"required extraction manifest is absent: {manifest_path}")
    manifest_bytes = manifest_path.read_bytes()
    try:
        payload = json.loads(manifest_bytes)
    except json.JSONDecodeError as error:
        raise TrustError("extraction manifest is not valid JSON") from error
    if not isinstance(payload, dict):
        raise TrustError("extraction manifest must be a JSON object")
    if payload.get("schema") != EXTRACTION_MANIFEST_SCHEMA:
        raise TrustError("unsupported extraction manifest schema")
    if payload.get("profile") != profile or payload.get("n") != 11:
        raise TrustError("extraction manifest profile mismatch")

    terminal_record = payload.get("terminal_cnf")
    proof_record = payload.get("proof")
    core_record = payload.get("input_core")
    checker_record = payload.get("checker")
    if not all(
        isinstance(record, dict)
        for record in (
            terminal_record,
            proof_record,
            core_record,
            checker_record,
        )
    ):
        raise TrustError("extraction manifest lacks a binding record")

    manifest_terminal = manifest_bound_path(terminal_record.get("path", ""))
    if manifest_terminal != terminal_path.resolve():
        raise TrustError("extraction manifest terminal path mismatch")
    actual_terminal_hash = sha256(terminal_path)
    if (
        terminal_record.get("sha256") != actual_terminal_hash
        or actual_terminal_hash != checkpoint["terminal_cnf_sha256"]
        or terminal_record.get("variable_count")
        != checkpoint["final_variable_count"]
        or terminal_record.get("clause_count")
        != checkpoint["final_clause_count"]
        or terminal_record.get("byte_count") != terminal_path.stat().st_size
    ):
        raise TrustError("extraction manifest terminal binding mismatch")

    proof_path = manifest_bound_path(proof_record.get("path", ""))
    if proof_path_override is not None and proof_path != proof_path_override.resolve():
        raise TrustError("--proof path differs from extraction manifest")
    if not proof_path.is_file():
        raise TrustError(f"bound DRAT proof is absent: {proof_path}")
    actual_proof_hash = sha256(proof_path)
    if (
        proof_record.get("sha256") != actual_proof_hash
        or proof_record.get("byte_count") != proof_path.stat().st_size
    ):
        raise TrustError("extraction manifest proof hash mismatch")

    manifest_core = manifest_bound_path(core_record.get("path", ""))
    if manifest_core != core_path.resolve():
        raise TrustError("extraction manifest core path mismatch")
    expected_core = {
        "sha256": core["sha256"],
        "variable_count": core["variable_count"],
        "clause_count": core["clause_count"],
    }
    for key, value in expected_core.items():
        if core_record.get(key) != value:
            raise TrustError(f"extraction manifest core {key} mismatch")
    if core_record.get("byte_count") != core_path.stat().st_size:
        raise TrustError("extraction manifest core byte_count mismatch")

    command = payload.get("command")
    if (
        not isinstance(command, list)
        or not command
        or any(not isinstance(token, str) or not token for token in command)
    ):
        raise TrustError("drat-trim command must be a nonempty string array")
    if "drat-trim" not in Path(command[0]).name:
        raise TrustError("extraction command is not drat-trim")
    if payload.get("returncode") != 0 or payload.get("verdict") != "s VERIFIED":
        raise TrustError("drat-trim extraction is not recorded as VERIFIED/exit 0")
    if "-c" not in command:
        raise TrustError("drat-trim command lacks -c input-core extraction")
    core_position = command.index("-c") + 1
    if (
        core_position >= len(command)
        or manifest_bound_path(command[core_position]) != core_path.resolve()
    ):
        raise TrustError("drat-trim -c target differs from the bound core")
    command_paths = resolved_token_paths(command)
    for required in (terminal_path.resolve(), proof_path, core_path.resolve()):
        if required not in command_paths:
            raise TrustError(f"drat-trim command does not bind {required}")

    checker_path = manifest_bound_path(checker_record.get("path", ""))
    if (
        not checker_path.is_file()
        or Path(command[0]).name != checker_path.name
        or checker_record.get("sha256") != sha256(checker_path)
    ):
        raise TrustError("extraction manifest checker binary binding mismatch")
    stdout_lines = payload.get("stdout_lines")
    if (
        not isinstance(stdout_lines, list)
        or "s VERIFIED" not in stdout_lines
        or not all(isinstance(line, str) for line in stdout_lines)
    ):
        raise TrustError("extraction manifest transcript lacks s VERIFIED")
    summary = payload.get("checker_summary")
    if (
        not isinstance(summary, dict)
        or summary.get("core_input_clause_count") != core["clause_count"]
        or summary.get("input_clause_count") != checkpoint["final_clause_count"]
    ):
        raise TrustError("extraction checker summary count mismatch")

    return {
        "path": str(manifest_path),
        "sha256": hashlib.sha256(manifest_bytes).hexdigest(),
        "schema": EXTRACTION_MANIFEST_SCHEMA,
        "profile": profile,
        "terminal_sha256": actual_terminal_hash,
        "proof_path": str(proof_path),
        "proof_sha256": actual_proof_hash,
        "core_sha256": core["sha256"],
        "checker_path": str(checker_path),
        "checker_sha256": checker_record["sha256"],
        "drat_trim_command": command,
        "drat_trim_verdict": "s VERIFIED",
        "matching_policy": MATCHING_POLICY,
    }


def parse_core(path: Path) -> dict[str, Any]:
    header: tuple[int, int] | None = None
    clauses: list[tuple[int, ...]] = []
    pending: list[int] = []
    with path.open("r", encoding="ascii") as stream:
        for line_number, raw in enumerate(stream, 1):
            line = raw.strip()
            if not line or line.startswith("c"):
                continue
            if line.startswith("p "):
                if header is not None or pending or clauses:
                    raise AssertionError(f"{path}:{line_number}: misplaced DIMACS header")
                fields = line.split()
                if len(fields) != 4 or fields[:2] != ["p", "cnf"]:
                    raise AssertionError(f"{path}:{line_number}: malformed DIMACS header")
                header = (int(fields[2]), int(fields[3]))
                if header[0] <= 0 or header[1] <= 0:
                    raise TrustError(
                        f"{path}:{line_number}: core header counts must be positive"
                    )
                continue
            if header is None:
                raise AssertionError(f"{path}:{line_number}: clause before header")
            for token in line.split():
                literal = int(token)
                if literal == 0:
                    clauses.append(tuple(pending))
                    pending.clear()
                else:
                    pending.append(literal)
    if header is None:
        raise AssertionError(f"{path}: missing DIMACS header")
    if pending:
        raise AssertionError(f"{path}: unterminated final clause")
    if len(clauses) != header[1]:
        raise AssertionError(
            f"{path}: header has {header[1]} clauses, parsed {len(clauses)}"
        )
    if any(abs(literal) > header[0] for clause in clauses for literal in clause):
        raise AssertionError(f"{path}: literal exceeds header variable count")
    if not clauses or any(not clause for clause in clauses):
        raise TrustError(f"{path}: empty core or empty input-core clause")
    if any(len(set(clause)) != len(clause) for clause in clauses):
        raise TrustError(
            f"{path}: duplicate literal in core clause makes multiset matching unsafe"
        )
    return {
        "variable_count": header[0],
        "clause_count": header[1],
        "clauses": clauses,
        "sha256": sha256(path),
    }


def build_formula(
    profile: int,
    checkpoint: dict[str, Any],
    interesting: set[tuple[int, ...]],
) -> tuple[Any, dict[str, Any], dict[str, Any]]:
    """Replay the exact terminal driver without solving or writing DIMACS."""

    unique = f"unique4_exact_two_core_map_{profile}"
    if profile == 4:
        driver = load_module(unique + "_p4", P4_DRIVER)
        outer = driver.DIRECT.OUTER
        outer.CNF = TrackingFactory(outer.CNF, interesting).make()
        cnf, metadata = outer.encode(
            11,
            4,
            driver.DIRECT.PLANAR_BANK,
            driver.DIRECT.KALMANSON_BANK,
            driver.DIRECT.U5_BANK,
            strict_cap_minimality_overlay=True,
            pair_minimality_overlay=False,
            exact_two_strict_hit_overlay=True,
        )
        own_cap_counts = driver.OWN_CAP.add_own_cap_bounds(cnf, metadata)
        direct_overlay = driver.DIRECT.add_direct_curvature_overlay(cnf, 11)
        for refinement_index, refinement in enumerate(checkpoint["refinements"]):
            cnf.provenance_context = {
                "checkpoint_refinement_index": refinement_index,
                "checkpoint_attempt": int(refinement["attempt"]),
            }
            canonical, count = driver.add_schema_cuts(
                cnf,
                11,
                tuple(map(int, refinement["core_vertices"])),
                tuple(
                    tuple(map(int, pair))
                    for pair in refinement["required_memberships"]
                ),
            )
            if [list(pair) for pair in canonical] != refinement["canonical_order_schema"]:
                raise AssertionError("p4 checkpoint refinement schema drift")
            if count != int(refinement["order_embedding_cut_count"]):
                raise AssertionError("p4 checkpoint refinement cut-count drift")
        cnf.provenance_context = None
        replay = {
            "own_cap_clause_counts": own_cap_counts,
            "direct_curvature_overlay": direct_overlay,
            "terminal_refinement_count": len(checkpoint["refinements"]),
        }
    elif profile == 5:
        driver = load_module(unique + "_p5", P5_DRIVER)
        outer = driver.BASE.DIRECT.OUTER
        outer.CNF = TrackingFactory(outer.CNF, interesting).make()
        cnf, metadata = outer.encode(
            11,
            5,
            driver.BASE.DIRECT.PLANAR_BANK,
            driver.BASE.DIRECT.KALMANSON_BANK,
            driver.BASE.DIRECT.U5_BANK,
            strict_cap_minimality_overlay=True,
            pair_minimality_overlay=False,
            exact_two_strict_hit_overlay=True,
        )
        own_cap_counts = driver.BASE.OWN_CAP.add_own_cap_bounds(cnf, metadata)
        direct_overlay = driver.BASE.DIRECT.add_direct_curvature_overlay(cnf, 11)
        seed_path = ROOT / checkpoint["seed_bank"]["path"]
        records, seed_bank = driver.load_seed_bank(seed_path.resolve())
        seeded_cuts = driver.add_seed_cuts(cnf, 11, records)
        for refinement_index, refinement in enumerate(checkpoint["refinements"]):
            cnf.provenance_context = {
                "checkpoint_refinement_index": refinement_index,
                "checkpoint_attempt": int(refinement["attempt"]),
            }
            canonical, count = driver.BASE.add_schema_cuts(
                cnf,
                11,
                tuple(map(int, refinement["core_vertices"])),
                tuple(
                    tuple(map(int, pair))
                    for pair in refinement["required_memberships"]
                ),
            )
            if [list(pair) for pair in canonical] != refinement["canonical_order_schema"]:
                raise AssertionError("p5 checkpoint refinement schema drift")
            if count != int(refinement["order_embedding_cut_count"]):
                raise AssertionError("p5 checkpoint refinement cut-count drift")
        cnf.provenance_context = None
        if seed_bank != checkpoint["seed_bank"]:
            raise AssertionError("p5 seed-bank metadata drift")
        replay = {
            "own_cap_clause_counts": own_cap_counts,
            "direct_curvature_overlay": direct_overlay,
            "seed_bank": seed_bank,
            "seeded_cuts": seeded_cuts,
            "seed_records": records,
            "terminal_refinement_count": len(checkpoint["refinements"]),
        }
    else:
        raise AssertionError(profile)

    if len(cnf.clause_families) != len(cnf.clauses):
        raise AssertionError("clause-family provenance lost alignment")
    if len(cnf.names) - 1 != int(checkpoint["final_variable_count"]):
        raise AssertionError("rebuilt terminal variable count differs from checkpoint")
    if len(cnf.clauses) != int(checkpoint["final_clause_count"]):
        raise AssertionError("rebuilt terminal clause count differs from checkpoint")
    return cnf, metadata, replay


def verify_terminal(
    path: Path,
    cnf: Any,
    checkpoint: dict[str, Any],
) -> dict[str, Any]:
    actual_hash = sha256(path)
    expected_hash = checkpoint["terminal_cnf_sha256"]
    if actual_hash != expected_hash:
        raise AssertionError(
            f"terminal CNF hash mismatch: {actual_hash} != {expected_hash}"
        )

    header: tuple[int, int] | None = None
    variable_comment_count = 0
    clause_index = 0
    pending: list[int] = []
    with path.open("r", encoding="ascii") as stream:
        for line_number, raw in enumerate(stream, 1):
            line = raw.strip()
            if not line:
                continue
            if line.startswith("c var "):
                fields = line.split(maxsplit=3)
                if len(fields) != 4:
                    raise AssertionError(f"{path}:{line_number}: malformed variable comment")
                identifier = int(fields[2])
                expected_identifier = variable_comment_count + 1
                if identifier != expected_identifier:
                    raise AssertionError("terminal variable comments are out of order")
                if identifier >= len(cnf.names) or fields[3] != cnf.names[identifier]:
                    raise AssertionError(
                        f"terminal variable-name drift at DIMACS variable {identifier}"
                    )
                variable_comment_count += 1
                continue
            if line.startswith("c"):
                continue
            if line.startswith("p "):
                if header is not None:
                    raise TrustError("terminal DIMACS contains duplicate headers")
                fields = line.split()
                if len(fields) != 4 or fields[:2] != ["p", "cnf"]:
                    raise AssertionError(f"{path}:{line_number}: malformed header")
                header = (int(fields[2]), int(fields[3]))
                if header[0] <= 0 or header[1] <= 0:
                    raise TrustError("terminal DIMACS header counts must be positive")
                continue
            if header is None:
                raise AssertionError(f"{path}:{line_number}: clause before header")
            for token in line.split():
                literal = int(token)
                if literal != 0:
                    pending.append(literal)
                    continue
                clause_index += 1
                rebuilt = cnf.clauses[clause_index - 1]
                if len(set(pending)) != len(pending) or len(set(rebuilt)) != len(
                    rebuilt
                ):
                    raise TrustError(
                        "duplicate literal in terminal/rebuilt clause makes "
                        "multiset matching unsafe"
                    )
                if tuple(pending) != rebuilt:
                    raise AssertionError(
                        "terminal clause-sequence drift at one-based index "
                        f"{clause_index}: file={tuple(pending)} rebuilt={rebuilt}"
                    )
                pending.clear()

    expected_header = (len(cnf.names) - 1, len(cnf.clauses))
    if header != expected_header:
        raise AssertionError(f"terminal header {header} != rebuilt {expected_header}")
    if variable_comment_count != expected_header[0]:
        raise AssertionError("terminal omits or duplicates variable-name comments")
    if pending or clause_index != expected_header[1]:
        raise AssertionError("terminal clause count/termination drift")
    return {
        "path": str(path),
        "sha256": actual_hash,
        "variable_count": expected_header[0],
        "clause_count": expected_header[1],
        "variable_names_exact": True,
        "clause_sequence_exact": True,
        "duplicate_occurrences_preserved": True,
    }


VARIABLE_PATTERNS: tuple[tuple[str, re.Pattern[str], tuple[str, ...]], ...] = (
    ("selected_row_membership", re.compile(r"m_(\d+)_(\d+)$"), ("center", "point")),
    (
        "complete_radius_equality",
        re.compile(r"eq_(\d+)_(\d+)_(\d+)$"),
        ("center", "left", "right"),
    ),
    ("blocker_choice", re.compile(r"b_(\d+)_(\d+)$"), ("source", "center")),
    ("first_apex_class", re.compile(r"class_(\d+)$"), ("point",)),
    ("retained_q", re.compile(r"retained_q_(\d+)$"), ("point",)),
    ("retained_w", re.compile(r"retained_w_(\d+)$"), ("point",)),
    ("interior_q", re.compile(r"interior_q_(\d+)$"), ("point",)),
    ("interior_w", re.compile(r"interior_w_(\d+)$"), ("point",)),
    ("critical_support", re.compile(r"h_(\d+)_(\d+)$"), ("source", "point")),
    ("second_deletion_row", re.compile(r"second_deleted_(\d+)$"), ("point",)),
    ("minimality_center", re.compile(r"minimality_center_(\d+)$"), ("point",)),
    ("minimality_deleted", re.compile(r"minimality_deleted_(\d+)$"), ("point",)),
    (
        "minimality_restore_witness",
        re.compile(r"minimality_restore_(\d+)_(\d+)_(\d+)_(\d+)_(\d+)$"),
        ("source", "center", "point0", "point1", "point2"),
    ),
    (
        "row_support",
        re.compile(r"row_support_(\d+)_(\d+)_(\d+)_(\d+)_(\d+)$"),
        ("center", "point0", "point1", "point2", "point3"),
    ),
    (
        "outer_arc",
        re.compile(r"outer_arc_(\d+)_(left|right)_([0-9a-f]+)$"),
        ("center", "side", "turn_mask_hex"),
    ),
)


def decode_variable(identifier: int, name: str) -> dict[str, Any]:
    for family, pattern, fields in VARIABLE_PATTERNS:
        match = pattern.fullmatch(name)
        if match is None:
            continue
        raw = match.groups()
        parameters: dict[str, Any] = {}
        for field, value in zip(fields, raw, strict=True):
            if field == "side":
                parameters[field] = value
            elif field == "turn_mask_hex":
                parameters[field] = value
                parameters["turn_mask"] = int(value, 16)
            else:
                parameters[field] = int(value)
        return {
            "variable": identifier,
            "name": name,
            "variable_family": family,
            "parameters": parameters,
        }
    return {
        "variable": identifier,
        "name": name,
        "variable_family": "unclassified",
        "parameters": {},
    }


def schema_key(semantic: dict[str, Any]) -> str | None:
    bank = semantic.get("schema_bank")
    if not isinstance(bank, str):
        return None
    if "schema_index" in semantic:
        return f"{bank}:index:{semantic['schema_index']}"
    if "record_id" in semantic:
        return f"{bank}:record:{semantic['record_id']}"
    if "checkpoint_refinement_index" in semantic:
        return f"{bank}:refinement:{semantic['checkpoint_refinement_index']}"
    role_schema = semantic.get("role_schema")
    if role_schema is not None:
        encoded = json.dumps(role_schema, sort_keys=True, separators=(",", ":"))
        return f"{bank}:roles-sha256:{hashlib.sha256(encoded.encode()).hexdigest()}"
    return bank


def enrich_bank_schema_indices(captured: dict[int, dict[str, Any]]) -> None:
    bank_specs = {
        "planar": (
            ROOT / "scratch/atail-force/whole-carrier-planar-rank-cegar/planar_schema_bank.json",
            "schemas",
            lambda record: (
                int(record["active_role_count"]),
                [list(map(int, pair)) for pair in record["memberships"]],
            ),
        ),
        "kalmanson": (
            ROOT / "scratch/atail-force/unique4-curvature-occurrence-census/kalmanson_schema_bank.kernel_only.json",
            "schemas",
            lambda record: (
                int(record["core_vertex_count"]),
                [list(map(int, pair)) for pair in record["order_schema"]],
            ),
        ),
        "u5": (
            ROOT / "scratch/atail-force/unique-arm-whole-carrier-source-audit/u5_signed_schema_bank.json",
            "schemas",
            lambda record: (
                int(record["role_count"]),
                [list(map(int, pair)) for pair in record["positive_memberships"]],
                [list(map(int, pair)) for pair in record["negative_memberships"]],
            ),
        ),
    }
    lookups: dict[str, dict[str, int]] = {}
    for bank, (path, list_key, normalizer) in bank_specs.items():
        payload = json.loads(path.read_text(encoding="utf-8"))
        lookup: dict[str, int] = {}
        for index, record in enumerate(payload[list_key]):
            key = json.dumps(normalizer(record), sort_keys=True, separators=(",", ":"))
            if key in lookup:
                raise AssertionError(f"{bank} bank has duplicate normalized schemas")
            lookup[key] = index
        lookups[bank] = lookup

    for semantic in captured.values():
        bank = semantic.get("schema_bank")
        if bank == "planar":
            value = (semantic["role_count"], semantic["role_schema"])
        elif bank == "kalmanson":
            value = (semantic["role_count"], semantic["role_schema"])
        elif bank == "u5":
            value = (
                semantic["role_count"],
                semantic["positive_role_schema"],
                semantic["negative_role_schema"],
            )
        else:
            continue
        key = json.dumps(value, sort_keys=True, separators=(",", ":"))
        index = lookups[bank].get(key)
        if index is None:
            raise AssertionError(f"captured {bank} schema is absent from its bank")
        semantic["schema_index"] = index


def seed_semantic_matches(
    cnf: Any,
    records: list[dict[str, Any]],
    interesting: set[tuple[int, ...]],
) -> dict[tuple[int, ...], list[dict[str, Any]]]:
    answer: dict[tuple[int, ...], list[dict[str, Any]]] = defaultdict(list)
    interesting_canonical = {
        canonical_clause(clause, "input core") for clause in interesting
    }
    for record in records:
        role_count = int(record["core_vertex_count"])
        forward = tuple(tuple(map(int, pair)) for pair in record["forward_order_schema"])
        reflected = tuple(
            tuple(map(int, pair)) for pair in record["reflected_order_schema"]
        )
        orientations = (
            (("symmetric", forward),)
            if forward == reflected
            else (("forward", forward), ("reflected", reflected))
        )
        for targets in itertools.combinations(range(11), role_count):
            for orientation, oriented in orientations:
                transformed = tuple(
                    sorted(
                        (targets[center], targets[member])
                        for center, member in oriented
                    )
                )
                clause = tuple(
                    sorted(
                        -cnf.ids[f"m_{center}_{member}"]
                        for center, member in transformed
                    )
                )
                clause_key = canonical_clause(clause, "seeded terminal clause")
                if clause_key not in interesting_canonical:
                    continue
                answer[clause_key].append(
                    {
                        "schema_bank": "p5_seeded",
                        "record_id": record["id"],
                        "transport": "order_preserving_and_reflected_injections",
                        "role_count": role_count,
                        "role_schema": [list(pair) for pair in forward],
                        "target_vertices": list(targets),
                        "orientation": orientation,
                        "oriented_role_schema": [list(pair) for pair in oriented],
                        "row_memberships": [list(pair) for pair in transformed],
                    }
                )
    return dict(answer)


def make_core_map(
    profile: int,
    cnf: Any,
    core: dict[str, Any],
    terminal_report: dict[str, Any],
    source_hashes: dict[str, str],
    replay: dict[str, Any],
    extraction_authentication: dict[str, Any],
) -> dict[str, Any]:
    core_clauses: list[tuple[int, ...]] = core["clauses"]
    interesting = set(core_clauses)
    core_keys = [
        canonical_clause(clause, f"core clause {index}")
        for index, clause in enumerate(core_clauses, 1)
    ]
    interesting_keys = set(core_keys)
    canonical_candidates: dict[tuple[int, ...], list[int]] = defaultdict(list)
    for input_index, clause in enumerate(cnf.clauses, 1):
        key = canonical_clause(clause, f"terminal clause {input_index}")
        if key in interesting_keys:
            canonical_candidates[key].append(input_index)

    core_multiplicity = Counter(core_keys)
    for key, count in core_multiplicity.items():
        available = canonical_candidates.get(key, [])
        if not available:
            raise TrustError(
                "input core contains a canonically unmatched clause "
                f"{key}"
            )
        if count > len(available):
            raise TrustError(
                "input-core clause multiplicity exceeds terminal multiplicity: "
                f"canonical_clause={key}, core={count}, terminal={len(available)}"
            )

    enrich_bank_schema_indices(cnf.interesting_semantics)
    seed_matches: dict[tuple[int, ...], list[dict[str, Any]]] = {}
    if profile == 5:
        seed_matches = seed_semantic_matches(
            cnf, replay["seed_records"], interesting
        )

    input_family_counts = Counter(cnf.clause_families)
    core_family_counts: Counter[str] = Counter()
    variable_family_counts: Counter[str] = Counter()
    schema_counts: Counter[str] = Counter()
    orientation_counts: Counter[str] = Counter()
    entries: list[dict[str, Any]] = []
    duplicate_ambiguous_count = 0
    exact_order_count = 0
    canonical_reordered_count = 0
    family_ambiguous_count = 0
    schema_ambiguous_count = 0
    allocation_offsets: Counter[tuple[int, ...]] = Counter()
    allocated_input_indices: set[int] = set()

    decoded_cache = {
        identifier: decode_variable(identifier, cnf.names[identifier])
        for identifier in {
            abs(literal) for clause in core_clauses for literal in clause
        }
    }

    for core_index, (clause, clause_key) in enumerate(
        zip(core_clauses, core_keys, strict=True), 1
    ):
        candidates = canonical_candidates.get(clause_key, [])
        allocation_ordinal = allocation_offsets[clause_key]
        allocated_input_index = candidates[allocation_ordinal]
        allocation_offsets[clause_key] += 1
        if allocated_input_index in allocated_input_indices:
            raise TrustError("duplicate allocator reused a terminal occurrence")
        allocated_input_indices.add(allocated_input_index)
        candidate_records: list[dict[str, Any]] = []
        for input_index in candidates:
            semantic = dict(cnf.interesting_semantics.get(input_index, {}))
            if cnf.clause_families[input_index - 1] == (
                "seeded_full_linear_kalmanson_cut"
            ):
                semantic["schema_matches"] = seed_matches.get(clause_key, [])
            candidate_records.append(
                {
                    "input_clause_index": input_index,
                    "input_clause_literal_order": list(
                        cnf.clauses[input_index - 1]
                    ),
                    "literal_order_matches_core": (
                        cnf.clauses[input_index - 1] == clause
                    ),
                    "family": cnf.clause_families[input_index - 1],
                    "semantic_parameters": semantic,
                }
            )

        families = sorted({record["family"] for record in candidate_records})
        allocated_record = next(
            record
            for record in candidate_records
            if record["input_clause_index"] == allocated_input_index
        )
        allocated_order_exact = bool(
            allocated_record["literal_order_matches_core"]
        )
        if allocated_order_exact:
            exact_order_count += 1
            order_status = "exact_literal_order"
        else:
            canonical_reordered_count += 1
            order_status = "canonical_literal_reordering"
        if len(candidates) == 1:
            status = f"semantic_unique_{order_status}"
        else:
            duplicate_ambiguous_count += 1
            status = (
                "semantic_duplicate_multiplicity_allocated_ambiguous_"
                f"{order_status}"
            )

        allocated_family = allocated_record["family"]
        core_family_counts[allocated_family] += 1
        if len(families) > 1:
            family_ambiguous_count += 1

        literal_records: list[dict[str, Any]] = []
        for literal in clause:
            decoded = dict(decoded_cache[abs(literal)])
            decoded["literal"] = literal
            decoded["polarity"] = "positive" if literal > 0 else "negative"
            literal_records.append(decoded)
            variable_family_counts[decoded["variable_family"]] += 1

        semantic_matches: list[dict[str, Any]] = []
        seen_semantics: set[str] = set()
        for record in candidate_records:
            semantic = record["semantic_parameters"]
            expanded = semantic.get("schema_matches")
            values = expanded if isinstance(expanded, list) else [semantic]
            for value in values:
                key = schema_key(value)
                if key is None:
                    continue
                compact = {
                    "schema": key,
                    "orientation": value.get("orientation"),
                }
                if compact["orientation"] == "unclassified":
                    raise TrustError("unclassified schema orientation is forbidden")
                encoded = json.dumps(compact, sort_keys=True)
                if encoded not in seen_semantics:
                    seen_semantics.add(encoded)
                    semantic_matches.append(compact)
        if len(semantic_matches) == 1:
            match = semantic_matches[0]
            schema_counts[match["schema"]] += 1
            if isinstance(match["orientation"], str):
                orientation_counts[match["orientation"]] += 1
        elif len(semantic_matches) > 1:
            schema_ambiguous_count += 1

        entries.append(
            {
                "core_clause_index": core_index,
                "match_status": status,
                "core_clause_literal_order": list(clause),
                "canonical_signed_literal_multiset": list(clause_key),
                "named_literals": literal_records,
                "input_clause_index_candidates": candidates,
                "allocated_input_clause_index": allocated_input_index,
                "allocated_input_clause_literal_order": allocated_record[
                    "input_clause_literal_order"
                ],
                "allocated_literal_order_matches_core": allocated_order_exact,
                "duplicate_allocation_ordinal": allocation_ordinal,
                "candidate_provenance": candidate_records,
                "allocated_family": allocated_family,
                "possible_families": families,
                "family_ambiguous_across_candidates": len(families) > 1,
                "schema_orientation_candidates": semantic_matches,
            }
        )

    if len(allocated_input_indices) != len(core_clauses):
        raise TrustError("core-to-input occurrence allocation is not injective")

    return {
        "schema": "p97-unique4-exact-two-drat-input-core-map-v1",
        "epistemic_status": (
            "EXACT RECONSTRUCTION OF THE HASHED FIXED-N TERMINAL CNF; "
            "CORE OCCURRENCE MATCHING IS EXPLICITLY QUALIFIED BELOW"
        ),
        "profile": profile,
        "claim_scope": (
            "The map concerns only the named fixed n=11 Boolean projection. "
            "It is not an arbitrary-cardinality theorem, a source occurrence "
            "proof, or a Lean closure."
        ),
        "terminal_verification": terminal_report,
        "extraction_authentication": extraction_authentication,
        "matching_policy": MATCHING_POLICY,
        "verified_checkpoint_source_hashes": source_hashes,
        "core": {
            "path": str(core["path"]),
            "sha256": core["sha256"],
            "header_variable_count": core["variable_count"],
            "clause_count": core["clause_count"],
        },
        "input_occurrence_provenance_invariants": {
            "indexing": "one_based_dimacs_clause_occurrence",
            "indexed_occurrence_count": len(cnf.clauses),
            "family_assignment_count": len(cnf.clause_families),
            "exact_clause_assignment_count": len(cnf.clauses),
            "variable_name_table_count": len(cnf.names) - 1,
            "duplicate_occurrences_preserved": True,
            "clause_order_preserved": True,
            "literal_order_preserved": True,
            "core_matching_basis": "sorted_signed_literal_multiset",
            "duplicate_literals_rejected": True,
            "semantic_parameters_captured_for_core_candidates_when_exposed": True,
        },
        "input_clause_count_by_family": dict(sorted(input_family_counts.items())),
        "core_clause_count_by_resolved_family": dict(
            sorted(core_family_counts.items())
        ),
        "core_literal_occurrence_count_by_variable_family": dict(
            sorted(variable_family_counts.items())
        ),
        "core_clause_count_by_resolved_schema": dict(sorted(schema_counts.items())),
        "core_clause_count_by_resolved_orientation": dict(
            sorted(orientation_counts.items())
        ),
        "matching_summary": {
            "core_clause_count": len(core_clauses),
            "semantic_unique_occurrence_count": sum(
                entry["match_status"].startswith("semantic_unique_")
                for entry in entries
            ),
            "duplicate_occurrence_ambiguous_count": duplicate_ambiguous_count,
            "exact_literal_order_match_count": exact_order_count,
            "canonical_literal_reordering_match_count": canonical_reordered_count,
            "canonically_unmatched_count": 0,
            "allocated_input_occurrence_count": len(allocated_input_indices),
            "allocation_is_injective": True,
            "family_ambiguous_count": family_ambiguous_count,
            "schema_orientation_ambiguous_count": schema_ambiguous_count,
        },
        "core_clauses": entries,
    }


def fixed_output_path(profile: int) -> Path:
    return (HERE / f"p{profile}.input-core-map.json").resolve()


def quarantine_stale_output(profile: int) -> Path | None:
    return quarantine_file(fixed_output_path(profile))


def quarantine_file(output: Path) -> Path | None:
    if not output.exists():
        return None
    quarantine = output.with_name(
        f"{output.stem}.rejected-stale-{time.time_ns()}{output.suffix}"
    )
    os.replace(output, quarantine)
    return quarantine


def atomic_write_json_exact(
    output: Path, allowed_output: Path, payload: dict[str, Any]
) -> None:
    if output.resolve() != allowed_output.resolve():
        raise TrustError(
            f"publication may write only {allowed_output.resolve()}, "
            f"not {output.resolve()}"
        )
    output.parent.mkdir(parents=True, exist_ok=True)
    descriptor, temporary_text = tempfile.mkstemp(
        dir=output.parent,
        prefix=f".{output.name}.",
        suffix=".tmp",
        text=True,
    )
    temporary = Path(temporary_text)
    try:
        with os.fdopen(descriptor, "w", encoding="utf-8") as stream:
            json.dump(payload, stream, indent=2, sort_keys=True)
            stream.write("\n")
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary, output)
    except BaseException:
        temporary.unlink(missing_ok=True)
        raise


def atomic_write_profile_map(
    profile: int, output: Path, payload: dict[str, Any]
) -> None:
    expected = fixed_output_path(profile)
    atomic_write_json_exact(output, expected, payload)


def run(
    profile: int,
    terminal: Path,
    core_path: Path,
    manifest_path: Path,
    proof_path: Path | None,
    authenticate_only: bool = False,
) -> int:
    output = fixed_output_path(profile)
    if not core_path.is_file():
        raise TrustError(f"required input core is absent: {core_path}")
    if not terminal.is_file():
        raise TrustError(f"required terminal CNF is absent: {terminal}")
    checkpoint_path = PROFILES[profile]["checkpoint"]
    checkpoint = json.loads(checkpoint_path.read_text(encoding="utf-8"))
    validate_checkpoint(profile, checkpoint)
    core = parse_core(core_path)
    core["path"] = core_path
    extraction_authentication = authenticate_extraction(
        manifest_path,
        profile,
        terminal,
        proof_path,
        core_path,
        checkpoint,
        core,
    )
    source_hashes = verify_checkpoint_sources(checkpoint)
    if authenticate_only:
        print(
            json.dumps(
                {
                    "status": "EXTRACTION_AUTHENTICATED_NO_MAP_WRITTEN",
                    "profile": profile,
                    "core_clause_count": core["clause_count"],
                    "core_sha256": core["sha256"],
                    "manifest_sha256": extraction_authentication["sha256"],
                    "verified_checkpoint_source_count": len(source_hashes),
                },
                indent=2,
                sort_keys=True,
            )
        )
        return 0
    interesting = set(core["clauses"])
    cnf, _metadata, replay = build_formula(profile, checkpoint, interesting)
    terminal_report = verify_terminal(terminal, cnf, checkpoint)
    if core["variable_count"] > terminal_report["variable_count"]:
        raise AssertionError("core header uses more variables than the terminal CNF")
    payload = make_core_map(
        profile,
        cnf,
        core,
        terminal_report,
        source_hashes,
        replay,
        extraction_authentication,
    )
    atomic_write_profile_map(profile, output, payload)
    print(
        json.dumps(
            {
                "status": "CORE_MAP_WRITTEN",
                "profile": profile,
                "output": str(output),
                **payload["matching_summary"],
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


def self_test() -> int:
    class Tiny:
        names = ["<unused-zero>", "m_0_1", "outer_arc_2_left_a"]
        clauses = [(1, -2), (1, -2), (-1,)]
        clause_families = ["first", "duplicate", "last"]

    checkpoint: dict[str, Any] = {
        "terminal_cnf_sha256": "",
        "final_variable_count": 2,
        "final_clause_count": 3,
    }

    def rejected(action: Any) -> None:
        try:
            action()
        except (AssertionError, TrustError, ValueError):
            return
        raise AssertionError("expected fail-closed rejection")

    with tempfile.TemporaryDirectory(prefix="unique4-core-map-smoke-") as directory:
        temp = Path(directory)
        terminal = temp / "terminal.cnf"
        terminal.write_text(
            "c var 1 m_0_1\n"
            "c var 2 outer_arc_2_left_a\n"
            "p cnf 2 3\n"
            "1 -2 0\n"
            "1 -2 0\n"
            "-1 0\n",
            encoding="ascii",
        )
        checkpoint["terminal_cnf_sha256"] = sha256(terminal)
        report = verify_terminal(terminal, Tiny(), checkpoint)
        assert report["clause_sequence_exact"]
        core_path = temp / "core.cnf"
        core_path.write_text(
            "p cnf 2 3\n-2 1 0\n1 -2 0\n-1 0\n", encoding="ascii"
        )
        core = parse_core(core_path)
        core["path"] = core_path
        assert core["clauses"] == [(-2, 1), (1, -2), (-1,)]
        decoded = decode_variable(2, "outer_arc_2_left_a")
        assert decoded["variable_family"] == "outer_arc"
        assert decoded["parameters"]["turn_mask"] == 10
        tiny = Tiny()
        tiny.interesting_semantics = {}
        payload = make_core_map(
            4,
            tiny,
            core,
            report,
            {},
            {},
            {"synthetic": True},
        )
        assert payload["core_clauses"][0]["match_status"] == (
            "semantic_duplicate_multiplicity_allocated_ambiguous_"
            "canonical_literal_reordering"
        )
        assert payload["core_clauses"][1]["match_status"] == (
            "semantic_duplicate_multiplicity_allocated_ambiguous_"
            "exact_literal_order"
        )
        assert payload["core_clauses"][0]["input_clause_index_candidates"] == [1, 2]
        assert payload["core_clauses"][0]["core_clause_literal_order"] == [-2, 1]
        assert payload["core_clauses"][0][
            "allocated_input_clause_literal_order"
        ] == [1, -2]
        assert not payload["core_clauses"][0][
            "allocated_literal_order_matches_core"
        ]
        assert [
            entry["allocated_input_clause_index"]
            for entry in payload["core_clauses"]
        ] == [1, 2, 3]
        assert payload["matching_summary"]["allocation_is_injective"]

        too_many = {
            **core,
            "clauses": [(-2, 1), (1, -2), (-2, 1)],
            "clause_count": 3,
        }
        rejected(
            lambda: make_core_map(
                4, tiny, too_many, report, {}, {}, {"synthetic": True}
            )
        )
        unmatched = {
            **core,
            "clauses": [(2,)],
            "clause_count": 1,
        }
        rejected(
            lambda: make_core_map(
                4, tiny, unmatched, report, {}, {}, {"synthetic": True}
            )
        )

        malformed_cores = {
            "negative.cnf": "p cnf -2 1\n1 0\n",
            "zero.cnf": "p cnf 2 0\n",
            "empty-clause.cnf": "p cnf 2 1\n0\n",
            "duplicate-header.cnf": "p cnf 2 1\np cnf 2 1\n1 0\n",
            "duplicate-literal.cnf": "p cnf 2 1\n1 1 0\n",
            "short-header.cnf": "p cnf 2\n1 0\n",
        }
        for name, text in malformed_cores.items():
            path = temp / name
            path.write_text(text, encoding="ascii")
            rejected(lambda path=path: parse_core(path))

        duplicate_terminal = temp / "duplicate-terminal.cnf"
        duplicate_terminal.write_text(
            "c var 1 m_0_1\n"
            "c var 2 outer_arc_2_left_a\n"
            "p cnf 2 3\n"
            "p cnf 2 3\n"
            "1 -2 0\n1 -2 0\n-1 0\n",
            encoding="ascii",
        )
        duplicate_checkpoint = {
            **checkpoint,
            "terminal_cnf_sha256": sha256(duplicate_terminal),
        }
        rejected(
            lambda: verify_terminal(
                duplicate_terminal, Tiny(), duplicate_checkpoint
            )
        )
        duplicate_literal_terminal = temp / "duplicate-literal-terminal.cnf"
        duplicate_literal_terminal.write_text(
            "c var 1 m_0_1\n"
            "c var 2 outer_arc_2_left_a\n"
            "p cnf 2 3\n"
            "1 1 -2 0\n"
            "1 -2 0\n"
            "-1 0\n",
            encoding="ascii",
        )
        duplicate_literal_checkpoint = {
            **checkpoint,
            "terminal_cnf_sha256": sha256(duplicate_literal_terminal),
        }
        rejected(
            lambda: verify_terminal(
                duplicate_literal_terminal,
                Tiny(),
                duplicate_literal_checkpoint,
            )
        )

        production_checkpoint = {
            "schema": CHECKPOINT_POLICY[4]["schema"],
            "n": 11,
            "opp1_card": 4,
            "terminal_status": "BOOLEAN_UNSAT_PENDING_PROOF_REPLAY",
            "refinement_count": 1,
            "refinements": [{}],
            "final_variable_count": 2,
            "final_clause_count": 3,
            "terminal_cnf_sha256": sha256(terminal),
        }
        validate_checkpoint(4, production_checkpoint)
        for key, bad in (
            ("schema", "wrong"),
            ("n", 12),
            ("opp1_card", 5),
            ("terminal_status", "RUNNING"),
            ("refinement_count", 0),
        ):
            drifted = {**production_checkpoint, key: bad}
            rejected(lambda drifted=drifted: validate_checkpoint(4, drifted))

        proof = temp / "proof.drat"
        proof.write_bytes(b"synthetic proof")
        checker = temp / "drat-trim"
        checker.write_bytes(b"synthetic checker")
        manifest_path = temp / "extraction.json"
        manifest = {
            "schema": EXTRACTION_MANIFEST_SCHEMA,
            "profile": 4,
            "n": 11,
            "command": [
                str(checker),
                str(terminal),
                str(proof),
                "-c",
                str(core_path),
            ],
            "returncode": 0,
            "verdict": "s VERIFIED",
            "terminal_cnf": {
                "path": str(terminal),
                "sha256": sha256(terminal),
                "variable_count": 2,
                "clause_count": 3,
                "byte_count": terminal.stat().st_size,
            },
            "proof": {
                "path": str(proof),
                "sha256": sha256(proof),
                "byte_count": proof.stat().st_size,
            },
            "checker": {
                "path": str(checker),
                "sha256": sha256(checker),
            },
            "input_core": {
                "path": str(core_path),
                "sha256": sha256(core_path),
                "variable_count": 2,
                "clause_count": 3,
                "byte_count": core_path.stat().st_size,
            },
            "checker_summary": {
                "core_input_clause_count": 3,
                "input_clause_count": 3,
            },
            "stdout_lines": ["s VERIFIED"],
        }

        def write_manifest(value: dict[str, Any]) -> None:
            manifest_path.write_text(
                json.dumps(value, sort_keys=True) + "\n", encoding="utf-8"
            )

        write_manifest(manifest)
        authenticated = authenticate_extraction(
            manifest_path,
            4,
            terminal,
            None,
            core_path,
            production_checkpoint,
            core,
        )
        assert authenticated["drat_trim_verdict"] == "s VERIFIED"
        rejected(
            lambda: authenticate_extraction(
                temp / "absent.json",
                4,
                terminal,
                None,
                core_path,
                production_checkpoint,
                core,
            )
        )
        manifest_mutations = (
            ("profile", 5),
            ("verdict", "s NOT VERIFIED"),
            ("returncode", 1),
            ("schema", "wrong"),
        )
        for key, bad in manifest_mutations:
            changed = json.loads(json.dumps(manifest))
            changed[key] = bad
            write_manifest(changed)
            rejected(
                lambda: authenticate_extraction(
                    manifest_path,
                    4,
                    terminal,
                    None,
                    core_path,
                    production_checkpoint,
                    core,
                )
            )
        for section, key in (
            ("terminal_cnf", "sha256"),
            ("proof", "sha256"),
            ("checker", "sha256"),
            ("input_core", "sha256"),
            ("input_core", "clause_count"),
        ):
            changed = json.loads(json.dumps(manifest))
            changed[section][key] = "wrong"
            write_manifest(changed)
            rejected(
                lambda: authenticate_extraction(
                    manifest_path,
                    4,
                    terminal,
                    None,
                    core_path,
                    production_checkpoint,
                    core,
                )
            )
        write_manifest(manifest)

        rejected(lambda: orientation_label(((0, 1),), ((1, 0),), ((2, 3),)))

        allowed = temp / "p4.input-core-map.json"
        atomic_write_json_exact(allowed, allowed, {"ok": True})
        assert json.loads(allowed.read_text()) == {"ok": True}
        forbidden = temp / "README.md"
        rejected(
            lambda: atomic_write_json_exact(
                forbidden, allowed, {"overwrite": True}
            )
        )
        assert not forbidden.exists()
        quarantine = quarantine_file(allowed)
        assert quarantine is not None and quarantine.is_file()
        assert not allowed.exists()
    print(json.dumps({"status": "SELF_TEST_OK"}, sort_keys=True))
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--profile", type=int, choices=(4, 5))
    parser.add_argument("--terminal", type=Path)
    parser.add_argument("--core", type=Path)
    parser.add_argument("--proof", type=Path)
    parser.add_argument("--extraction-manifest", type=Path)
    parser.add_argument("--authenticate-only", action="store_true")
    parser.add_argument("--self-test", action="store_true")
    args = parser.parse_args()
    if args.self_test:
        return self_test()
    if args.profile is None:
        parser.error("--profile is required unless --self-test is used")
    defaults = PROFILES[args.profile]
    if args.core is None:
        core_name = f"p{args.profile}.input-core.cnf"
        core_candidates = (HERE / core_name, defaults["core"])
        selected_core = next(
            (candidate for candidate in core_candidates if candidate.is_file()),
            core_candidates[0],
        )
    else:
        selected_core = args.core
    manifest = (
        args.extraction_manifest
        or HERE / f"p{args.profile}.input-core-extraction.json"
    ).resolve()
    try:
        return run(
            args.profile,
            (args.terminal or defaults["terminal"]).resolve(),
            selected_core.resolve(),
            manifest,
            args.proof.resolve() if args.proof is not None else None,
            args.authenticate_only,
        )
    except Exception as error:
        quarantine = quarantine_stale_output(args.profile)
        print(
            json.dumps(
                {
                    "status": "CORE_MAP_REJECTED",
                    "profile": args.profile,
                    "error_type": type(error).__name__,
                    "error": str(error),
                    "quarantined_stale_output": (
                        str(quarantine) if quarantine is not None else None
                    ),
                },
                indent=2,
                sort_keys=True,
            ),
            file=sys.stderr,
        )
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
