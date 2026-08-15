#!/usr/bin/env python3
"""Validate an append-only PIQD formula as root DIMACS plus cut receipts."""

from __future__ import annotations

import hashlib
import json
from collections.abc import Iterable
from dataclasses import dataclass
from pathlib import Path
from typing import Any

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
V1_SCHEMA = "p97-piqd-two-kalmanson-label-cut-admission-v1"
V2_SCHEMA = "p97-piqd-two-kalmanson-label-cut-admission-v2"
SCHEMAS = {V1_SCHEMA, V2_SCHEMA}


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def repo_path(value: str | Path) -> Path:
    path = Path(value)
    return path.resolve() if path.is_absolute() else (REPO / path).resolve()


def relative(path: Path) -> str:
    return str(path.resolve().relative_to(REPO))


def clauses_digest(clauses: Iterable[tuple[int, ...]]) -> str:
    digest = hashlib.sha256()
    for clause in clauses:
        digest.update((" ".join(map(str, clause)) + " 0\n").encode())
    return digest.hexdigest()


def clause_satisfied(clause: tuple[int, ...], assignment: dict[int, bool]) -> bool:
    return any(assignment[abs(literal)] == (literal > 0) for literal in clause)


def require_fields(value: dict[str, Any], expected: dict[str, Any], where: str) -> None:
    for key, wanted in expected.items():
        if value.get(key) != wanted:
            raise ValueError(f"{where} field {key!r} disagrees with the chain")


def parse_receipt_clauses(value: Any, variables: int) -> tuple[tuple[int, ...], ...]:
    if type(value) is not list:
        raise TypeError("receipt appended_clauses is not a list")
    result = []
    for index, raw_clause in enumerate(value, start=1):
        if type(raw_clause) is not list or not raw_clause:
            raise ValueError(f"receipt clause {index} is not a nonempty list")
        clause = tuple(raw_clause)
        if any(type(literal) is not int or literal == 0 for literal in clause):
            raise ValueError(f"receipt clause {index} has a non-integer or zero literal")
        if any(abs(literal) > variables for literal in clause):
            raise ValueError(f"receipt clause {index} exceeds max_var")
        result.append(clause)
    return tuple(result)


@dataclass(frozen=True)
class FormulaChain:
    root_cnf: Path
    root_cnf_sha256: str
    session_id: str
    variables: int
    root_clauses: int
    clauses: int
    receipt_paths: tuple[Path, ...]
    receipt_sha256s: tuple[str, ...]
    appended_batches: tuple[tuple[tuple[int, ...], ...], ...]

    @property
    def appended_clauses(self) -> int:
        return self.clauses - self.root_clauses


def validate_formula_chain(
    *,
    root_cnf: Path,
    root_cnf_sha256: str,
    variables: int,
    root_clauses: int,
    receipt_paths: Iterable[Path],
    expected_session_id: str | None = None,
    validate_generation_sources: bool = True,
) -> FormulaChain:
    root = root_cnf.resolve()
    if sha256(root) != root_cnf_sha256:
        raise ValueError("root CNF SHA-256 mismatch")
    if variables < 1 or root_clauses < 1:
        raise ValueError("formula dimensions must be positive")

    running = root_clauses
    session_id = expected_session_id
    previous_after: dict[str, Any] | None = None
    paths = tuple(path.resolve() for path in receipt_paths)
    hashes: list[str] = []
    batches: list[tuple[tuple[int, ...], ...]] = []
    for number, path in enumerate(paths, start=1):
        receipt_hash = sha256(path)
        receipt = json.loads(path.read_text())
        if receipt.get("schema") not in SCHEMAS:
            raise ValueError(f"cut receipt {number} has an unsupported schema")
        current_session = receipt.get("session_id")
        if not isinstance(current_session, str) or not current_session:
            raise ValueError(f"cut receipt {number} has no session id")
        if session_id is None:
            session_id = current_session
        if current_session != session_id:
            raise ValueError(f"cut receipt {number} belongs to another session")
        if receipt.get("variables") != variables:
            raise ValueError(f"cut receipt {number} has the wrong max_var")
        if receipt.get("base_clauses") != running:
            raise ValueError(f"cut receipt {number} does not continue the chain")

        clauses = parse_receipt_clauses(receipt.get("appended_clauses"), variables)
        require_fields(
            receipt,
            {
                "appended_clause_count": len(clauses),
                "appended_clause_sha256": clauses_digest(clauses),
            },
            f"cut receipt {number}",
        )
        before = receipt.get("session_before")
        after = receipt.get("session_after")
        if not isinstance(before, dict) or not isinstance(after, dict):
            raise TypeError(f"cut receipt {number} lacks session snapshots")
        require_fields(
            before,
            {
                "id": session_id,
                "lane": "sat",
                "state": "live",
                "clauses": running,
                "max_var": variables,
            },
            f"cut receipt {number} before",
        )
        after_count = running + len(clauses)
        require_fields(
            after,
            {
                "id": session_id,
                "lane": "sat",
                "state": "live",
                "clauses": after_count,
                "max_var": variables,
            },
            f"cut receipt {number} after",
        )
        require_fields(
            receipt.get("add_response", {}),
            {"added": len(clauses), "clauses": after_count, "max_var": variables},
            f"cut receipt {number} add response",
        )
        if previous_after is not None:
            require_fields(
                before,
                {
                    "id": previous_after.get("id"),
                    "clauses": previous_after.get("clauses"),
                    "max_var": previous_after.get("max_var"),
                },
                f"cut receipt {number} continuity",
            )
        if number == 1:
            recorded_root = receipt.get("base_cnf_sha256")
            if recorded_root is not None and recorded_root != root_cnf_sha256:
                raise ValueError("first cut receipt is not based on the root CNF")
        if receipt.get("schema") == V2_SCHEMA:
            require_fields(
                receipt,
                {
                    "root_cnf_sha256": root_cnf_sha256,
                    "parent_cut_receipt_sha256s": hashes,
                },
                f"cut receipt {number} ancestry",
            )
        if validate_generation_sources:
            source_hashes = receipt.get("generation_source_hashes")
            if not isinstance(source_hashes, dict) or not source_hashes:
                raise ValueError(f"cut receipt {number} lacks frozen generation sources")
            for source, expected_hash in source_hashes.items():
                if sha256(repo_path(source)) != expected_hash:
                    raise ValueError(
                        f"cut receipt {number} generation source changed: {source}"
                    )
        for key in ("model_log", "analysis"):
            recorded_path = receipt.get(key)
            recorded_hash = receipt.get(f"{key}_sha256")
            if not isinstance(recorded_path, str) or not isinstance(recorded_hash, str):
                raise TypeError(f"cut receipt {number} lacks {key} custody")
            if sha256(repo_path(recorded_path)) != recorded_hash:
                raise ValueError(f"cut receipt {number} {key} SHA-256 mismatch")

        hashes.append(receipt_hash)
        batches.append(clauses)
        running = after_count
        previous_after = after

    if session_id is None:
        raise ValueError("a PIQD formula chain requires a session id")
    return FormulaChain(
        root_cnf=root,
        root_cnf_sha256=root_cnf_sha256,
        session_id=session_id,
        variables=variables,
        root_clauses=root_clauses,
        clauses=running,
        receipt_paths=paths,
        receipt_sha256s=tuple(hashes),
        appended_batches=tuple(batches),
    )


def verify_appended_assignment(
    chain: FormulaChain, assignment: dict[int, bool]
) -> int:
    checked = 0
    violations: list[tuple[int, int]] = []
    for batch_index, batch in enumerate(chain.appended_batches, start=1):
        for clause_index, clause in enumerate(batch, start=1):
            if not clause_satisfied(clause, assignment):
                violations.append((batch_index, clause_index))
                if len(violations) == 20:
                    raise ValueError(f"model violates receipt clauses {violations}")
            checked += 1
    if violations:
        raise ValueError(f"model violates receipt clauses {violations}")
    return checked


def validate_solve_receipt(
    *,
    path: Path,
    chain: FormulaChain,
    model_log: Path,
) -> dict[str, Any]:
    receipt = json.loads(path.resolve().read_text())
    if receipt.get("schema") != "p97-piqd-sat-session-model-capture-v1":
        raise ValueError("unexpected PIQD solve-receipt schema")
    before = receipt.get("session_before")
    if not isinstance(before, dict):
        raise TypeError("PIQD solve receipt lacks a session-before snapshot")
    require_fields(
        before,
        {
            "id": chain.session_id,
            "lane": "sat",
            "state": "live",
            "clauses": chain.clauses,
            "max_var": chain.variables,
        },
        "PIQD solve receipt",
    )
    if Path(receipt.get("model_log", "")).resolve() != model_log.resolve():
        raise ValueError("PIQD solve receipt names a different model log")
    if receipt.get("model_log_sha256") != sha256(model_log.resolve()):
        raise ValueError("PIQD solve receipt model SHA-256 mismatch")
    if receipt.get("model_literals") != chain.variables:
        raise ValueError("PIQD solve receipt has an incomplete model")
    response = receipt.get("solve_response")
    if not isinstance(response, dict) or response.get("status") != "SAT":
        raise ValueError("PIQD solve receipt does not record SAT")
    return receipt
