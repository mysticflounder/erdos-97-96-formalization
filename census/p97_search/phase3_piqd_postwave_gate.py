"""Authenticate the mandatory P97 post-wave theorem-search gate.

PIQD is only the incremental SAT engine.  A SAT model may authorize another
wave only after the lane has searched the current model *and* the accumulated
history for a reusable, source-backed theorem.  This module makes that review
an explicit, fail-closed receipt boundary.

The gate deliberately does not infer mathematical entitlement from a clause.
It binds an existing source-backed refinement receipt to the completed solve,
model, source analysis, theorem-bank search, and successor CNF.  A documented
``no_justified_lift`` outcome completes the review but cannot authorize another
solver wave.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import stat
from collections.abc import Iterator, Mapping, Sequence
from dataclasses import dataclass
from itertools import chain, zip_longest
from pathlib import Path, PurePosixPath
from typing import Any

from census.p97_search.phase3_piqd_clause_admission import (
    ClauseAdmissionError,
    audit_clause_admission,
)
from census.p97_search.phase3_piqd_incremental_discovery import (
    PiqdIncrementalDiscoveryError,
    parse_dimacs,
)

SCHEMA = "p97-piqd-postwave-theorem-search/v1"
STATUS = "authenticated-postwave-review"
LEAN_CORPUS = "erdos-97-96-formalization-lean"
MAX_JSON_BYTES = 16 * 1024 * 1024
HEX64 = frozenset("0123456789abcdef")
THEOREM_BANK_PATHS = frozenset(
    {
        "docs/general-n-certificate-bank-mining-2026-07-09.md",
        "certificates/p97_rvol_general_n_mining.md",
        "certificates/p97_rvol_general_n_mining.json",
        "certificates/erdos97_legacy_general_n_mining.md",
        "certificates/erdos97_legacy_general_n_mining.json",
        "certificates/erdos_general_theorem_p97_mining.md",
        "certificates/erdos_general_theorem_p97_mining.json",
    }
)
REFINEMENT_STATUS = "checked-source-backed-witness-instance-refinement"
LEGACY_BOOTSTRAP_LANE = "exact17-rigid221-lazy"
LEGACY_BOOTSTRAP_ORDINAL = 48
LEGACY_BOOTSTRAP_RESULTS_SNAPSHOT = (
    "scratch/p97-exact17-piqd-wave6-canary-v1/"
    "wave48-legacy-results-index.snapshot.md"
)
LEGACY_BOOTSTRAP_ROLES = frozenset(
    {
        "legacy-results-index",
        "accumulated-family-receipt",
        "wave46-search-log",
        "wave47-search-log",
    }
)


class PostwaveGateError(ValueError):
    """The post-wave review or its custody chain failed closed."""


@dataclass(frozen=True)
class PostwaveAuthorization:
    wave_ordinal: int
    outcome: str
    successor_authorized: bool
    source_session_id: str
    source_solve_index: int
    source_solver_sha256: str
    input_root_sha256: str
    successor_root_sha256: str | None
    lean_consumer: str | None
    admitted_clauses: tuple[tuple[int, ...], ...]


def _fail(message: str) -> None:
    raise PostwaveGateError(message)


def _reject_constant(value: str) -> None:
    raise ValueError(f"non-standard JSON constant: {value}")


def _reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def canonical_json_bytes(value: Any) -> bytes:
    try:
        return json.dumps(
            value,
            sort_keys=True,
            separators=(",", ":"),
            ensure_ascii=False,
            allow_nan=False,
        ).encode("utf-8")
    except (TypeError, ValueError, UnicodeError) as exc:
        raise PostwaveGateError("value is not strict JSON") from exc


def _strict_json(data: bytes, *, label: str) -> Any:
    try:
        return json.loads(
            data.decode("utf-8"),
            object_pairs_hook=_reject_duplicate_keys,
            parse_constant=_reject_constant,
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise PostwaveGateError(f"{label} must be strict JSON") from exc


def _object(value: Any, *, label: str) -> Mapping[str, Any]:
    if type(value) is not dict:
        _fail(f"{label} must be a JSON object")
    return value


def _keys(value: Mapping[str, Any], expected: set[str], *, label: str) -> None:
    if set(value) != expected:
        missing = sorted(expected - set(value))
        extra = sorted(set(value) - expected)
        _fail(f"{label} has wrong keys (missing={missing}, extra={extra})")


def _string(value: Any, *, label: str) -> str:
    if type(value) is not str or not value:
        _fail(f"{label} must be a nonempty builtin string")
    return value


def _integer(value: Any, *, label: str, minimum: int = 0) -> int:
    if type(value) is not int or value < minimum:
        _fail(f"{label} must be a builtin integer >= {minimum}")
    return value


def _true(value: Any, *, label: str) -> None:
    if value is not True:
        _fail(f"{label} must be the builtin boolean true")


def _false(value: Any, *, label: str) -> None:
    if value is not False:
        _fail(f"{label} must be the builtin boolean false")


def _sha256_string(value: Any, *, label: str) -> str:
    digest = _string(value, label=label)
    if len(digest) != 64 or any(char not in HEX64 for char in digest):
        _fail(f"{label} must be a lowercase SHA-256 digest")
    return digest


def _repo_path(value: Any, *, label: str) -> PurePosixPath:
    raw = _string(value, label=label)
    path = PurePosixPath(raw)
    if (
        path.is_absolute()
        or not path.parts
        or any(part in {"", ".", ".."} for part in path.parts)
    ):
        _fail(f"{label} must be a normalized repository-relative path")
    return path


def _hash_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _artifact(
    value: Any, *, repo_root: Path, label: str, expected_path: str | None = None
) -> tuple[Path, str]:
    obj = _object(value, label=label)
    _keys(obj, {"path", "sha256"}, label=label)
    relative = _repo_path(obj["path"], label=f"{label}.path")
    if expected_path is not None and relative.as_posix() != expected_path:
        _fail(f"{label}.path must equal {expected_path}")
    expected = _sha256_string(obj["sha256"], label=f"{label}.sha256")
    path = repo_root
    for index, part in enumerate(relative.parts):
        path /= part
        try:
            info = os.lstat(path)
        except OSError as exc:
            raise PostwaveGateError(f"{label} is not readable") from exc
        if stat.S_ISLNK(info.st_mode):
            _fail(f"{label} path must not traverse a symlink")
        if index < len(relative.parts) - 1 and not stat.S_ISDIR(info.st_mode):
            _fail(f"{label} parent path must contain only directories")
    if not stat.S_ISREG(info.st_mode):
        _fail(f"{label} must be a regular non-symlink file")
    if _hash_file(path) != expected:
        _fail(f"{label} SHA-256 does not match the receipt")
    return path, expected


def _load_json_artifact(path: Path, *, label: str) -> Mapping[str, Any]:
    data = path.read_bytes()
    if len(data) > MAX_JSON_BYTES:
        _fail(f"{label} exceeds the JSON size bound")
    return _object(_strict_json(data, label=label), label=label)


def _dimacs_header(path: Path) -> tuple[int, int]:
    with path.open("r", encoding="ascii") as stream:
        for line in stream:
            stripped = line.strip()
            if not stripped or stripped.startswith("c"):
                continue
            fields = stripped.split()
            if len(fields) != 4 or fields[:2] != ["p", "cnf"]:
                _fail("input root has no valid leading DIMACS header")
            try:
                variables = int(fields[2])
                clauses = int(fields[3])
            except ValueError as exc:
                raise PostwaveGateError(
                    "input root DIMACS dimensions are invalid"
                ) from exc
            if variables < 1 or clauses < 1:
                _fail("input root DIMACS dimensions must be positive")
            return variables, clauses
    _fail("input root is empty")


def _iter_dimacs_clauses(path: Path) -> Iterator[tuple[int, ...]]:
    """Stream a strict DIMACS body and verify its declared dimensions."""

    variables: int | None = None
    declared_clauses: int | None = None
    seen_clauses = 0
    pending: list[int] = []
    with path.open("r", encoding="ascii") as stream:
        for line in stream:
            stripped = line.strip()
            if not stripped or stripped.startswith("c"):
                continue
            if variables is None:
                fields = stripped.split()
                if len(fields) != 4 or fields[:2] != ["p", "cnf"]:
                    _fail("DIMACS artifact has no valid leading header")
                try:
                    variables, declared_clauses = int(fields[2]), int(fields[3])
                except ValueError as exc:
                    raise PostwaveGateError("DIMACS dimensions are invalid") from exc
                if variables < 1 or declared_clauses < 1:
                    _fail("DIMACS dimensions must be positive")
                continue
            if stripped.startswith("p"):
                _fail("DIMACS artifact has a misplaced header")
            for raw in stripped.split():
                try:
                    literal = int(raw)
                except ValueError as exc:
                    raise PostwaveGateError(
                        "DIMACS artifact contains a non-integer token"
                    ) from exc
                if literal == 0:
                    seen_clauses += 1
                    yield tuple(pending)
                    pending.clear()
                else:
                    if abs(literal) > variables:
                        _fail("DIMACS literal exceeds the declared variable universe")
                    pending.append(literal)
    if variables is None:
        _fail("DIMACS artifact is empty")
    if pending:
        _fail("DIMACS artifact has an unterminated clause")
    assert declared_clauses is not None
    if seen_clauses != declared_clauses:
        _fail("DIMACS body count does not match its header")


def _verify_model_satisfies_root(root_path: Path, *, literals: Sequence[int]) -> None:
    signs = tuple(literal > 0 for literal in literals)
    for index, clause in enumerate(_iter_dimacs_clauses(root_path), start=1):
        if not any(signs[abs(literal) - 1] is (literal > 0) for literal in clause):
            _fail(f"captured model does not satisfy input root clause {index}")


def _verify_successor_body(
    *, input_root: Path, fragment: Sequence[Sequence[int]], successor: Path
) -> None:
    marker = object()
    expected = chain(_iter_dimacs_clauses(input_root), map(tuple, fragment))
    actual = _iter_dimacs_clauses(successor)
    for index, (expected_clause, actual_clause) in enumerate(
        zip_longest(expected, actual, fillvalue=marker), start=1
    ):
        if expected_clause != actual_clause:
            _fail(
                "successor DIMACS body is not exactly input root plus refinement "
                f"at clause {index}"
            )


def _fragment_clauses(path: Path, *, max_var: int) -> tuple[tuple[int, ...], ...]:
    """Parse a standalone DIMACS fragment or a headerless PIQD clause journal."""

    data = path.read_bytes()
    significant = [
        line.strip()
        for line in data.splitlines()
        if line.strip() and not line.lstrip().startswith(b"c")
    ]
    if not significant:
        _fail("refinement fragment is empty")
    if significant[0].startswith(b"p"):
        try:
            variables, clauses = parse_dimacs(data)
        except PiqdIncrementalDiscoveryError as exc:
            raise PostwaveGateError("refinement fragment is malformed DIMACS") from exc
        if variables != max_var:
            _fail("refinement fragment changes the DIMACS variable universe")
        return clauses

    pending: list[int] = []
    clauses: list[tuple[int, ...]] = []
    for line in significant:
        if line.startswith(b"p"):
            _fail("refinement fragment has a misplaced DIMACS header")
        for raw in line.split():
            try:
                literal = int(raw)
            except ValueError as exc:
                raise PostwaveGateError(
                    "refinement fragment contains a non-integer token"
                ) from exc
            if literal == 0:
                clauses.append(tuple(pending))
                pending.clear()
            else:
                if abs(literal) > max_var:
                    _fail("refinement fragment exceeds the DIMACS variable universe")
                pending.append(literal)
    if pending:
        _fail("refinement fragment has an unterminated clause")
    if not clauses:
        _fail("refinement fragment contains no clauses")
    return tuple(clauses)


def _check_solve_and_model(
    *, solve_path: Path, model_path: Path, root_path: Path
) -> tuple[str, int, str]:
    variables, clauses = _dimacs_header(root_path)
    solve = _load_json_artifact(solve_path, label="solve receipt")
    session = _object(solve.get("session_before"), label="solve receipt session_before")
    response = _object(
        solve.get("solve_response"), label="solve receipt solve_response"
    )
    if response.get("status") != "SAT":
        _fail("post-wave theorem search requires a captured SAT model")
    if (
        session.get("lane") != "sat"
        or session.get("state") not in {"live", "detached"}
        or session.get("last_assumption_free") is not True
    ):
        _fail("solve receipt is not from a resumable assumption-free session")
    session_id = _string(session.get("id"), label="solve receipt session id")
    solver_sha256 = _sha256_string(
        session.get("solver_sha256"), label="solve receipt solver sha256"
    )
    if session.get("clauses") != clauses:
        _fail("solve receipt clause count does not match the input root")
    declared_raw = session.get("declared_num_vars")
    declared_variables = (
        0
        if declared_raw is None
        else _integer(
            declared_raw,
            label="solve receipt declared variable count",
            minimum=0,
        )
    )
    observed_variables = _integer(
        session.get("max_var"), label="solve receipt maximum variable", minimum=0
    )
    if max(declared_variables, observed_variables) != variables:
        _fail("solve receipt variable count does not match the input root")
    if solve.get("model_literals") != variables:
        _fail("solve receipt does not claim a total model")
    prior_solves = _integer(
        session.get("solves"), label="solve receipt prior solve count"
    )
    solve_index = _integer(
        response.get("solve_index"), label="solve receipt solve index", minimum=1
    )
    if solve_index != prior_solves + 1:
        _fail("solve receipt index is not the session successor")

    model = _load_json_artifact(model_path, label="captured model")
    if model.get("vars") != variables:
        _fail("captured model variable count does not match the input root")
    literals = model.get("model")
    if type(literals) is not list or len(literals) != variables:
        _fail("captured model is not total")
    for index, literal in enumerate(literals, start=1):
        if type(literal) is not int or abs(literal) != index:
            _fail("captured model is not in canonical variable order")
    _verify_model_satisfies_root(root_path, literals=literals)
    return session_id, solve_index, solver_sha256


def _artifact_path(value: Any, *, label: str) -> str:
    obj = _object(value, label=label)
    return _repo_path(obj.get("path"), label=f"{label}.path").as_posix()


def _check_refinement(
    *,
    repo_root: Path,
    outcome: Mapping[str, Any],
    artifacts: Mapping[str, Any],
    artifact_paths: Mapping[str, Path],
) -> tuple[str, str, tuple[tuple[int, ...], ...]]:
    refinement_path, _ = _artifact(
        outcome["refinement_receipt"],
        repo_root=repo_root,
        label="outcome.refinement_receipt",
    )
    successor_path, successor_sha = _artifact(
        outcome["successor_root"],
        repo_root=repo_root,
        label="outcome.successor_root",
    )
    fragment_path, fragment_sha = _artifact(
        outcome["refinement_fragment"],
        repo_root=repo_root,
        label="outcome.refinement_fragment",
    )
    refinement = _load_json_artifact(refinement_path, label="refinement receipt")
    status = _string(refinement.get("status"), label="refinement receipt status")
    if status != REFINEMENT_STATUS:
        _fail("refinement receipt is not explicitly source-backed")
    consumer = _string(outcome["lean_consumer"], label="outcome.lean_consumer")
    if refinement.get("lean_consumer") != consumer:
        _fail("refinement receipt does not bind the named Lean consumer")
    if refinement.get("output_root_sha256") != successor_sha:
        _fail("refinement receipt does not bind the successor root digest")
    if (
        refinement.get("output_root")
        != successor_path.relative_to(repo_root).as_posix()
    ):
        _fail("refinement receipt does not bind the successor root path")
    if refinement.get("fragment_sha256") != fragment_sha:
        _fail("refinement receipt does not bind the refinement fragment digest")
    if refinement.get("fragment") != fragment_path.relative_to(repo_root).as_posix():
        _fail("refinement receipt does not bind the refinement fragment path")

    input_variables, input_clauses = _dimacs_header(artifact_paths["input_root"])
    fragment_clauses = _fragment_clauses(fragment_path, max_var=input_variables)
    successor_variables, successor_clauses = _dimacs_header(successor_path)
    if successor_variables != input_variables:
        _fail("refinement changes the DIMACS variable universe")
    if successor_clauses != input_clauses + len(fragment_clauses):
        _fail("successor clause count does not equal input plus refinement")
    _verify_successor_body(
        input_root=artifact_paths["input_root"],
        fragment=fragment_clauses,
        successor=successor_path,
    )

    inputs = _object(refinement.get("inputs"), label="refinement receipt inputs")
    input_root = _object(artifacts["input_root"], label="artifacts.input_root")
    model = _object(artifacts["model"], label="artifacts.model")
    analysis = _object(artifacts["source_analysis"], label="artifacts.source_analysis")
    if inputs.get("root_sha256") != input_root["sha256"]:
        _fail("refinement receipt does not bind the input root")
    if inputs.get("model_sha256") != model["sha256"]:
        _fail("refinement receipt does not bind the model")
    if inputs.get("gate_report_sha256") != analysis["sha256"]:
        _fail("refinement receipt does not bind the source analysis")

    producer = _repo_path(
        outcome["source_producer"], label="outcome.source_producer"
    ).as_posix()
    source_hashes = _object(
        refinement.get("source_hashes"), label="refinement receipt source_hashes"
    )
    if producer not in source_hashes:
        _fail("refinement receipt does not bind the named source producer")
    for source_path, source_sha in source_hashes.items():
        relative = _repo_path(source_path, label="refinement source path").as_posix()
        _artifact(
            {"path": relative, "sha256": source_sha},
            repo_root=repo_root,
            label=f"refinement source {relative}",
            expected_path=relative,
        )

    model = _load_json_artifact(artifact_paths["model"], label="captured model")
    assignment = {abs(literal): literal > 0 for literal in model["model"]}
    try:
        audit_clause_admission(
            root_cnf=artifact_paths["input_root"],
            root_clauses=input_clauses,
            max_var=input_variables,
            candidates=fragment_clauses,
            assignment=assignment,
        )
    except ClauseAdmissionError as exc:
        raise PostwaveGateError("refinement fragment failed clause admission") from exc
    return successor_sha, consumer, fragment_clauses


def validate_postwave_receipt(
    receipt: Mapping[str, Any], *, repo_root: Path
) -> PostwaveAuthorization:
    """Validate a parsed post-wave receipt and return its authorization."""

    root = Path(repo_root).resolve(strict=True)
    if not root.is_dir():
        _fail("repo_root must be a directory")
    receipt = _object(receipt, label="receipt")
    _keys(
        receipt,
        {
            "schema",
            "status",
            "lane",
            "wave",
            "artifacts",
            "history",
            "search",
            "outcome",
            "claims",
        },
        label="receipt",
    )
    if receipt["schema"] != SCHEMA or receipt["status"] != STATUS:
        _fail("receipt schema or status is unsupported")
    lane = _string(receipt["lane"], label="lane")

    wave = _object(receipt["wave"], label="wave")
    _keys(wave, {"ordinal", "label"}, label="wave")
    ordinal = _integer(wave["ordinal"], label="wave.ordinal", minimum=1)
    _string(wave["label"], label="wave.label")

    artifacts = _object(receipt["artifacts"], label="artifacts")
    _keys(
        artifacts,
        {"input_root", "solve_receipt", "model", "source_analysis"},
        label="artifacts",
    )
    artifact_paths: dict[str, Path] = {}
    artifact_hashes: dict[str, str] = {}
    for name, value in artifacts.items():
        artifact_paths[name], artifact_hashes[name] = _artifact(
            value, repo_root=root, label=f"artifacts.{name}"
        )

    source_session_id, source_solve_index, source_solver_sha256 = (
        _check_solve_and_model(
            solve_path=artifact_paths["solve_receipt"],
            model_path=artifact_paths["model"],
            root_path=artifact_paths["input_root"],
        )
    )

    analysis = _load_json_artifact(
        artifact_paths["source_analysis"], label="source analysis"
    )
    analysis_inputs = _object(analysis.get("inputs"), label="source analysis inputs")
    if analysis_inputs.get("cnf_sha256") != artifact_hashes["input_root"]:
        _fail("source analysis does not bind the input root")
    if analysis_inputs.get("model_sha256") != artifact_hashes["model"]:
        _fail("source analysis does not bind the model")
    _true(
        analysis.get("cnf_assignment_verified"),
        label="source analysis cnf_assignment_verified",
    )
    _true(
        analysis.get("piqd_model_total"),
        label="source analysis piqd_model_total",
    )

    history = _object(receipt["history"], label="history")
    _keys(
        history,
        {"mode", "first_wave", "last_wave", "evidence"},
        label="history",
    )
    mode = history["mode"]
    if mode not in {"predecessor-receipt", "legacy-bootstrap"}:
        _fail("history.mode is unsupported")
    first_wave = _integer(history["first_wave"], label="history.first_wave", minimum=1)
    last_wave = _integer(history["last_wave"], label="history.last_wave", minimum=1)
    if first_wave > last_wave or last_wave != ordinal:
        _fail("history range must end at the current wave")
    evidence = history["evidence"]
    if type(evidence) is not list or not evidence:
        _fail("history.evidence must be a nonempty list")
    evidence_roles: set[str] = set()
    evidence_paths: dict[str, str] = {}
    predecessor_path: Path | None = None
    for index, item in enumerate(evidence):
        entry = _object(item, label=f"history.evidence[{index}]")
        _keys(entry, {"role", "artifact"}, label=f"history.evidence[{index}]")
        role = _string(entry["role"], label=f"history.evidence[{index}].role")
        if role in evidence_roles:
            _fail("history evidence roles must be unique")
        evidence_roles.add(role)
        path, _ = _artifact(
            entry["artifact"],
            repo_root=root,
            label=f"history.evidence[{index}].artifact",
        )
        evidence_paths[role] = path.relative_to(root).as_posix()
        if role == "predecessor-theorem-search-receipt":
            predecessor_path = path
    if mode == "predecessor-receipt":
        if evidence_roles != {"predecessor-theorem-search-receipt"}:
            _fail("predecessor history must contain exactly its predecessor receipt")
        assert predecessor_path is not None
        predecessor = load_postwave_receipt(predecessor_path, repo_root=root)
        predecessor_wave = _object(predecessor["wave"], label="predecessor wave")
        predecessor_history = _object(
            predecessor["history"], label="predecessor history"
        )
        if predecessor_wave["ordinal"] + 1 != ordinal:
            _fail("predecessor receipt is not the immediately preceding wave")
        if predecessor.get("lane") != lane:
            _fail("predecessor receipt changes the CEGAR lane")
        if predecessor_history["first_wave"] != first_wave:
            _fail("predecessor history changes the first wave")
        predecessor_outcome = _object(
            predecessor["outcome"], label="predecessor outcome"
        )
        if predecessor_outcome.get("kind") != "reusable-theorem":
            _fail("predecessor did not authorize a successor")
        previous_root = _object(
            predecessor_outcome.get("successor_root"),
            label="predecessor successor_root",
        )
        if previous_root.get("sha256") != artifact_hashes["input_root"]:
            _fail("current input root is not the predecessor successor root")
    else:
        if lane != LEGACY_BOOTSTRAP_LANE or ordinal != LEGACY_BOOTSTRAP_ORDINAL:
            _fail("legacy bootstrap is allowed only at the exact wave-48 migration")
        if first_wave != 1 or evidence_roles != LEGACY_BOOTSTRAP_ROLES:
            _fail("legacy bootstrap does not bind the exact pre-gate evidence set")
        if (
            evidence_paths["legacy-results-index"]
            != LEGACY_BOOTSTRAP_RESULTS_SNAPSHOT
        ):
            _fail("legacy bootstrap must bind the immutable wave-48 results snapshot")

    search = _object(receipt["search"], label="search")
    _keys(
        search,
        {
            "artifact",
            "corpus",
            "queries",
            "results_examined",
            "current_wave_checked",
            "accumulated_history_checked",
            "theorem_banks",
        },
        label="search",
    )
    search_path, _ = _artifact(
        search["artifact"], repo_root=root, label="search.artifact"
    )
    if search["corpus"] != LEAN_CORPUS:
        _fail("search must use the repository Lean corpus")
    queries = search["queries"]
    if type(queries) is not list or not queries:
        _fail("search.queries must be a nonempty list")
    for index, query in enumerate(queries):
        _string(query, label=f"search.queries[{index}]")
    results_examined = _integer(
        search["results_examined"], label="search.results_examined", minimum=1
    )
    nonempty_search_lines = sum(
        bool(line.strip())
        for line in search_path.read_text(encoding="utf-8").splitlines()
    )
    if nonempty_search_lines < results_examined:
        _fail("search artifact contains fewer results than claimed")
    _true(search["current_wave_checked"], label="search.current_wave_checked")
    _true(
        search["accumulated_history_checked"],
        label="search.accumulated_history_checked",
    )
    banks = search["theorem_banks"]
    if type(banks) is not list:
        _fail("search.theorem_banks must be a list")
    bank_paths: set[str] = set()
    for index, bank in enumerate(banks):
        bank_path = _artifact_path(bank, label=f"search.theorem_banks[{index}]")
        if bank_path in bank_paths:
            _fail("search.theorem_banks contains a duplicate path")
        bank_paths.add(bank_path)
        _artifact(
            bank,
            repo_root=root,
            label=f"search.theorem_banks[{index}]",
            expected_path=bank_path,
        )
    if bank_paths != THEOREM_BANK_PATHS:
        _fail("search does not bind the complete canonical P97 theorem-bank registry")

    outcome = _object(receipt["outcome"], label="outcome")
    kind = outcome.get("kind")
    successor_sha: str | None = None
    consumer: str | None = None
    admitted_clauses: tuple[tuple[int, ...], ...] = ()
    if kind == "reusable-theorem":
        _keys(
            outcome,
            {
                "kind",
                "lean_consumer",
                "source_producer",
                "refinement_receipt",
                "refinement_fragment",
                "successor_root",
            },
            label="outcome",
        )
        successor_sha, consumer, admitted_clauses = _check_refinement(
            repo_root=root,
            outcome=outcome,
            artifacts=artifacts,
            artifact_paths=artifact_paths,
        )
        successor_authorized = True
    elif kind == "no-justified-lift":
        _keys(outcome, {"kind", "reason", "proposed_refinement_count"}, label="outcome")
        _string(outcome["reason"], label="outcome.reason")
        if outcome["proposed_refinement_count"] != 0:
            _fail("no-justified-lift cannot carry a proposed refinement")
        successor_authorized = False
    else:
        _fail("outcome.kind is unsupported")

    claims = _object(receipt["claims"], label="claims")
    _keys(
        claims,
        {
            "finite_theorem_search",
            "source_backed_refinement",
            "successor_authorized",
            "universal_closure",
            "theorem_closure",
        },
        label="claims",
    )
    _true(claims["finite_theorem_search"], label="claims.finite_theorem_search")
    expected = kind == "reusable-theorem"
    if claims["source_backed_refinement"] is not expected:
        _fail("claims.source_backed_refinement disagrees with the outcome")
    if claims["successor_authorized"] is not expected:
        _fail("claims.successor_authorized disagrees with the outcome")
    _false(claims["universal_closure"], label="claims.universal_closure")
    _false(claims["theorem_closure"], label="claims.theorem_closure")

    return PostwaveAuthorization(
        wave_ordinal=ordinal,
        outcome=kind,
        successor_authorized=successor_authorized,
        source_session_id=source_session_id,
        source_solve_index=source_solve_index,
        source_solver_sha256=source_solver_sha256,
        input_root_sha256=artifact_hashes["input_root"],
        successor_root_sha256=successor_sha,
        lean_consumer=consumer,
        admitted_clauses=admitted_clauses,
    )


def _read_canonical_postwave_receipt(path: Path) -> Mapping[str, Any]:
    """Read a canonical receipt without traversing its artifact chain."""

    data = Path(path).read_bytes()
    if len(data) > MAX_JSON_BYTES:
        _fail("post-wave receipt exceeds the JSON size bound")
    trailing_newline = data.endswith(b"\n")
    payload = data[:-1] if trailing_newline else data
    value = _object(
        _strict_json(payload, label="post-wave receipt"), label="post-wave receipt"
    )
    if payload != canonical_json_bytes(value):
        _fail("post-wave receipt is not canonical JSON")
    return value


def load_postwave_receipt(path: Path, *, repo_root: Path) -> Mapping[str, Any]:
    """Load canonical receipt bytes and validate their full artifact chain."""

    value = _read_canonical_postwave_receipt(path)
    validate_postwave_receipt(value, repo_root=repo_root)
    return value


def load_postwave_authorization(
    path: Path, *, repo_root: Path
) -> PostwaveAuthorization:
    """Load and validate a receipt once, returning its solver authorization."""

    value = _read_canonical_postwave_receipt(path)
    return validate_postwave_receipt(value, repo_root=repo_root)


def write_postwave_receipt(
    receipt: Mapping[str, Any], *, output: Path, repo_root: Path
) -> PostwaveAuthorization:
    """Validate and atomically write a canonical post-wave receipt."""

    authorization = validate_postwave_receipt(receipt, repo_root=repo_root)
    payload = canonical_json_bytes(receipt) + b"\n"
    output = Path(output)
    output.parent.mkdir(parents=True, exist_ok=True)
    temporary = output.with_name(f".{output.name}.{os.getpid()}.tmp")
    try:
        with temporary.open("xb") as stream:
            stream.write(payload)
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary, output)
    finally:
        temporary.unlink(missing_ok=True)
    return authorization


def _main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("receipt", type=Path)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    args = parser.parse_args(argv)
    authorization = load_postwave_authorization(args.receipt, repo_root=args.repo_root)
    print(canonical_json_bytes(authorization.__dict__).decode("utf-8"))
    return 0


if __name__ == "__main__":
    raise SystemExit(_main())
