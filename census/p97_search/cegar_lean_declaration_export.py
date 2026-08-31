"""Closed-registry Lean declaration export and replayable custody receipts.

The receipt produced here authenticates a declaration statement and the tool
that serialized it.  It is deliberately not semantic authority: it does not
claim any P97 bridge, refinement, terminal, or consumer-reachability result.
"""

from __future__ import annotations

import argparse
import hashlib
import os
import re
import shutil
import stat
import subprocess
import tempfile
from collections.abc import Mapping, Sequence
from pathlib import Path
from types import MappingProxyType
from typing import Any, NoReturn

from census.cap_configuration import schema as json_schema
from census.p97_search import cegar_producer_ref as custody

SCHEMA = "p97-cegar-lean-declaration-receipt/v1"
EXPORT_SCHEMA = "p97-cegar-lean-declaration-export/v1"
SERIALIZER_SCHEMA = "p97-cegar-lean-declaration-serializer/v1"
TOOLCHAIN_SCHEMA = "p97-cegar-lean-toolchain/v1"
INVOCATION_SCHEMA = "p97-cegar-lean-invocation/v1"

CONTROL_REGISTRY_ID = "lean-core-eq-trans-control-v1"
_SERIALIZER_PATH = "census/p97_search/cegar_lean_declaration_serializer.lean"
_EXPORTER_PATH = "census/p97_search/cegar_lean_declaration_export.py"
_LEAN_CWD = "lean"
_SOURCE_PATHS = (
    "census/cap_configuration/schema.py",
    "census/p97_search/cegar_producer_ref.py",
    _EXPORTER_PATH,
    _SERIALIZER_PATH,
)

_EXPECTED_TOOLCHAIN_BYTES = b"leanprover/lean4:v4.27.0\n"
_EXPECTED_TOOLCHAIN_SHA256 = hashlib.sha256(_EXPECTED_TOOLCHAIN_BYTES).hexdigest()
_EXPECTED_LEAN_VERSION = re.compile(
    r"Lean \(version 4\.27\.0, [^,\r\n]+, "
    r"commit db93fe1608548721853390a10cd40580fe7d22ae, Release\)"
)
_EXPECTED_LAKE_VERSION = "Lake version 5.0.0-src+db93fe1 (Lean version 4.27.0)"

_CONTROL_REGISTRY = MappingProxyType(
    {
        CONTROL_REGISTRY_ID: MappingProxyType(
            {
                "registry_id": CONTROL_REGISTRY_ID,
                "import_module": "Init.Prelude",
                "qualified_name": "Eq.trans",
                "trust_classification": "LEAN_KERNEL_STATEMENT_CONTROL_ONLY",
            }
        )
    }
)

MAX_DOCUMENT_BYTES = 4 * 1024 * 1024
MAX_SERIALIZER_STDERR_BYTES = 64 * 1024
MAX_AST_NODES = 200_000
MAX_AST_DEPTH = 2_048
PROCESS_TIMEOUT_SECONDS = 120

_SHA256 = re.compile(r"[0-9a-f]{64}")
_REGISTRY_ID = re.compile(r"[a-z0-9][a-z0-9_.-]{0,127}")
_MODULE_NAME = re.compile(r"[A-Za-z_][A-Za-z0-9_]*(?:\.[A-Za-z_][A-Za-z0-9_]*)*")
_TOP_KEYS = frozenset(
    {
        "schema",
        "registry",
        "export",
        "digests",
        "serializer",
        "toolchain",
        "invocation",
        "receipt_sha256",
    }
)
_REGISTRY_KEYS = frozenset(
    {"registry_id", "import_module", "qualified_name", "trust_classification"}
)
_EXPORT_KEYS = frozenset(
    {
        "schema",
        "registry_id",
        "import_module",
        "qualified_name",
        "defining_module",
        "declaration_kind",
        "is_unsafe",
        "is_partial",
        "universe_parameters",
        "elaborated_type",
        "hypotheses",
        "constants",
        "imports",
    }
)
_DIGEST_KEYS = frozenset(
    {
        "export_output_sha256",
        "normalized_statement_sha256",
        "universe_levels_sha256",
        "constants_sha256",
        "hypothesis_sha256",
        "import_sha256",
    }
)
_SERIALIZER_KEYS = frozenset(
    {"schema", "entrypoint", "sources", "source_manifest_sha256"}
)
_SOURCE_KEYS = frozenset({"path", "sha256"})
_TOOLCHAIN_KEYS = frozenset(
    {
        "schema",
        "lean_toolchain_sha256",
        "lakefile_sha256",
        "lake_manifest_sha256",
        "lean_executable_sha256",
        "lake_executable_sha256",
        "lake_launcher_sha256",
        "lean_version",
        "lake_version",
        "identity_sha256",
    }
)
_INVOCATION_KEYS = frozenset(
    {"schema", "cwd", "argv", "environment", "identity_sha256"}
)
_ENVIRONMENT_KEYS = frozenset(
    {"LANG", "LC_ALL", "TZ", "PATH_POLICY", "inherited_variables"}
)
_DECLARATION_KINDS = frozenset(
    {
        "AXIOM",
        "DEFINITION",
        "THEOREM",
        "OPAQUE",
        "QUOTIENT",
        "INDUCTIVE",
        "CONSTRUCTOR",
        "RECURSOR",
    }
)
_BINDER_INFOS = frozenset(
    {"DEFAULT", "IMPLICIT", "STRICT_IMPLICIT", "INSTANCE_IMPLICIT"}
)
_LEVEL_TAGS = frozenset({"ZERO", "SUCC", "MAX", "IMAX", "PARAM"})
_EXPR_TAGS = frozenset(
    {
        "BVAR",
        "SORT",
        "CONST",
        "APP",
        "LAM",
        "FORALL",
        "LET",
        "NAT_LITERAL",
        "STRING_LITERAL",
        "PROJ",
    }
)


class DeclarationReceiptError(ValueError):
    """A declaration export or its custody receipt failed closed."""


def _fail(message: str) -> NoReturn:
    raise DeclarationReceiptError(message)


def _exact(value: Any, keys: frozenset[str], path: str) -> dict[str, Any]:
    if type(value) is not dict:
        _fail(f"{path} must be an object")
    if any(type(key) is not str for key in value):
        _fail(f"{path} has a non-string object key")
    try:
        return json_schema.exact_keys(value, keys, path)
    except json_schema.CapConfigurationSchemaError as exc:
        raise DeclarationReceiptError(str(exc)) from exc


def _list(value: Any, path: str) -> list[Any]:
    try:
        return json_schema.exact_list(value, path)
    except json_schema.CapConfigurationSchemaError as exc:
        raise DeclarationReceiptError(str(exc)) from exc


def _text(value: Any, path: str, maximum_bytes: int = 1_024) -> str:
    try:
        result = json_schema.canonical_text(value, path)
    except json_schema.CapConfigurationSchemaError as exc:
        raise DeclarationReceiptError(str(exc)) from exc
    if len(result.encode("utf-8")) > maximum_bytes:
        _fail(f"{path} is too long")
    return result


def _sha256(value: Any, path: str) -> str:
    if type(value) is not str or _SHA256.fullmatch(value) is None:
        _fail(f"{path} must be a lowercase SHA-256 digest")
    return value


def _nat(value: Any, path: str) -> int:
    if type(value) is not int or value < 0:
        _fail(f"{path} must be a nonnegative integer")
    return value


def _canonical_sha256(value: Any) -> str:
    try:
        return json_schema.raw_sha256(json_schema.canonical_json_bytes(value))
    except json_schema.CapConfigurationSchemaError as exc:
        raise DeclarationReceiptError(str(exc)) from exc


def _ordered_unique_strings(
    value: Any,
    path: str,
    *,
    sorted_order: bool,
    module_names: bool = False,
) -> list[str]:
    items = _list(value, path)
    strings: list[str] = []
    for index, item in enumerate(items):
        text = _text(item, f"{path}[{index}]")
        if module_names and _MODULE_NAME.fullmatch(text) is None:
            _fail(f"{path}[{index}] is not a canonical module name")
        strings.append(text)
    if len(strings) != len(set(strings)):
        _fail(f"{path} must not contain duplicates")
    if sorted_order and strings != sorted(strings):
        _fail(f"{path} must be sorted")
    return strings


def _level(
    value: Any,
    path: str,
    parameters: frozenset[str],
    *,
    depth: int,
    budget: list[int],
) -> None:
    if depth > MAX_AST_DEPTH:
        _fail(f"{path} exceeds the AST depth limit")
    budget[0] -= 1
    if budget[0] < 0:
        _fail("declaration AST exceeds the node limit")
    if type(value) is not dict:
        _fail(f"{path} must be a level object")
    tag = value.get("tag")
    if tag not in _LEVEL_TAGS:
        _fail(f"{path}.tag is not a supported level tag")
    keys = {
        "ZERO": frozenset({"tag"}),
        "SUCC": frozenset({"tag", "of"}),
        "MAX": frozenset({"tag", "left", "right"}),
        "IMAX": frozenset({"tag", "left", "right"}),
        "PARAM": frozenset({"tag", "name"}),
    }[tag]
    level = _exact(value, keys, path)
    if tag == "SUCC":
        _level(level["of"], f"{path}.of", parameters, depth=depth + 1, budget=budget)
    elif tag in {"MAX", "IMAX"}:
        _level(
            level["left"],
            f"{path}.left",
            parameters,
            depth=depth + 1,
            budget=budget,
        )
        _level(
            level["right"],
            f"{path}.right",
            parameters,
            depth=depth + 1,
            budget=budget,
        )
    elif tag == "PARAM":
        name = _text(level["name"], f"{path}.name")
        if name not in parameters:
            _fail(f"{path}.name is not a declared universe parameter")


def _binder(value: Any, path: str) -> str:
    result = _text(value, path)
    if result not in _BINDER_INFOS:
        _fail(f"{path} must be one of {sorted(_BINDER_INFOS)}")
    return result


def _expr(
    value: Any,
    path: str,
    parameters: frozenset[str],
    *,
    scope: int,
    depth: int,
    budget: list[int],
) -> None:
    if depth > MAX_AST_DEPTH:
        _fail(f"{path} exceeds the AST depth limit")
    budget[0] -= 1
    if budget[0] < 0:
        _fail("declaration AST exceeds the node limit")
    if type(value) is not dict:
        _fail(f"{path} must be an expression object")
    tag = value.get("tag")
    if tag not in _EXPR_TAGS:
        _fail(f"{path}.tag is not a supported expression tag")
    key_map = {
        "BVAR": frozenset({"tag", "index"}),
        "SORT": frozenset({"tag", "level"}),
        "CONST": frozenset({"tag", "name", "levels"}),
        "APP": frozenset({"tag", "function", "argument"}),
        "LAM": frozenset({"tag", "binder_name", "binder_info", "binder_type", "body"}),
        "FORALL": frozenset(
            {"tag", "binder_name", "binder_info", "binder_type", "body"}
        ),
        "LET": frozenset(
            {
                "tag",
                "binder_name",
                "binder_type",
                "value",
                "body",
                "nondependent",
            }
        ),
        "NAT_LITERAL": frozenset({"tag", "value"}),
        "STRING_LITERAL": frozenset({"tag", "value"}),
        "PROJ": frozenset({"tag", "type_name", "index", "structure"}),
    }
    expression = _exact(value, key_map[tag], path)
    child = {
        "parameters": parameters,
        "scope": scope,
        "depth": depth + 1,
        "budget": budget,
    }
    if tag == "BVAR":
        index = _nat(expression["index"], f"{path}.index")
        if index >= scope:
            _fail(f"{path}.index escapes its binder scope")
    elif tag == "SORT":
        _level(
            expression["level"],
            f"{path}.level",
            parameters,
            depth=depth + 1,
            budget=budget,
        )
    elif tag == "CONST":
        _text(expression["name"], f"{path}.name")
        levels = _list(expression["levels"], f"{path}.levels")
        for index, level in enumerate(levels):
            _level(
                level,
                f"{path}.levels[{index}]",
                parameters,
                depth=depth + 1,
                budget=budget,
            )
    elif tag == "APP":
        _expr(expression["function"], f"{path}.function", **child)
        _expr(expression["argument"], f"{path}.argument", **child)
    elif tag in {"LAM", "FORALL"}:
        _text(expression["binder_name"], f"{path}.binder_name")
        _binder(expression["binder_info"], f"{path}.binder_info")
        _expr(expression["binder_type"], f"{path}.binder_type", **child)
        _expr(
            expression["body"],
            f"{path}.body",
            parameters,
            scope=scope + 1,
            depth=depth + 1,
            budget=budget,
        )
    elif tag == "LET":
        _text(expression["binder_name"], f"{path}.binder_name")
        if type(expression["nondependent"]) is not bool:
            _fail(f"{path}.nondependent must be a boolean")
        _expr(expression["binder_type"], f"{path}.binder_type", **child)
        _expr(expression["value"], f"{path}.value", **child)
        _expr(
            expression["body"],
            f"{path}.body",
            parameters,
            scope=scope + 1,
            depth=depth + 1,
            budget=budget,
        )
    elif tag == "NAT_LITERAL":
        _nat(expression["value"], f"{path}.value")
    elif tag == "STRING_LITERAL":
        _text(expression["value"], f"{path}.value", MAX_DOCUMENT_BYTES)
    elif tag == "PROJ":
        _text(expression["type_name"], f"{path}.type_name")
        _nat(expression["index"], f"{path}.index")
        _expr(expression["structure"], f"{path}.structure", **child)


def _constants_in(value: Any, result: dict[bytes, dict[str, Any]]) -> None:
    if type(value) is not dict:
        return
    if value.get("tag") == "CONST":
        entry = {"name": value["name"], "levels": value["levels"]}
        result[json_schema.canonical_json_bytes(entry)] = entry
    for key, child in value.items():
        if key == "tag":
            continue
        if type(child) is dict:
            _constants_in(child, result)
        elif type(child) is list:
            for item in child:
                _constants_in(item, result)


def _expected_hypotheses(elaborated_type: Any) -> list[dict[str, Any]]:
    hypotheses: list[dict[str, Any]] = []
    current = elaborated_type
    while type(current) is dict and current.get("tag") == "FORALL":
        hypotheses.append(
            {
                "index": len(hypotheses),
                "binder_name": current["binder_name"],
                "binder_info": current["binder_info"],
                "type": current["binder_type"],
            }
        )
        current = current["body"]
    return hypotheses


def _validate_export(value: Any, registry: Mapping[str, Any]) -> None:
    export = _exact(value, _EXPORT_KEYS, "receipt.export")
    if export["schema"] != EXPORT_SCHEMA:
        _fail(f"receipt.export.schema must be {EXPORT_SCHEMA}")
    for field in ("registry_id", "import_module", "qualified_name"):
        if export[field] != registry[field]:
            _fail(f"receipt.export.{field} disagrees with the closed registry")
    import_module = _text(export["import_module"], "receipt.export.import_module")
    if _MODULE_NAME.fullmatch(import_module) is None:
        _fail("receipt.export.import_module is not canonical")
    _text(export["qualified_name"], "receipt.export.qualified_name")
    defining_module = _text(export["defining_module"], "receipt.export.defining_module")
    if _MODULE_NAME.fullmatch(defining_module) is None:
        _fail("receipt.export.defining_module is not canonical")
    if export["declaration_kind"] not in _DECLARATION_KINDS:
        _fail("receipt.export.declaration_kind is not supported")
    for field in ("is_unsafe", "is_partial"):
        if type(export[field]) is not bool:
            _fail(f"receipt.export.{field} must be a boolean")
    parameters = _ordered_unique_strings(
        export["universe_parameters"],
        "receipt.export.universe_parameters",
        sorted_order=False,
    )
    parameter_set = frozenset(parameters)
    budget = [MAX_AST_NODES]
    _expr(
        export["elaborated_type"],
        "receipt.export.elaborated_type",
        parameter_set,
        scope=0,
        depth=0,
        budget=budget,
    )
    hypotheses = _list(export["hypotheses"], "receipt.export.hypotheses")
    for index, raw in enumerate(hypotheses):
        hypothesis = _exact(
            raw,
            frozenset({"index", "binder_name", "binder_info", "type"}),
            f"receipt.export.hypotheses[{index}]",
        )
        if hypothesis["index"] != index:
            _fail("receipt.export.hypotheses indices must be consecutive")
        _text(
            hypothesis["binder_name"], f"receipt.export.hypotheses[{index}].binder_name"
        )
        _binder(
            hypothesis["binder_info"], f"receipt.export.hypotheses[{index}].binder_info"
        )
        _expr(
            hypothesis["type"],
            f"receipt.export.hypotheses[{index}].type",
            parameter_set,
            scope=index,
            depth=0,
            budget=budget,
        )
    if hypotheses != _expected_hypotheses(export["elaborated_type"]):
        _fail("receipt.export.hypotheses does not match the forall telescope")
    constants = _list(export["constants"], "receipt.export.constants")
    constant_keys: list[bytes] = []
    for index, raw in enumerate(constants):
        constant = _exact(
            raw,
            frozenset({"name", "levels"}),
            f"receipt.export.constants[{index}]",
        )
        _text(constant["name"], f"receipt.export.constants[{index}].name")
        for level_index, level in enumerate(
            _list(constant["levels"], f"receipt.export.constants[{index}].levels")
        ):
            _level(
                level,
                f"receipt.export.constants[{index}].levels[{level_index}]",
                parameter_set,
                depth=0,
                budget=budget,
            )
        constant_keys.append(json_schema.canonical_json_bytes(constant))
    if constant_keys != sorted(set(constant_keys)):
        _fail("receipt.export.constants must be unique and canonically sorted")
    expected_constants: dict[bytes, dict[str, Any]] = {}
    _constants_in(export["elaborated_type"], expected_constants)
    if constants != [expected_constants[key] for key in sorted(expected_constants)]:
        _fail("receipt.export.constants does not match the elaborated type")
    imports = _ordered_unique_strings(
        export["imports"],
        "receipt.export.imports",
        sorted_order=True,
        module_names=True,
    )
    if registry["import_module"] not in imports:
        _fail("receipt.export.imports omits the closed-registry import module")


def _validate_serializer(value: Any) -> None:
    serializer = _exact(value, _SERIALIZER_KEYS, "receipt.serializer")
    if serializer["schema"] != SERIALIZER_SCHEMA:
        _fail(f"receipt.serializer.schema must be {SERIALIZER_SCHEMA}")
    if serializer["entrypoint"] != _SERIALIZER_PATH:
        _fail("receipt.serializer.entrypoint is not the frozen serializer")
    sources = _list(serializer["sources"], "receipt.serializer.sources")
    paths: list[str] = []
    for index, raw in enumerate(sources):
        source = _exact(raw, _SOURCE_KEYS, f"receipt.serializer.sources[{index}]")
        path = _text(source["path"], f"receipt.serializer.sources[{index}].path")
        _sha256(source["sha256"], f"receipt.serializer.sources[{index}].sha256")
        paths.append(path)
    if paths != sorted(_SOURCE_PATHS):
        _fail("receipt.serializer.sources is not the frozen source manifest")
    expected = _canonical_sha256(sources)
    if serializer["source_manifest_sha256"] != expected:
        _fail("receipt.serializer.source_manifest_sha256 is invalid")


def _validate_toolchain(value: Any) -> None:
    toolchain = _exact(value, _TOOLCHAIN_KEYS, "receipt.toolchain")
    if toolchain["schema"] != TOOLCHAIN_SCHEMA:
        _fail(f"receipt.toolchain.schema must be {TOOLCHAIN_SCHEMA}")
    for field in (
        "lean_toolchain_sha256",
        "lakefile_sha256",
        "lake_manifest_sha256",
        "lean_executable_sha256",
        "lake_executable_sha256",
        "lake_launcher_sha256",
    ):
        _sha256(toolchain[field], f"receipt.toolchain.{field}")
    if toolchain["lean_toolchain_sha256"] != _EXPECTED_TOOLCHAIN_SHA256:
        _fail("receipt.toolchain does not use the approved Lean toolchain pin")
    lean_version = _text(
        toolchain["lean_version"], "receipt.toolchain.lean_version", 4_096
    )
    if _EXPECTED_LEAN_VERSION.fullmatch(lean_version) is None:
        _fail("receipt.toolchain.lean_version is not the approved Lean release")
    lake_version = _text(
        toolchain["lake_version"], "receipt.toolchain.lake_version", 4_096
    )
    if lake_version != _EXPECTED_LAKE_VERSION:
        _fail("receipt.toolchain.lake_version is not the approved Lake release")
    claimed = _sha256(toolchain["identity_sha256"], "receipt.toolchain.identity_sha256")
    unsigned = dict(toolchain)
    unsigned.pop("identity_sha256")
    if claimed != _canonical_sha256(unsigned):
        _fail("receipt.toolchain.identity_sha256 is invalid")


def _validate_invocation(value: Any, registry: Mapping[str, Any]) -> None:
    invocation = _exact(value, _INVOCATION_KEYS, "receipt.invocation")
    if invocation["schema"] != INVOCATION_SCHEMA:
        _fail(f"receipt.invocation.schema must be {INVOCATION_SCHEMA}")
    if invocation["cwd"] != _LEAN_CWD:
        _fail("receipt.invocation.cwd is not frozen")
    argv = _list(invocation["argv"], "receipt.invocation.argv")
    expected_argv = _invocation_argv(registry)
    if argv != expected_argv or any(type(item) is not str for item in argv):
        _fail("receipt.invocation.argv is not the frozen invocation")
    environment = _exact(
        invocation["environment"], _ENVIRONMENT_KEYS, "receipt.invocation.environment"
    )
    if (
        environment["LANG"] != "C"
        or environment["LC_ALL"] != "C"
        or environment["TZ"] != "UTC"
    ):
        _fail("receipt.invocation.environment locale or timezone is not frozen")
    if environment["PATH_POLICY"] != "INHERITED_PATH_WITH_PINNED_SELECTED_BINARIES":
        _fail("receipt.invocation.environment.PATH_POLICY is not frozen")
    inherited = _exact(
        environment["inherited_variables"],
        frozenset({"PATH"}),
        "receipt.invocation.environment.inherited_variables",
    )
    _text(
        inherited["PATH"],
        "receipt.invocation.environment.inherited_variables.PATH",
        32_768,
    )
    claimed = _sha256(
        invocation["identity_sha256"], "receipt.invocation.identity_sha256"
    )
    unsigned = dict(invocation)
    unsigned.pop("identity_sha256")
    if claimed != _canonical_sha256(unsigned):
        _fail("receipt.invocation.identity_sha256 is invalid")


def _alpha_normalize_ast(value: Any, universes: Mapping[str, str]) -> Any:
    if type(value) is list:
        return [_alpha_normalize_ast(item, universes) for item in value]
    if type(value) is not dict:
        return value
    tag = value.get("tag")
    normalized: dict[str, Any] = {}
    for key, item in value.items():
        if key == "binder_name" and tag in {"LAM", "FORALL", "LET"}:
            normalized[key] = "_"
        elif key == "name" and tag == "PARAM":
            normalized[key] = universes[item]
        else:
            normalized[key] = _alpha_normalize_ast(item, universes)
    return normalized


def _normalized_statement(export: Mapping[str, Any]) -> dict[str, Any]:
    universe_names = export["universe_parameters"]
    universes = {name: f"u{index}" for index, name in enumerate(universe_names)}
    return {
        "universe_parameters": [universes[name] for name in universe_names],
        "elaborated_type": _alpha_normalize_ast(export["elaborated_type"], universes),
    }


def _component_digests(export: Mapping[str, Any]) -> dict[str, str]:
    return {
        "export_output_sha256": _canonical_sha256(export),
        "normalized_statement_sha256": _canonical_sha256(_normalized_statement(export)),
        "universe_levels_sha256": _canonical_sha256(export["universe_parameters"]),
        "constants_sha256": _canonical_sha256(export["constants"]),
        "hypothesis_sha256": _canonical_sha256(export["hypotheses"]),
        "import_sha256": _canonical_sha256(export["imports"]),
    }


def validate_declaration_receipt(value: Any) -> None:
    """Validate one exact, self-authenticating declaration receipt."""

    receipt = _exact(value, _TOP_KEYS, "receipt")
    if receipt["schema"] != SCHEMA:
        _fail(f"receipt.schema must be {SCHEMA}")
    registry = _exact(receipt["registry"], _REGISTRY_KEYS, "receipt.registry")
    registry_id = registry["registry_id"]
    if type(registry_id) is not str or _REGISTRY_ID.fullmatch(registry_id) is None:
        _fail("receipt.registry.registry_id is not canonical")
    frozen = _CONTROL_REGISTRY.get(registry_id)
    if frozen is None or registry != dict(frozen):
        _fail("receipt.registry is not an exact closed-registry entry")
    _validate_export(receipt["export"], registry)
    digests = _exact(receipt["digests"], _DIGEST_KEYS, "receipt.digests")
    for field in _DIGEST_KEYS:
        _sha256(digests[field], f"receipt.digests.{field}")
    if digests != _component_digests(receipt["export"]):
        _fail("receipt.digests does not authenticate the declaration export")
    _validate_serializer(receipt["serializer"])
    _validate_toolchain(receipt["toolchain"])
    _validate_invocation(receipt["invocation"], registry)
    claimed = _sha256(receipt["receipt_sha256"], "receipt.receipt_sha256")
    unsigned = dict(receipt)
    unsigned.pop("receipt_sha256")
    if claimed != _canonical_sha256(unsigned):
        _fail("receipt.receipt_sha256 does not authenticate its payload")


def canonical_declaration_receipt_bytes(value: Any) -> bytes:
    """Return the canonical stored receipt with exactly one trailing newline."""

    validate_declaration_receipt(value)
    try:
        payload = json_schema.stored_json_bytes(value)
    except json_schema.CapConfigurationSchemaError as exc:
        raise DeclarationReceiptError(str(exc)) from exc
    if len(payload) > MAX_DOCUMENT_BYTES:
        _fail("declaration receipt exceeds the size limit")
    return payload


def parse_declaration_receipt_bytes(payload: bytes) -> dict[str, Any]:
    """Parse only the canonical stored JSON spelling of a receipt."""

    if type(payload) is not bytes or len(payload) > MAX_DOCUMENT_BYTES:
        _fail("declaration receipt payload is not bounded exact bytes")
    try:
        value = json_schema.parse_stored_json_bytes(payload)
    except json_schema.CapConfigurationSchemaError as exc:
        raise DeclarationReceiptError(str(exc)) from exc
    validate_declaration_receipt(value)
    return value


def _repository_root() -> Path:
    return Path(__file__).resolve().parents[2]


def _stable_file_bytes(path: Path, maximum_bytes: int = 4_096) -> bytes:
    flags = os.O_RDONLY | getattr(os, "O_CLOEXEC", 0) | getattr(os, "O_NOFOLLOW", 0)
    descriptor: int | None = None
    try:
        descriptor = os.open(path, flags)
        before = os.fstat(descriptor)
        if not stat.S_ISREG(before.st_mode):
            _fail(f"read input is not a regular file: {path}")
        chunks: list[bytes] = []
        total = 0
        while True:
            chunk = os.read(descriptor, min(64 * 1024, maximum_bytes + 1 - total))
            if not chunk:
                break
            chunks.append(chunk)
            total += len(chunk)
            if total > maximum_bytes:
                _fail(f"read input exceeds its size limit: {path}")
        after = os.fstat(descriptor)
        metadata = lambda info: (
            info.st_dev,
            info.st_ino,
            info.st_mode,
            info.st_nlink,
            info.st_size,
            info.st_mtime_ns,
            info.st_ctime_ns,
        )
        if metadata(before) != metadata(after) or total != after.st_size:
            _fail(f"read input mutated during access: {path}")
        return b"".join(chunks)
    except DeclarationReceiptError:
        raise
    except OSError as exc:
        raise DeclarationReceiptError(f"cannot read input file: {path}") from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)


def _stable_file_sha256(path: Path, maximum_bytes: int = 128 * 1024 * 1024) -> str:
    flags = os.O_RDONLY | getattr(os, "O_CLOEXEC", 0) | getattr(os, "O_NOFOLLOW", 0)
    descriptor: int | None = None
    try:
        descriptor = os.open(path, flags)
        before = os.fstat(descriptor)
        if not stat.S_ISREG(before.st_mode):
            _fail(f"hashed input is not a regular file: {path}")
        hasher = hashlib.sha256()
        total = 0
        while True:
            chunk = os.read(descriptor, 64 * 1024)
            if not chunk:
                break
            total += len(chunk)
            if total > maximum_bytes:
                _fail(f"hashed input exceeds its size limit: {path}")
            hasher.update(chunk)
        after = os.fstat(descriptor)
        identity = lambda info: (
            info.st_dev,
            info.st_ino,
            info.st_mode,
            info.st_nlink,
            info.st_size,
            info.st_mtime_ns,
            info.st_ctime_ns,
        )
        if identity(before) != identity(after) or total != after.st_size:
            _fail(f"hashed input mutated during read: {path}")
        return hasher.hexdigest()
    except DeclarationReceiptError:
        raise
    except OSError as exc:
        raise DeclarationReceiptError(f"cannot hash input file: {path}") from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)


def _source_manifest(root: Path) -> dict[str, Any]:
    sources = [
        {"path": relative, "sha256": _stable_file_sha256(root / relative)}
        for relative in sorted(_SOURCE_PATHS)
    ]
    return {
        "schema": SERIALIZER_SCHEMA,
        "entrypoint": _SERIALIZER_PATH,
        "sources": sources,
        "source_manifest_sha256": _canonical_sha256(sources),
    }


def _process_environment() -> dict[str, str]:
    path = os.environ.get("PATH")
    if not path:
        _fail("PATH must be present for the pinned Lake invocation")
    return {"PATH": path, "LANG": "C", "LC_ALL": "C", "TZ": "UTC"}


def _run_small(
    argv: Sequence[str],
    *,
    cwd: Path,
    maximum_bytes: int = 64 * 1024,
) -> str:
    try:
        completed = subprocess.run(
            list(argv),
            cwd=cwd,
            env=_process_environment(),
            stdin=subprocess.DEVNULL,
            capture_output=True,
            check=False,
            timeout=30,
        )
    except (OSError, subprocess.SubprocessError) as exc:
        raise DeclarationReceiptError(f"command failed to execute: {argv[0]}") from exc
    if len(completed.stdout) > maximum_bytes or len(completed.stderr) > maximum_bytes:
        _fail(f"command output exceeded its bound: {argv[0]}")
    if completed.returncode != 0:
        detail = completed.stderr.decode("utf-8", "replace").strip()
        _fail(f"command failed ({completed.returncode}): {argv[0]}: {detail}")
    try:
        return completed.stdout.decode("utf-8").strip()
    except UnicodeDecodeError as exc:
        raise DeclarationReceiptError(
            f"command emitted non-UTF-8 output: {argv[0]}"
        ) from exc


def _lake_launcher() -> Path:
    launcher = shutil.which("lake", path=_process_environment()["PATH"])
    if launcher is None:
        _fail("lake is not available on PATH")
    try:
        resolved = Path(launcher).resolve(strict=True)
    except OSError as exc:
        raise DeclarationReceiptError("cannot resolve the PATH-selected lake") from exc
    if not resolved.is_absolute():
        _fail("the PATH-selected lake did not resolve to an absolute path")
    return resolved


def _selected_executables(root: Path) -> tuple[Path, Path]:
    launcher = _lake_launcher()
    cwd = root / _LEAN_CWD
    lean_text = _run_small([str(launcher), "env", "which", "lean"], cwd=cwd)
    lake_text = _run_small([str(launcher), "env", "which", "lake"], cwd=cwd)
    lean_path = Path(lean_text)
    lake_path = Path(lake_text)
    if not lean_path.is_absolute() or not lake_path.is_absolute():
        _fail("lake env which returned a non-absolute executable path")
    return lean_path, lake_path


def _capture_toolchain(root: Path) -> dict[str, Any]:
    pin_bytes = _stable_file_bytes(root / "lean/lean-toolchain")
    if pin_bytes != _EXPECTED_TOOLCHAIN_BYTES:
        _fail("repository lean-toolchain is not the approved v4.27.0 pin")
    launcher_path = _lake_launcher()
    launcher_digest = _stable_file_sha256(launcher_path)
    lean_path, lake_path = _selected_executables(root)
    lean_version = _run_small([str(lean_path), "--version"], cwd=root / _LEAN_CWD)
    lake_version = _run_small([str(lake_path), "--version"], cwd=root / _LEAN_CWD)
    if _EXPECTED_LEAN_VERSION.fullmatch(lean_version) is None:
        _fail("selected lean executable is not the approved v4.27.0 release")
    if lake_version != _EXPECTED_LAKE_VERSION:
        _fail("selected lake executable is not the approved v4.27.0 release")
    if _stable_file_sha256(_lake_launcher()) != launcher_digest:
        _fail("PATH-selected lake launcher mutated during toolchain capture")
    unsigned = {
        "schema": TOOLCHAIN_SCHEMA,
        "lean_toolchain_sha256": hashlib.sha256(pin_bytes).hexdigest(),
        "lakefile_sha256": _stable_file_sha256(root / "lean/lakefile.toml"),
        "lake_manifest_sha256": _stable_file_sha256(root / "lean/lake-manifest.json"),
        "lean_executable_sha256": _stable_file_sha256(lean_path),
        "lake_executable_sha256": _stable_file_sha256(lake_path),
        "lake_launcher_sha256": launcher_digest,
        "lean_version": lean_version,
        "lake_version": lake_version,
    }
    return {**unsigned, "identity_sha256": _canonical_sha256(unsigned)}


def _invocation_argv(registry: Mapping[str, Any]) -> list[str]:
    return [
        "lake",
        "env",
        "lean",
        "--run",
        f"../{_SERIALIZER_PATH}",
        registry["registry_id"],
        registry["import_module"],
        registry["qualified_name"],
    ]


def _invocation(registry: Mapping[str, Any]) -> dict[str, Any]:
    environment = _process_environment()
    unsigned = {
        "schema": INVOCATION_SCHEMA,
        "cwd": _LEAN_CWD,
        "argv": _invocation_argv(registry),
        "environment": {
            "LANG": environment["LANG"],
            "LC_ALL": environment["LC_ALL"],
            "TZ": environment["TZ"],
            "PATH_POLICY": "INHERITED_PATH_WITH_PINNED_SELECTED_BINARIES",
            "inherited_variables": {"PATH": environment["PATH"]},
        },
    }
    return {**unsigned, "identity_sha256": _canonical_sha256(unsigned)}


def _run_serializer(
    root: Path,
    registry: Mapping[str, Any],
    toolchain: Mapping[str, Any],
) -> dict[str, Any]:
    current = _capture_toolchain(root)
    if current != dict(toolchain):
        _fail("selected Lean toolchain changed before serializer execution")
    lean_path, lake_path = _selected_executables(root)
    if (
        _stable_file_sha256(lean_path) != toolchain["lean_executable_sha256"]
        or _stable_file_sha256(lake_path) != toolchain["lake_executable_sha256"]
        or _stable_file_sha256(_lake_launcher()) != toolchain["lake_launcher_sha256"]
    ):
        _fail("selected Lean executables changed before serializer execution")
    invocation = _invocation(registry)
    executable_argv = [str(lake_path), *invocation["argv"][1:]]
    with tempfile.TemporaryFile() as stdout, tempfile.TemporaryFile() as stderr:
        try:
            completed = subprocess.run(
                executable_argv,
                cwd=root / invocation["cwd"],
                env=_process_environment(),
                stdin=subprocess.DEVNULL,
                stdout=stdout,
                stderr=stderr,
                check=False,
                timeout=PROCESS_TIMEOUT_SECONDS,
            )
        except (OSError, subprocess.SubprocessError) as exc:
            raise DeclarationReceiptError(
                "Lean declaration serializer failed to execute"
            ) from exc
        stdout.seek(0, os.SEEK_END)
        stdout_size = stdout.tell()
        stderr.seek(0, os.SEEK_END)
        stderr_size = stderr.tell()
        if stdout_size > MAX_DOCUMENT_BYTES:
            _fail("Lean declaration serializer stdout exceeds the size limit")
        if stderr_size > MAX_SERIALIZER_STDERR_BYTES:
            _fail("Lean declaration serializer stderr exceeds the size limit")
        stdout.seek(0)
        stderr.seek(0)
        output = stdout.read()
        error_output = stderr.read()
    if completed.returncode != 0:
        detail = error_output.decode("utf-8", "replace").strip()
        _fail(f"Lean declaration serializer failed ({completed.returncode}): {detail}")
    if error_output:
        detail = error_output.decode("utf-8", "replace").strip()
        _fail(f"Lean declaration serializer emitted stderr: {detail}")
    try:
        value = json_schema.parse_stored_json_bytes(output)
    except json_schema.CapConfigurationSchemaError as exc:
        raise DeclarationReceiptError(
            f"Lean declaration serializer output is not canonical: {exc}"
        ) from exc
    _validate_export(value, registry)
    return value


def build_declaration_receipt(registry_id: str) -> dict[str, Any]:
    """Export one closed-registry declaration and bind a replayable receipt."""

    if type(registry_id) is not str:
        _fail("registry_id must be a string")
    frozen = _CONTROL_REGISTRY.get(registry_id)
    if frozen is None:
        _fail(f"registry_id is not in the closed declaration registry: {registry_id}")
    registry = dict(frozen)
    root = _repository_root()
    serializer = _source_manifest(root)
    toolchain = _capture_toolchain(root)
    invocation = _invocation(registry)
    export = _run_serializer(root, registry, toolchain)
    if _source_manifest(root) != serializer:
        _fail("serializer sources mutated during declaration export")
    if _capture_toolchain(root) != toolchain:
        _fail("Lean toolchain mutated during declaration export")
    unsigned = {
        "schema": SCHEMA,
        "registry": registry,
        "export": export,
        "digests": _component_digests(export),
        "serializer": serializer,
        "toolchain": toolchain,
        "invocation": invocation,
    }
    result = {**unsigned, "receipt_sha256": _canonical_sha256(unsigned)}
    validate_declaration_receipt(result)
    return result


def replay_declaration_receipt(value: Any) -> None:
    """Re-run the frozen export and require byte-identical semantic content."""

    validate_declaration_receipt(value)
    receipt = dict(value)
    root = _repository_root()
    registry = receipt["registry"]
    if _source_manifest(root) != receipt["serializer"]:
        _fail("current serializer sources do not match the receipt")
    if _capture_toolchain(root) != receipt["toolchain"]:
        _fail("current Lean toolchain does not match the receipt")
    if _invocation(registry) != receipt["invocation"]:
        _fail("current invocation environment does not match the receipt")
    replayed = _run_serializer(root, registry, receipt["toolchain"])
    if replayed != receipt["export"]:
        _fail("replayed declaration export differs from the receipt")
    if _source_manifest(root) != receipt["serializer"]:
        _fail("serializer sources mutated during receipt replay")
    if _capture_toolchain(root) != receipt["toolchain"]:
        _fail("Lean toolchain mutated during receipt replay")


def producer_ref_inputs(value: Any) -> dict[str, Any]:
    """Replay, then return only the producer-reference fields substantiated."""

    replay_declaration_receipt(value)
    receipt = dict(value)
    digests = receipt["digests"]
    return {
        "producer": {
            "kind": "LEAN_DECLARATION",
            "qualified_name": receipt["registry"]["qualified_name"],
        },
        "normalized_statement_sha256": digests["normalized_statement_sha256"],
        "hypothesis_sha256": digests["hypothesis_sha256"],
        "import_sha256": digests["import_sha256"],
        "toolchain": {
            "kind": "LEAN",
            "identity_sha256": receipt["toolchain"]["identity_sha256"],
        },
        "trust_classification": receipt["registry"]["trust_classification"],
        "input_digests": {
            "export_output_sha256": digests["export_output_sha256"],
            "serializer_source_manifest_sha256": receipt["serializer"][
                "source_manifest_sha256"
            ],
            "universe_levels_sha256": digests["universe_levels_sha256"],
            "constants_sha256": digests["constants_sha256"],
            "hypothesis_sha256": digests["hypothesis_sha256"],
            "import_sha256": digests["import_sha256"],
        },
        "validation_receipt_sha256": receipt["receipt_sha256"],
    }


def load_declaration_receipt(path: os.PathLike[str] | str) -> dict[str, Any]:
    """Load one no-follow, stable, canonical declaration receipt."""

    try:
        payload = custody._read_regular_file(path)
    except custody.ProducerRefError as exc:
        raise DeclarationReceiptError(str(exc)) from exc
    return parse_declaration_receipt_bytes(payload)


def publish_declaration_receipt(
    path: os.PathLike[str] | str,
    value: Any,
) -> Path:
    """Publish one immutable declaration receipt using exclusive creation."""

    payload = canonical_declaration_receipt_bytes(value)
    try:
        parent_descriptor, name, absolute = custody._open_parent_directory(path)
    except custody.ProducerRefError as exc:
        raise DeclarationReceiptError(str(exc)) from exc
    descriptor: int | None = None
    created_identity: tuple[int, int] | None = None
    succeeded = False
    try:
        parent_info = os.fstat(parent_descriptor)
        flags = (
            os.O_WRONLY
            | os.O_CREAT
            | os.O_EXCL
            | getattr(os, "O_CLOEXEC", 0)
            | os.O_NOFOLLOW
        )
        descriptor = os.open(name, flags, 0o600, dir_fd=parent_descriptor)
        created = os.fstat(descriptor)
        created_identity = custody._identity(created)
        if not stat.S_ISREG(created.st_mode) or created.st_nlink != 1:
            _fail("new declaration receipt is not a single-link regular file")
        remaining = memoryview(payload)
        while remaining:
            written = os.write(descriptor, remaining)
            if written <= 0:
                _fail("short write while publishing declaration receipt")
            remaining = remaining[written:]
        os.fsync(descriptor)
        published = os.fstat(descriptor)
        if (
            not stat.S_ISREG(published.st_mode)
            or published.st_nlink != 1
            or published.st_size != len(payload)
        ):
            _fail("published declaration receipt failed custody checks")
        entry = os.stat(name, dir_fd=parent_descriptor, follow_symlinks=False)
        if custody._metadata(entry) != custody._metadata(published):
            _fail("declaration receipt path changed during publication")
        os.fsync(parent_descriptor)
        try:
            custody._verify_lexical_entry(absolute, parent_info, published)
        except custody.ProducerRefError as exc:
            raise DeclarationReceiptError(str(exc)) from exc
        succeeded = True
        return absolute
    except FileExistsError as exc:
        raise DeclarationReceiptError(
            f"refusing to overwrite declaration receipt: {absolute}"
        ) from exc
    except DeclarationReceiptError:
        raise
    except OSError as exc:
        raise DeclarationReceiptError(
            f"cannot publish declaration receipt: {absolute}"
        ) from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)
        if not succeeded and created_identity is not None:
            custody._remove_failed_create(parent_descriptor, name, created_identity)
        os.close(parent_descriptor)


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    subcommands = parser.add_subparsers(dest="command", required=True)
    export = subcommands.add_parser("export", help="build and publish a receipt")
    export.add_argument("--registry-id", default=CONTROL_REGISTRY_ID)
    export.add_argument("--output", type=Path, required=True)
    replay = subcommands.add_parser("replay", help="validate and replay a receipt")
    replay.add_argument("--input", type=Path, required=True)
    return parser


def _lexical_absolute(path: os.PathLike[str] | str) -> Path:
    try:
        raw = os.fspath(path)
    except TypeError as exc:
        raise DeclarationReceiptError("CLI artifact path is not path-like") from exc
    if type(raw) is not str or not raw or "\x00" in raw:
        _fail("CLI artifact path is not canonical text")
    return Path(os.path.abspath(raw))


def main(argv: Sequence[str] | None = None) -> int:
    args = _parser().parse_args(argv)
    if args.command == "export":
        receipt = build_declaration_receipt(args.registry_id)
        publish_declaration_receipt(_lexical_absolute(args.output), receipt)
        print(receipt["receipt_sha256"])
    else:
        receipt = load_declaration_receipt(_lexical_absolute(args.input))
        replay_declaration_receipt(receipt)
        print(receipt["receipt_sha256"])
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
