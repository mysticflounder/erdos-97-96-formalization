"""Strict, additive PIQD boundary for the finite A-core incidence canary.

This module deliberately does not alter ``census/frontier-packages/a_core``.
The legacy package has no authenticated DIMACS variable map (and its model
JSON omits auxiliary variables), so :func:`load_package` rejects that live
tree.  A producer may opt in by supplying a sidecar map with every DIMACS
variable and a complete Boolean model.  Only then can the raw CNF be checked
independently and handed to PIQD.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
import os
import re
import stat
import uuid
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from census.p97_search.phase3_cegar_wave import (
    DISCOVERY_UNSAT,
    STRUCTURAL_SAT,
    validate_attempt_journal,
    wave_manifest_sha256,
)
from census.p97_search.phase3_piqd_a_core_package import (
    CLAUSE_FAMILIES as SOURCE_CLAUSE_FAMILIES,
)
from census.p97_search.phase3_piqd_a_core_package import (
    CLAUSE_FAMILY_CONTRACT as SOURCE_CLAUSE_FAMILY_CONTRACT,
)
from census.p97_search.phase3_piqd_a_core_package import (
    MAP_SCHEMA as SOURCE_MAP_SCHEMA,
)
from census.p97_search.phase3_piqd_a_core_package import (
    RETRY_SCHEMA as SOURCE_RETRY_SCHEMA,
)
from census.p97_search.phase3_piqd_a_core_package import SCHEMA as SOURCE_SCHEMA
from census.p97_search.phase3_piqd_a_core_package import (
    SOURCE_CONTRACT as SOURCE_PACKAGE_CONTRACT,
)
from census.p97_search.phase3_piqd_a_core_package import (
    SourcePackage,
    build_source_package,
)
from census.p97_search.phase3_piqd_driver import (
    DriverPolicy,
    DurableAttemptJournal,
    PiqdCegarDriver,
)
from census.p97_search.phase3_piqd_oracle import (
    CheckedModel,
    PiqdRawDimacsClient,
    PreparedJob,
    parse_dimacs,
    raw_dimacs_identity,
    scan_dimacs,
)

SCHEMA = "p97-piqd-a-core-adapter/v1"
PACKAGE_SCHEMA = "p97-piqd-a-core-package/v1"
MAP_SCHEMA = SOURCE_MAP_SCHEMA
RECEIPT_SCHEMA = "p97-piqd-a-core-receipt/v1"
SELECTED_CASE = "base+P"
REQUESTED_CORE_LIMIT = 1
DEFAULT_TIMEOUT_SECONDS = 60
MAX_CAPTURE_BYTES = 16 * 1024 * 1024
MAX_JSON_DEPTH = 64
MAX_JSON_NODES = 100_000
MAX_INTEGER_DIGITS = 100
MAX_VARIABLES = 10_000
MAX_CLAUSES = 100_000
CANONICAL_NUM_VARIABLES = 889
CANONICAL_NUM_CLAUSES = 21_101
SOURCE_CONTRACT = SOURCE_PACKAGE_CONTRACT
CLAUSE_FAMILY_CONTRACT = SOURCE_CLAUSE_FAMILY_CONTRACT
DURABLE_RECEIPT_NAME = "receipt.json"
DURABLE_JOURNAL_NAME = "attempt.jsonl"
DURABLE_SEAL_NAME = "attempt.jsonl.seal.json"
DURABLE_LOCK_NAME = "attempt.jsonl.lock"
DURABLE_ARTIFACT_DIR = "attempt.jsonl.artifacts"

_HEX = frozenset("0123456789abcdef")
_ATOM = re.compile(r"^([A-Za-z][A-Za-z0-9_]*)\(([^()]*)\)$")
_LABELS = frozenset(
    ("a0", "a1", "a2", "zd", "u", "xu", "v", "xv", "oth", "qh", "wh", "f1", "f2")
)
_TARGETS = _LABELS | {"OUT"}
_ZERO_ATOMS = frozenset(
    {"s5a", "s5b", "s6a", "s6b", "s6c", "rbs1", "rbs2", "rbt1", "rbt2"}
)
_ONE_FAMILIES = frozenset(
    {
        "moser",
        "inSig",
        "inO1i",
        "inO2i",
        "cl1",
        "inT",
        "row_u",
        "row_v",
        "del",
        "sv",
        "bs1",
        "bs2",
        "bt1",
        "bt2",
        "fbar",
    }
)
_EQ_PAIRS = frozenset(
    frozenset(pair)
    for left, rights in (
        (("qh", "wh"), ("zd", "xu", "xv", "v")),
        (("f1", "f2"), ("zd", "xu", "xv", "v", "oth", "a0", "a2")),
        (("oth",), ("zd", "v", "xv")),
        (("a0", "a1"), ("zd", "xu", "xv")),
        (("a0",), ("qh", "wh")),
        (("v",), ("a0", "a1")),
    )
    for l in left
    for r in rights
    for pair in ((l, r),)
)

_CANONICAL_EQ_ATOMS = frozenset(
    {
        "eq(a0,f1)",
        "eq(a0,f2)",
        "eq(a0,qh)",
        "eq(a0,v)",
        "eq(a0,wh)",
        "eq(a0,xu)",
        "eq(a0,xv)",
        "eq(a0,zd)",
        "eq(a1,v)",
        "eq(a1,xu)",
        "eq(a1,xv)",
        "eq(a1,zd)",
        "eq(a2,f1)",
        "eq(a2,f2)",
        "eq(f1,oth)",
        "eq(f1,v)",
        "eq(f1,xu)",
        "eq(f1,xv)",
        "eq(f1,zd)",
        "eq(f2,oth)",
        "eq(f2,v)",
        "eq(f2,xu)",
        "eq(f2,xv)",
        "eq(f2,zd)",
        "eq(oth,v)",
        "eq(oth,xv)",
        "eq(oth,zd)",
        "eq(qh,v)",
        "eq(qh,xu)",
        "eq(qh,xv)",
        "eq(qh,zd)",
        "eq(v,wh)",
        "eq(wh,xu)",
        "eq(wh,xv)",
        "eq(wh,zd)",
    }
)


def _canonical_named_atoms() -> tuple[str, ...]:
    labels = (
        "a0",
        "a1",
        "a2",
        "zd",
        "u",
        "xu",
        "v",
        "xv",
        "oth",
        "qh",
        "wh",
        "f1",
        "f2",
    )
    atoms = set(_CANONICAL_EQ_ATOMS)
    atoms.update(
        f"b({left},{right})"
        for left in ("u", "v", "zd", "xu", "xv", "oth", "qh", "wh")
        for right in (*labels, "OUT")
    )
    for family in (
        "moser",
        "inSig",
        "inO1i",
        "inO2i",
        "cl1",
        "inT",
        "row_u",
        "row_v",
        "sv",
    ):
        atoms.update(f"{family}({label})" for label in labels)
    atoms.update(f"del({label})" for label in ("zd", "u", "xu", "v", "xv"))
    for family in ("bs1", "bs2", "bt1", "bt2"):
        atoms.update(
            f"{family}({label})"
            for label in ("zd", "u", "xu", "v", "xv", "qh", "wh", "f1", "f2")
        )
    atoms.update(f"fbar({label})" for label in ("qh", "wh", "f1", "f2"))
    for family in ("and_bs1_bs2", "and_bt1_bt2"):
        atoms.update(f"{family}({label})" for label in ("zd", "u", "xu", "v", "xv"))
    atoms.update(_ZERO_ATOMS)
    for family in ("n", "nSig", "nO1", "nO2"):
        atoms.update(f"{family}={value}" for value in range(25))
        atoms.add(f"{family}>=25")
    return tuple(sorted(atoms))


CANONICAL_NAMED_ATOMS = _canonical_named_atoms()
if len(CANONICAL_NAMED_ATOMS) != 432:  # the authenticated source contract is fixed
    raise RuntimeError("A-core source contract named-atom count drifted")


class ACorePiqdAdapterError(ValueError):
    """A package, model, transport response, or custody operation failed closed."""


def _canonical(value: Any) -> bytes:
    return json.dumps(
        value,
        sort_keys=True,
        separators=(",", ":"),
        ensure_ascii=False,
        allow_nan=False,
    ).encode("utf-8")


def _json(raw: bytes, source: str) -> Any:
    if type(raw) is not bytes:
        raise ACorePiqdAdapterError(f"{source} must be builtin bytes")
    if len(raw) > MAX_CAPTURE_BYTES:
        raise ACorePiqdAdapterError(f"{source} exceeds byte limit")

    def pairs(items: list[tuple[str, Any]]) -> dict[str, Any]:
        out: dict[str, Any] = {}
        for key, value in items:
            if key in out:
                raise ValueError(f"duplicate key {key!r}")
            out[key] = value
        return out

    def bounded_int(token: str) -> int:
        digits = token.lstrip("-")
        if len(digits) > MAX_INTEGER_DIGITS:
            raise ValueError("integer digit limit")
        return int(token)

    try:
        value = json.loads(
            raw.decode("utf-8"),
            object_pairs_hook=pairs,
            parse_int=bounded_int,
            parse_constant=lambda x: (_ for _ in ()).throw(ValueError(x)),
        )
    except (
        UnicodeDecodeError,
        json.JSONDecodeError,
        ValueError,
        RecursionError,
    ) as exc:
        raise ACorePiqdAdapterError(f"{source} is not strict JSON") from exc
    stack: list[tuple[Any, int]] = [(value, 0)]
    nodes = 0
    while stack:
        current, depth = stack.pop()
        nodes += 1
        if nodes > MAX_JSON_NODES or depth > MAX_JSON_DEPTH:
            raise ACorePiqdAdapterError(f"{source} exceeds JSON depth/node limits")
        if type(current) is dict:
            stack.extend((child, depth + 1) for child in current.values())
        elif type(current) is list:
            stack.extend((child, depth + 1) for child in current)
    return value


def _keys(value: Mapping[str, Any], expected: frozenset[str], source: str) -> None:
    if type(value) is not dict or frozenset(value) != expected:
        actual = frozenset(value) if type(value) is dict else frozenset()
        raise ACorePiqdAdapterError(
            f"{source} keys mismatch: missing={sorted(expected - actual)}, extra={sorted(actual - expected)}"
        )


def _sha(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def _digest(value: Any, source: str) -> str:
    if type(value) is not str or len(value) != 64 or any(c not in _HEX for c in value):
        raise ACorePiqdAdapterError(f"{source} is not a lowercase SHA-256 digest")
    return value


def _safe_name(value: Any, source: str) -> str:
    if (
        type(value) is not str
        or not value
        or value in {".", ".."}
        or "/" in value
        or "\\" in value
    ):
        raise ACorePiqdAdapterError(f"{source} is not a safe relative name")
    return value


def _safe_artifact_path(value: Any, source: str, *, allow_none: bool = False) -> None:
    if allow_none and value is None:
        return
    if type(value) is not str or not value.startswith("out/"):
        raise ACorePiqdAdapterError(f"{source} is not a safe out/ artifact path")
    parts = value.split("/")
    if len(parts) != 2 or any(part in {"", ".", ".."} for part in parts):
        raise ACorePiqdAdapterError(f"{source} is not a safe out/ artifact path")


def _validate_atom(atom: str) -> None:
    """Validate an atom against the producer's named source universe."""
    if atom.startswith("aux_"):
        if not re.fullmatch(r"aux_[1-9][0-9]*", atom):
            raise ACorePiqdAdapterError(f"malformed auxiliary atom {atom!r}")
        return
    if atom in _ZERO_ATOMS:
        return
    integer = re.fullmatch(
        r"(?:nSig|nO1|nO2|n)=(?:[0-9]|1[0-9]|2[0-4])|(?:nSig|nO1|nO2|n)>=25", atom
    )
    if integer:
        return
    parsed = _ATOM.fullmatch(atom)
    if parsed is None:
        raise ACorePiqdAdapterError(f"malformed source atom {atom!r}")
    family, payload = parsed.groups()
    parts = payload.split(",")
    if family == "eq":
        if (
            len(parts) != 2
            or parts[0] not in (_LABELS | {"gamma"})
            or parts[1] not in _TARGETS
            or (parts[0] != "gamma" and frozenset(parts) not in _EQ_PAIRS)
        ):
            raise ACorePiqdAdapterError(
                f"atom {atom!r} is outside the A-core source universe"
            )
    elif family == "b":
        if len(parts) != 2 or parts[0] not in _LABELS or parts[1] not in _TARGETS:
            raise ACorePiqdAdapterError(
                f"atom {atom!r} is outside the A-core source universe"
            )
    elif family in _ONE_FAMILIES:
        if len(parts) != 1 or parts[0] not in (_LABELS | {"gamma"}):
            raise ACorePiqdAdapterError(
                f"atom {atom!r} is outside the A-core source universe"
            )
    elif (family.startswith("w_") and family[2:] in _LABELS) or family.startswith(
        ("and_bs1_bs2", "and_bt1_bt2")
    ):
        if len(parts) != 1 or parts[0] not in _LABELS:
            raise ACorePiqdAdapterError(
                f"atom {atom!r} is outside the A-core source universe"
            )
    else:
        raise ACorePiqdAdapterError(
            f"atom {atom!r} is outside the A-core source universe"
        )


def canonical_variable_map(
    *,
    num_variables: int = CANONICAL_NUM_VARIABLES,
    num_clauses: int = CANONICAL_NUM_CLAUSES,
    case: str = SELECTED_CASE,
) -> dict[str, Any]:
    """Return the authenticated sparse-ID map rebuilt from the source encoder."""
    if (
        type(num_variables) is not int
        or num_variables != CANONICAL_NUM_VARIABLES
        or type(num_clauses) is not int
        or num_clauses != CANONICAL_NUM_CLAUSES
        or case != SELECTED_CASE
    ):
        raise ACorePiqdAdapterError(
            "only the authenticated live-sized source contract is admissible"
        )
    try:
        return dict(build_source_package(case=case).variable_map)
    except Exception as exc:
        raise ACorePiqdAdapterError(
            "authenticated source map cannot be rebuilt"
        ) from exc


def _validate_manifest(value: Any) -> tuple[dict[str, Any], ...]:
    if type(value) is not list or not value:
        raise ACorePiqdAdapterError("A-core manifest must be a nonempty JSON array")
    expected = frozenset(
        {
            "run",
            "verdict",
            "n_variables",
            "n_clauses",
            "wall_seconds",
            "cnf_file",
            "proof_verified",
            "model_file",
            "model_true_atoms",
        }
    )
    records: list[dict[str, Any]] = []
    for index, record in enumerate(value):
        _keys(record, expected, f"manifest record {index}")
        if (
            type(record["run"]) is not str
            or not record["run"]
            or type(record["verdict"]) is not str
            or record["verdict"] not in {"SAT", "UNSAT", "UNKNOWN"}
        ):
            raise ACorePiqdAdapterError(
                "manifest run/verdict has invalid builtin type or value"
            )
        if (
            type(record["n_variables"]) is not int
            or type(record["n_clauses"]) is not int
            or record["n_variables"] <= 0
            or record["n_clauses"] <= 0
            or record["n_variables"] > MAX_VARIABLES
            or record["n_clauses"] > MAX_CLAUSES
        ):
            raise ACorePiqdAdapterError(
                "manifest dimensions must be positive builtin ints"
            )
        if (
            type(record["wall_seconds"]) not in (int, float)
            or isinstance(record["wall_seconds"], bool)
            or not math.isfinite(record["wall_seconds"])
            or record["wall_seconds"] < 0
        ):
            raise ACorePiqdAdapterError(
                "manifest wall_seconds must be finite nonnegative number"
            )
        if (
            type(record["proof_verified"]) is not bool
            or type(record["cnf_file"]) is not str
        ):
            raise ACorePiqdAdapterError(
                "manifest artifact fields have invalid builtin types"
            )
        if record["verdict"] == "SAT":
            if (
                type(record["model_file"]) is not str
                or type(record["model_true_atoms"]) is not list
                or any(type(x) is not str for x in record["model_true_atoms"])
            ):
                raise ACorePiqdAdapterError("SAT manifest model fields are malformed")
        elif record["model_file"] is not None or record["model_true_atoms"] != []:
            raise ACorePiqdAdapterError("non-SAT manifest must not name a model")
        _safe_name(record["run"], f"manifest record {index} run")
        _safe_artifact_path(record["cnf_file"], f"manifest record {index} cnf_file")
        _safe_artifact_path(
            record["model_file"],
            f"manifest record {index} model_file",
            allow_none=record["verdict"] != "SAT",
        )
        records.append(dict(record))
    if len({record["run"] for record in records}) != len(records):
        raise ACorePiqdAdapterError("manifest has duplicate run names")
    selected = [record for record in records if record["run"] == SELECTED_CASE]
    if len(selected) != 1:
        raise ACorePiqdAdapterError(
            f"manifest must contain exactly one {SELECTED_CASE} record"
        )
    return tuple(records)


def _validate_map(
    value: Any, *, num_vars: int, num_clauses: int, case: str
) -> dict[int, str]:
    expected = frozenset(
        {
            "source_contract",
            "clause_family_contract",
            "named_atoms",
            "schema",
            "case",
            "num_variables",
            "num_clauses",
            "variables",
            "clause_families",
        }
    )
    _keys(value, expected, "variable map")
    if (
        value["source_contract"] != SOURCE_CONTRACT
        or value["clause_family_contract"] != CLAUSE_FAMILY_CONTRACT
        or value["schema"] != MAP_SCHEMA
        or value["case"] != case
        or type(value["num_variables"]) is not int
        or value["num_variables"] != num_vars
        or type(value["num_clauses"]) is not int
        or value["num_clauses"] != num_clauses
    ):
        raise ACorePiqdAdapterError("variable map schema/case/dimension mismatch")
    variables = value["variables"]
    if (
        type(variables) is not dict
        or not variables
        or any(
            type(k) is not str
            or not k.isdigit()
            or int(k) <= 0
            or type(v) is not str
            or not v
            for k, v in variables.items()
        )
    ):
        raise ACorePiqdAdapterError(
            "variable map must map every positive DIMACS id to a string atom"
        )
    expected_map = canonical_variable_map(
        num_variables=num_vars, num_clauses=num_clauses, case=case
    )
    if (
        type(value["named_atoms"]) is not list
        or value["named_atoms"] != expected_map["named_atoms"]
    ):
        raise ACorePiqdAdapterError("named_atoms are not the canonical source universe")
    if len(set(variables.values())) != len(variables):
        raise ACorePiqdAdapterError("variable map contains duplicate labels")
    expected_variables = expected_map["variables"]
    if variables != expected_variables:
        raise ACorePiqdAdapterError(
            "variable map is not the deterministic producer map"
        )
    for atom in variables.values():
        _safe_name(atom, "variable-map atom")
    result = {int(k): v for k, v in variables.items()}
    if set(result) != set(range(1, num_vars + 1)):
        raise ACorePiqdAdapterError(
            "variable map must cover the complete DIMACS universe"
        )
    families = value["clause_families"]
    if type(families) is not dict or families != SOURCE_CLAUSE_FAMILIES:
        raise ACorePiqdAdapterError(
            "clause_families must match the source-derived base+P contract"
        )
    return result


def _validate_model(
    model: Any, variable_map: Mapping[int, str], clauses: Sequence[Sequence[int]]
) -> dict[int, bool]:
    if (
        type(model) is not dict
        or not model
        or any(type(k) is not str or type(v) is not bool for k, v in model.items())
    ):
        raise ACorePiqdAdapterError(
            "model must be a nonempty atom-to-builtin-bool object"
        )
    expected_atoms = set(variable_map.values())
    if set(model) != expected_atoms:
        raise ACorePiqdAdapterError("model is not total over the declared variable map")
    assignment: dict[int, bool] = {}
    for number, atom in variable_map.items():
        _validate_atom(atom)
        assignment[number] = model[atom]
    for clause in clauses:
        if not any(
            (lit > 0 and assignment[abs(lit)]) or (lit < 0 and not assignment[abs(lit)])
            for lit in clause
        ):
            raise ACorePiqdAdapterError(
                "complete model does not satisfy every CNF clause"
            )
    return assignment


def _preflight_dimacs(cnf: bytes) -> tuple[int, int]:
    if type(cnf) is not bytes or len(cnf) > MAX_CAPTURE_BYTES:
        raise ACorePiqdAdapterError("CNF exceeds the bounded byte limit")
    header = next(
        (line for line in cnf.splitlines() if line.startswith(b"p cnf ")), None
    )
    if header is None:
        raise ACorePiqdAdapterError("CNF has no DIMACS header")
    match = re.fullmatch(rb"p cnf ([0-9]{1,100}) ([0-9]{1,100})", header)
    if match is None:
        raise ACorePiqdAdapterError("CNF header is not strict DIMACS")
    num_vars, num_clauses = (int(part) for part in match.groups())
    if not 0 < num_vars <= MAX_VARIABLES or not 0 < num_clauses <= MAX_CLAUSES:
        raise ACorePiqdAdapterError("CNF dimensions exceed explicit safety limits")
    for line in cnf.splitlines():
        stripped = line.strip()
        if not stripped or stripped.startswith((b"c", b"p")):
            continue
        for token in stripped.split():
            if (
                re.fullmatch(rb"-?[0-9]+", token)
                and len(token.lstrip(b"-")) > MAX_INTEGER_DIGITS
            ):
                raise ACorePiqdAdapterError("DIMACS integer exceeds digit limit")
    return num_vars, num_clauses


@dataclass(frozen=True, slots=True)
class ACorePackage:
    package_dir: Path
    case: str
    cnf: bytes
    model: Mapping[str, bool]
    variable_map: Mapping[int, str]
    manifest: Mapping[str, Any]
    producer_manifest: bytes
    source_hashes: Mapping[str, str]
    cnf_sha256: str
    variable_map_sha256: str
    package_identity: str

    @property
    def producer_bytes(self) -> bytes:
        return self.producer_manifest


@dataclass(frozen=True, slots=True)
class RunPacket:
    packet_id: str
    package: ACorePackage
    timeout_seconds: int = DEFAULT_TIMEOUT_SECONDS
    requested_core_limit: int = REQUESTED_CORE_LIMIT

    def __post_init__(self) -> None:
        if type(self.packet_id) is not str or not self.packet_id:
            raise ACorePiqdAdapterError("packet_id must be a nonempty builtin string")
        if type(self.timeout_seconds) is not int or self.timeout_seconds <= 0:
            raise ACorePiqdAdapterError(
                "timeout_seconds must be a positive builtin int"
            )
        if self.requested_core_limit != REQUESTED_CORE_LIMIT:
            raise ACorePiqdAdapterError("requested_core_limit is fixed at 1")


def _open_root(path: Path) -> int:
    absolute = Path(os.path.abspath(path))
    flags = os.O_RDONLY | getattr(os, "O_DIRECTORY", 0) | getattr(os, "O_NOFOLLOW", 0)
    fd = os.open("/", flags)
    try:
        for part in absolute.parts[1:]:
            if part in {"", ".", ".."} or "/" in part:
                raise ACorePiqdAdapterError("package path has unsafe component")
            child = os.open(part, flags, dir_fd=fd)
            os.close(fd)
            fd = child
        return fd
    except (OSError, ACorePiqdAdapterError):
        os.close(fd)
        raise ACorePiqdAdapterError("package root is missing or symlinked")


def _file_signature(info: os.stat_result) -> tuple[int, ...]:
    return (
        info.st_dev,
        info.st_ino,
        info.st_mode,
        info.st_nlink,
        info.st_uid,
        info.st_gid,
        info.st_size,
        info.st_mtime_ns,
        info.st_ctime_ns,
    )


def _read_at(root_fd: int, relative: str, *, limit: int = MAX_CAPTURE_BYTES) -> bytes:
    parts = relative.split("/")
    if any(part in {"", ".", ".."} or "/" in part for part in parts):
        raise ACorePiqdAdapterError(f"unsafe artifact path {relative!r}")
    fd = root_fd
    opened: list[int] = []
    leaf: int | None = None
    try:
        for part in parts[:-1]:
            child = os.open(
                part, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW, dir_fd=fd
            )
            opened.append(child)
            fd = child
        leaf = os.open(parts[-1], os.O_RDONLY | os.O_NOFOLLOW, dir_fd=fd)
        info = os.fstat(leaf)
        if not stat.S_ISREG(info.st_mode) or info.st_size > limit:
            raise ACorePiqdAdapterError(
                f"artifact {relative!r} is not a bounded regular file"
            )
        data = b""
        while len(data) <= limit:
            chunk = os.read(leaf, min(1024 * 1024, limit + 1 - len(data)))
            if not chunk:
                break
            data += chunk
        after = os.fstat(leaf)
        if _file_signature(info) != _file_signature(after) or len(data) != info.st_size:
            raise ACorePiqdAdapterError(f"artifact {relative!r} changed during capture")
        return data
    except OSError as exc:
        raise ACorePiqdAdapterError(f"cannot safely capture {relative!r}") from exc
    finally:
        if leaf is not None:
            os.close(leaf)
        for descriptor in reversed(opened):
            os.close(descriptor)


def validate_static_package(
    *,
    manifest_bytes: bytes,
    cnf: bytes,
    model_bytes: bytes,
    variable_map_bytes: bytes,
    case: str = SELECTED_CASE,
) -> tuple[Mapping[str, Any], dict[str, bool], dict[int, str]]:
    if case != SELECTED_CASE:
        raise ACorePiqdAdapterError(
            f"only the selected case {SELECTED_CASE!r} is admissible"
        )
    for raw, source in (
        (manifest_bytes, "manifest"),
        (model_bytes, "model"),
        (variable_map_bytes, "variable map"),
    ):
        if type(raw) is not bytes or len(raw) > MAX_CAPTURE_BYTES:
            raise ACorePiqdAdapterError(f"{source} exceeds the bounded byte limit")
    manifest = _json(manifest_bytes, "manifest")
    records = _validate_manifest(manifest)
    if manifest_bytes != _canonical(manifest) + b"\n":
        raise ACorePiqdAdapterError("manifest is not canonical JSON")
    selected = next(record for record in records if record["run"] == case)
    if (
        selected["verdict"] != "SAT"
        or selected["cnf_file"] != f"out/{case}.cnf"
        or selected["model_file"] != f"out/{case}.model.json"
    ):
        raise ACorePiqdAdapterError(
            "selected case has an unbound CNF/model path or is not SAT"
        )
    header_vars, header_clauses = _preflight_dimacs(cnf)
    num_vars, clauses = parse_dimacs(cnf)
    if (num_vars, len(clauses)) != (header_vars, header_clauses):
        raise ACorePiqdAdapterError("DIMACS parser dimensions disagree with header")
    if (num_vars, len(clauses)) != (selected["n_variables"], selected["n_clauses"]):
        raise ACorePiqdAdapterError("selected manifest dimensions do not match DIMACS")
    model = _json(model_bytes, "model")
    variable_map = _json(variable_map_bytes, "variable map")
    if (
        model_bytes != _canonical(model) + b"\n"
        or variable_map_bytes != _canonical(variable_map) + b"\n"
    ):
        raise ACorePiqdAdapterError("model and variable map must be canonical JSON")
    mapping = _validate_map(
        variable_map, num_vars=num_vars, num_clauses=len(clauses), case=case
    )
    _validate_model(model, mapping, clauses)
    if sorted(record for record in selected["model_true_atoms"]) != sorted(
        key for key, value in model.items() if value
    ):
        raise ACorePiqdAdapterError(
            "manifest model_true_atoms does not match the authenticated model"
        )
    return selected, model, mapping


def load_package(
    package_dir: Path,
    *,
    variable_map_path: Path | None = None,
    case: str = SELECTED_CASE,
) -> ACorePackage:
    if not isinstance(package_dir, Path) or not package_dir.is_absolute():
        raise ACorePiqdAdapterError("package_dir must be an absolute builtin Path")
    if case != SELECTED_CASE:
        raise ACorePiqdAdapterError(
            f"only the selected case {SELECTED_CASE!r} is admissible"
        )
    root_fd = _open_root(package_dir)
    try:
        source_names = ("encoding.py", "run.py", "smoke.py", "RESULTS.md")
        source = {name: _read_at(root_fd, name) for name in source_names}
        manifest_bytes = _read_at(root_fd, "out/manifest.json")
        manifest = _json(manifest_bytes, "manifest")
        records = _validate_manifest(manifest)
        selected = next(record for record in records if record["run"] == case)
        if (
            selected["verdict"] != "SAT"
            or selected["cnf_file"] != f"out/{case}.cnf"
            or selected["model_file"] != f"out/{case}.model.json"
        ):
            raise ACorePiqdAdapterError(
                "selected case has an unbound CNF/model path or is not SAT"
            )
        cnf = _read_at(root_fd, selected["cnf_file"])
        model_bytes = _read_at(root_fd, selected["model_file"])
        if variable_map_path is None:
            raise ACorePiqdAdapterError(
                "legacy A-core package has no authenticated variable-map sidecar"
            )
        if variable_map_path.is_absolute() or any(
            part in {"", ".", ".."} for part in variable_map_path.parts
        ):
            raise ACorePiqdAdapterError(
                "variable map path must be a safe relative path"
            )
        map_relative = variable_map_path.as_posix()
        _safe_artifact_path(map_relative, "variable map path")
        map_bytes = _read_at(root_fd, map_relative)
        selected, model, mapping = validate_static_package(
            manifest_bytes=manifest_bytes,
            cnf=cnf,
            model_bytes=model_bytes,
            variable_map_bytes=map_bytes,
            case=case,
        )
        producer = _canonical(
            {
                "schema": PACKAGE_SCHEMA,
                "case": case,
                "source_hashes": {name: _sha(data) for name, data in source.items()},
                "manifest_sha256": _sha(manifest_bytes),
                "cnf_sha256": _sha(cnf),
                "model_sha256": _sha(model_bytes),
                "variable_map_sha256": _sha(map_bytes),
            }
        )
        identity = _sha(producer + b"\n" + cnf)
        return ACorePackage(
            package_dir,
            case,
            cnf,
            model,
            mapping,
            {"records": records, "selected": selected},
            producer,
            {name: _sha(data) for name, data in source.items()},
            _sha(cnf),
            _sha(map_bytes),
            identity,
        )
    finally:
        os.close(root_fd)


def packet_from_package(
    package: ACorePackage, *, timeout_seconds: int = DEFAULT_TIMEOUT_SECONDS
) -> RunPacket:
    return RunPacket(uuid.uuid4().hex, package, timeout_seconds=timeout_seconds)


def packet_from_source_package(
    source_package: SourcePackage | None = None,
    *,
    timeout_seconds: int = DEFAULT_TIMEOUT_SECONDS,
) -> RunPacket:
    """Build the live additive packet without consulting the legacy model.

    The returned package intentionally has no model: PIQD's checked total SAT
    assignment is the first complete model and is replayed against every
    clause and every source-derived map atom by :func:`run_packet`.
    """
    package = source_package or build_source_package()
    if not isinstance(package, SourcePackage):
        raise ACorePiqdAdapterError("source_package has the wrong builtin type")
    variable_map = {
        int(number): atom for number, atom in package.variable_map["variables"].items()
    }
    map_bytes = _canonical(package.variable_map)
    return packet_from_package(
        ACorePackage(
            package.source_root,
            package.case,
            package.cnf,
            {},
            variable_map,
            {"source_package": True, "case": package.case},
            package.producer_manifest,
            {name: _sha(data) for name, data in package.source_bytes.items()},
            package.cnf_sha256,
            _sha(map_bytes),
            package.package_identity,
        ),
        timeout_seconds=timeout_seconds,
    )


def _validate_prepared_job(
    job: PreparedJob, package: ACorePackage, identity: str
) -> None:
    if (
        type(job.job_id) is not str
        or not job.job_id
        or job.backend != "cadical"
        or job.solver_profile != "sat"
        or job.cnf_blob_hash != package.cnf_sha256
        or job.identity_hash != identity
        or job.num_vars != CANONICAL_NUM_VARIABLES
        or job.num_clauses != CANONICAL_NUM_CLAUSES
        or job.num_vars != len(package.variable_map)
        or type(job.existing) is not bool
        or job.requested_core_limit != REQUESTED_CORE_LIMIT
    ):
        raise ACorePiqdAdapterError(
            "PIQD prepared job identity, dimensions, backend/profile, or core limit is unbound"
        )


def _validate_status(status: Mapping[str, Any], job: PreparedJob) -> dict[str, Any]:
    if type(status) is not dict:
        raise ACorePiqdAdapterError("PIQD status has wrong type")
    job_id = status.get("id", status.get("job_id"))
    if type(job_id) is not str or job_id != job.job_id:
        raise ACorePiqdAdapterError("PIQD terminal confirmation has the wrong job id")
    expected_optional = {
        "num_vars": job.num_vars,
        "num_variables": job.num_vars,
        "num_clauses": job.num_clauses,
        "backend": job.backend,
        "solver_profile": job.solver_profile,
        "requested_core_limit": REQUESTED_CORE_LIMIT,
    }
    for key, expected in expected_optional.items():
        if key in status and status[key] != expected:
            raise ACorePiqdAdapterError(
                f"PIQD status {key} is not bound to this packet"
            )
    return status


def make_wave_manifest(packet: RunPacket) -> dict[str, Any]:
    package = packet.package
    num_vars, num_clauses = scan_dimacs(package.cnf)
    return {
        "schema": "p97-cegar-wave/v1",
        "wave_id": packet.packet_id,
        "iteration": 0,
        "parent_checkpoint_sha256": None,
        "source": {
            "live_leaf": "Problem97.ACoreFiniteCanary",
            "ingress_hypotheses_sha256": _sha(package.producer_manifest),
            "finite_schema": "a-core-incidence/v1",
            "cardinality_scope": "one finite A-core case",
            "source_theorem": "FINITE_CANARY_SOURCE_ONLY",
        },
        "encoding": {
            "cnf_sha256": package.cnf_sha256,
            "variable_map_sha256": package.variable_map_sha256,
            "producer_manifest_sha256": _sha(package.producer_manifest),
            "num_variables": num_vars,
            "num_clauses": num_clauses,
            "query_polarity": "SAT_MEANS_COUNTEREXAMPLE",
        },
        "execution": {
            "backend": "cadical",
            "solver_profile": "sat",
            "shard_id": 0,
            "shard_count": 1,
            "order_sha256": package.package_identity,
            "seed": 97,
        },
        "promotion": {
            # The shared wave schema has no finite-computation class.  This
            # control-plane label is never promoted: result claims stay false.
            "evidence_classification": "LOCAL_CERTIFICATE",
            "producer_theorem": None,
            "lift_theorem": None,
            "consumer_theorem": None,
        },
    }


def _dimacs_clauses(cnf: bytes) -> tuple[tuple[int, ...], ...]:
    clauses: list[tuple[int, ...]] = []
    for raw_line in cnf.splitlines():
        line = raw_line.strip()
        if not line or line.startswith((b"c", b"p")):
            continue
        values = tuple(int(token) for token in line.split())
        if not values or values[-1] != 0:
            raise ACorePiqdAdapterError("DIMACS clause is not zero terminated")
        clauses.append(values[:-1])
    return tuple(clauses)


def run_packet(
    packet: RunPacket, *, client: Any, project: str = "erdos-97-96-formalization"
) -> Mapping[str, Any]:
    if type(client) not in (PiqdRawDimacsClient,) and not hasattr(
        client, "prepare_cnf"
    ):
        raise ACorePiqdAdapterError(
            "client lacks the strict raw-DIMACS prepare interface"
        )
    package = packet.package
    wave = make_wave_manifest(packet)
    try:
        job: PreparedJob = client.prepare_cnf(
            wave_manifest=wave,
            cnf=package.cnf,
            producer_manifest=package.producer_manifest,
            timeout_s=packet.timeout_seconds,
            march_timeout_s=packet.timeout_seconds,
            project=project,
            requested_core_limit=REQUESTED_CORE_LIMIT,
        )
    except Exception as exc:  # noqa: BLE001 - transport failures are honest FAILED results
        return {
            "status": "FAILED",
            "detail": str(exc)[:240],
            "claims": {
                "finite_canary": False,
                "universal": False,
                "theorem_closure": False,
            },
        }
    expected_identity = raw_dimacs_identity(
        backend="cadical",
        solver_profile="sat",
        cnf_sha256=package.cnf_sha256,
        producer_manifest_sha256=_sha(package.producer_manifest),
        requested_core_limit=REQUESTED_CORE_LIMIT,
    )
    _validate_prepared_job(job, package, expected_identity)
    try:
        confirmation = client.confirm(job, expected_cnf=package.cnf)
        if type(confirmation) is dict:
            status = confirmation
        elif confirmation == "confirmed":
            # A 201/200 confirmation has no terminal payload; exactly one
            # documented status read completes this lifecycle.  On HTTP 409
            # PiqdRawDimacsClient.confirm already performs that read and a
            # strict wrapper must return its terminal payload instead.
            status = client.status(job.job_id)
        elif confirmation in {"running", "completed", "failed"}:
            return {
                "status": "UNKNOWN",
                "job_id": job.job_id,
                "state": confirmation,
                "result": None,
                "claims": {
                    "finite_canary": False,
                    "universal": False,
                    "theorem_closure": False,
                },
            }
        else:
            raise ACorePiqdAdapterError(
                "PIQD confirmation is not an authenticated lifecycle result"
            )
    except Exception as exc:  # noqa: BLE001 - transport failures are honest FAILED results
        return {
            "status": "FAILED",
            "job_id": job.job_id,
            "detail": str(exc)[:240],
            "claims": {
                "finite_canary": False,
                "universal": False,
                "theorem_closure": False,
            },
        }
    status = _validate_status(status, job)
    state = status.get("status")
    result = status.get("result")
    if state != "completed" or result not in {"SAT", "UNSAT"}:
        return {
            "status": "UNKNOWN",
            "job_id": job.job_id,
            "state": state,
            "result": result,
            "claims": {
                "finite_canary": False,
                "universal": False,
                "theorem_closure": False,
            },
        }
    if result == "SAT":
        try:
            checked: CheckedModel = client.checked_model(job, cnf=package.cnf)
            num_vars, clauses = parse_dimacs(package.cnf)
            scan_dimacs(package.cnf, assignment=checked.assignment)
            solver_values = set(checked.assignment)
            solver_model = {
                atom: (variable in solver_values)
                for variable, atom in package.variable_map.items()
            }
            if num_vars != len(package.variable_map):
                raise ACorePiqdAdapterError(
                    "checked model dimensions do not match the variable map"
                )
            _validate_model(solver_model, package.variable_map, clauses)
        except Exception as exc:  # noqa: BLE001 - checked-model failures are honest FAILED results
            return {
                "status": "FAILED",
                "job_id": job.job_id,
                "detail": str(exc)[:240],
                "claims": {
                    "finite_canary": False,
                    "universal": False,
                    "theorem_closure": False,
                },
            }
        return {
            "status": "SAT",
            "job_id": job.job_id,
            "assignment_sha256": checked.response_sha256,
            "claims": {
                "finite_canary": True,
                "universal": False,
                "theorem_closure": False,
            },
        }
    return {
        "status": "UNSAT",
        "job_id": job.job_id,
        "promotion": "DISCOVERY_ONLY_NO_CERT-001",
        "claims": {
            "finite_canary": False,
            "universal": False,
            "theorem_closure": False,
        },
    }


def _custody_root(path: Path) -> int:
    """Open an existing output root without following any path component."""
    if not isinstance(path, Path) or not path.is_absolute() or path == Path("/"):
        raise ACorePiqdAdapterError("durable output root must be an absolute directory")
    try:
        descriptor = _open_root(path)
        info = os.fstat(descriptor)
        if not stat.S_ISDIR(info.st_mode):
            os.close(descriptor)
            raise ACorePiqdAdapterError("durable output root is not a directory")
        return descriptor
    except ACorePiqdAdapterError:
        raise
    except OSError as exc:
        raise ACorePiqdAdapterError("durable output root is missing or unsafe") from exc


def _root_names(root_fd: int) -> set[str]:
    try:
        return set(os.listdir(root_fd))
    except OSError as exc:
        raise ACorePiqdAdapterError("cannot enumerate durable output root") from exc


def _safe_json_artifact(root_fd: int, relative: str, source: str) -> tuple[bytes, Any]:
    raw = _read_at(root_fd, relative)
    value = _json(raw, source)
    if raw not in {_canonical(value), _canonical(value) + b"\n"}:
        raise ACorePiqdAdapterError(f"{source} is not canonical JSON")
    return raw, value


def _validate_source_packet(packet: RunPacket) -> dict[str, Any]:
    if not isinstance(packet, RunPacket):
        raise ACorePiqdAdapterError("durable packet has the wrong builtin type")
    package = packet.package
    expected = canonical_variable_map()
    actual = {
        "schema": MAP_SCHEMA,
        "source_contract": SOURCE_CONTRACT,
        "clause_family_contract": CLAUSE_FAMILY_CONTRACT,
        "named_atoms": expected["named_atoms"],
        "case": package.case,
        "num_variables": len(package.variable_map),
        "num_clauses": CANONICAL_NUM_CLAUSES,
        "variables": {
            str(number): atom for number, atom in package.variable_map.items()
        },
        "clause_families": dict(SOURCE_CLAUSE_FAMILIES),
    }
    # The producer map is authenticated by rebuilding the source package, not by
    # accepting a caller-supplied relabeling.
    if actual != expected:
        raise ACorePiqdAdapterError(
            "packet does not carry the deterministic source map"
        )
    if package.case != SELECTED_CASE:
        raise ACorePiqdAdapterError("packet case is not the selected finite canary")
    if package.cnf_sha256 != _sha(package.cnf):
        raise ACorePiqdAdapterError("packet CNF hash is not self-authenticating")
    if _preflight_dimacs(package.cnf) != (
        CANONICAL_NUM_VARIABLES,
        CANONICAL_NUM_CLAUSES,
    ):
        raise ACorePiqdAdapterError("packet CNF dimensions are not live-sized")
    return expected


def _read_durable_journal(
    root_fd: int, *, wave: Mapping[str, Any]
) -> tuple[bytes, list[dict[str, Any]], dict[str, Any], bytes]:
    journal_raw = _read_at(root_fd, DURABLE_JOURNAL_NAME)
    if not journal_raw.endswith(b"\n"):
        raise ACorePiqdAdapterError("durable journal is not newline terminated")
    records: list[dict[str, Any]] = []
    for index, line in enumerate(journal_raw.splitlines(keepends=True), start=1):
        payload = line[:-1]
        if not payload:
            raise ACorePiqdAdapterError(f"durable journal line {index} is blank")
        value = _json(payload, f"durable journal line {index}")
        if type(value) is not dict or payload != _canonical(value):
            raise ACorePiqdAdapterError(
                f"durable journal line {index} is not canonical"
            )
        records.append(value)
    seal_raw, seal = _safe_json_artifact(
        root_fd, DURABLE_SEAL_NAME, "durable journal seal"
    )
    expected_seal_keys = frozenset(
        {
            "schema",
            "wave_manifest_sha256",
            "record_count",
            "terminal_attempt_sha256",
            "journal_sha256",
            "seal_sha256",
        }
    )
    _keys(seal, expected_seal_keys, "durable journal seal")
    unsigned = dict(seal)
    claimed = unsigned.pop("seal_sha256")
    if seal["schema"] != "p97-cegar-wave-journal-seal/v1" or claimed != _sha(
        _canonical(unsigned)
    ):
        raise ACorePiqdAdapterError("durable journal seal is not self-authenticating")
    try:
        terminal = validate_attempt_journal(
            records,
            manifest=wave,
            expected_record_count=seal["record_count"],
            expected_terminal_sha256=seal["terminal_attempt_sha256"],
        )
    except Exception as exc:
        raise ACorePiqdAdapterError("durable journal chain is invalid") from exc
    if (
        seal["wave_manifest_sha256"] != wave_manifest_sha256(wave)
        or seal["journal_sha256"] != _sha(journal_raw)
        or terminal != seal["terminal_attempt_sha256"]
    ):
        raise ACorePiqdAdapterError("durable journal seal is bound to another run")
    return journal_raw, records, dict(seal), seal_raw


def _read_archived_artifacts(
    root_fd: int, records: Sequence[Mapping[str, Any]], wave: Mapping[str, Any]
) -> dict[str, bytes]:
    declared = {
        wave["encoding"]["cnf_sha256"],
        wave["encoding"]["producer_manifest_sha256"],
    }
    for record in records:
        artifacts = record.get("artifacts")
        if type(artifacts) is not dict:
            raise ACorePiqdAdapterError("journal artifact table has the wrong type")
        declared.update(value for value in artifacts.values() if value is not None)
    try:
        artifact_fd = os.open(
            DURABLE_ARTIFACT_DIR,
            os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
            dir_fd=root_fd,
        )
    except OSError as exc:
        raise ACorePiqdAdapterError(
            "durable artifact directory is missing or unsafe"
        ) from exc
    try:
        names = set(os.listdir(artifact_fd))
    except OSError as exc:
        raise ACorePiqdAdapterError("cannot enumerate durable artifacts") from exc
    finally:
        # The root-relative captures below provide the TOCTOU signature check.
        os.close(artifact_fd)
    if names != declared:
        raise ACorePiqdAdapterError(
            "durable artifact directory contains undeclared or missing files"
        )
    result: dict[str, bytes] = {}
    for digest in sorted(declared):
        _digest(digest, "durable artifact name")
        payload = _read_at(root_fd, f"{DURABLE_ARTIFACT_DIR}/{digest}")
        if _sha(payload) != digest:
            raise ACorePiqdAdapterError(f"durable artifact hash mismatch: {digest}")
        result[digest] = payload
    return result


def _journal_events(
    records: Sequence[Mapping[str, Any]], artifacts: Mapping[str, bytes]
) -> list[dict[str, Any]]:
    events: list[dict[str, Any]] = []
    for record in records:
        digest = record["artifacts"]["checkpoint_sha256"]
        raw = artifacts[digest]
        event = _json(raw, "journal checkpoint")
        if type(event) is not dict or raw != _canonical(event):
            raise ACorePiqdAdapterError("journal checkpoint is not canonical JSON")
        events.append(event)
    return events


def _receipt_payload(
    *,
    packet: RunPacket,
    wave: Mapping[str, Any],
    journal_raw: bytes,
    records: Sequence[Mapping[str, Any]],
    seal: Mapping[str, Any],
    events: Sequence[Mapping[str, Any]],
) -> dict[str, Any]:
    start = next((event for event in events if event["phase"] == "DRIVER_START"), None)
    prepare = next((event for event in events if event["phase"] == "PREPARE"), None)
    terminal_status = next(
        (
            event
            for event in reversed(events)
            if event["phase"] == "POLL" and event["status"] == "completed"
        ),
        None,
    )
    terminal = events[-1]
    if (
        type(start) is not dict
        or type(prepare) is not dict
        or type(terminal_status) is not dict
    ):
        raise ACorePiqdAdapterError(
            "durable journal lacks required lifecycle attestations"
        )
    policy = start.get("response")
    prepared = prepare.get("response")
    status_response = terminal_status.get("response")
    if (
        type(policy) is not dict
        or type(prepared) is not dict
        or type(status_response) is not dict
    ):
        raise ACorePiqdAdapterError("durable lifecycle response is not an object")
    identity = raw_dimacs_identity(
        backend="cadical",
        solver_profile="sat",
        cnf_sha256=packet.package.cnf_sha256,
        producer_manifest_sha256=_sha(packet.package.producer_manifest),
        requested_core_limit=REQUESTED_CORE_LIMIT,
    )
    expected_prepared = {
        "backend": "cadical",
        "solver_profile": "sat",
        "cnf_blob_hash": packet.package.cnf_sha256,
        "identity_hash": identity,
        "num_vars": CANONICAL_NUM_VARIABLES,
        "num_clauses": CANONICAL_NUM_CLAUSES,
    }
    if any(prepared.get(key) != value for key, value in expected_prepared.items()):
        raise ACorePiqdAdapterError(
            "prepared-job attestation is not bound to this packet"
        )
    if type(prepared.get("existing")) is not bool:
        raise ACorePiqdAdapterError(
            "prepared-job existing flag must be an exact archived boolean"
        )
    job_id = prepare.get("job_id")
    if type(job_id) is not str or not job_id or terminal.get("job_id") != job_id:
        raise ACorePiqdAdapterError("journal lifecycle changed job identity")
    if (
        policy.get("requested_core_limit") != REQUESTED_CORE_LIMIT
        or policy.get("project") != "erdos-97-96-formalization"
        or terminal_status.get("job_id") != job_id
        or status_response.get("id", status_response.get("job_id")) != job_id
        or status_response.get("status") != "completed"
        or status_response.get("result") != terminal_status.get("result")
    ):
        raise ACorePiqdAdapterError(
            "status/resource attestation is not bound to this run"
        )
    for key, expected in expected_prepared.items():
        if key in status_response and status_response[key] != expected:
            raise ACorePiqdAdapterError(
                f"terminal status {key} is not bound to this packet"
            )
    if "requested_core_limit" in status_response and (
        status_response["requested_core_limit"] != REQUESTED_CORE_LIMIT
    ):
        raise ACorePiqdAdapterError("terminal status core limit is not bound")
    outcome = records[-1]["outcome"]
    result = terminal_status.get("result")
    status = (
        "SAT"
        if outcome == STRUCTURAL_SAT
        else "UNSAT"
        if outcome == DISCOVERY_UNSAT
        else "FAILED"
    )
    if result == "UNKNOWN":
        status = "UNKNOWN"
    model_hash = records[-1]["artifacts"].get("model_sha256")
    return {
        "adapter_schema": SCHEMA,
        "case": SELECTED_CASE,
        "status": status,
        "outcome": outcome,
        "packet_id": packet.packet_id,
        "job_id": job_id,
        "state": "completed",
        "result": result,
        "backend": "cadical",
        "solver_profile": "sat",
        "project": "erdos-97-96-formalization",
        "requested_core_limit": REQUESTED_CORE_LIMIT,
        "timeout_seconds": packet.timeout_seconds,
        "num_variables": CANONICAL_NUM_VARIABLES,
        "num_clauses": CANONICAL_NUM_CLAUSES,
        "cnf_sha256": packet.package.cnf_sha256,
        "producer_manifest_sha256": _sha(packet.package.producer_manifest),
        "variable_map_sha256": packet.package.variable_map_sha256,
        "identity_hash": identity,
        "wave_manifest_sha256": wave_manifest_sha256(wave),
        "journal_sha256": _sha(journal_raw),
        "terminal_record_sha256": records[-1]["record_sha256"],
        "journal_record_count": len(records),
        "seal_sha256": seal["seal_sha256"],
        "model_sha256": model_hash,
        "claims": {
            "finite_canary": status == "SAT",
            "universal": False,
            "theorem_closure": False,
        },
    }


def _validate_receipt_self_hash(value: Any) -> dict[str, Any]:
    if type(value) is not dict:
        raise ACorePiqdAdapterError("receipt must be a JSON object")
    claimed = _digest(value.get("receipt_sha256"), "receipt self-hash")
    unsigned = dict(value)
    unsigned.pop("receipt_sha256")
    if value.get("schema") != RECEIPT_SCHEMA or claimed != _sha(_canonical(unsigned)):
        raise ACorePiqdAdapterError("receipt self-hash mismatch")
    return dict(value)


def _packet_from_archived_receipt(
    root_fd: int, receipt: Mapping[str, Any]
) -> RunPacket:
    producer_hash = _digest(
        receipt.get("producer_manifest_sha256"),
        "receipt producer manifest hash",
    )
    producer_raw = _read_at(root_fd, f"{DURABLE_ARTIFACT_DIR}/{producer_hash}")
    if _sha(producer_raw) != producer_hash:
        raise ACorePiqdAdapterError("archived producer manifest hash mismatch")
    producer = _json(producer_raw, "archived producer manifest")
    if type(producer) is not dict or producer_raw != _canonical(producer):
        raise ACorePiqdAdapterError("archived producer manifest is not canonical JSON")
    schema = producer.get("schema")
    if schema == SOURCE_SCHEMA:
        if "retry" in producer:
            raise ACorePiqdAdapterError(
                "v1 archived producer manifest cannot contain retry metadata"
            )
        retry = None
    elif schema == SOURCE_RETRY_SCHEMA:
        retry = producer.get("retry")
        if type(retry) is not dict:
            raise ACorePiqdAdapterError(
                "v2 archived producer manifest lacks retry metadata"
            )
    else:
        raise ACorePiqdAdapterError(
            "archived producer manifest schema is not supported"
        )
    try:
        source_package = build_source_package(retry=retry)
    except Exception as exc:
        raise ACorePiqdAdapterError(
            "archived producer manifest cannot rebuild the source package"
        ) from exc
    if source_package.producer_manifest != producer_raw:
        raise ACorePiqdAdapterError(
            "archived producer manifest does not match current authenticated sources"
        )
    timeout = receipt.get("timeout_seconds")
    base = packet_from_source_package(
        source_package,
        timeout_seconds=timeout,
    )
    return RunPacket(
        receipt.get("packet_id"),
        base.package,
        timeout_seconds=timeout,
    )


def replay_durable_output(
    output_root: Path, packet: RunPacket | None = None
) -> Mapping[str, Any]:
    """Safely replay a sealed one-core run, including its raw SAT model archive."""
    root_fd = _custody_root(output_root)
    try:
        expected_names = {
            DURABLE_RECEIPT_NAME,
            DURABLE_JOURNAL_NAME,
            DURABLE_SEAL_NAME,
            DURABLE_LOCK_NAME,
            DURABLE_ARTIFACT_DIR,
        }
        if _root_names(root_fd) != expected_names:
            raise ACorePiqdAdapterError(
                "durable output has undeclared or missing files"
            )
        _read_at(root_fd, DURABLE_LOCK_NAME, limit=0)
        _, receipt_value = _safe_json_artifact(root_fd, DURABLE_RECEIPT_NAME, "receipt")
        receipt_value = _validate_receipt_self_hash(receipt_value)
        if packet is None:
            packet = _packet_from_archived_receipt(root_fd, receipt_value)
        _validate_source_packet(packet)
        wave = make_wave_manifest(packet)
        journal_raw, records, seal, _ = _read_durable_journal(root_fd, wave=wave)
        artifacts = _read_archived_artifacts(root_fd, records, wave)
        events = _journal_events(records, artifacts)
        expected = _receipt_payload(
            packet=packet,
            wave=wave,
            journal_raw=journal_raw,
            records=records,
            seal=seal,
            events=events,
        )
        _, receipt = _safe_json_artifact(root_fd, DURABLE_RECEIPT_NAME, "receipt")
    finally:
        os.close(root_fd)
    receipt = _validate_receipt_self_hash(receipt)
    if receipt != expected | {
        "schema": RECEIPT_SCHEMA,
        "receipt_sha256": receipt["receipt_sha256"],
    }:
        raise ACorePiqdAdapterError("receipt is not bound to the sealed run")
    if expected["status"] == "SAT":
        model_hash = expected["model_sha256"]
        if type(model_hash) is not str or model_hash not in artifacts:
            raise ACorePiqdAdapterError(
                "SAT receipt has no authenticated model archive"
            )
        model = _json(artifacts[model_hash], "raw SAT model archive")
        if type(model) is not dict:
            raise ACorePiqdAdapterError("raw SAT model archive must be a JSON object")
        if (
            model.get("job_id") != expected["job_id"]
            or model.get("result") != "SAT"
            or type(model.get("assignment")) is not list
            or type(model.get("num_assigned")) is not int
            or model["num_assigned"] != CANONICAL_NUM_VARIABLES
        ):
            raise ACorePiqdAdapterError(
                "raw SAT model archive is not job-bound or total"
            )
        try:
            scan_dimacs(packet.package.cnf, assignment=model["assignment"])
            _, clauses = parse_dimacs(packet.package.cnf)
            named = {
                atom: (variable in set(model["assignment"]))
                for variable, atom in packet.package.variable_map.items()
            }
            _validate_model(named, packet.package.variable_map, clauses)
        except Exception as exc:
            raise ACorePiqdAdapterError(
                "raw SAT model does not satisfy every CNF clause"
            ) from exc
    return receipt


def run_durable_packet(
    packet: RunPacket,
    *,
    output_root: Path,
    client: Any,
    project: str = "erdos-97-96-formalization",
    max_polls: int = 300,
) -> Mapping[str, Any]:
    """Run exactly one bounded PIQD lifecycle under create-once output custody."""
    _validate_source_packet(packet)
    if (
        project != "erdos-97-96-formalization"
        or type(max_polls) is not int
        or max_polls <= 0
    ):
        raise ACorePiqdAdapterError(
            "durable runner project/poll bound is not admissible"
        )
    root_fd = _custody_root(output_root)
    try:
        names = _root_names(root_fd)
        if names == {
            DURABLE_RECEIPT_NAME,
            DURABLE_JOURNAL_NAME,
            DURABLE_SEAL_NAME,
            DURABLE_LOCK_NAME,
            DURABLE_ARTIFACT_DIR,
        }:
            return replay_durable_output(output_root, packet)
        if names:
            raise ACorePiqdAdapterError("durable output custody is create-once")
    finally:
        os.close(root_fd)
    wave = make_wave_manifest(packet)
    journal = DurableAttemptJournal(
        output_root / DURABLE_JOURNAL_NAME,
        manifest=wave,
    )
    policy = DriverPolicy(
        max_prepare_attempts=1,
        max_confirm_attempts=1,
        max_polls=max_polls,
        max_result_attempts=1,
        poll_interval_s=0,
        solver_timeout_s=packet.timeout_seconds,
        march_timeout_s=packet.timeout_seconds,
        project=project,
        requested_core_limit=REQUESTED_CORE_LIMIT,
    )
    result = PiqdCegarDriver(
        client=client, journal=journal, policy=policy, sleep=lambda _: None
    ).run(
        wave_manifest=wave,
        cnf=packet.package.cnf,
        producer_manifest=packet.package.producer_manifest,
    )
    root_fd = _custody_root(output_root)
    try:
        journal_raw, records, seal, _ = _read_durable_journal(root_fd, wave=wave)
        artifacts = _read_archived_artifacts(root_fd, records, wave)
        events = _journal_events(records, artifacts)
        payload = _receipt_payload(
            packet=packet,
            wave=wave,
            journal_raw=journal_raw,
            records=records,
            seal=seal,
            events=events,
        )
        if result.seal_sha256 != seal["seal_sha256"]:
            raise ACorePiqdAdapterError("driver result seal is not the journal seal")
    finally:
        os.close(root_fd)
    write_receipt(output_root / DURABLE_RECEIPT_NAME, payload)
    return replay_durable_output(output_root, packet)


def durable_replay_main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Replay a sealed A-core PIQD output")
    parser.add_argument("output_root", type=Path)
    args = parser.parse_args(argv)
    try:
        result = replay_durable_output(args.output_root)
    except (ACorePiqdAdapterError, OSError, ValueError) as exc:
        print(json.dumps({"status": "FAILED", "detail": str(exc)[:240]}))
        return 2
    print(json.dumps(result, sort_keys=True, separators=(",", ":")))
    return 0


def write_receipt(path: Path, payload: Mapping[str, Any]) -> Mapping[str, Any]:
    if (
        not isinstance(path, Path)
        or not path.is_absolute()
        or type(payload) is not dict
    ):
        raise ACorePiqdAdapterError("receipt path/payload has invalid builtin type")
    body = dict(payload)
    body["schema"] = RECEIPT_SCHEMA
    body.pop("receipt_sha256", None)
    body["receipt_sha256"] = _sha(_canonical(body))
    raw = _canonical(body) + b"\n"
    parent = _open_root(path.parent)
    try:
        fd = os.open(
            path.name,
            os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW,
            0o600,
            dir_fd=parent,
        )
        try:
            view = memoryview(raw)
            while view:
                written = os.write(fd, view)
                if written <= 0:
                    raise OSError("short receipt write")
                view = view[written:]
            os.fsync(fd)
        finally:
            os.close(fd)
    except FileExistsError as exc:
        raise ACorePiqdAdapterError("receipt custody is create-once") from exc
    except OSError as exc:
        raise ACorePiqdAdapterError("receipt path is unsafe or unavailable") from exc
    finally:
        os.close(parent)
    return body


__all__ = [
    "CANONICAL_NUM_CLAUSES",
    "CANONICAL_NUM_VARIABLES",
    "REQUESTED_CORE_LIMIT",
    "SELECTED_CASE",
    "ACorePackage",
    "ACorePiqdAdapterError",
    "RunPacket",
    "canonical_variable_map",
    "durable_replay_main",
    "load_package",
    "make_wave_manifest",
    "packet_from_package",
    "packet_from_source_package",
    "replay_durable_output",
    "run_durable_packet",
    "run_packet",
    "validate_static_package",
    "write_receipt",
]


if __name__ == "__main__":
    raise SystemExit(durable_replay_main())
