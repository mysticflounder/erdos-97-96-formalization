#!/usr/bin/env python3
"""Authenticate every p5-largest trimmed clause back to its source occurrence.

This is mapping infrastructure only.  It does not prove source adequacy or
UNSAT.  The output preserves the exact signed-literal order of the trimmed CNF
while attaching the authenticated input-core occurrence and its semantic data.
"""

from __future__ import annotations

import argparse
from collections import Counter
import copy
import hashlib
import json
import os
from pathlib import Path
import tempfile
from typing import Any, Iterable


HERE = Path(__file__).resolve().parent
CORE_MAP_DIR = HERE.parents[1] / "unique4-exact-two-core-map"
DEFAULT_MAP = CORE_MAP_DIR / "p5.input-core-map.json"
DEFAULT_GREEDY = CORE_MAP_DIR / "p5.greedy-family-largest-seed0.json"
DEFAULT_REPORT = CORE_MAP_DIR / "p5-largest.trimmed-certificate.json"
DEFAULT_OUTPUT = HERE / "p5-largest.trimmed-occurrence-map.json"

MAP_SCHEMA = "p97-unique4-exact-two-drat-input-core-map-v1"
GREEDY_SCHEMA = "p97-unique4-exact-two-greedy-family-core-v1"
REPORT_SCHEMA = "p97-unique4-exact-two-trimmed-reduced-core-certificate-v1"
OUTPUT_SCHEMA = "p97-unique4-exact-two-trimmed-occurrence-source-map-v1"


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(8 * 1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def json_sha256(value: Any) -> str:
    encoded = json.dumps(
        value, ensure_ascii=False, separators=(",", ":"), sort_keys=True
    ).encode("utf-8")
    return hashlib.sha256(encoded).hexdigest()


def load_json(path: Path) -> dict[str, Any]:
    value = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(value, dict):
        raise ValueError(f"expected a JSON object: {path}")
    return value


def atomic_write(path: Path, text: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(f".{path.name}.tmp-{os.getpid()}")
    temporary.write_text(text, encoding="utf-8")
    os.replace(temporary, path)


def canonical_clause(clause: Iterable[int]) -> tuple[int, ...]:
    return tuple(sorted(clause))


def parse_dimacs(path: Path) -> tuple[int, list[tuple[int, ...]]]:
    variable_count: int | None = None
    declared_clause_count: int | None = None
    clauses: list[tuple[int, ...]] = []
    pending: list[int] = []
    for line_number, raw_line in enumerate(
        path.read_text(encoding="utf-8").splitlines(), 1
    ):
        line = raw_line.strip()
        if not line or line.startswith("c"):
            continue
        if line.startswith("p"):
            fields = line.split()
            if (
                variable_count is not None
                or len(fields) != 4
                or fields[:2] != ["p", "cnf"]
            ):
                raise ValueError(f"invalid DIMACS header at {path}:{line_number}")
            variable_count = int(fields[2])
            declared_clause_count = int(fields[3])
            if variable_count < 0 or declared_clause_count < 0:
                raise ValueError("negative DIMACS header count")
            continue
        if variable_count is None:
            raise ValueError(f"DIMACS data precedes header at {path}:{line_number}")
        for field in line.split():
            literal = int(field)
            if literal == 0:
                if not pending:
                    raise ValueError(f"empty DIMACS clause at {path}:{line_number}")
                clause = tuple(pending)
                if len(set(clause)) != len(clause):
                    raise ValueError(
                        f"duplicate literal in DIMACS clause {len(clauses) + 1}"
                    )
                if max(map(abs, clause)) > variable_count:
                    raise ValueError(
                        f"literal exceeds DIMACS header in clause {len(clauses) + 1}"
                    )
                clauses.append(clause)
                pending = []
            else:
                pending.append(literal)
    if variable_count is None or declared_clause_count is None:
        raise ValueError(f"missing DIMACS header: {path}")
    if pending:
        raise ValueError(f"unterminated DIMACS clause: {path}")
    if len(clauses) != declared_clause_count:
        raise ValueError(
            f"DIMACS clause count mismatch: declared {declared_clause_count}, "
            f"parsed {len(clauses)}"
        )
    return variable_count, clauses


def recorded_path(
    record: dict[str, Any],
    *,
    anchor: Path,
    override: Path | None = None,
) -> Path:
    if override is not None:
        answer = override.resolve()
    else:
        answer = Path(str(record["path"])).expanduser()
        if not answer.is_absolute():
            answer = anchor / answer
        answer = answer.resolve()
        if not answer.is_file():
            relocated = (anchor / answer.name).resolve()
            if relocated.is_file():
                answer = relocated
    if not answer.is_file():
        raise ValueError(f"recorded artifact is missing: {answer}")
    expected = str(record["sha256"])
    actual = sha256(answer)
    if actual != expected:
        raise ValueError(
            f"artifact hash mismatch for {answer}: expected {expected}, got {actual}"
        )
    if "byte_count" in record and answer.stat().st_size != int(record["byte_count"]):
        raise ValueError(f"artifact byte count mismatch for {answer}")
    return answer


def validate_named_literals(
    clause_index: int, source_clause: tuple[int, ...], entry: dict[str, Any]
) -> None:
    named = entry.get("named_literals")
    if not isinstance(named, list) or len(named) != len(source_clause):
        raise ValueError(
            f"named-literal coverage drifted at core clause {clause_index}"
        )
    for position, (literal, atom) in enumerate(
        zip(source_clause, named, strict=True), 1
    ):
        if (
            int(atom["literal"]) != literal
            or int(atom["variable"]) != abs(literal)
            or atom["polarity"] != ("positive" if literal > 0 else "negative")
            or not isinstance(atom.get("name"), str)
            or not atom["name"]
            or not isinstance(atom.get("parameters"), dict)
            or not isinstance(atom.get("variable_family"), str)
        ):
            raise ValueError(
                f"named literal {position} drifted at core clause {clause_index}"
            )


def validate_source_map(
    greedy: dict[str, Any],
    mapping: dict[str, Any],
    source_variable_count: int,
    source_clauses: list[tuple[int, ...]],
) -> tuple[set[str], list[tuple[tuple[int, ...], dict[str, Any]]]]:
    if (
        greedy.get("schema") != GREEDY_SCHEMA
        or int(greedy.get("profile", -1)) != 5
        or greedy.get("order") != "largest"
        or int(greedy.get("seed", -1)) != 0
    ):
        raise ValueError("expected the p5 largest-order seed-0 greedy artifact")
    if (
        mapping.get("schema") != MAP_SCHEMA
        or int(mapping.get("profile", -1)) != 5
    ):
        raise ValueError("unexpected p5 input-core map schema/profile")
    if greedy.get("final_solver_result", {}).get("status") != "UNSAT":
        raise ValueError("greedy artifact lacks its recorded final UNSAT result")
    summary = mapping.get("matching_summary", {})
    if (
        summary.get("allocation_is_injective") is not True
        or int(summary.get("canonically_unmatched_count", -1)) != 0
    ):
        raise ValueError("input-core occurrence authentication invariants drifted")
    entries = mapping.get("core_clauses")
    if not isinstance(entries, list) or len(entries) != len(source_clauses):
        raise ValueError("source core and map have different clause counts")
    if int(mapping["core"]["clause_count"]) != len(source_clauses):
        raise ValueError("map core clause count drifted")
    if int(mapping["core"]["header_variable_count"]) != source_variable_count:
        raise ValueError("map core variable count drifted")

    all_families: set[str] = set()
    allocated_input_indices: set[int] = set()
    for clause_index, (clause, entry) in enumerate(
        zip(source_clauses, entries, strict=True), 1
    ):
        if int(entry["core_clause_index"]) != clause_index:
            raise ValueError("map core-clause indices are not contiguous")
        if tuple(map(int, entry["core_clause_literal_order"])) != clause:
            raise ValueError(f"source literal order drifted at clause {clause_index}")
        if len(set(clause)) != len(clause):
            raise ValueError(f"duplicate source literal at clause {clause_index}")
        canonical = canonical_clause(clause)
        if tuple(map(int, entry["canonical_signed_literal_multiset"])) != canonical:
            raise ValueError(
                f"canonical source clause drifted at clause {clause_index}"
            )
        allocated_order = tuple(
            map(int, entry["allocated_input_clause_literal_order"])
        )
        if canonical_clause(allocated_order) != canonical:
            raise ValueError(
                f"allocated original input clause drifted at clause {clause_index}"
            )
        if bool(entry["allocated_literal_order_matches_core"]) != (
            allocated_order == clause
        ):
            raise ValueError(
                f"allocated literal-order flag drifted at clause {clause_index}"
            )
        validate_named_literals(clause_index, clause, entry)
        family = str(entry["allocated_family"])
        all_families.add(family)
        allocated_input_index = int(entry["allocated_input_clause_index"])
        if allocated_input_index in allocated_input_indices:
            raise ValueError(
                f"original input occurrence reused at core clause {clause_index}"
            )
        allocated_input_indices.add(allocated_input_index)
        if allocated_input_index not in set(
            map(int, entry["input_clause_index_candidates"])
        ):
            raise ValueError(
                f"allocated input index is not a candidate at clause {clause_index}"
            )
        if family not in set(map(str, entry["possible_families"])):
            raise ValueError(
                f"allocated family is not a candidate at clause {clause_index}"
            )
        allocated_candidates = [
            candidate
            for candidate in entry.get("candidate_provenance", [])
            if (
                str(candidate.get("family")) == family
                and int(candidate.get("input_clause_index", -1))
                == int(entry["allocated_input_clause_index"])
            )
        ]
        if len(allocated_candidates) != 1:
            raise ValueError(
                f"allocated provenance is not unique at core clause {clause_index}"
            )
        candidate_order = tuple(
            map(int, allocated_candidates[0]["input_clause_literal_order"])
        )
        if canonical_clause(candidate_order) != canonical:
            raise ValueError(
                f"allocated provenance literals drifted at clause {clause_index}"
            )
        if bool(allocated_candidates[0]["literal_order_matches_core"]) != (
            candidate_order == clause
        ):
            raise ValueError(
                f"candidate literal-order flag drifted at clause {clause_index}"
            )
        if not isinstance(allocated_candidates[0].get("semantic_parameters"), dict):
            raise ValueError(
                f"semantic parameters missing at core clause {clause_index}"
            )
        if not isinstance(entry.get("schema_orientation_candidates"), list):
            raise ValueError(
                f"schema orientations missing at core clause {clause_index}"
            )

    retained = set(map(str, greedy["retained_families"]))
    removed = set(map(str, greedy["removed_optional_families"]))
    if retained & removed or retained | removed != all_families:
        raise ValueError("greedy retained/removed family partition drifted")
    retained_entries = [
        (clause, entry)
        for clause, entry in zip(source_clauses, entries, strict=True)
        if str(entry["allocated_family"]) in retained
    ]
    if len(retained_entries) != int(greedy["retained_clause_count"]):
        raise ValueError("greedy retained clause count drifted")
    if len(retained) != int(greedy["retained_family_count"]):
        raise ValueError("greedy retained family count drifted")
    return retained, retained_entries


def dense_mapping(
    report: dict[str, Any],
    retained_entries: list[tuple[tuple[int, ...], dict[str, Any]]],
) -> dict[int, int]:
    pairs = report["dense_variable_renaming"]["old_to_new"]
    parsed = [(int(old), int(new)) for old, new in pairs]
    used_source_variables = sorted(
        {
            abs(literal)
            for source_clause, _entry in retained_entries
            for literal in source_clause
        }
    )
    expected = list(enumerate(used_source_variables, 1))
    expected = [(old, new) for new, old in expected]
    if parsed != expected:
        raise ValueError(
            "dense old_to_new is not the canonical bijection from retained variables"
        )
    if int(report["dense_variable_renaming"]["dense_variable_count"]) != len(parsed):
        raise ValueError("dense variable count drifted")
    return dict(parsed)


def allocated_candidate(entry: dict[str, Any]) -> dict[str, Any]:
    family = str(entry["allocated_family"])
    input_index = int(entry["allocated_input_clause_index"])
    matches = [
        candidate
        for candidate in entry["candidate_provenance"]
        if (
            str(candidate["family"]) == family
            and int(candidate["input_clause_index"]) == input_index
        )
    ]
    if len(matches) != 1:
        raise ValueError("allocated candidate ceased to be unique")
    return matches[0]


def assemble_bridge(
    greedy: dict[str, Any],
    mapping: dict[str, Any],
    source_variable_count: int,
    source_clauses: list[tuple[int, ...]],
    report: dict[str, Any],
    trimmed_variable_count: int,
    trimmed_clauses: list[tuple[int, ...]],
    dense_cnf_variable_count: int | None = None,
    authenticated_dense_clauses: list[tuple[int, ...]] | None = None,
) -> tuple[list[dict[str, Any]], dict[str, int]]:
    if report.get("schema") != REPORT_SCHEMA:
        raise ValueError("unexpected trimmed-certificate report schema")
    retained, retained_entries = validate_source_map(
        greedy, mapping, source_variable_count, source_clauses
    )
    old_to_new = dense_mapping(report, retained_entries)
    new_to_old = {new: old for old, new in old_to_new.items()}
    if len(new_to_old) != len(old_to_new):
        raise ValueError("dense variable mapping is not bijective")

    dense_input_clauses = [
        tuple(
            old_to_new[abs(literal)] if literal > 0 else -old_to_new[abs(literal)]
            for literal in source_clause
        )
        for source_clause, _entry in retained_entries
    ]
    if dense_cnf_variable_count is not None:
        if dense_cnf_variable_count != len(old_to_new):
            raise ValueError("authenticated dense CNF variable count drifted")
        if authenticated_dense_clauses != dense_input_clauses:
            raise ValueError(
                "authenticated dense CNF clause order or signed literals drifted"
            )
    if trimmed_variable_count > len(old_to_new):
        raise ValueError("trimmed CNF header admits an auxiliary variable")
    counts = report.get("counts", {})
    if int(counts["dense_variable_count"]) != len(old_to_new):
        raise ValueError("report dense variable count drifted")
    if int(counts["dense_clause_count"]) != len(dense_input_clauses):
        raise ValueError("report dense clause count drifted")
    if int(counts["trimmed_variable_count"]) != trimmed_variable_count:
        raise ValueError("report trimmed variable count drifted")
    if int(counts["trimmed_clause_count"]) != len(trimmed_clauses):
        raise ValueError("report trimmed clause count drifted")
    if set(map(str, report["retained_families"])) != retained:
        raise ValueError("report retained families drifted")
    expected_family_counts = Counter(
        str(entry["allocated_family"]) for _clause, entry in retained_entries
    )
    reported_family_counts = {
        str(family): int(count)
        for family, count in report["retained_clause_count_by_family"].items()
    }
    if reported_family_counts != dict(expected_family_counts):
        raise ValueError("report retained family counts drifted")
    if int(report["retained_family_count"]) != len(retained):
        raise ValueError("report retained family count drifted")

    core_to_input = list(
        map(int, report["clause_numbering"]["core_to_input_clause_id"])
    )
    if len(core_to_input) != len(trimmed_clauses):
        raise ValueError("trimmed core_to_input mapping lacks complete coverage")
    if len(set(core_to_input)) != len(core_to_input):
        raise ValueError("trimmed core_to_input mapping is not occurrence-injective")
    if any(
        dense_id < 1 or dense_id > len(dense_input_clauses)
        for dense_id in core_to_input
    ):
        raise ValueError("trimmed core_to_input mapping is out of range")

    bindings: list[dict[str, Any]] = []
    seen_trimmed_indices: set[int] = set()
    for trimmed_index, (trimmed_clause, dense_id) in enumerate(
        zip(trimmed_clauses, core_to_input, strict=True), 1
    ):
        if len(set(trimmed_clause)) != len(trimmed_clause):
            raise ValueError(f"duplicate literal in trimmed clause {trimmed_index}")
        if any(abs(literal) not in new_to_old for literal in trimmed_clause):
            raise ValueError(
                f"trimmed clause {trimmed_index} contains an auxiliary variable"
            )
        dense_input_clause = dense_input_clauses[dense_id - 1]
        if canonical_clause(trimmed_clause) != canonical_clause(dense_input_clause):
            raise ValueError(
                f"signed literal multiset mismatch at trimmed clause {trimmed_index}"
            )
        source_clause, entry = retained_entries[dense_id - 1]
        family = str(entry["allocated_family"])
        if family not in retained:
            raise ValueError(
                f"trimmed clause {trimmed_index} maps to a removed family"
            )
        named_by_dense_literal: dict[int, tuple[int, dict[str, Any]]] = {}
        for source_position, (source_literal, atom) in enumerate(
            zip(source_clause, entry["named_literals"], strict=True), 1
        ):
            dense_literal = (
                old_to_new[abs(source_literal)]
                if source_literal > 0
                else -old_to_new[abs(source_literal)]
            )
            if dense_literal in named_by_dense_literal:
                raise ValueError(
                    f"non-unique named dense literal at trimmed clause {trimmed_index}"
                )
            named_by_dense_literal[dense_literal] = (source_position, atom)
        named_source_atoms: list[dict[str, Any]] = []
        for trimmed_position, dense_literal in enumerate(trimmed_clause, 1):
            if dense_literal not in named_by_dense_literal:
                raise ValueError(
                    f"unnamed dense literal at trimmed clause {trimmed_index}"
                )
            source_position, atom = named_by_dense_literal[dense_literal]
            source_literal = int(atom["literal"])
            named_source_atoms.append(
                {
                    "trimmed_position": trimmed_position,
                    "source_position": source_position,
                    "dense_literal": dense_literal,
                    "source_literal": source_literal,
                    "name": atom["name"],
                    "polarity": atom["polarity"],
                    "variable_family": atom["variable_family"],
                    "parameters": atom["parameters"],
                }
            )
        candidate = allocated_candidate(entry)
        bindings.append(
            {
                "trimmed_clause_index": trimmed_index,
                "dense_input_clause_id": dense_id,
                "input_core_clause_index": int(entry["core_clause_index"]),
                "authenticated_original_input_clause_index": int(
                    entry["allocated_input_clause_index"]
                ),
                "retained_family": family,
                "exact_dense_signed_clause": list(trimmed_clause),
                "dense_input_signed_clause": list(dense_input_clause),
                "source_core_signed_clause": list(source_clause),
                "allocated_original_signed_clause": list(
                    map(int, entry["allocated_input_clause_literal_order"])
                ),
                "named_source_atoms": named_source_atoms,
                "semantic_parameters": candidate["semantic_parameters"],
                "schema_orientation_candidates": entry[
                    "schema_orientation_candidates"
                ],
                "duplicate_allocation_ordinal": int(
                    entry["duplicate_allocation_ordinal"]
                ),
                "match_status": entry["match_status"],
            }
        )
        seen_trimmed_indices.add(trimmed_index)
    if seen_trimmed_indices != set(range(1, len(trimmed_clauses) + 1)):
        raise ValueError("trimmed clause coverage is incomplete")
    audit_counts = {
        "source_core_clause_count": len(source_clauses),
        "retained_dense_clause_count": len(dense_input_clauses),
        "trimmed_clause_count": len(trimmed_clauses),
        "dense_variable_count": len(old_to_new),
        "trimmed_header_variable_count": trimmed_variable_count,
        "bound_named_atom_count": sum(
            len(binding["named_source_atoms"]) for binding in bindings
        ),
        "retained_family_count": len(retained),
    }
    return bindings, audit_counts


def validate_report_provenance(
    report: dict[str, Any],
    report_path: Path,
    greedy_path: Path,
    map_path: Path,
    core_path: Path,
) -> None:
    provenance = report.get("input_provenance", {})
    if provenance.get("mode") != "AUTHENTICATED_P5_LARGEST_GREEDY_CORE":
        raise ValueError("report is not the authenticated p5-largest production mode")
    expected = {
        "greedy_result": (greedy_path, sha256(greedy_path)),
        "source_map": (map_path, sha256(map_path)),
        "source_core": (core_path, sha256(core_path)),
    }
    for key, (path, digest) in expected.items():
        record = provenance.get(key, {})
        if str(record.get("sha256")) != digest:
            raise ValueError(f"report {key} hash does not authenticate {path}")
    if not report_path.is_file():
        raise ValueError("trimmed report disappeared during validation")


def generate(
    *,
    report_path: Path,
    greedy_path: Path,
    map_path: Path,
    core_override: Path | None = None,
    dense_cnf_override: Path | None = None,
    trimmed_cnf_override: Path | None = None,
) -> dict[str, Any]:
    report_path = report_path.resolve()
    greedy_path = greedy_path.resolve()
    map_path = map_path.resolve()
    report = load_json(report_path)
    greedy = load_json(greedy_path)
    mapping = load_json(map_path)
    if sha256(map_path) != str(greedy["map"]["sha256"]):
        raise ValueError("greedy map hash mismatch")
    core_path = recorded_path(
        greedy["core"], anchor=greedy_path.parent, override=core_override
    )
    if sha256(core_path) != str(mapping["core"]["sha256"]):
        raise ValueError("source map/core hash mismatch")
    source_variable_count, source_clauses = parse_dimacs(core_path)
    validate_report_provenance(
        report, report_path, greedy_path, map_path, core_path
    )
    dense_artifact_record = report.get("artifacts", {}).get("dense_cnf")
    if not isinstance(dense_artifact_record, dict):
        raise ValueError("report lacks artifacts.dense_cnf")
    dense_cnf_path = recorded_path(
        dense_artifact_record,
        anchor=report_path.parent,
        override=dense_cnf_override,
    )
    dense_cnf_variable_count, authenticated_dense_clauses = parse_dimacs(
        dense_cnf_path
    )
    artifact_record = report.get("artifacts", {}).get("trimmed_core_cnf")
    if not isinstance(artifact_record, dict):
        raise ValueError("report lacks artifacts.trimmed_core_cnf")
    trimmed_cnf_path = recorded_path(
        artifact_record,
        anchor=report_path.parent,
        override=trimmed_cnf_override,
    )
    trimmed_variable_count, trimmed_clauses = parse_dimacs(trimmed_cnf_path)
    bindings, audit_counts = assemble_bridge(
        greedy,
        mapping,
        source_variable_count,
        source_clauses,
        report,
        trimmed_variable_count,
        trimmed_clauses,
        dense_cnf_variable_count,
        authenticated_dense_clauses,
    )
    return {
        "schema": OUTPUT_SCHEMA,
        "epistemic_status": (
            "AUTHENTICATED OCCURRENCE MAPPING FOR THE HASHED FIXED-N TRIMMED "
            "CNF; NOT SOURCE CLOSURE AND NOT AN UNSAT PROOF"
        ),
        "claim_scope": (
            "Every emitted trimmed clause is bound occurrence-wise to a "
            "retained authenticated input-core entry and its named source "
            "atoms. This artifact does not establish that geometric source "
            "hypotheses imply the CNF and does not independently establish UNSAT."
        ),
        "profile": 5,
        "source_artifacts": {
            "trimmed_certificate_report": {
                "path": str(report_path),
                "sha256": sha256(report_path),
            },
            "trimmed_core_cnf": {
                "path": str(trimmed_cnf_path),
                "sha256": sha256(trimmed_cnf_path),
            },
            "dense_cnf": {
                "path": str(dense_cnf_path),
                "sha256": sha256(dense_cnf_path),
            },
            "greedy_family_core": {
                "path": str(greedy_path),
                "sha256": sha256(greedy_path),
            },
            "input_core_map": {
                "path": str(map_path),
                "sha256": sha256(map_path),
            },
            "input_core_cnf": {
                "path": str(core_path),
                "sha256": sha256(core_path),
            },
        },
        "validated_invariants": {
            "artifact_hashes": True,
            "canonical_dense_variable_bijection": True,
            "input_core_map_literal_order": True,
            "trimmed_to_dense_signed_literal_multiset": True,
            "retained_family_membership": True,
            "named_source_atom_occurrence_coverage": True,
            "no_trimmed_auxiliary_variables": True,
            "complete_injective_trimmed_clause_coverage": True,
        },
        "counts": audit_counts,
        "bindings_sha256": json_sha256(bindings),
        "clauses": bindings,
    }


def render_lean(namespace: str, bindings: list[dict[str, Any]]) -> str:
    if (
        not namespace
        or not namespace[0].isalpha()
        or not all(character.isalnum() or character in "._" for character in namespace)
    ):
        raise ValueError("invalid Lean namespace")
    rows = ",\n".join(
        "  #[" + ", ".join(map(str, binding["exact_dense_signed_clause"])) + "]"
        for binding in bindings
    )
    return f"""namespace {namespace}

/-- Exact signed clauses from the authenticated trimmed occurrence map.
This is data only: it makes no source-closure or UNSAT claim. -/
def p5LargestTrimmedClauses : Array (Array Int) := #[
{rows}
]

end {namespace}
"""


def fixture_entry(
    index: int, clause: tuple[int, ...], family: str, allocated_index: int
) -> dict[str, Any]:
    named = []
    for literal in clause:
        named.append(
            {
                "literal": literal,
                "name": f"atom_{abs(literal)}",
                "parameters": {"fixture_variable": abs(literal)},
                "polarity": "positive" if literal > 0 else "negative",
                "variable": abs(literal),
                "variable_family": "fixture_atom",
            }
        )
    return {
        "allocated_family": family,
        "allocated_input_clause_index": allocated_index,
        "allocated_input_clause_literal_order": list(reversed(clause)),
        "allocated_literal_order_matches_core": len(clause) < 2,
        "candidate_provenance": [
            {
                "family": family,
                "input_clause_index": allocated_index,
                "input_clause_literal_order": list(reversed(clause)),
                "literal_order_matches_core": len(clause) < 2,
                "semantic_parameters": {
                    "producer_function": "synthetic_fixture",
                    "fixture_clause": index,
                },
            }
        ],
        "canonical_signed_literal_multiset": sorted(clause),
        "core_clause_index": index,
        "core_clause_literal_order": list(clause),
        "duplicate_allocation_ordinal": 0 if index != 3 else 1,
        "family_ambiguous_across_candidates": False,
        "input_clause_index_candidates": [allocated_index],
        "match_status": "synthetic_authenticated",
        "named_literals": named,
        "possible_families": [family],
        "schema_orientation_candidates": [
            {"orientation": "fixture", "clause": index}
        ],
    }


def audit_live_pre_report_inputs() -> int | None:
    """Check the real map/greedy/core trio even before a report is published."""

    if not DEFAULT_GREEDY.is_file() or not DEFAULT_MAP.is_file():
        return None
    greedy = load_json(DEFAULT_GREEDY)
    mapping = load_json(DEFAULT_MAP)
    if sha256(DEFAULT_MAP) != str(greedy["map"]["sha256"]):
        raise ValueError("live greedy/map hash mismatch")
    core_path = recorded_path(greedy["core"], anchor=DEFAULT_GREEDY.parent)
    if sha256(core_path) != str(mapping["core"]["sha256"]):
        raise ValueError("live map/core hash mismatch")
    source_variable_count, source_clauses = parse_dimacs(core_path)
    validate_source_map(
        greedy, mapping, source_variable_count, source_clauses
    )
    return len(source_clauses)


def run_self_test() -> int | None:
    with tempfile.TemporaryDirectory(prefix="trimmed-occurrence-self-test-") as raw:
        directory = Path(raw)
        source_clauses = [(10, -20), (-10, 30), (10, -20), (40,)]
        core_path = directory / "p5.input-core.cnf"
        atomic_write(
            core_path,
            "p cnf 40 4\n10 -20 0\n-10 30 0\n10 -20 0\n40 0\n",
        )
        entries = [
            fixture_entry(1, source_clauses[0], "kept_a", 101),
            fixture_entry(2, source_clauses[1], "kept_b", 102),
            fixture_entry(3, source_clauses[2], "kept_a", 103),
            fixture_entry(4, source_clauses[3], "removed_c", 104),
        ]
        mapping = {
            "schema": MAP_SCHEMA,
            "profile": 5,
            "core": {
                "clause_count": 4,
                "header_variable_count": 40,
                "path": str(core_path),
                "sha256": sha256(core_path),
            },
            "matching_summary": {
                "allocation_is_injective": True,
                "canonically_unmatched_count": 0,
            },
            "core_clauses": entries,
        }
        map_path = directory / "p5.input-core-map.json"
        atomic_write(
            map_path,
            json.dumps(mapping, sort_keys=True, separators=(",", ":")) + "\n",
        )
        greedy = {
            "schema": GREEDY_SCHEMA,
            "profile": 5,
            "order": "largest",
            "seed": 0,
            "map": {"path": str(map_path), "sha256": sha256(map_path)},
            "core": {
                "path": str(core_path),
                "sha256": sha256(core_path),
                "clause_count": 4,
                "variable_count": 40,
            },
            "retained_families": ["kept_a", "kept_b"],
            "removed_optional_families": ["removed_c"],
            "retained_clause_count": 3,
            "retained_family_count": 2,
            "final_solver_result": {"status": "UNSAT"},
        }
        greedy_path = directory / "p5.greedy-family-largest-seed0.json"
        atomic_write(
            greedy_path,
            json.dumps(greedy, sort_keys=True, separators=(",", ":")) + "\n",
        )
        trimmed_path = directory / "p5-largest.trimmed.core.cnf"
        atomic_write(trimmed_path, "p cnf 3 2\n-2 1 0\n3 -1 0\n")
        dense_path = directory / "p5-largest.dense.cnf"
        atomic_write(
            dense_path,
            "p cnf 3 3\n1 -2 0\n-1 3 0\n1 -2 0\n",
        )
        report = {
            "schema": REPORT_SCHEMA,
            "input_provenance": {
                "mode": "AUTHENTICATED_P5_LARGEST_GREEDY_CORE",
                "greedy_result": {
                    "path": str(greedy_path),
                    "sha256": sha256(greedy_path),
                },
                "source_map": {
                    "path": str(map_path),
                    "sha256": sha256(map_path),
                },
                "source_core": {
                    "path": str(core_path),
                    "sha256": sha256(core_path),
                },
            },
            "retained_families": ["kept_a", "kept_b"],
            "retained_family_count": 2,
            "retained_clause_count_by_family": {"kept_a": 2, "kept_b": 1},
            "dense_variable_renaming": {
                "dense_variable_count": 3,
                "old_to_new": [[10, 1], [20, 2], [30, 3]],
            },
            "clause_numbering": {"core_to_input_clause_id": [3, 2]},
            "counts": {
                "dense_variable_count": 3,
                "dense_clause_count": 3,
                "trimmed_variable_count": 3,
                "trimmed_clause_count": 2,
            },
            "artifacts": {
                "dense_cnf": {
                    "path": str(dense_path),
                    "sha256": sha256(dense_path),
                    "byte_count": dense_path.stat().st_size,
                },
                "trimmed_core_cnf": {
                    "path": str(trimmed_path),
                    "sha256": sha256(trimmed_path),
                    "byte_count": trimmed_path.stat().st_size,
                }
            },
        }
        report_path = directory / "p5-largest.trimmed-certificate.json"
        atomic_write(
            report_path,
            json.dumps(report, sort_keys=True, separators=(",", ":")) + "\n",
        )
        output = generate(
            report_path=report_path,
            greedy_path=greedy_path,
            map_path=map_path,
        )
        assert output["counts"]["trimmed_clause_count"] == 2
        assert output["clauses"][0]["input_core_clause_index"] == 3
        assert output["clauses"][0]["exact_dense_signed_clause"] == [-2, 1]
        assert [
            atom["source_literal"]
            for atom in output["clauses"][0]["named_source_atoms"]
        ] == [-20, 10]
        assert "def p5LargestTrimmedClauses" in render_lean(
            "Problem97.Synthetic", output["clauses"]
        )

        failure_cases = []
        bad_report = copy.deepcopy(report)
        bad_report["dense_variable_renaming"]["old_to_new"][1][1] = 1
        failure_cases.append(
            (
                "non-bijective dense map",
                mapping,
                bad_report,
                [(-2, 1), (3, -1)],
            )
        )
        bad_report = copy.deepcopy(report)
        bad_report["clause_numbering"]["core_to_input_clause_id"] = [3, 3]
        failure_cases.append(
            ("duplicate occurrence", mapping, bad_report, [(-2, 1), (3, -1)])
        )
        bad_report = copy.deepcopy(report)
        bad_report["clause_numbering"]["core_to_input_clause_id"] = [3]
        failure_cases.append(
            ("incomplete coverage", mapping, bad_report, [(-2, 1), (3, -1)])
        )
        failure_cases.append(
            ("auxiliary variable", mapping, report, [(-2, 4), (3, -1)])
        )
        failure_cases.append(
            ("literal mismatch", mapping, report, [(-2, -1), (3, -1)])
        )
        for name, case_map, case_report, case_clauses in failure_cases:
            try:
                assemble_bridge(
                    greedy,
                    case_map,
                    40,
                    source_clauses,
                    case_report,
                    3,
                    case_clauses,
                )
            except ValueError:
                pass
            else:
                raise AssertionError(f"self-test failed to reject {name}")

        original_trimmed = trimmed_path.read_text(encoding="utf-8")
        atomic_write(trimmed_path, original_trimmed + "c tampered\n")
        try:
            generate(
                report_path=report_path,
                greedy_path=greedy_path,
                map_path=map_path,
            )
        except ValueError as error:
            if "hash mismatch" not in str(error):
                raise
        else:
            raise AssertionError("self-test failed to reject artifact hash drift")
    return audit_live_pre_report_inputs()


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--report", type=Path, default=DEFAULT_REPORT)
    parser.add_argument("--greedy", type=Path, default=DEFAULT_GREEDY)
    parser.add_argument("--input-core-map", type=Path, default=DEFAULT_MAP)
    parser.add_argument("--input-core-cnf", type=Path)
    parser.add_argument("--dense-cnf", type=Path)
    parser.add_argument("--trimmed-core-cnf", type=Path)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--lean-output", type=Path)
    parser.add_argument(
        "--lean-namespace",
        default="Problem97.ATailUniqueFourExactTwoTrimmedOccurrenceScratch",
    )
    parser.add_argument("--self-test", action="store_true")
    args = parser.parse_args()

    if args.self_test:
        live_clause_count = run_self_test()
        live_suffix = (
            f"; live pre-report map/core audit passed for {live_clause_count} clauses"
            if live_clause_count is not None
            else ""
        )
        print(
            "SELF-TEST PASS: valid fixture accepted; six invariant drifts rejected"
            + live_suffix
        )
        return 0
    if not args.report.is_file():
        parser.error(
            f"trimmed certificate report is not present yet: {args.report}; "
            "run --self-test meanwhile"
        )
    output = generate(
        report_path=args.report,
        greedy_path=args.greedy,
        map_path=args.input_core_map,
        core_override=args.input_core_cnf,
        dense_cnf_override=args.dense_cnf,
        trimmed_cnf_override=args.trimmed_core_cnf,
    )
    encoded = json.dumps(
        output, ensure_ascii=False, separators=(",", ":"), sort_keys=True
    ) + "\n"
    atomic_write(args.output.resolve(), encoded)
    if args.lean_output is not None:
        lean = render_lean(args.lean_namespace, output["clauses"])
        atomic_write(args.lean_output.resolve(), lean)
    print(
        json.dumps(
            {
                "status": "ok",
                "output": str(args.output.resolve()),
                "output_sha256": sha256(args.output.resolve()),
                "trimmed_clause_count": output["counts"][
                    "trimmed_clause_count"
                ],
                "bindings_sha256": output["bindings_sha256"],
                "lean_output": (
                    str(args.lean_output.resolve())
                    if args.lean_output is not None
                    else None
                ),
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
