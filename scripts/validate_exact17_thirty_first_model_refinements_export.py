"""Validate the proposed Lean-owned exact-17 child32 DIMACS export.

The publication ledger is a trust boundary, so production validation always
calls ``validate_published_outputs`` from the child31 cancellation-family
generator before inspecting the DIMACS.  Python never authors successor
clauses here: it independently regenerates their expected signed-DIMACS view
and compares it with the bytes emitted by Lean.

The live child32 artifact is pinned to its independently validated Lean export,
byte count, SHA-256, and publication ledger. Passing an unprovisioned test spec
remains fail-closed by default.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
from collections.abc import Callable
from dataclasses import dataclass
from pathlib import Path
from typing import Any, BinaryIO

ROOT = Path(__file__).resolve().parents[1]
SCRIPTS = ROOT / "scripts"
PUBLICATION_VALIDATOR = (
    SCRIPTS / "generate_exact17_thirty_first_all_cancellation_refinements.py"
)
sys.path.insert(0, str(SCRIPTS))

from validate_exact17_fifth_convex_five_point_export import (
    ORDERS,
    expected_clause,
)

VARIABLES = 308
PARENT_CLAUSES = 5_846_904
NEW_CLAUSES = 336
CHILD_CLAUSES = PARENT_CLAUSES + NEW_CLAUSES
PARENT_SHA256 = "3c847c1ebcacf85256b65d54563584a8b89eb50f427fe268e2f916d4cdafa204"
LEDGER_SCHEMA = "p97-exact17-child31-all-minimal-two-kalmanson/v2"
EXPECTED_OUTPUT_PATHS = tuple(
    str((ROOT / "lean/Erdos9796Proof/P97/ATail" / name).resolve())
    for name in (
        "BlockerVExactSeventeenThirtyFirstModelRefinements.lean",
        "BlockerVExactSeventeenThirtyFirstModelRefinementsShard0.lean",
        "BlockerVExactSeventeenThirtyFirstModelRefinementsShard1.lean",
        "BlockerVExactSeventeenThirtyFirstModelRefinementsShard2.lean",
        "BlockerVExactSeventeenThirtyFirstModelRefinementsShard3.lean",
    )
)


class UnprovisionedError(ValueError):
    """The candidate is structurally inspectable but not production-pinned."""


@dataclass(frozen=True)
class ExportSpec:
    variables: int
    parent_clauses: int
    new_clauses: int
    parent_sha256: str
    child_sha256: str | None
    child_bytes: int | None
    ledger_schema: str
    ledger_sha256: str | None
    occurrence_count: int
    expected_output_paths: tuple[str, ...]
    publication_state: str

    @property
    def child_clauses(self) -> int:
        return self.parent_clauses + self.new_clauses

    @property
    def provisioned(self) -> bool:
        return (
            self.publication_state == "PROVISIONED"
            and self.child_sha256 is not None
            and self.child_bytes is not None
            and self.ledger_sha256 is not None
        )


PRODUCTION_SPEC = ExportSpec(
    variables=VARIABLES,
    parent_clauses=PARENT_CLAUSES,
    new_clauses=NEW_CLAUSES,
    parent_sha256=PARENT_SHA256,
    child_sha256="c325d3eedda8fe81e3d1c1d70645024f5b9ea8c36c20ca5cd1896f0934296a7d",
    child_bytes=291_620_182,
    ledger_schema=LEDGER_SCHEMA,
    ledger_sha256="fd1ffabf7d8abf1124d8f5376b82ff1db43226ffe1aa7428d7de41ba5c4f5654",
    occurrence_count=84,
    expected_output_paths=EXPECTED_OUTPUT_PATHS,
    publication_state="PROVISIONED",
)

PublicationValidator = Callable[..., dict[str, Any]]


@dataclass(frozen=True)
class PublicationInputs:
    lean_output: Path
    analysis: Path
    parent_ledger: Path
    parent_cnf: Path


PRODUCTION_PUBLICATION_INPUTS = PublicationInputs(
    lean_output=ROOT
    / "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenThirtyFirstModelRefinements.lean",
    analysis=ROOT
    / "scratch/exact17-lean-to-sat/audit-thirty-first-model-analysis-hardened.json",
    parent_ledger=ROOT
    / "scratch/exact17-lean-to-sat/"
    "piqd-thirtieth-root-all-cancellation-family.json",
    parent_cnf=ROOT
    / "scratch/exact17-lean-to-sat/"
    "exact17-thirty-first-root-thirtieth-model-refinements.cnf",
)


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def _strict_object(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def strict_json_read(path: Path) -> dict[str, Any]:
    value = json.loads(
        path.read_text(encoding="utf-8"), object_pairs_hook=_strict_object
    )
    if not isinstance(value, dict):
        raise TypeError(f"expected JSON object: {path}")
    return value


def load_publication_validator() -> PublicationValidator:
    """Load the strict publisher API from its live, separately-owned script."""
    spec = importlib.util.spec_from_file_location(
        "_exact17_child32_publication_validator", PUBLICATION_VALIDATOR
    )
    if spec is None or spec.loader is None:
        raise RuntimeError("cannot load child32 publication validator")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    validator = getattr(module, "validate_published_outputs", None)
    if not callable(validator):
        raise TypeError("child32 publisher has no validate_published_outputs API")
    return validator


def call_publication_validator(
    validator: PublicationValidator,
    ledger_path: Path,
    inputs: PublicationInputs,
) -> dict[str, Any]:
    return validator(
        ledger_path,
        lean_output=inputs.lean_output,
        analysis_path=inputs.analysis,
        parent_ledger_path=inputs.parent_ledger,
        parent_cnf_path=inputs.parent_cnf,
    )


def _read_header(handle: BinaryIO, path: Path) -> tuple[int, int]:
    try:
        fields = handle.readline().decode("ascii").split()
    except UnicodeDecodeError as error:
        raise ValueError(f"non-ASCII DIMACS header: {path}") from error
    if len(fields) != 4 or fields[:2] != ["p", "cnf"]:
        raise ValueError(f"malformed DIMACS header: {path}")
    try:
        return int(fields[2]), int(fields[3])
    except ValueError as error:
        raise ValueError(f"non-integer DIMACS header: {path}") from error


def _parse_clause(line: bytes, *, variables: int, context: str) -> tuple[int, ...]:
    try:
        fields = tuple(int(token) for token in line.split())
    except ValueError as error:
        raise ValueError(f"non-integer DIMACS clause: {context}") from error
    if len(fields) < 2 or fields[-1] != 0:
        raise ValueError(f"unterminated or empty DIMACS clause: {context}")
    clause = fields[:-1]
    if any(literal == 0 or abs(literal) > variables for literal in clause):
        raise ValueError(f"DIMACS literal out of range: {context}")
    return clause


def _canonical_hits(entry: dict[str, Any], index: int) -> tuple[tuple[int, int], ...]:
    raw = entry.get("hits")
    if not isinstance(raw, list):
        raise TypeError(f"ledger entry {index} has no hits")
    hits: list[tuple[int, int]] = []
    for pair in raw:
        if (
            not isinstance(pair, list)
            or len(pair) != 2
            or type(pair[0]) is not int
            or type(pair[1]) is not int
        ):
            raise TypeError(f"ledger entry {index} has a malformed hit")
        hit = (pair[0], pair[1])
        if not all(0 <= value < 17 for value in hit) or hit[0] == hit[1]:
            raise ValueError(f"ledger entry {index} has an invalid hit")
        hits.append(hit)
    result = tuple(hits)
    if not result or result != tuple(sorted(result)) or len(set(result)) != len(result):
        raise ValueError(f"ledger entry {index} hits are not nonempty canonical support")
    return result


def _order_table_sha256() -> str:
    encoded = json.dumps([list(order) for order in ORDERS], separators=(",", ":"))
    return hashlib.sha256(encoded.encode("ascii")).hexdigest()


def _semantic_clause_key(clause: tuple[int, ...]) -> frozenset[int]:
    """Normalize a DIMACS clause without rewriting authenticated parent bytes."""
    return frozenset(clause)


def _canonical_clause_key(clause: tuple[int, ...]) -> frozenset[int]:
    """Normalize a newly generated clause and require canonical literals."""
    key = _semantic_clause_key(clause)
    if len(key) != len(clause):
        raise ValueError("duplicate literals within one appended DIMACS clause are forbidden")
    if any(-literal in key for literal in key):
        raise ValueError("tautological appended DIMACS clauses are forbidden")
    return key


def _expected_suffix(
    ledger: dict[str, Any], spec: ExportSpec
) -> list[tuple[int, ...]]:
    if ledger.get("schema") != spec.ledger_schema:
        raise ValueError("wrong child32 publication ledger schema")
    required_counts = {
        "minimal_support_count": spec.occurrence_count,
        "parent_subsumed_support_count": 0,
        "emitted_clause_count": spec.new_clauses,
        "shard_count": 4,
    }
    for key, expected in required_counts.items():
        if ledger.get(key) != expected:
            raise ValueError(f"publication ledger {key} drifted")
    if ledger.get("publication_protocol") != (
        "immutable-outputs-then-ledger-last+shared-read-lock/v2"
    ):
        raise ValueError("publication ledger protocol drifted")
    parent = ledger.get("parent_cnf")
    if (
        not isinstance(parent, dict)
        or set(parent) != {"path", "sha256", "bytes_verified"}
        or not isinstance(parent["path"], str)
        or not parent["path"]
        or parent["sha256"] != spec.parent_sha256
        or parent["bytes_verified"] is not True
    ):
        raise ValueError("publication ledger lacks exact verified-parent binding")
    outputs = ledger.get("generated_outputs")
    if not isinstance(outputs, dict) or not outputs:
        raise ValueError("publication ledger has no generated outputs")
    if spec.expected_output_paths and tuple(sorted(outputs)) != tuple(
        sorted(spec.expected_output_paths)
    ):
        raise ValueError("publication ledger names the wrong Lean output set")

    named = ledger.get("named_order")
    if not isinstance(named, dict):
        raise TypeError("publication ledger has no named-order identity")
    index = named.get("index")
    if type(index) is not int or not 0 <= index < len(ORDERS):
        raise ValueError("publication ledger named-order index is invalid")
    if named.get("tuple") != list(ORDERS[index]):
        raise ValueError("publication ledger named-order tuple drifted")
    if named.get("reverse_tuple") != list(reversed(ORDERS[index])):
        raise ValueError("publication ledger reverse-order tuple drifted")
    if named.get("table_sha256") != _order_table_sha256():
        raise ValueError("publication ledger order-table hash drifted")

    entries = ledger.get("entries")
    if not isinstance(entries, list) or len(entries) != spec.occurrence_count:
        raise ValueError("publication ledger occurrence count drifted")
    supports: list[frozenset[tuple[int, int]]] = []
    clauses: list[tuple[int, ...]] = []
    for entry_index, entry in enumerate(entries):
        if not isinstance(entry, dict):
            raise TypeError(f"ledger entry {entry_index} is not an object")
        hits = _canonical_hits(entry, entry_index)
        support = frozenset(hits)
        if any(previous <= support or support <= previous for previous in supports):
            raise ValueError("publication ledger has duplicate or nonminimal support")
        supports.append(support)
        for order_index, order in enumerate(ORDERS):
            for reverse in (False, True):
                clauses.append(
                    expected_clause(order_index, order, hits, reverse=reverse)
                )
    if len(clauses) != spec.new_clauses:
        raise ValueError("independent child32 clause count drifted")
    clause_keys = [_canonical_clause_key(clause) for clause in clauses]
    if len(set(clause_keys)) != len(clause_keys):
        raise ValueError("duplicate policy forbids duplicate appended clauses")
    return clauses


def validate_export(
    parent_path: Path,
    child_path: Path,
    ledger_path: Path,
    *,
    spec: ExportSpec = PRODUCTION_SPEC,
    publication_validator: PublicationValidator | None = None,
    publication_inputs: PublicationInputs = PRODUCTION_PUBLICATION_INPUTS,
    allow_unprovisioned: bool = False,
) -> dict[str, Any]:
    """Authenticate and independently replay the exact ordered child32 suffix."""
    validator = publication_validator or load_publication_validator()
    first_ledger_sha256 = sha256_file(ledger_path)
    ledger = call_publication_validator(validator, ledger_path, publication_inputs)
    if not isinstance(ledger, dict):
        raise TypeError("publication validator did not return a ledger object")
    if spec.ledger_sha256 is not None and first_ledger_sha256 != spec.ledger_sha256:
        raise ValueError("publication ledger SHA-256 drifted")
    if not spec.provisioned and not allow_unprovisioned:
        raise UnprovisionedError("child32 production export is UNPROVISIONED")

    if sha256_file(parent_path) != spec.parent_sha256:
        raise ValueError("unauthenticated child31 parent bytes")
    expected_suffix = _expected_suffix(ledger, spec)
    expected_suffix_keys = {
        _canonical_clause_key(clause) for clause in expected_suffix
    }
    suffix_digest = hashlib.sha256()
    parent_duplicate_literal_clauses = 0

    with parent_path.open("rb") as parent, child_path.open("rb") as child:
        if _read_header(parent, parent_path) != (spec.variables, spec.parent_clauses):
            raise ValueError("unexpected child31 parent DIMACS header")
        if _read_header(child, child_path) != (spec.variables, spec.child_clauses):
            raise ValueError("unexpected child32 DIMACS header")
        for index in range(spec.parent_clauses):
            parent_line = parent.readline()
            child_line = child.readline()
            if not parent_line:
                raise ValueError(f"parent is missing clause {index + 1}")
            if parent_line != child_line:
                raise ValueError(f"parent-prefix byte mismatch at clause {index + 1}")
            parent_clause = _parse_clause(
                parent_line, variables=spec.variables, context=f"parent/{index}"
            )
            parent_key = _semantic_clause_key(parent_clause)
            if len(parent_key) != len(parent_clause):
                parent_duplicate_literal_clauses += 1
            if parent_key in expected_suffix_keys:
                raise ValueError("duplicate policy forbids a successor clause already in parent")
        if parent.readline():
            raise ValueError("parent contains extra clauses")

        observed_suffix: list[tuple[int, ...]] = []
        for suffix_index, expected in enumerate(expected_suffix):
            line = child.readline()
            if not line:
                raise ValueError(f"child32 suffix is missing clause {suffix_index + 1}")
            observed = _parse_clause(
                line, variables=spec.variables, context=f"suffix/{suffix_index}"
            )
            if observed != expected:
                raise ValueError(f"child32 ordered suffix drift at clause {suffix_index + 1}")
            observed_suffix.append(observed)
            suffix_digest.update(line)
        if child.readline():
            raise ValueError("child32 contains extra clauses")
    if len({_canonical_clause_key(clause) for clause in observed_suffix}) != len(
        observed_suffix
    ):
        raise ValueError("duplicate policy forbids duplicate observed suffix clauses")

    child_sha256 = sha256_file(child_path)
    child_bytes = child_path.stat().st_size
    if spec.child_sha256 is not None and child_sha256 != spec.child_sha256:
        raise ValueError("Lean-owned child32 SHA-256 drifted")
    if spec.child_bytes is not None and child_bytes != spec.child_bytes:
        raise ValueError("Lean-owned child32 byte count drifted")

    second_ledger = call_publication_validator(
        validator, ledger_path, publication_inputs
    )
    if second_ledger != ledger or sha256_file(ledger_path) != first_ledger_sha256:
        raise ValueError("publication changed during DIMACS validation")
    status = "PASS" if spec.provisioned else "UNPROVISIONED"
    return {
        "schema": "p97-exact17-thirty-first-model-refinements-export-validation/v1",
        "status": status,
        "publication_state": spec.publication_state,
        "parent_prefix_byte_identical": True,
        "parent_sha256": spec.parent_sha256,
        "child_sha256": child_sha256,
        "child_bytes": child_bytes,
        "variables": spec.variables,
        "clauses": spec.child_clauses,
        "new_clauses": spec.new_clauses,
        "ordered_suffix_sha256": suffix_digest.hexdigest(),
        "ordered_suffix_exact": True,
        "missing_clauses": 0,
        "extra_clauses": 0,
        "duplicate_policy": (
            "authenticated-parent-semantic-normalization+canonical-suffix/v2"
        ),
        "parent_duplicate_literal_clauses": parent_duplicate_literal_clauses,
        "duplicate_clauses": 0,
        "minimal_occurrences": spec.occurrence_count,
        "publication_validator_called_twice": True,
        "publication_ledger_sha256": first_ledger_sha256,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--parent", type=Path, required=True)
    parser.add_argument("--child", type=Path, required=True)
    parser.add_argument("--ledger", type=Path, required=True)
    parser.add_argument("--report", type=Path)
    parser.add_argument(
        "--inspect-unprovisioned",
        action="store_true",
        help="structurally inspect a candidate but emit no production PASS",
    )
    args = parser.parse_args()
    report = validate_export(
        args.parent,
        args.child,
        args.ledger,
        allow_unprovisioned=args.inspect_unprovisioned,
    )
    rendered = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.report is not None:
        args.report.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
