"""Authenticated one-shot PIQD cvc5 adapter for ATAIL polynomial geometry.

The adapter emits only SMT state commands.  A SAT response is retained only
after exact rational replay of every enabled named polynomial atom from the
immutable semantic input.  UNSAT is diagnostic discovery, never a proof.
"""

from __future__ import annotations

import hashlib
import json
import os
import re
import stat
import uuid
from collections.abc import Iterable, Mapping, Sequence
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path, PurePosixPath

import sympy as sp

from census.p97_search import phase3_piqd_smt_source_adapter as neutral

from . import producer_geometry as geometry

DESCRIPTOR_SCHEMA = "atail-piqd-cvc5-geometry-query/v1"
PROFILE_SCHEMA = "atail-piqd-cvc5/v1"
SEMANTIC_SCHEMA = "atail-piqd-cvc5-geometry-semantic-input/v1"
RESULT_SCHEMA = "atail-piqd-cvc5-geometry-result/v1"
SYSTEM_SCHEMA = "atail-named-polynomial-system/v1"
NL_COV_COMMAND = "(set-option :nl-cov true)"
MAX_SOURCE_BYTES = 32 * 1024 * 1024
MAX_MODEL_BYTES = 4 * 1024 * 1024
MAX_MODEL_TOKENS = 100_000
MAX_MODEL_DEPTH = 64
MAX_RUN_ARTIFACT_BYTES = 96 * 1024 * 1024
MAX_RUN_TOTAL_BYTES = 768 * 1024 * 1024
MAX_RUN_FILES = 17
MAX_JSON_DEPTH = 64
MAX_JSON_NODES = 250_000
ROOT = Path(__file__).resolve().parents[2]
REQUIRED_SOURCE_PATHS = tuple(
    sorted(
        (
            "census/atail_force/producer_bank.py",
            "census/atail_force/producer_geometry.py",
            "census/atail_force/producer_mus.py",
            "census/atail_force/producer_probe.py",
            "census/atail_force/producer_surface.py",
        )
    )
)
PROOF_BLUEPRINT = {
    "session_id": "019fdf9c",
    "anchor": "Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier",
    "state": "OPEN",
    "relation": "OFF_SPINE",
    "changed": False,
}
FALSE_CLAIMS = {
    "source_entitlement": False,
    "theorem": False,
    "global": False,
    "universal": False,
    "lean": False,
    "proof": False,
    "euclidean_problem97": False,
    "named_core_support": False,
}
_ENGINE_FALSE_CLAIMS = {
    "source_entitlement": False,
    "theorem": False,
    "universal": False,
    "lean": False,
    "euclidean": False,
}

_INTEGER = re.compile(r"-?(?:0|[1-9][0-9]*)\Z")
_DECIMAL = re.compile(r"-?(?:0|[1-9][0-9]*)\.[0-9]+\Z")
_SIMPLE_SYMBOL = re.compile(r"[A-Za-z_][A-Za-z0-9_]*\Z")
_RELATIONS = frozenset({"eq", "ge", "gt", "ne", "or_ne"})


class ATailPiqdCvc5Error(RuntimeError):
    """The ATAIL source, query, or exact replay contract failed closed."""


@dataclass(frozen=True)
class PreparedGeometryQuery:
    """One immutable, source-bound ATAIL query packet."""

    query: neutral.SourceSemanticQuery


def _fail(condition: bool, message: str) -> None:
    if not condition:
        raise ATailPiqdCvc5Error(message)


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _canonical(value: object) -> bytes:
    try:
        return json.dumps(
            value,
            ensure_ascii=False,
            allow_nan=False,
            sort_keys=True,
            separators=(",", ":"),
        ).encode("utf-8")
    except (TypeError, ValueError) as exc:
        raise ATailPiqdCvc5Error("value is not canonical builtin JSON") from exc


def _safe(value: str) -> str:
    cleaned = "".join(ch if ch.isalnum() or ch == "_" else "_" for ch in value)
    _fail(bool(cleaned), f"empty normalized identifier for {value!r}")
    return cleaned


def _unique_safe(values: Sequence[str], where: str) -> None:
    _fail(
        all(type(value) is str and bool(value) for value in values),
        f"{where} must be nonempty strings",
    )
    normalized = [_safe(value) for value in values]
    _fail(len(values) == len(set(values)), f"{where} are not unique")
    _fail(
        len(normalized) == len(set(normalized)),
        f"{where} collide after _safe normalization",
    )


def _blueprint_record(spec: geometry.GeometryBlueprint) -> dict[str, object]:
    _fail(type(spec) is geometry.GeometryBlueprint, "blueprint has the wrong type")
    labels = spec.labels
    _unique_safe(labels, "blueprint labels")
    _fail(len(labels) >= 5, "blueprint has too few carrier labels")
    label_set = set(labels)
    _fail(
        len(spec.cyclic_order) == len(labels) and set(spec.cyclic_order) == label_set,
        "blueprint cyclic order is not a complete unique carrier order",
    )
    apices = (spec.surplus_apex, spec.opp_apex1, spec.opp_apex2)
    _fail(
        len(set(apices)) == 3 and set(apices) <= label_set,
        "blueprint apices are invalid",
    )
    caps = (spec.surplus_cap, spec.opp_cap1, spec.opp_cap2)
    for index, (opposite, cap) in enumerate(zip(apices, caps, strict=True)):
        _fail(type(cap) is frozenset, f"cap[{index}] is not immutable")
        _fail(
            2 <= len(cap) < len(labels) and cap <= label_set,
            f"cap[{index}] is weak or has unknown labels",
        )
        _fail(opposite not in cap, f"cap[{index}] contains its opposite apex")
        _fail(
            set(apices) - {opposite} <= cap,
            f"cap[{index}] omits a base apex",
        )

    exact = spec.exact_classes
    _fail(len(exact) == 2, "blueprint must bind both opposite-apex exact classes")
    _unique_safe(tuple(item.class_id for item in exact), "exact class IDs")
    _fail(
        {item.apex for item in exact} == {spec.opp_apex1, spec.opp_apex2},
        "exact classes do not bind both opposite apices",
    )
    for item in exact:
        _fail(
            len(item.members) >= 4
            and len(item.members) == len(set(item.members))
            and set(item.members) <= label_set
            and item.apex not in item.members,
            f"exact class {item.class_id!r} is weak or invalid",
        )

    rows = spec.pinned_k4_rows
    _fail(len(rows) == 2, "blueprint must bind both opposite-apex pinned K4 rows")
    _unique_safe(tuple(row.row_id for row in rows), "pinned K4 row IDs")
    _fail(
        {row.center for row in rows} == {spec.opp_apex1, spec.opp_apex2},
        "pinned K4 rows do not bind both opposite apices",
    )
    for row in rows:
        _fail(
            len(row.members) == 4
            and len(set(row.members)) == 4
            and set(row.members) <= label_set
            and row.center not in row.members,
            f"pinned K4 row {row.row_id!r} is invalid",
        )

    _fail(
        type(spec.case_id) is str and bool(spec.case_id),
        "blueprint case ID is invalid",
    )
    order = {label: index for index, label in enumerate(labels)}
    return {
        "case_id": spec.case_id,
        "labels": list(labels),
        "cyclic_order": list(spec.cyclic_order),
        "surplus_apex": spec.surplus_apex,
        "opp_apex1": spec.opp_apex1,
        "opp_apex2": spec.opp_apex2,
        "surplus_cap": sorted(spec.surplus_cap, key=order.__getitem__),
        "opp_cap1": sorted(spec.opp_cap1, key=order.__getitem__),
        "opp_cap2": sorted(spec.opp_cap2, key=order.__getitem__),
        "exact_classes": [
            {
                "apex": item.apex,
                "class_id": item.class_id,
                "members": list(item.members),
            }
            for item in exact
        ],
        "pinned_k4_rows": [
            {
                "center": row.center,
                "row_id": row.row_id,
                "members": list(row.members),
            }
            for row in rows
        ],
    }


def _validate_blueprint_record(value: object) -> None:
    """Reject records that cannot round-trip through the strong blueprint type."""

    fields = {
        "case_id",
        "labels",
        "cyclic_order",
        "surplus_apex",
        "opp_apex1",
        "opp_apex2",
        "surplus_cap",
        "opp_cap1",
        "opp_cap2",
        "exact_classes",
        "pinned_k4_rows",
    }
    _fail(
        type(value) is dict and set(value) == fields,
        "blueprint record fields are invalid",
    )
    try:
        exact_records = value["exact_classes"]
        row_records = value["pinned_k4_rows"]
        _fail(type(exact_records) is list, "blueprint exact-class ledger is invalid")
        _fail(type(row_records) is list, "blueprint pinned-row ledger is invalid")
        exact: list[geometry.ExactClassSpec] = []
        for item in exact_records:
            _fail(
                type(item) is dict and set(item) == {"apex", "class_id", "members"},
                "blueprint exact-class entry is invalid",
            )
            _fail(
                type(item["members"]) is list,
                "blueprint exact-class members are invalid",
            )
            exact.append(
                geometry.ExactClassSpec(
                    apex=item["apex"],
                    class_id=item["class_id"],
                    members=tuple(item["members"]),
                )
            )
        rows: list[geometry.PinnedK4Row] = []
        for item in row_records:
            _fail(
                type(item) is dict and set(item) == {"center", "row_id", "members"},
                "blueprint pinned-row entry is invalid",
            )
            _fail(
                type(item["members"]) is list,
                "blueprint pinned-row members are invalid",
            )
            rows.append(
                geometry.PinnedK4Row(
                    center=item["center"],
                    row_id=item["row_id"],
                    members=tuple(item["members"]),
                )
            )
        list_fields = (
            "labels",
            "cyclic_order",
            "surplus_cap",
            "opp_cap1",
            "opp_cap2",
        )
        _fail(
            all(type(value[name]) is list for name in list_fields),
            "blueprint carrier or cap ledger is invalid",
        )
        spec = geometry.GeometryBlueprint(
            case_id=value["case_id"],
            labels=tuple(value["labels"]),
            cyclic_order=tuple(value["cyclic_order"]),
            surplus_apex=value["surplus_apex"],
            opp_apex1=value["opp_apex1"],
            opp_apex2=value["opp_apex2"],
            surplus_cap=frozenset(value["surplus_cap"]),
            opp_cap1=frozenset(value["opp_cap1"]),
            opp_cap2=frozenset(value["opp_cap2"]),
            exact_classes=tuple(exact),
            pinned_k4_rows=tuple(rows),
        )
        _fail(_blueprint_record(spec) == value, "blueprint record is not canonical")
    except ATailPiqdCvc5Error:
        raise
    except (KeyError, TypeError, ValueError) as exc:
        raise ATailPiqdCvc5Error("blueprint record is invalid") from exc


def _fraction_record(value: sp.Rational) -> dict[str, int]:
    return {"numerator": int(value.p), "denominator": int(value.q)}


def _polynomial_record(
    expression: sp.Expr, variables: tuple[sp.Symbol, ...]
) -> dict[str, object]:
    unknown = expression.free_symbols - set(variables)
    _fail(
        not unknown,
        f"polynomial contains undeclared variables: {sorted(map(str, unknown))}",
    )
    try:
        polynomial = sp.Poly(sp.expand(expression), *variables, domain=sp.QQ)
    except (sp.PolynomialError, TypeError, ValueError) as exc:
        raise ATailPiqdCvc5Error("atom is not a rational polynomial") from exc
    return {
        "terms": [
            {
                "coefficient": _fraction_record(coefficient),
                "powers": list(powers),
            }
            for powers, coefficient in polynomial.terms()
            if coefficient != 0
        ]
    }


def _system_record(system: geometry.GeometrySystem) -> dict[str, object]:
    _fail(type(system) is geometry.GeometrySystem, "geometry system has the wrong type")
    blueprint = _blueprint_record(system.blueprint)
    _fail(
        type(system.variables) is tuple and system.variables,
        "system variables are invalid",
    )
    _fail(
        all(type(variable) is sp.Symbol for variable in system.variables),
        "system variables must be exact SymPy symbols",
    )
    variable_order = tuple(str(variable) for variable in system.variables)
    _fail(
        len(variable_order) == len(set(variable_order)),
        "system variable order is not complete and unique",
    )
    _fail(
        all(_SIMPLE_SYMBOL.fullmatch(name) for name in variable_order),
        "system variable name is not a safe SMT symbol",
    )
    _fail(type(system.atoms) is tuple and system.atoms, "system atom ledger is empty")
    names = tuple(atom.name for atom in system.atoms)
    _unique_safe(names, "atom names")
    _fail(
        all(name == _safe(name) and "|" not in name for name in names),
        "atom names are not canonical safe symbols",
    )
    _fail(
        set(variable_order).isdisjoint(names),
        "variable and atom SMT symbols collide",
    )
    atoms: list[dict[str, object]] = []
    used_variables: set[str] = set()
    for atom in system.atoms:
        _fail(type(atom) is geometry.NamedPolynomialAtom, "atom has the wrong type")
        _fail(atom.relation in _RELATIONS, f"unsupported relation {atom.relation!r}")
        expected = 2 if atom.relation == "or_ne" else 1
        _fail(len(atom.polynomials) == expected, f"atom {atom.name!r} has wrong arity")
        _fail(
            bool(atom.family) and bool(atom.lean_source),
            f"atom {atom.name!r} lacks provenance",
        )
        polynomials = [
            _polynomial_record(expression, system.variables)
            for expression in atom.polynomials
        ]
        used_variables.update(
            str(symbol)
            for expression in atom.polynomials
            for symbol in expression.free_symbols
        )
        atoms.append(
            {
                "id": atom.name,
                "family": atom.family,
                "relation": atom.relation,
                "polynomials": polynomials,
                "lean_source": atom.lean_source,
            }
        )
    _fail(
        used_variables == set(variable_order),
        "system variable order has missing or unused variables",
    )
    _fail(
        tuple(system.omitted_ledger) == tuple(geometry.OMITTED_LEDGER),
        "system omitted ledger is not the canonical ATAIL ledger",
    )
    return {
        "schema": SYSTEM_SCHEMA,
        "blueprint": blueprint,
        "variable_order": list(variable_order),
        "atoms": atoms,
        "omitted_ledger": list(system.omitted_ledger),
    }


def _smt_symbol(name: str) -> str:
    _fail(_SIMPLE_SYMBOL.fullmatch(name) is not None, f"unsafe SMT symbol {name!r}")
    return f"|{name}|"


def _smt_rational(numerator: int, denominator: int) -> str:
    _fail(denominator > 0, "polynomial coefficient denominator is not positive")
    sign = numerator < 0
    numerator = abs(numerator)
    body = str(numerator) if denominator == 1 else f"(/ {numerator} {denominator})"
    return f"(- {body})" if sign else body


def _term_smt2(term: Mapping[str, object], variable_order: Sequence[str]) -> str:
    coefficient = term["coefficient"]
    _fail(type(coefficient) is dict, "polynomial coefficient is malformed")
    powers = term["powers"]
    _fail(
        type(powers) is list and len(powers) == len(variable_order),
        "polynomial powers are malformed",
    )
    factors: list[str] = []
    for variable, power in zip(variable_order, powers, strict=True):
        _fail(type(power) is int and power >= 0, "polynomial power is invalid")
        if power == 1:
            factors.append(_smt_symbol(variable))
        elif power > 1:
            factors.append(f"(^ {_smt_symbol(variable)} {power})")
    number = _smt_rational(coefficient["numerator"], coefficient["denominator"])
    if not factors:
        return number
    if number == "1":
        return factors[0] if len(factors) == 1 else f"(* {' '.join(factors)})"
    return f"(* {number} {' '.join(factors)})"


def _polynomial_smt2(
    polynomial: Mapping[str, object], variable_order: Sequence[str]
) -> str:
    terms = polynomial["terms"]
    _fail(type(terms) is list, "polynomial terms are malformed")
    rendered = [_term_smt2(term, variable_order) for term in terms]
    if not rendered:
        return "0"
    return rendered[0] if len(rendered) == 1 else f"(+ {' '.join(rendered)})"


def _atom_body(atom: Mapping[str, object], variable_order: Sequence[str]) -> str:
    values = [_polynomial_smt2(poly, variable_order) for poly in atom["polynomials"]]
    relation = atom["relation"]
    if relation == "eq":
        return f"(= {values[0]} 0)"
    if relation == "ge":
        return f"(>= {values[0]} 0)"
    if relation == "gt":
        return f"(> {values[0]} 0)"
    if relation == "ne":
        return f"(not (= {values[0]} 0))"
    _fail(relation == "or_ne" and len(values) == 2, "atom relation is malformed")
    return f"(or (not (= {values[0]} 0)) (not (= {values[1]} 0)))"


def _emit_commands(semantic: Mapping[str, object]) -> tuple[str, ...]:
    system = semantic["system"]
    _fail(type(system) is dict, "semantic system is malformed")
    variable_order = system["variable_order"]
    atoms = system["atoms"]
    enabled = semantic["enabled_atom_order"]
    _fail(
        type(variable_order) is list and type(atoms) is list and type(enabled) is list,
        "semantic query ledger is malformed",
    )
    by_id = {atom["id"]: atom for atom in atoms}
    commands = [NL_COV_COMMAND, "(set-logic QF_NRA)"]
    commands.extend(
        f"(declare-fun {_smt_symbol(name)} () Real)" for name in variable_order
    )
    for atom_id in enabled:
        atom = by_id[atom_id]
        commands.append(
            f"(assert (! {_atom_body(atom, variable_order)} :named {_smt_symbol(atom_id)}))"
        )
    return tuple(commands)


def _directory_identity(info: os.stat_result) -> tuple[int, int, int, int]:
    return (info.st_dev, info.st_ino, info.st_mode, info.st_nlink)


def _open_directory_chain(
    first_fd: int,
    parts: Sequence[str],
    where: str,
) -> tuple[list[int], list[tuple[int, int, int, int]]]:
    descriptors = [first_fd]
    identities: list[tuple[int, int, int, int]] = []
    try:
        first = os.fstat(first_fd)
        _fail(stat.S_ISDIR(first.st_mode), f"{where} is not a directory")
        identities.append(_directory_identity(first))
        for part in parts:
            _fail(
                type(part) is str and part not in {"", ".", ".."} and "/" not in part,
                f"{where} has an unsafe path component",
            )
            descriptor = os.open(
                part,
                os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
                dir_fd=descriptors[-1],
            )
            info = os.fstat(descriptor)
            _fail(stat.S_ISDIR(info.st_mode), f"{where} component is not a directory")
            descriptors.append(descriptor)
            identities.append(_directory_identity(info))
        return descriptors, identities
    except BaseException:
        for descriptor in reversed(descriptors):
            os.close(descriptor)
        raise


def _verify_directory_chain(
    descriptors: Sequence[int],
    parts: Sequence[str],
    identities: Sequence[tuple[int, int, int, int]],
    where: str,
) -> None:
    _fail(
        len(descriptors) == len(identities) == len(parts) + 1,
        f"{where} directory chain is malformed",
    )
    for index, (descriptor, expected) in enumerate(
        zip(descriptors, identities, strict=True)
    ):
        current = os.fstat(descriptor)
        _fail(
            stat.S_ISDIR(current.st_mode) and _directory_identity(current) == expected,
            f"{where} directory changed during capture",
        )
        if index:
            rebound = os.stat(
                parts[index - 1],
                dir_fd=descriptors[index - 1],
                follow_symlinks=False,
            )
            _fail(
                stat.S_ISDIR(rebound.st_mode)
                and _directory_identity(rebound) == expected,
                f"{where} directory entry changed during capture",
            )


def _source_identity(info: os.stat_result) -> tuple[int, int, int, int, int]:
    return (
        info.st_dev,
        info.st_ino,
        info.st_size,
        info.st_mtime_ns,
        info.st_ctime_ns,
    )


def _read_source_relative(root_fd: int, relative: str) -> bytes:
    parts = PurePosixPath(relative).parts
    _fail(
        parts
        and not PurePosixPath(relative).is_absolute()
        and all(part not in {"", ".", ".."} for part in parts),
        f"unsafe source path: {relative}",
    )
    directories: list[int] = []
    descriptor: int | None = None
    try:
        directories, identities = _open_directory_chain(
            os.dup(root_fd), parts[:-1], f"source parent {relative}"
        )
        _verify_directory_chain(
            directories, parts[:-1], identities, f"source parent {relative}"
        )
        descriptor = os.open(
            parts[-1],
            os.O_RDONLY | os.O_NOFOLLOW,
            dir_fd=directories[-1],
        )
        before = os.fstat(descriptor)
        _fail(stat.S_ISREG(before.st_mode), f"source is not regular: {relative}")
        _fail(before.st_nlink == 1, f"source is hard-linked: {relative}")
        _fail(before.st_size <= MAX_SOURCE_BYTES, f"source exceeds cap: {relative}")
        chunks: list[bytes] = []
        remaining = MAX_SOURCE_BYTES + 1
        while remaining:
            chunk = os.read(descriptor, min(1024 * 1024, remaining))
            if not chunk:
                break
            chunks.append(chunk)
            remaining -= len(chunk)
        payload = b"".join(chunks)
        after = os.fstat(descriptor)
        rebound = os.stat(parts[-1], dir_fd=directories[-1], follow_symlinks=False)
        _fail(
            stat.S_ISREG(after.st_mode)
            and stat.S_ISREG(rebound.st_mode)
            and after.st_nlink == rebound.st_nlink == 1
            and len(payload) <= MAX_SOURCE_BYTES
            and len(payload) == before.st_size
            and _source_identity(before)
            == _source_identity(after)
            == _source_identity(rebound),
            f"source changed during capture: {relative}",
        )
        _verify_directory_chain(
            directories, parts[:-1], identities, f"source parent {relative}"
        )
        return payload
    except ATailPiqdCvc5Error:
        raise
    except OSError as exc:
        raise ATailPiqdCvc5Error(
            f"cannot capture source without following links: {relative}"
        ) from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)
        for directory in reversed(directories):
            os.close(directory)


def _capture_sources(root: Path) -> tuple[neutral.SourceSnapshot, ...]:
    _fail(isinstance(root, Path) and root.is_absolute(), "source root must be absolute")
    root_parts = Path(os.path.abspath(os.fspath(root))).parts[1:]
    directories: list[int] = []
    try:
        slash_fd = os.open("/", os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW)
        directories, identities = _open_directory_chain(
            slash_fd, root_parts, "source root"
        )
        _verify_directory_chain(directories, root_parts, identities, "source root")
        snapshots = tuple(
            neutral.SourceSnapshot(
                relative, _read_source_relative(directories[-1], relative)
            )
            for relative in REQUIRED_SOURCE_PATHS
        )
        _verify_directory_chain(directories, root_parts, identities, "source root")
        return snapshots
    except ATailPiqdCvc5Error:
        raise
    except OSError as exc:
        raise ATailPiqdCvc5Error(
            "cannot capture required ATAIL sources without following links"
        ) from exc
    finally:
        for directory in reversed(directories):
            os.close(directory)


def prepare_geometry_query(
    system: geometry.GeometrySystem,
    enabled_atoms: Iterable[str] | None = None,
    *,
    timeout_ms: int = 1_000,
    source_root: Path = ROOT,
) -> PreparedGeometryQuery:
    """Build one deterministic, state-only, source-bound cvc5 query."""

    _fail(
        type(timeout_ms) is int and 1 <= timeout_ms <= 3_600_000,
        "timeout_ms is invalid",
    )
    system_record = _system_record(system)
    atom_order = [atom["id"] for atom in system_record["atoms"]]
    requested = atom_order if enabled_atoms is None else list(enabled_atoms)
    _fail(all(type(name) is str for name in requested), "enabled atom IDs are invalid")
    _fail(len(requested) == len(set(requested)), "enabled atom IDs contain duplicates")
    _fail(
        bool(requested) and set(requested) <= set(atom_order),
        "enabled atom IDs are empty or unknown",
    )
    requested_set = set(requested)
    enabled_order = [name for name in atom_order if name in requested_set]
    semantic = {
        "schema": SEMANTIC_SCHEMA,
        "proof_blueprint": dict(PROOF_BLUEPRINT),
        "system": system_record,
        "system_sha256": _sha(_canonical(system_record)),
        "enabled_atom_order": enabled_order,
    }
    commands = _emit_commands(semantic)
    journal = b"".join(command.encode("utf-8") + b"\n" for command in commands)
    sources = _capture_sources(source_root)
    source_entries = [
        {"path": item.path, "bytes": len(item.payload), "sha256": _sha(item.payload)}
        for item in sources
    ]
    variable_order = system_record["variable_order"]
    variables = sorted(
        (
            {"id": name, "term": _smt_symbol(name), "sort": "Real"}
            for name in variable_order
        ),
        key=lambda item: item["id"],
    )
    named_atoms = sorted(
        ({"id": name, "assumption_term": _smt_symbol(name)} for name in enabled_order),
        key=lambda item: item["id"],
    )
    descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "producer": {"id": "atail-named-polynomial-geometry", "version": "v1"},
        "semantic_verifier": {
            "id": "atail-exact-rational-atom-replay",
            "version": "v1",
        },
        "stage_id": "atail-geometry",
        "query_id": system.blueprint.case_id,
        "sources": source_entries,
        "semantic_input": semantic,
        "semantic_sha256": _sha(_canonical(semantic)),
        "original_smt2": {
            "path": "query.state-only.smt2",
            "bytes": len(journal),
            "sha256": _sha(journal),
        },
        "variables": variables,
        "named_atoms": named_atoms,
        "solve": {
            "assumption_ids": [],
            "readback_variable_ids": list(variable_order),
            "include_model": True,
        },
        "solver_profile": {
            "schema": PROFILE_SCHEMA,
            "solvers": ["cvc5"],
            "timeout_ms": timeout_ms,
        },
    }
    query = neutral.SourceSemanticQuery(
        descriptor=descriptor,
        descriptor_bytes=_canonical(descriptor) + b"\n",
        original_smt2=journal,
        journal_commands=commands,
        journal_smt2=journal,
        source_files=sources,
    )
    prepared = PreparedGeometryQuery(query)
    validate_prepared_query(prepared)
    return prepared


def _validated_semantic(query: neutral.SourceSemanticQuery) -> dict[str, object]:
    semantic = query.descriptor["semantic_input"]
    _fail(
        type(semantic) is dict
        and set(semantic)
        == {
            "schema",
            "proof_blueprint",
            "system",
            "system_sha256",
            "enabled_atom_order",
        },
        "semantic input schema is invalid",
    )
    _fail(semantic["schema"] == SEMANTIC_SCHEMA, "semantic input version mismatch")
    _fail(
        semantic["proof_blueprint"] == PROOF_BLUEPRINT,
        "proof-blueprint binding mismatch",
    )
    system = semantic["system"]
    _fail(
        type(system) is dict and system.get("schema") == SYSTEM_SCHEMA,
        "semantic system schema mismatch",
    )
    _fail(
        _sha(_canonical(system)) == semantic["system_sha256"],
        "semantic system hash mismatch",
    )
    _fail(
        set(system)
        == {"schema", "blueprint", "variable_order", "atoms", "omitted_ledger"},
        "semantic system fields are invalid",
    )
    _validate_blueprint_record(system["blueprint"])
    variables = system["variable_order"]
    atoms = system["atoms"]
    enabled = semantic["enabled_atom_order"]
    _fail(
        type(variables) is list
        and variables
        and all(
            type(name) is str and _SIMPLE_SYMBOL.fullmatch(name) for name in variables
        ),
        "semantic variable order is invalid",
    )
    _fail(
        len(variables) == len(set(variables)), "semantic variable order is not unique"
    )
    _fail(type(atoms) is list and atoms, "semantic atom ledger is empty")
    atom_ids = [atom.get("id") if type(atom) is dict else None for atom in atoms]
    _fail(
        all(type(name) is str for name in atom_ids)
        and len(atom_ids) == len(set(atom_ids)),
        "semantic atom ledger IDs are invalid",
    )
    _unique_safe(atom_ids, "semantic atom ledger IDs")
    _fail(
        all(name == _safe(name) for name in atom_ids),
        "semantic atom IDs are not canonical",
    )
    _fail(
        set(variables).isdisjoint(atom_ids),
        "semantic variable and atom SMT symbols collide",
    )
    _fail(
        type(enabled) is list
        and enabled
        and len(enabled) == len(set(enabled))
        and set(enabled) <= set(atom_ids),
        "enabled atom order is invalid",
    )
    _fail(
        enabled == [name for name in atom_ids if name in set(enabled)],
        "enabled atom order is not canonical",
    )
    _fail(
        system["omitted_ledger"] == list(geometry.OMITTED_LEDGER),
        "omitted ledger mismatch",
    )
    used_variable_indexes: set[int] = set()
    for atom in atoms:
        _fail(
            set(atom) == {"id", "family", "relation", "polynomials", "lean_source"}
            and atom["relation"] in _RELATIONS
            and type(atom["family"]) is str
            and bool(atom["family"])
            and type(atom["lean_source"]) is str
            and bool(atom["lean_source"]),
            "semantic atom entry is invalid",
        )
        expected = 2 if atom["relation"] == "or_ne" else 1
        _fail(
            type(atom["polynomials"]) is list and len(atom["polynomials"]) == expected,
            "semantic atom polynomial arity is invalid",
        )
        for polynomial in atom["polynomials"]:
            used_variable_indexes.update(
                _validate_polynomial_record(polynomial, len(variables))
            )
    _fail(
        used_variable_indexes == set(range(len(variables))),
        "semantic variable order has missing or unused variables",
    )
    return semantic


def _validate_polynomial_record(value: object, variable_count: int) -> set[int]:
    _fail(
        type(value) is dict and set(value) == {"terms"}, "polynomial record is invalid"
    )
    terms = value["terms"]
    _fail(type(terms) is list, "polynomial terms are invalid")
    seen: set[tuple[int, ...]] = set()
    used: set[int] = set()
    previous: tuple[int, ...] | None = None
    for term in terms:
        _fail(
            type(term) is dict and set(term) == {"coefficient", "powers"},
            "polynomial term is invalid",
        )
        coefficient = term["coefficient"]
        powers = term["powers"]
        _fail(
            type(coefficient) is dict
            and set(coefficient) == {"numerator", "denominator"}
            and type(coefficient["numerator"]) is int
            and type(coefficient["denominator"]) is int
            and coefficient["denominator"] > 0
            and coefficient["numerator"] != 0,
            "polynomial coefficient is invalid",
        )
        reduced = Fraction(coefficient["numerator"], coefficient["denominator"])
        _fail(
            reduced.numerator == coefficient["numerator"]
            and reduced.denominator == coefficient["denominator"],
            "polynomial coefficient is not canonical",
        )
        _fail(
            type(powers) is list
            and len(powers) == variable_count
            and all(type(power) is int and power >= 0 for power in powers),
            "polynomial powers are invalid",
        )
        power_tuple = tuple(powers)
        _fail(power_tuple not in seen, "polynomial has duplicate monomials")
        _fail(
            previous is None or previous > power_tuple,
            "polynomial monomials are not canonical",
        )
        seen.add(power_tuple)
        used.update(index for index, power in enumerate(power_tuple) if power > 0)
        previous = power_tuple
    return used


def validate_prepared_query(
    prepared: PreparedGeometryQuery,
) -> neutral.SourceSemanticQuery:
    """Revalidate all source, descriptor, journal, and semantic cross-bindings."""

    _fail(type(prepared) is PreparedGeometryQuery, "prepared query has the wrong type")
    query = neutral.validate_authenticated_single_solver_query(
        prepared.query,
        solver="cvc5",
        descriptor_schema=DESCRIPTOR_SCHEMA,
        solver_profile_schema=PROFILE_SCHEMA,
        authenticated_journal_commands=prepared.query.journal_commands,
    )
    semantic = _validated_semantic(query)
    blueprint = semantic["system"]["blueprint"]
    _fail(
        query.descriptor["producer"]
        == {"id": "atail-named-polynomial-geometry", "version": "v1"}
        and query.descriptor["semantic_verifier"]
        == {"id": "atail-exact-rational-atom-replay", "version": "v1"}
        and query.descriptor["stage_id"] == "atail-geometry"
        and query.descriptor["query_id"] == blueprint["case_id"],
        "descriptor identity is not bound to the ATAIL blueprint",
    )
    _fail(
        query.descriptor["original_smt2"]["path"] == "query.state-only.smt2",
        "original query path is not canonical",
    )
    _fail(
        tuple(item.path for item in query.source_files) == REQUIRED_SOURCE_PATHS,
        "required source ledger mismatch",
    )
    _fail(
        query.descriptor["sources"]
        == [
            {
                "path": item.path,
                "bytes": len(item.payload),
                "sha256": _sha(item.payload),
            }
            for item in query.source_files
        ],
        "source custody ledger mismatch",
    )
    variables = semantic["system"]["variable_order"]
    expected_variables = sorted(
        ({"id": name, "term": _smt_symbol(name), "sort": "Real"} for name in variables),
        key=lambda item: item["id"],
    )
    enabled = semantic["enabled_atom_order"]
    expected_atoms = sorted(
        ({"id": name, "assumption_term": _smt_symbol(name)} for name in enabled),
        key=lambda item: item["id"],
    )
    _fail(
        query.descriptor["variables"] == expected_variables,
        "descriptor variable ledger mismatch",
    )
    _fail(
        query.descriptor["named_atoms"] == expected_atoms,
        "descriptor atom ledger mismatch",
    )
    _fail(
        query.descriptor["solve"]
        == {
            "assumption_ids": [],
            "readback_variable_ids": list(variables),
            "include_model": True,
        },
        "solve contract is not empty-assumption complete-readback",
    )
    expected_commands = _emit_commands(semantic)
    expected_journal = b"".join(
        command.encode("utf-8") + b"\n" for command in expected_commands
    )
    _fail(
        query.journal_commands == expected_commands,
        "journal differs from semantic query",
    )
    _fail(
        query.original_smt2 == expected_journal == query.journal_smt2,
        "state-only query custody mismatch",
    )
    forbidden = ("check-sat", "get-unsat-core", "produce-unsat-cores")
    _fail(
        not any(marker in query.original_smt2.decode("utf-8") for marker in forbidden),
        "query contains a forbidden command",
    )
    return query


def _tokenize(raw: str) -> list[str]:
    _fail(
        type(raw) is str and len(raw.encode("utf-8")) <= MAX_MODEL_BYTES,
        "SMT response exceeds cap",
    )
    tokens: list[str] = []

    def append(token: str) -> None:
        tokens.append(token)
        _fail(len(tokens) <= MAX_MODEL_TOKENS, "SMT response has too many tokens")

    index = 0
    while index < len(raw):
        if raw[index].isspace():
            index += 1
            continue
        if raw[index] in "()":
            append(raw[index])
            index += 1
            continue
        if raw[index] == "|":
            end = raw.find("|", index + 1)
            _fail(
                end >= 0 and "\\" not in raw[index : end + 1],
                "invalid quoted SMT symbol",
            )
            append(raw[index : end + 1])
            index = end + 1
            continue
        end = index
        while end < len(raw) and not raw[end].isspace() and raw[end] not in "()":
            end += 1
        token = raw[index:end]
        _fail(";" not in token and bool(token), "unsupported SMT token")
        append(token)
        index = end
    return tokens


def _parse_sexpr(raw: str) -> object:
    tokens = _tokenize(raw)
    _fail(bool(tokens), "SMT response is empty")
    index = 0

    def parse(depth: int) -> object:
        nonlocal index
        _fail(
            depth <= MAX_MODEL_DEPTH and index < len(tokens), "malformed SMT expression"
        )
        token = tokens[index]
        index += 1
        if token != "(":
            _fail(token != ")", "unexpected SMT close parenthesis")
            return token
        values: list[object] = []
        while True:
            _fail(index < len(tokens), "unterminated SMT expression")
            if tokens[index] == ")":
                index += 1
                return values
            values.append(parse(depth + 1))

    result = parse(0)
    _fail(index == len(tokens), "SMT response has trailing expressions")
    return result


def _rational(value: object) -> Fraction:
    if type(value) is str:
        if _INTEGER.fullmatch(value):
            return Fraction(int(value))
        if _DECIMAL.fullmatch(value):
            return Fraction(value)
        raise ATailPiqdCvc5Error("NON_RATIONAL_MODEL")
    _fail(type(value) is list and bool(value), "NON_RATIONAL_MODEL")
    if len(value) == 2 and value[0] == "-":
        return -_rational(value[1])
    if len(value) == 3 and value[0] == "/":
        denominator = _rational(value[2])
        _fail(denominator != 0, "NON_RATIONAL_MODEL")
        return _rational(value[1]) / denominator
    raise ATailPiqdCvc5Error("NON_RATIONAL_MODEL")


def _symbol(value: object) -> str:
    _fail(type(value) is str, "model/readback symbol is invalid")
    if value.startswith("|"):
        _fail(value.endswith("|") and len(value) > 2, "quoted model symbol is invalid")
        value = value[1:-1]
    _fail(_SIMPLE_SYMBOL.fullmatch(value) is not None, "model symbol is not canonical")
    return value


def _readback(raw: str, expected: Sequence[str]) -> dict[str, Fraction]:
    root = _parse_sexpr(raw)
    _fail(type(root) is list, "readback is not a pair list")
    result: dict[str, Fraction] = {}
    for pair in root:
        _fail(type(pair) is list and len(pair) == 2, "readback entry is malformed")
        name = _symbol(pair[0])
        _fail(name not in result, "readback contains a duplicate variable")
        result[name] = _rational(pair[1])
    _fail(
        set(result) == set(expected) and len(result) == len(expected),
        "readback is not exact and complete",
    )
    return result


def _model_bindings(raw: str, expected: Sequence[str]) -> dict[str, Fraction]:
    root = _parse_sexpr(raw)
    _fail(type(root) is list, "model is malformed")
    definitions = root[1:] if root and root[0] == "model" else root
    result: dict[str, Fraction] = {}
    for definition in definitions:
        _fail(
            type(definition) is list
            and len(definition) == 5
            and definition[0] == "define-fun"
            and definition[2] == []
            and definition[3] == "Real",
            "model definition is malformed",
        )
        name = _symbol(definition[1])
        _fail(name not in result, "model contains a duplicate variable")
        result[name] = _rational(definition[4])
    _fail(
        set(result) == set(expected) and len(result) == len(expected),
        "model is not exact and complete",
    )
    return result


def _evaluate(
    polynomial: Mapping[str, object],
    variables: Sequence[str],
    values: Mapping[str, Fraction],
) -> Fraction:
    total = Fraction(0)
    for term in polynomial["terms"]:
        coefficient = term["coefficient"]
        value = Fraction(coefficient["numerator"], coefficient["denominator"])
        for name, power in zip(variables, term["powers"], strict=True):
            if power:
                value *= values[name] ** power
        total += value
    return total


def verify_sat_model(
    query: neutral.SourceSemanticQuery,
    solver: str,
    model: str,
    values: str | None,
) -> neutral.SemanticVerification:
    """Replay every enabled atom from immutable exact polynomial data."""

    _fail(
        solver == "cvc5" and type(model) is str and type(values) is str,
        "SAT replay received wrong solver/model shape",
    )
    semantic = _validated_semantic(query)
    system = semantic["system"]
    variable_order = system["variable_order"]
    readback = _readback(values, variable_order)
    model_values = _model_bindings(model, variable_order)
    _fail(model_values == readback, "model/readback rational values disagree")
    by_id = {atom["id"]: atom for atom in system["atoms"]}
    checked: list[str] = []
    for atom_id in semantic["enabled_atom_order"]:
        atom = by_id[atom_id]
        evaluations = [
            _evaluate(polynomial, variable_order, readback)
            for polynomial in atom["polynomials"]
        ]
        relation = atom["relation"]
        accepted = {
            "eq": evaluations[0] == 0,
            "ge": evaluations[0] >= 0,
            "gt": evaluations[0] > 0,
            "ne": evaluations[0] != 0,
            "or_ne": any(value != 0 for value in evaluations),
        }[relation]
        if not accepted:
            return neutral.SemanticVerification(
                False,
                {
                    "reason": "ATOM_RELATION_MISMATCH",
                    "atom_id": atom_id,
                    "relation": relation,
                    "evaluations": [str(value) for value in evaluations],
                },
            )
        checked.append(atom_id)
    return neutral.SemanticVerification(
        True,
        {
            "atom_count": len(checked),
            "atom_order": checked,
            "atom_ledger_sha256": _sha(_canonical(system["atoms"])),
            "variable_order": list(variable_order),
            "readback_sha256": _sha(
                _canonical({name: str(readback[name]) for name in variable_order})
            ),
            "arithmetic": "exact-rational/Fraction",
        },
    )


def _output_identity(info: os.stat_result) -> tuple[int, int, int, int, int]:
    return (
        info.st_dev,
        info.st_ino,
        info.st_mode,
        info.st_nlink,
        info.st_size,
    )


def _output_directory_identity(info: os.stat_result) -> tuple[int, int, int]:
    return (info.st_dev, info.st_ino, info.st_mode)


def _recapture_output(descriptor: int, expected_bytes: int) -> bytes:
    os.lseek(descriptor, 0, os.SEEK_SET)
    chunks: list[bytes] = []
    remaining = expected_bytes + 1
    while remaining:
        chunk = os.read(descriptor, min(1024 * 1024, remaining))
        if not chunk:
            break
        chunks.append(chunk)
        remaining -= len(chunk)
    return b"".join(chunks)


def _write_immutable(output_fd: int, name: str, payload: bytes) -> dict[str, object]:
    _fail(type(payload) is bytes, "immutable output payload must be exact bytes")
    _fail(
        type(output_fd) is int
        and output_fd >= 0
        and type(name) is str
        and name not in {"", ".", ".."}
        and "/" not in name
        and "\\" not in name
        and "\0" not in name,
        "output descriptor/name is invalid",
    )
    descriptor: int | None = None
    rebound_descriptor: int | None = None
    try:
        directory_before = os.fstat(output_fd)
        _fail(
            stat.S_ISDIR(directory_before.st_mode),
            "output descriptor is not a directory",
        )
        directory_identity = _output_directory_identity(directory_before)
        descriptor = os.open(
            name,
            os.O_RDWR | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW,
            0o400,
            dir_fd=output_fd,
        )
        view = memoryview(payload)
        while view:
            written = os.write(descriptor, view)
            _fail(written > 0, "immutable output write made no progress")
            view = view[written:]
        os.fsync(descriptor)

        sealed = os.fstat(descriptor)
        _fail(
            stat.S_ISREG(sealed.st_mode)
            and sealed.st_nlink == 1
            and sealed.st_size == len(payload),
            f"immutable output {name} is not a private regular file",
        )
        identity = _output_identity(sealed)
        _fail(
            _recapture_output(descriptor, len(payload)) == payload
            and _output_identity(os.fstat(descriptor)) == identity,
            f"immutable output {name} failed descriptor recapture",
        )

        path_info = os.stat(name, dir_fd=output_fd, follow_symlinks=False)
        _fail(
            stat.S_ISREG(path_info.st_mode)
            and path_info.st_nlink == 1
            and _output_identity(path_info) == identity,
            f"immutable output {name} pathname changed",
        )
        rebound_descriptor = os.open(
            name, os.O_RDONLY | os.O_NOFOLLOW, dir_fd=output_fd
        )
        _fail(
            _output_identity(os.fstat(rebound_descriptor)) == identity
            and _recapture_output(rebound_descriptor, len(payload)) == payload
            and _output_identity(os.fstat(rebound_descriptor)) == identity,
            f"immutable output {name} failed pathname recapture",
        )
        os.fsync(output_fd)
        final_path = os.stat(name, dir_fd=output_fd, follow_symlinks=False)
        directory_after = os.fstat(output_fd)
        _fail(
            stat.S_ISREG(final_path.st_mode)
            and final_path.st_nlink == 1
            and _output_identity(final_path) == identity
            and _recapture_output(descriptor, len(payload)) == payload
            and _output_identity(os.fstat(descriptor)) == identity
            and stat.S_ISDIR(directory_after.st_mode)
            and _output_directory_identity(directory_after) == directory_identity,
            f"immutable output {name} changed before publication",
        )
    except ATailPiqdCvc5Error:
        raise
    except OSError as exc:
        raise ATailPiqdCvc5Error(f"cannot create immutable output {name}") from exc
    finally:
        for opened in (rebound_descriptor, descriptor):
            if opened is not None:
                try:
                    os.close(opened)
                except OSError as exc:
                    raise ATailPiqdCvc5Error(
                        f"cannot close immutable output {name}"
                    ) from exc
    return {"path": name, "bytes": len(payload), "sha256": _sha(payload)}


def run_prepared_query(
    prepared: PreparedGeometryQuery,
    *,
    transport: neutral.PiqdTransport,
    output_fd: int,
    used_session_ids: set[str] | None = None,
) -> dict[str, object]:
    """Run exactly one authenticated cvc5 solve and retain custody artifacts."""

    query = validate_prepared_query(prepared)
    custody = {
        "descriptor": _write_immutable(
            output_fd, "descriptor.json", query.descriptor_bytes
        ),
        "original_smt2": _write_immutable(
            output_fd, "original.smt2", query.original_smt2
        ),
        "journal_smt2": _write_immutable(output_fd, "journal.smt2", query.journal_smt2),
        "sources": [
            _write_immutable(output_fd, f"source-{index:02d}.py", source.payload)
            for index, source in enumerate(query.source_files)
        ],
    }
    engine = neutral.run_authenticated_single_solver_query(
        query,
        solver="cvc5",
        descriptor_schema=DESCRIPTOR_SCHEMA,
        solver_profile_schema=PROFILE_SCHEMA,
        authenticated_journal_commands=query.journal_commands,
        transport=transport,
        semantic_verifier=verify_sat_model,
        output_fd=output_fd,
        used_session_ids=used_session_ids,
    )
    raw_status = engine["raw_status"]
    effective = engine["effective_status"]
    classification = (
        "UNSAT_DISCOVERY_ONLY"
        if raw_status == "UNSAT"
        else "SAT_EXACT_RATIONAL_REPLAY"
        if effective == "SAT_SEMANTICALLY_REPLAYED"
        else effective
    )
    result = {
        "schema": RESULT_SCHEMA,
        "query_id": query.descriptor["query_id"],
        "raw_status": raw_status,
        "effective_status": effective,
        "classification": classification,
        "core_entitlement": False,
        "custody": custody,
        "engine": engine,
        "claims": dict(FALSE_CLAIMS),
        "proof_blueprint": dict(PROOF_BLUEPRINT),
    }
    _write_immutable(output_fd, "atail-result.json", _canonical(result) + b"\n")
    return result


_SESSION_KEYS = {
    "id",
    "lane",
    "state",
    "solver_name",
    "solver_sha256",
    "solver_signature",
    "protocol_version",
    "journal_path",
    "created_at",
    "updated_at",
    "clauses",
    "max_var",
    "solves",
    "last_status",
    "declared_num_vars",
    "last_solve_index",
    "last_assumption_free",
    "last_terminal_unsat",
    "label",
}
_RECEIPT_KEYS = {
    "solve_index",
    "base_commands",
    "base_bytes",
    "base_sha256",
    "solver_signature",
    "solver_sha256",
    "assumptions",
    "timeout_ms",
    "effective_deadline_ms",
    "include_model",
    "get_values",
    "status",
    "solve_ms",
    "result_sha256",
    "at",
}
_RECEIPTS_KEYS = {
    "session_id",
    "lane",
    "journal_path",
    "receipts_path",
    "count",
    "receipts",
}
_RESULT_KEYS = {
    "schema",
    "query_id",
    "raw_status",
    "effective_status",
    "classification",
    "core_entitlement",
    "custody",
    "engine",
    "claims",
    "proof_blueprint",
}
_ENGINE_KEYS = {
    "solver",
    "session_id",
    "solver_signature",
    "solver_sha256",
    "raw_status",
    "effective_status",
    "solve_index",
    "result_sha256",
    "response_lost",
    "reconciled_from_receipt",
    "reconciliation_attempts",
    "result_digest_advisory",
    "unsat_assumptions",
    "semantic_replay",
    "artifacts",
    "claims",
}
_BASE_RUN_FILES = {
    "descriptor.json",
    "original.smt2",
    "journal.smt2",
    "atail-result.json",
    *(f"source-{index:02d}.py" for index in range(len(REQUIRED_SOURCE_PATHS))),
}
_COMMON_ENGINE_FILES = {
    "cvc5.session.json",
    "cvc5.smt2",
    "cvc5.receipts-before.json",
    "cvc5.receipts.json",
    "cvc5.closed-session.json",
}


def _run_identity(info: os.stat_result) -> tuple[int, int, int, int, int, int, int]:
    return (
        info.st_dev,
        info.st_ino,
        info.st_mode,
        info.st_nlink,
        info.st_size,
        info.st_mtime_ns,
        info.st_ctime_ns,
    )


def _read_run_leaf(output_fd: int, name: str, expected: os.stat_result) -> bytes:
    descriptor: int | None = None
    try:
        descriptor = os.open(name, os.O_RDONLY | os.O_NOFOLLOW, dir_fd=output_fd)
        opened = os.fstat(descriptor)
        _fail(
            _run_identity(opened) == _run_identity(expected),
            f"run artifact {name} changed before opening",
        )
        chunks: list[bytes] = []
        remaining = MAX_RUN_ARTIFACT_BYTES + 1
        while remaining:
            chunk = os.read(descriptor, min(1024 * 1024, remaining))
            if not chunk:
                break
            chunks.append(chunk)
            remaining -= len(chunk)
        payload = b"".join(chunks)
        after = os.fstat(descriptor)
        rebound = os.stat(name, dir_fd=output_fd, follow_symlinks=False)
        _fail(
            len(payload) <= MAX_RUN_ARTIFACT_BYTES
            and len(payload) == expected.st_size
            and _run_identity(after) == _run_identity(expected)
            and _run_identity(rebound) == _run_identity(expected),
            f"run artifact {name} changed during capture",
        )
        return payload
    finally:
        if descriptor is not None:
            os.close(descriptor)


def _capture_run_directory(
    output_fd: int,
) -> tuple[tuple[int, int, int, int, int, int, int], dict[str, bytes]]:
    _fail(type(output_fd) is int and output_fd >= 0, "run directory fd is invalid")
    before = os.fstat(output_fd)
    _fail(stat.S_ISDIR(before.st_mode), "run directory fd is not a directory")
    names = os.listdir(output_fd)
    _fail(
        1 <= len(names) <= MAX_RUN_FILES and len(names) == len(set(names)),
        "run directory inventory is not bounded and unique",
    )
    files: dict[str, bytes] = {}
    total = 0
    for name in sorted(names):
        _fail(
            type(name) is str
            and name not in {"", ".", ".."}
            and "/" not in name
            and "\\" not in name
            and "\0" not in name
            and len(os.fsencode(name)) <= 255,
            "run directory contains an unsafe artifact name",
        )
        info = os.stat(name, dir_fd=output_fd, follow_symlinks=False)
        _fail(
            stat.S_ISREG(info.st_mode)
            and info.st_nlink == 1
            and info.st_size <= MAX_RUN_ARTIFACT_BYTES,
            f"run artifact {name} is not a bounded private regular file",
        )
        payload = _read_run_leaf(output_fd, name, info)
        total += len(payload)
        _fail(total <= MAX_RUN_TOTAL_BYTES, "run directory exceeds its byte cap")
        files[name] = payload
    after = os.fstat(output_fd)
    _fail(
        _run_identity(after) == _run_identity(before)
        and sorted(os.listdir(output_fd)) == sorted(names),
        "run directory changed during capture",
    )
    return _run_identity(before), files


def _finalize_run_directory_capture(
    output_fd: int,
    directory_identity: tuple[int, int, int, int, int, int, int],
    files: Mapping[str, bytes],
) -> None:
    final_identity, final_files = _capture_run_directory(output_fd)
    _fail(
        final_identity == directory_identity and final_files == files,
        "run directory changed during validation",
    )


def _strict_json_artifact(payload: bytes, where: str) -> object:
    def pairs(items: list[tuple[str, object]]) -> dict[str, object]:
        result: dict[str, object] = {}
        for key, value in items:
            if key in result:
                raise ValueError(f"duplicate key {key!r}")
            result[key] = value
        return result

    def reject_number(value: str) -> object:
        raise ValueError(f"unsupported JSON number {value}")

    try:
        value = json.loads(
            payload.decode("utf-8"),
            object_pairs_hook=pairs,
            parse_float=reject_number,
            parse_constant=reject_number,
        )
    except (
        UnicodeDecodeError,
        ValueError,
        json.JSONDecodeError,
        RecursionError,
    ) as exc:
        raise ATailPiqdCvc5Error(f"{where} is not strict UTF-8 JSON") from exc

    nodes = 0

    def visit(item: object, depth: int) -> None:
        nonlocal nodes
        nodes += 1
        _fail(nodes <= MAX_JSON_NODES, f"{where} exceeds the JSON node cap")
        _fail(depth <= MAX_JSON_DEPTH, f"{where} exceeds the JSON depth cap")
        if item is None or type(item) in {bool, int, str}:
            return
        if type(item) is list:
            for child in item:
                visit(child, depth + 1)
            return
        _fail(type(item) is dict, f"{where} contains a non-builtin JSON value")
        for key, child in item.items():
            _fail(type(key) is str, f"{where} contains a non-text object key")
            visit(child, depth + 1)

    visit(value, 0)
    _fail(payload == _canonical(value) + b"\n", f"{where} is not canonical JSON")
    return value


def _json_run_file(files: Mapping[str, bytes], name: str) -> object:
    try:
        payload = files[name]
    except KeyError as exc:
        raise ATailPiqdCvc5Error(f"run directory is missing {name}") from exc
    return _strict_json_artifact(payload, f"run artifact {name}")


def _exact_object(value: object, keys: set[str], where: str) -> dict[str, object]:
    _fail(
        type(value) is dict and set(value) == keys,
        f"{where} has an unexpected field set",
    )
    return value


def _exact_int(value: object, where: str, minimum: int = 0) -> int:
    _fail(type(value) is int and value >= minimum, f"{where} is not a bounded integer")
    return value


def _digest(value: object, where: str) -> str:
    _fail(
        type(value) is str
        and len(value) == 64
        and all(character in "0123456789abcdef" for character in value),
        f"{where} is not a lowercase SHA-256",
    )
    return value


def _artifact_record(
    files: Mapping[str, bytes], value: object, name: str, where: str
) -> dict[str, object]:
    record = _exact_object(value, {"path", "bytes", "sha256"}, where)
    _fail(
        record
        == {"path": name, "bytes": len(files[name]), "sha256": _sha(files[name])},
        f"{where} does not bind exact artifact bytes",
    )
    return record


def _reconstruct_run_query(
    files: Mapping[str, bytes], descriptor: dict[str, object]
) -> neutral.SourceSemanticQuery:
    original = files["original.smt2"]
    commands, normalized = neutral.normalize_state_journal(original)
    _fail(normalized == files["journal.smt2"], "persisted state journal mismatch")
    query = neutral.SourceSemanticQuery(
        descriptor=descriptor,
        descriptor_bytes=files["descriptor.json"],
        original_smt2=original,
        journal_commands=commands,
        journal_smt2=normalized,
        source_files=tuple(
            neutral.SourceSnapshot(path, files[f"source-{index:02d}.py"])
            for index, path in enumerate(REQUIRED_SOURCE_PATHS)
        ),
    )
    return validate_prepared_query(PreparedGeometryQuery(query))


def _validate_run_session(
    value: object, query: neutral.SourceSemanticQuery, state: str
) -> dict[str, object]:
    session = _exact_object(value, _SESSION_KEYS, f"{state} PIQD session")
    session_id = session["id"]
    _fail(type(session_id) is str, "PIQD session id is not text")
    try:
        _fail(
            str(uuid.UUID(session_id)) == session_id, "PIQD session id is not canonical"
        )
    except ValueError as exc:
        raise ATailPiqdCvc5Error("PIQD session id is not canonical") from exc
    expected_label = (
        f"p97-smt-source/{query.descriptor['query_id']}/cvc5/"
        f"{query.descriptor['semantic_sha256'][:12]}"
    )
    _fail(
        session["lane"] == "smt"
        and session["state"] == state
        and session["solver_name"] == "cvc5"
        and session["label"] == expected_label,
        f"{state} PIQD session identity mismatch",
    )
    _digest(session["solver_sha256"], "PIQD session solver hash")
    _fail(
        type(session["solver_signature"]) is str and bool(session["solver_signature"]),
        "PIQD session solver signature is invalid",
    )
    for key in (
        "protocol_version",
        "created_at",
        "updated_at",
        "clauses",
        "max_var",
        "solves",
    ):
        _exact_int(session[key], f"PIQD session {key}")
    _fail(
        session["protocol_version"] == 1
        and session["updated_at"] >= session["created_at"]
        and session["declared_num_vars"] is None
        and session["max_var"] == 0,
        "PIQD session protocol/CNF metadata mismatch",
    )
    for key in ("last_solve_index",):
        _fail(
            session[key] is None or type(session[key]) is int,
            f"PIQD session {key} is invalid",
        )
    for key in ("last_assumption_free", "last_terminal_unsat"):
        _fail(
            session[key] is None or type(session[key]) is bool,
            f"PIQD session {key} is invalid",
        )
    _fail(
        session["last_status"] is None
        or session["last_status"] in {"SAT", "UNSAT", "UNKNOWN"},
        "PIQD session status is invalid",
    )
    journal = PurePosixPath(str(session["journal_path"]))
    _fail(
        str(journal) == session["journal_path"]
        and "." not in journal.parts
        and ".." not in journal.parts
        and journal.name == "journal.smt2"
        and journal.parent.name == session_id
        and journal.parent.parent.name == "sessions",
        "PIQD session journal path is not canonical",
    )
    return session


def _answer_keys(status: str) -> set[str]:
    if status == "SAT":
        return {"model", "values"}
    if status == "UNSAT":
        return {"core", "terminal_unsat"}
    raise ATailPiqdCvc5Error("only terminal SAT/UNSAT runs are publishable")


def _validate_run_solve(
    value: object, *, status: str, timeout_ms: int, reconciled: bool
) -> dict[str, object]:
    keys = {
        "status",
        "solve_ms",
        "solve_index",
        "result_sha256",
        "effective_deadline_ms",
        *_answer_keys(status),
    }
    if not reconciled:
        keys.add("replayed")
    solve = _exact_object(value, keys, "PIQD solve")
    _fail(solve["status"] == status, "PIQD solve status mismatch")
    _exact_int(solve["solve_ms"], "PIQD solve time")
    _fail(
        _exact_int(solve["solve_index"], "PIQD solve index", 1) == 1,
        "PIQD solve index is not one",
    )
    expected_deadline = neutral.effective_deadline_ms(
        timeout_ms, "persisted timeout_ms"
    )
    _fail(
        _exact_int(solve["effective_deadline_ms"], "PIQD effective deadline", 1)
        == expected_deadline,
        "PIQD solve deadline mismatch",
    )
    claimed = _digest(solve["result_sha256"], "PIQD solve result hash")
    _fail(
        neutral.piqd_result_digest(solve) == claimed, "PIQD solve result hash mismatch"
    )
    if not reconciled:
        _fail(solve["replayed"] is False, "PIQD solve replay flag is not exact false")
    if status == "SAT":
        _fail(
            type(solve["model"]) is str and type(solve["values"]) is str,
            "PIQD SAT model/readback is not text",
        )
        _fail(
            len(solve["model"].encode()) <= MAX_MODEL_BYTES
            and len(solve["values"].encode()) <= MAX_MODEL_BYTES,
            "PIQD SAT model/readback exceeds the byte cap",
        )
    else:
        _fail(
            solve["core"] == [] and solve["terminal_unsat"] is True,
            "PIQD UNSAT is not empty-assumption terminal discovery",
        )
    return solve


def _validate_receipts_envelope(
    value: object,
    *,
    session: Mapping[str, object],
    query: neutral.SourceSemanticQuery,
    solve: Mapping[str, object] | None,
) -> dict[str, object] | None:
    envelope = _exact_object(value, _RECEIPTS_KEYS, "PIQD receipts envelope")
    journal = PurePosixPath(str(session["journal_path"]))
    _fail(
        envelope["session_id"] == session["id"]
        and envelope["lane"] == "smt"
        and envelope["journal_path"] == session["journal_path"]
        and envelope["receipts_path"] == str(journal.with_name("receipts.jsonl")),
        "PIQD receipts envelope identity mismatch",
    )
    _fail(type(envelope["receipts"]) is list, "PIQD receipts are not a list")
    expected_count = 0 if solve is None else 1
    _fail(
        type(envelope["count"]) is int
        and envelope["count"] == expected_count
        and len(envelope["receipts"]) == expected_count,
        "PIQD receipts count mismatch",
    )
    if solve is None:
        return None
    status = str(solve["status"])
    receipt = _exact_object(
        envelope["receipts"][0],
        _RECEIPT_KEYS | _answer_keys(status),
        "PIQD receipt",
    )
    for key in ("solve_index", "base_commands", "base_bytes", "solve_ms", "at"):
        _exact_int(receipt[key], f"PIQD receipt {key}")
    for key in ("base_sha256", "solver_sha256", "result_sha256"):
        _digest(receipt[key], f"PIQD receipt {key}")
    timeout_ms = query.descriptor["solver_profile"]["timeout_ms"]
    _fail(
        receipt["solve_index"] == 1
        and receipt["base_commands"] == len(query.journal_commands)
        and receipt["base_bytes"] == len(query.journal_smt2)
        and receipt["base_sha256"] == _sha(query.journal_smt2)
        and receipt["solver_signature"] == session["solver_signature"]
        and receipt["solver_sha256"] == session["solver_sha256"]
        and receipt["assumptions"] == []
        and receipt["timeout_ms"] == timeout_ms
        and receipt["effective_deadline_ms"]
        == neutral.effective_deadline_ms(timeout_ms, "persisted timeout_ms")
        and receipt["include_model"] is True
        and receipt["get_values"] == list(query.get_values),
        "PIQD receipt request/base/solver binding mismatch",
    )
    answer_fields = {"status", "model", "values", "core", "terminal_unsat"}
    _fail(
        all(receipt.get(key) == solve.get(key) for key in answer_fields)
        and receipt["solve_ms"] == solve["solve_ms"]
        and receipt["result_sha256"] == solve["result_sha256"]
        and neutral.piqd_result_digest(receipt) == receipt["result_sha256"],
        "PIQD receipt and solve disagree",
    )
    return receipt


def _validate_session_lifecycle(
    *,
    created: Mapping[str, object],
    closed: Mapping[str, object],
    reconciliation: Mapping[str, object] | None,
    query: neutral.SourceSemanticQuery,
    solve: Mapping[str, object],
) -> None:
    identity_keys = {
        "id",
        "solver_name",
        "solver_sha256",
        "solver_signature",
        "protocol_version",
        "journal_path",
        "created_at",
        "label",
    }
    _fail(
        created["clauses"] == 0
        and created["solves"] == 0
        and created["updated_at"] == created["created_at"]
        and all(
            created[key] is None
            for key in (
                "last_status",
                "last_solve_index",
                "last_assumption_free",
                "last_terminal_unsat",
            )
        ),
        "created PIQD session is not fresh",
    )
    terminal = reconciliation if reconciliation is not None else closed
    _fail(
        all(closed[key] == created[key] for key in identity_keys)
        and all(terminal[key] == created[key] for key in identity_keys),
        "PIQD session identity changed across lifecycle",
    )
    for value, where in ((terminal, "terminal"), (closed, "closed")):
        _fail(
            value["clauses"] == len(query.journal_commands)
            and value["solves"] == 1
            and value["last_status"] == solve["status"]
            and value["last_solve_index"] == 1
            and value["last_assumption_free"] is True
            and value["last_terminal_unsat"] == solve.get("terminal_unsat"),
            f"{where} PIQD session solve state mismatch",
        )


def _validate_run_directory_snapshot(files: Mapping[str, bytes]) -> dict[str, object]:
    result = _exact_object(
        _json_run_file(files, "atail-result.json"), _RESULT_KEYS, "ATAIL result"
    )
    engine = _exact_object(result["engine"], _ENGINE_KEYS, "ATAIL engine result")
    raw_status = engine["raw_status"]
    _fail(raw_status in {"SAT", "UNSAT"}, "published run is not terminal SAT/UNSAT")
    reconciled = engine["response_lost"] is True
    _fail(
        type(engine["response_lost"]) is bool
        and engine["reconciled_from_receipt"] is reconciled,
        "PIQD reconciliation flags mismatch",
    )
    attempts = engine["reconciliation_attempts"]
    _fail(
        type(attempts) is int
        and ((reconciled and 1 <= attempts <= 7) or (not reconciled and attempts == 0)),
        "PIQD reconciliation attempt count mismatch",
    )
    expected_files = _BASE_RUN_FILES | _COMMON_ENGINE_FILES
    expected_files |= (
        {"cvc5.reconciled-solve.json", "cvc5.reconciliation-session.json"}
        if reconciled
        else {"cvc5.solve.json"}
    )
    if raw_status == "SAT":
        expected_files.add("cvc5.semantic.json")
    _fail(set(files) == expected_files, "run directory has an unexpected inventory")

    descriptor_value = _json_run_file(files, "descriptor.json")
    _fail(type(descriptor_value) is dict, "ATAIL descriptor is not an exact object")
    descriptor = descriptor_value
    query = _reconstruct_run_query(files, descriptor)
    _fail(files["cvc5.smt2"] == query.journal_smt2, "PIQD SMT export mismatch")

    custody = _exact_object(
        result["custody"],
        {"descriptor", "original_smt2", "journal_smt2", "sources"},
        "ATAIL custody",
    )
    _artifact_record(
        files, custody["descriptor"], "descriptor.json", "descriptor custody"
    )
    _artifact_record(
        files, custody["original_smt2"], "original.smt2", "original custody"
    )
    _artifact_record(files, custody["journal_smt2"], "journal.smt2", "journal custody")
    _fail(
        type(custody["sources"]) is list
        and len(custody["sources"]) == len(REQUIRED_SOURCE_PATHS),
        "source custody count mismatch",
    )
    for index, record in enumerate(custody["sources"]):
        _artifact_record(
            files, record, f"source-{index:02d}.py", f"source custody {index}"
        )

    artifacts = engine["artifacts"]
    artifact_names = {
        "session": "cvc5.session.json",
        "smt2": "cvc5.smt2",
        "receipts_before": "cvc5.receipts-before.json",
        "receipts": "cvc5.receipts.json",
        "closed_session": "cvc5.closed-session.json",
    }
    artifact_names["reconciled_solve" if reconciled else "solve"] = (
        "cvc5.reconciled-solve.json" if reconciled else "cvc5.solve.json"
    )
    if reconciled:
        artifact_names["reconciliation_session"] = "cvc5.reconciliation-session.json"
    if raw_status == "SAT":
        artifact_names["semantic"] = "cvc5.semantic.json"
    artifact_object = _exact_object(
        artifacts, set(artifact_names), "PIQD artifact ledger"
    )
    for key, name in artifact_names.items():
        _artifact_record(files, artifact_object[key], name, f"PIQD artifact {key}")

    created = _validate_run_session(
        _json_run_file(files, "cvc5.session.json"), query, "live"
    )
    closed = _validate_run_session(
        _json_run_file(files, "cvc5.closed-session.json"), query, "closed"
    )
    reconciliation = (
        _validate_run_session(
            _json_run_file(files, "cvc5.reconciliation-session.json"), query, "live"
        )
        if reconciled
        else None
    )
    timeout_ms = query.descriptor["solver_profile"]["timeout_ms"]
    solve_name = "cvc5.reconciled-solve.json" if reconciled else "cvc5.solve.json"
    solve = _validate_run_solve(
        _json_run_file(files, solve_name),
        status=raw_status,
        timeout_ms=timeout_ms,
        reconciled=reconciled,
    )
    _validate_receipts_envelope(
        _json_run_file(files, "cvc5.receipts-before.json"),
        session=created,
        query=query,
        solve=None,
    )
    _validate_receipts_envelope(
        _json_run_file(files, "cvc5.receipts.json"),
        session=created,
        query=query,
        solve=solve,
    )
    _validate_session_lifecycle(
        created=created,
        closed=closed,
        reconciliation=reconciliation,
        query=query,
        solve=solve,
    )

    semantic: dict[str, object] | None = None
    unsat: dict[str, object] | None = None
    if raw_status == "SAT":
        verification = verify_sat_model(
            query, "cvc5", str(solve["model"]), str(solve["values"])
        )
        _fail(verification.accepted is True, "persisted SAT model failed exact replay")
        semantic = {
            "accepted": True,
            "evidence": verification.evidence,
            "verifier": query.descriptor["semantic_verifier"],
            "model_sha256": _sha(str(solve["model"]).encode()),
            "values_sha256": _sha(str(solve["values"]).encode()),
        }
        _fail(
            _canonical(_json_run_file(files, "cvc5.semantic.json"))
            == _canonical(semantic),
            "persisted SAT semantic replay mismatch",
        )
        effective = "SAT_SEMANTICALLY_REPLAYED"
        classification = "SAT_EXACT_RATIONAL_REPLAY"
    else:
        unsat = {
            "basis": "get-unsat-assumptions",
            "named_core_support": False,
            "daemon_field": "core",
            "assumption_terms": [],
            "source_atom_ids": [],
            "terminal_unsat": True,
        }
        effective = classification = "UNSAT_DISCOVERY_ONLY"

    digest = neutral.piqd_result_digest(solve)
    expected_engine = {
        "solver": "cvc5",
        "session_id": created["id"],
        "solver_signature": created["solver_signature"],
        "solver_sha256": created["solver_sha256"],
        "raw_status": raw_status,
        "effective_status": effective,
        "solve_index": 1,
        "result_sha256": solve["result_sha256"],
        "response_lost": reconciled,
        "reconciled_from_receipt": reconciled,
        "reconciliation_attempts": attempts,
        "result_digest_advisory": {
            "algorithm": "piqd-smt-solve-result/v1",
            "locally_recomputed": digest,
            "matches_daemon": True,
        },
        "unsat_assumptions": unsat,
        "semantic_replay": semantic,
        "artifacts": artifact_object,
        "claims": dict(_ENGINE_FALSE_CLAIMS),
    }
    expected_result = {
        "schema": RESULT_SCHEMA,
        "query_id": query.descriptor["query_id"],
        "raw_status": raw_status,
        "effective_status": effective,
        "classification": classification,
        "core_entitlement": False,
        "custody": custody,
        "engine": expected_engine,
        "claims": dict(FALSE_CLAIMS),
        "proof_blueprint": dict(PROOF_BLUEPRINT),
    }
    _fail(
        _canonical(result) == _canonical(expected_result),
        "ATAIL result reconstruction mismatch",
    )
    return result


def validate_run_directory(output_fd: int) -> dict[str, object]:
    """Validate one complete ATAIL PIQD run using only its held directory fd."""

    try:
        directory_identity, files = _capture_run_directory(output_fd)
        result = _validate_run_directory_snapshot(files)
        _finalize_run_directory_capture(output_fd, directory_identity, files)
        return result
    except ATailPiqdCvc5Error:
        raise
    except (
        neutral.SmtSourceAdapterError,
        OSError,
        KeyError,
        TypeError,
        ValueError,
        RecursionError,
    ) as exc:
        raise ATailPiqdCvc5Error(
            "persisted ATAIL run validation failed closed"
        ) from exc
