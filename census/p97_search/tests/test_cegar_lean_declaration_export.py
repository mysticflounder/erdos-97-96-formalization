# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import copy
import hashlib
import os
import shutil
import subprocess
from collections.abc import Callable, Iterator, Mapping
from pathlib import Path
from typing import Any

import pytest

from census.cap_configuration import schema as json_schema
from census.p97_search import cegar_lean_declaration_export as declaration_export

REPOSITORY_ROOT = Path(__file__).resolve().parents[3]
LEAN_ROOT = REPOSITORY_ROOT / "lean"

TOP_LEVEL_KEYS = {
    "schema",
    "registry",
    "export",
    "digests",
    "serializer",
    "toolchain",
    "invocation",
    "receipt_sha256",
}
REGISTRY_KEYS = {
    "registry_id",
    "import_module",
    "qualified_name",
    "trust_classification",
}
EXPORT_KEYS = {
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
DIGEST_KEYS = {
    "export_output_sha256",
    "normalized_statement_sha256",
    "universe_levels_sha256",
    "constants_sha256",
    "hypothesis_sha256",
    "import_sha256",
}
SERIALIZER_KEYS = {
    "schema",
    "entrypoint",
    "sources",
    "source_manifest_sha256",
}
TOOLCHAIN_KEYS = {
    "schema",
    "lean_toolchain_sha256",
    "lakefile_sha256",
    "lake_manifest_sha256",
    "lake_launcher_sha256",
    "lean_executable_sha256",
    "lake_executable_sha256",
    "lean_version",
    "lake_version",
    "identity_sha256",
}
INVOCATION_KEYS = {"schema", "cwd", "argv", "environment", "identity_sha256"}
ENVIRONMENT_KEYS = {"LANG", "LC_ALL", "TZ", "PATH_POLICY", "inherited_variables"}
PRODUCER_REF_INPUT_KEYS = {
    "producer",
    "normalized_statement_sha256",
    "hypothesis_sha256",
    "import_sha256",
    "toolchain",
    "trust_classification",
    "validation_receipt_sha256",
    "input_digests",
}
PRODUCER_INPUT_DIGEST_KEYS = {
    "export_output_sha256",
    "serializer_source_manifest_sha256",
    "universe_levels_sha256",
    "constants_sha256",
    "hypothesis_sha256",
    "import_sha256",
}


def _sha256_json(value: Any) -> str:
    return hashlib.sha256(json_schema.canonical_json_bytes(value)).hexdigest()


def _identity_object(value: Mapping[str, Any], field: str) -> dict[str, Any]:
    result = copy.deepcopy(dict(value))
    result.pop(field, None)
    result[field] = _sha256_json(result)
    return result


def _serializer_schema() -> str:
    return getattr(
        declaration_export,
        "SERIALIZER_SCHEMA",
        "p97-cegar-lean-declaration-serializer/v1",
    )


def _toolchain_schema() -> str:
    return getattr(
        declaration_export,
        "TOOLCHAIN_SCHEMA",
        "p97-cegar-lean-toolchain/v1",
    )


def _fake_serializer() -> dict[str, Any]:
    entrypoint = getattr(
        declaration_export,
        "SERIALIZER_ENTRYPOINT",
        "census/p97_search/cegar_lean_declaration_serializer.lean",
    )
    source_paths = getattr(
        declaration_export,
        "_SOURCE_PATHS",
        (
            "census/p97_search/cegar_lean_declaration_export.py",
            entrypoint,
        ),
    )
    sources = [
        {
            "path": path,
            "sha256": hashlib.sha256(
                f"synthetic serializer source: {path}\n".encode()
            ).hexdigest(),
        }
        for path in sorted(source_paths)
    ]
    return {
        "schema": _serializer_schema(),
        "entrypoint": entrypoint,
        "sources": sources,
        "source_manifest_sha256": _sha256_json(sources),
    }


def _fake_toolchain() -> dict[str, Any]:
    expected_toolchain_sha256 = getattr(
        declaration_export,
        "_EXPECTED_TOOLCHAIN_SHA256",
        hashlib.sha256(b"leanprover/lean4:v4.27.0\n").hexdigest(),
    )
    return _identity_object(
        {
            "schema": _toolchain_schema(),
            "lean_toolchain_sha256": expected_toolchain_sha256,
            "lakefile_sha256": "2" * 64,
            "lake_manifest_sha256": "3" * 64,
            "lake_launcher_sha256": "6" * 64,
            "lean_executable_sha256": "4" * 64,
            "lake_executable_sha256": "5" * 64,
            "lean_version": (
                "Lean (version 4.27.0, synthetic-platform, commit "
                "db93fe1608548721853390a10cd40580fe7d22ae, Release)"
            ),
            "lake_version": "Lake version 5.0.0-src+db93fe1 (Lean version 4.27.0)",
        },
        "identity_sha256",
    )


def _const(name: str, levels: list[dict[str, Any]] | None = None) -> dict[str, Any]:
    return {"tag": "CONST", "name": name, "levels": levels or []}


def _app(function: dict[str, Any], argument: dict[str, Any]) -> dict[str, Any]:
    return {"tag": "APP", "function": function, "argument": argument}


def _fake_export(registry: Mapping[str, Any]) -> dict[str, Any]:
    nat = _const("Nat")
    eq_nat = _const("Eq", [{"tag": "ZERO"}])
    elaborated_type = {
        "tag": "FORALL",
        "binder_name": "n",
        "binder_info": "DEFAULT",
        "binder_type": nat,
        "body": _app(
            _app(eq_nat, {"tag": "BVAR", "index": 0}), {"tag": "BVAR", "index": 0}
        ),
    }
    constants = [
        {"name": "Nat", "levels": []},
        {"name": "Eq", "levels": [{"tag": "ZERO"}]},
    ]
    constants.sort(key=json_schema.canonical_json_bytes)
    return {
        "schema": declaration_export.EXPORT_SCHEMA,
        "registry_id": registry["registry_id"],
        "import_module": registry["import_module"],
        "qualified_name": registry["qualified_name"],
        "defining_module": registry["import_module"],
        "declaration_kind": "THEOREM",
        "is_unsafe": False,
        "is_partial": False,
        "universe_parameters": [],
        "elaborated_type": elaborated_type,
        "hypotheses": [
            {
                "index": 0,
                "binder_name": "n",
                "binder_info": "DEFAULT",
                "type": nat,
            }
        ],
        "constants": constants,
        "imports": sorted({"Init", str(registry["import_module"])}),
    }


@pytest.fixture
def receipt_factory(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> Callable[[], dict[str, Any]]:
    root = tmp_path / "synthetic-repository"
    root.mkdir()
    serializer = _fake_serializer()
    toolchain = _fake_toolchain()

    monkeypatch.setattr(declaration_export, "_repository_root", lambda: root)
    monkeypatch.setattr(
        declaration_export,
        "_source_manifest",
        lambda _root: copy.deepcopy(serializer),
    )
    monkeypatch.setattr(
        declaration_export,
        "_capture_toolchain",
        lambda _root: copy.deepcopy(toolchain),
    )
    monkeypatch.setattr(
        declaration_export,
        "_run_serializer",
        lambda _root, registry, _toolchain: _fake_export(registry),
    )

    def build() -> dict[str, Any]:
        return declaration_export.build_declaration_receipt(
            declaration_export.CONTROL_REGISTRY_ID
        )

    return build


@pytest.fixture
def receipt(receipt_factory: Callable[[], dict[str, Any]]) -> dict[str, Any]:
    return receipt_factory()


def _rehash_receipt(receipt: dict[str, Any]) -> None:
    unsigned = copy.deepcopy(receipt)
    unsigned.pop("receipt_sha256", None)
    receipt["receipt_sha256"] = _sha256_json(unsigned)


def _refresh_component_digests(receipt: dict[str, Any]) -> None:
    exported = receipt["export"]
    normalize = getattr(declaration_export, "_normalized_statement", None)
    try:
        normalized_statement = (
            normalize(exported)
            if normalize is not None
            else exported["elaborated_type"]
        )
    except KeyError:
        # Deliberately malformed undeclared universe parameters fail during
        # export validation before their component digests are consulted.
        normalized_statement = exported["elaborated_type"]
    receipt["digests"] = {
        "export_output_sha256": _sha256_json(exported),
        "normalized_statement_sha256": _sha256_json(normalized_statement),
        "universe_levels_sha256": _sha256_json(exported["universe_parameters"]),
        "constants_sha256": _sha256_json(exported["constants"]),
        "hypothesis_sha256": _sha256_json(exported["hypotheses"]),
        "import_sha256": _sha256_json(exported["imports"]),
    }
    _rehash_receipt(receipt)


def _refresh_nested_identity(receipt: dict[str, Any], component: str) -> None:
    value = receipt[component]
    unsigned = copy.deepcopy(value)
    unsigned.pop("identity_sha256", None)
    value["identity_sha256"] = _sha256_json(unsigned)
    _rehash_receipt(receipt)


def _at(value: Any, path: tuple[str | int, ...]) -> Any:
    result = value
    for component in path:
        result = result[component]
    return result


def _set(value: Any, path: tuple[str | int, ...], replacement: Any) -> None:
    target = value
    for component in path[:-1]:
        target = target[component]
    target[path[-1]] = replacement


def _different(value: Any) -> Any:
    if type(value) is bool:
        return not value
    if type(value) is int:
        return value + 1
    if type(value) is str:
        if len(value) == 64 and set(value) <= set("0123456789abcdef"):
            return ("f" if value[0] != "f" else "e") + value[1:]
        return value + ".tampered"
    if type(value) is list:
        return [*value, "tampered"]
    if type(value) is dict:
        return {**value, "tampered": "tampered"}
    raise AssertionError(f"test helper lacks a mutation for {type(value).__name__}")


def _walk_object_keys(value: Any) -> Iterator[str]:
    if type(value) is dict:
        for key, item in value.items():
            yield key
            yield from _walk_object_keys(item)
    elif type(value) is list:
        for item in value:
            yield from _walk_object_keys(item)


def test_synthetic_control_build_is_deterministic_and_exact(
    receipt_factory: Callable[[], dict[str, Any]],
) -> None:
    first = receipt_factory()
    second = receipt_factory()

    assert first == second
    assert first["schema"] == declaration_export.SCHEMA
    assert first["export"]["schema"] == declaration_export.EXPORT_SCHEMA
    assert set(first) == TOP_LEVEL_KEYS
    assert set(first["registry"]) == REGISTRY_KEYS
    assert set(first["export"]) == EXPORT_KEYS
    assert set(first["digests"]) == DIGEST_KEYS
    assert set(first["serializer"]) == SERIALIZER_KEYS
    assert set(first["toolchain"]) == TOOLCHAIN_KEYS
    assert set(first["invocation"]) == INVOCATION_KEYS
    assert set(first["invocation"]["environment"]) == ENVIRONMENT_KEYS
    declaration_export.validate_declaration_receipt(first)
    declaration_export.replay_declaration_receipt(first)


def test_source_manifest_closes_over_all_python_and_lean_serializer_dependencies(
    receipt: dict[str, Any],
) -> None:
    assert {source["path"] for source in receipt["serializer"]["sources"]} == {
        "census/cap_configuration/schema.py",
        "census/p97_search/cegar_lean_declaration_export.py",
        "census/p97_search/cegar_lean_declaration_serializer.lean",
        "census/p97_search/cegar_producer_ref.py",
    }


def test_unknown_registry_id_fails_closed(
    receipt_factory: Callable[[], dict[str, Any]],
) -> None:
    del receipt_factory
    with pytest.raises(declaration_export.DeclarationReceiptError, match="registry"):
        declaration_export.build_declaration_receipt("p97.not-in-the-closed-registry")


@pytest.mark.parametrize(
    "path",
    [
        ("schema",),
        ("registry", "registry_id"),
        ("registry", "import_module"),
        ("registry", "qualified_name"),
        ("registry", "trust_classification"),
        ("export", "schema"),
        ("export", "registry_id"),
        ("export", "import_module"),
        ("export", "qualified_name"),
        ("export", "defining_module"),
        ("export", "declaration_kind"),
        ("export", "is_unsafe"),
        ("export", "is_partial"),
        ("export", "universe_parameters"),
        ("export", "elaborated_type", "binder_name"),
        ("export", "hypotheses", 0, "binder_name"),
        ("export", "constants", 0, "name"),
        ("export", "imports", 0),
        ("digests", "export_output_sha256"),
        ("digests", "normalized_statement_sha256"),
        ("digests", "universe_levels_sha256"),
        ("digests", "constants_sha256"),
        ("digests", "hypothesis_sha256"),
        ("digests", "import_sha256"),
        ("serializer", "schema"),
        ("serializer", "entrypoint"),
        ("serializer", "sources", 0, "path"),
        ("serializer", "sources", 0, "sha256"),
        ("serializer", "source_manifest_sha256"),
        ("toolchain", "schema"),
        ("toolchain", "lean_toolchain_sha256"),
        ("toolchain", "lakefile_sha256"),
        ("toolchain", "lake_manifest_sha256"),
        ("toolchain", "lake_launcher_sha256"),
        ("toolchain", "lean_executable_sha256"),
        ("toolchain", "lake_executable_sha256"),
        ("toolchain", "lean_version"),
        ("toolchain", "lake_version"),
        ("toolchain", "identity_sha256"),
        ("invocation", "schema"),
        ("invocation", "cwd"),
        ("invocation", "argv", 0),
        ("invocation", "environment", "LANG"),
        ("invocation", "environment", "LC_ALL"),
        ("invocation", "environment", "TZ"),
        ("invocation", "environment", "PATH_POLICY"),
        ("invocation", "environment", "inherited_variables"),
        ("invocation", "identity_sha256"),
    ],
)
def test_every_authenticated_field_rejects_outer_rehash_only(
    receipt: dict[str, Any],
    path: tuple[str | int, ...],
) -> None:
    _set(receipt, path, _different(_at(receipt, path)))
    _rehash_receipt(receipt)

    with pytest.raises(declaration_export.DeclarationReceiptError):
        declaration_export.validate_declaration_receipt(receipt)


@pytest.mark.parametrize(
    "fields",
    [
        (("registry", "registry_id"), ("export", "registry_id")),
        (("registry", "import_module"), ("export", "import_module")),
        (("registry", "qualified_name"), ("export", "qualified_name")),
    ],
)
def test_paired_registry_substitution_still_fails_closed(
    receipt: dict[str, Any],
    fields: tuple[tuple[str, str], tuple[str, str]],
) -> None:
    replacement = _different(_at(receipt, fields[0]))
    _set(receipt, fields[0], replacement)
    _set(receipt, fields[1], replacement)
    _refresh_component_digests(receipt)

    with pytest.raises(declaration_export.DeclarationReceiptError, match="registry"):
        declaration_export.validate_declaration_receipt(receipt)


def _replace_export_shape(receipt: dict[str, Any], expression: dict[str, Any]) -> None:
    receipt["export"]["elaborated_type"] = expression
    receipt["export"]["hypotheses"] = []
    receipt["export"]["constants"] = []
    _refresh_component_digests(receipt)


def _set_alpha_statement(
    receipt: dict[str, Any],
    *,
    universe_name: str,
    binder_name: str,
) -> None:
    level = {"tag": "PARAM", "name": universe_name}
    binder_type = {"tag": "SORT", "level": copy.deepcopy(level)}
    receipt["export"].update(
        {
            "universe_parameters": [universe_name],
            "elaborated_type": {
                "tag": "FORALL",
                "binder_name": binder_name,
                "binder_info": "DEFAULT",
                "binder_type": copy.deepcopy(binder_type),
                "body": {"tag": "SORT", "level": copy.deepcopy(level)},
            },
            "hypotheses": [
                {
                    "index": 0,
                    "binder_name": binder_name,
                    "binder_info": "DEFAULT",
                    "type": binder_type,
                }
            ],
            "constants": [],
        }
    )
    _refresh_component_digests(receipt)


@pytest.mark.parametrize(
    "expression",
    [
        {"tag": "UNKNOWN"},
        {"tag": "BVAR", "index": 0},
        {"tag": "BVAR", "index": True},
        {"tag": "SORT", "level": {"tag": "UNKNOWN"}},
        {"tag": "SORT", "level": {"tag": "ZERO", "scope": 0}},
        {"tag": "SORT", "level": {"tag": "PARAM", "name": "undeclared"}},
        {"tag": "NAT_LITERAL", "value": -1},
        {
            "tag": "PROJ",
            "type_name": "Pair",
            "index": -1,
            "structure": {"tag": "SORT", "level": {"tag": "ZERO"}},
        },
        {
            "tag": "FORALL",
            "binder_name": "x",
            "binder_info": "EXPLICIT",
            "binder_type": {"tag": "SORT", "level": {"tag": "ZERO"}},
            "body": {"tag": "BVAR", "index": 0},
        },
        {
            "tag": "FORALL",
            "binder_name": "x",
            "binder_info": "DEFAULT",
            "binder_type": {"tag": "SORT", "level": {"tag": "ZERO"}},
            "body": {"tag": "BVAR", "index": 1},
        },
    ],
)
def test_malformed_ast_tags_and_scopes_fail_after_digest_recomputation(
    receipt: dict[str, Any],
    expression: dict[str, Any],
) -> None:
    _replace_export_shape(receipt, expression)

    with pytest.raises(declaration_export.DeclarationReceiptError):
        declaration_export.validate_declaration_receipt(receipt)


@pytest.mark.parametrize(
    "mutate",
    [
        lambda export: export["hypotheses"].clear(),
        lambda export: export["hypotheses"][0].__setitem__("index", 1),
        lambda export: export["hypotheses"][0].__setitem__("binder_name", "other"),
        lambda export: export["hypotheses"][0].__setitem__("binder_info", "IMPLICIT"),
        lambda export: export["hypotheses"].append(
            copy.deepcopy(export["hypotheses"][0])
        ),
    ],
)
def test_hypotheses_must_match_the_top_level_forall_telescope(
    receipt: dict[str, Any],
    mutate: Callable[[dict[str, Any]], None],
) -> None:
    mutate(receipt["export"])
    _refresh_component_digests(receipt)

    with pytest.raises(declaration_export.DeclarationReceiptError, match="hypoth"):
        declaration_export.validate_declaration_receipt(receipt)


@pytest.mark.parametrize(
    "mutate",
    [
        lambda export: export["constants"].clear(),
        lambda export: export["constants"].append(
            copy.deepcopy(export["constants"][0])
        ),
        lambda export: export["constants"].reverse(),
        lambda export: export["constants"][0].__setitem__("name", "String"),
        lambda export: export["constants"][0].__setitem__("levels", [{"tag": "ZERO"}]),
    ],
)
def test_constants_must_be_the_sorted_unique_ast_inventory(
    receipt: dict[str, Any],
    mutate: Callable[[dict[str, Any]], None],
) -> None:
    mutate(receipt["export"])
    _refresh_component_digests(receipt)

    with pytest.raises(declaration_export.DeclarationReceiptError, match="constant"):
        declaration_export.validate_declaration_receipt(receipt)


def test_normalized_statement_digest_is_invariant_under_alpha_renaming(
    receipt: dict[str, Any],
) -> None:
    _set_alpha_statement(receipt, universe_name="u", binder_name="alpha")
    renamed = copy.deepcopy(receipt)
    _set_alpha_statement(renamed, universe_name="v", binder_name="beta")

    declaration_export.validate_declaration_receipt(receipt)
    declaration_export.validate_declaration_receipt(renamed)
    assert (
        receipt["digests"]["normalized_statement_sha256"]
        == renamed["digests"]["normalized_statement_sha256"]
    )
    for raw_digest in (
        "export_output_sha256",
        "universe_levels_sha256",
        "hypothesis_sha256",
    ):
        assert receipt["digests"][raw_digest] != renamed["digests"][raw_digest]


@pytest.mark.parametrize(
    "field",
    [
        "export_output_sha256",
        "normalized_statement_sha256",
        "universe_levels_sha256",
        "constants_sha256",
        "hypothesis_sha256",
        "import_sha256",
    ],
)
def test_stale_export_component_digest_fails_closed(
    receipt: dict[str, Any], field: str
) -> None:
    receipt["digests"][field] = "f" * 64
    _rehash_receipt(receipt)

    with pytest.raises(
        declaration_export.DeclarationReceiptError, match="digest|SHA-256"
    ):
        declaration_export.validate_declaration_receipt(receipt)


def test_stale_export_output_digest_detects_ast_mutation(
    receipt: dict[str, Any],
) -> None:
    receipt["export"]["elaborated_type"]["binder_name"] = "renamed"
    _rehash_receipt(receipt)

    with pytest.raises(declaration_export.DeclarationReceiptError):
        declaration_export.validate_declaration_receipt(receipt)


@pytest.mark.parametrize(
    ("field", "value"),
    [
        ("lean_toolchain_sha256", "f" * 64),
        ("lean_version", "Lean (version 4.28.0, forged-platform, Release)"),
        ("lake_version", "Lake version 5.0.0-src+forged (Lean version 4.28.0)"),
    ],
)
def test_closed_toolchain_pin_and_release_versions_reject_forgery(
    receipt: dict[str, Any],
    field: str,
    value: str,
) -> None:
    if value == receipt["toolchain"][field]:
        value = _different(value)
    receipt["toolchain"][field] = value
    _refresh_nested_identity(receipt, "toolchain")

    with pytest.raises(
        declaration_export.DeclarationReceiptError,
        match="toolchain|Lean version|Lake version|pinned",
    ):
        declaration_export.validate_declaration_receipt(receipt)


@pytest.mark.parametrize(
    ("pin_bytes", "lean_version", "lake_version", "message"),
    [
        (
            b"leanprover/lean4:v4.26.0\n",
            (
                "Lean (version 4.27.0, test-platform, commit "
                "db93fe1608548721853390a10cd40580fe7d22ae, Release)"
            ),
            "Lake version 5.0.0-src+db93fe1 (Lean version 4.27.0)",
            "lean-toolchain",
        ),
        (
            b"leanprover/lean4:v4.27.0",
            (
                "Lean (version 4.27.0, test-platform, commit "
                "db93fe1608548721853390a10cd40580fe7d22ae, Release)"
            ),
            "Lake version 5.0.0-src+db93fe1 (Lean version 4.27.0)",
            "lean-toolchain",
        ),
        (
            b"leanprover/lean4:v4.27.0\n",
            "Lean (version 4.27.0, forged-platform, commit bad, Release)",
            "Lake version 5.0.0-src+db93fe1 (Lean version 4.27.0)",
            "lean executable",
        ),
        (
            b"leanprover/lean4:v4.27.0\n",
            (
                "Lean (version 4.27.0, test-platform, commit "
                "db93fe1608548721853390a10cd40580fe7d22ae, Release)"
            ),
            "Lake version 5.0.0-src+forged (Lean version 4.27.0)",
            "lake executable",
        ),
    ],
)
def test_toolchain_capture_rejects_unapproved_pin_bytes_and_release_output(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    pin_bytes: bytes,
    lean_version: str,
    lake_version: str,
    message: str,
) -> None:
    root = tmp_path / "repository"
    launcher = tmp_path / "path-lake"
    lean = tmp_path / "selected-lean"
    lake = tmp_path / "selected-lake"

    monkeypatch.setattr(
        declaration_export,
        "_stable_file_bytes",
        lambda _path: pin_bytes,
    )
    monkeypatch.setattr(declaration_export, "_lake_launcher", lambda: launcher)
    monkeypatch.setattr(
        declaration_export,
        "_selected_executables",
        lambda _root: (lean, lake),
    )
    monkeypatch.setattr(
        declaration_export,
        "_stable_file_sha256",
        lambda path, *_args, **_kwargs: hashlib.sha256(
            os.fspath(path).encode()
        ).hexdigest(),
    )

    def version_output(argv: list[str], **_kwargs: Any) -> str:
        if argv[0] == os.fspath(lean):
            return lean_version
        if argv[0] == os.fspath(lake):
            return lake_version
        raise AssertionError(f"unexpected version command: {argv}")

    monkeypatch.setattr(declaration_export, "_run_small", version_output)
    with pytest.raises(declaration_export.DeclarationReceiptError, match=message):
        declaration_export._capture_toolchain(root)


def test_universe_constants_and_imports_are_sorted_and_unique(
    receipt: dict[str, Any],
) -> None:
    receipt["export"]["universe_parameters"] = ["u", "u"]
    _refresh_component_digests(receipt)
    with pytest.raises(declaration_export.DeclarationReceiptError, match="universe"):
        declaration_export.validate_declaration_receipt(receipt)

    receipt["export"]["universe_parameters"] = []
    receipt["export"]["imports"].append(receipt["export"]["imports"][0])
    _refresh_component_digests(receipt)
    with pytest.raises(declaration_export.DeclarationReceiptError, match="import"):
        declaration_export.validate_declaration_receipt(receipt)

    receipt["export"]["imports"] = sorted(
        set(receipt["export"]["imports"]), reverse=True
    )
    _refresh_component_digests(receipt)
    with pytest.raises(declaration_export.DeclarationReceiptError, match="import"):
        declaration_export.validate_declaration_receipt(receipt)


@pytest.mark.parametrize(
    "field",
    [
        "verified",
        "success",
        "supports_source_promotion",
        "supports_theorem_promotion",
        "consumer_reachable",
    ],
)
def test_caller_success_and_authority_booleans_are_unknown(
    receipt: dict[str, Any], field: str
) -> None:
    receipt[field] = True
    _rehash_receipt(receipt)

    with pytest.raises(declaration_export.DeclarationReceiptError, match="extra|keys"):
        declaration_export.validate_declaration_receipt(receipt)


@pytest.mark.parametrize(
    "component",
    ["registry", "export", "digests", "serializer", "toolchain", "invocation"],
)
def test_unknown_nested_keys_are_rejected(
    receipt: dict[str, Any], component: str
) -> None:
    receipt[component]["unknown"] = None
    _rehash_receipt(receipt)

    with pytest.raises(declaration_export.DeclarationReceiptError, match="extra|keys"):
        declaration_export.validate_declaration_receipt(receipt)


def test_exact_builtin_json_types_are_required(receipt: dict[str, Any]) -> None:
    receipt["export"]["is_unsafe"] = 0
    _refresh_component_digests(receipt)
    with pytest.raises(declaration_export.DeclarationReceiptError):
        declaration_export.validate_declaration_receipt(receipt)

    malformed = copy.deepcopy(receipt)
    malformed["export"]["is_unsafe"] = False
    malformed["export"]["elaborated_type"] = {"tag": "BVAR", "index": True}
    malformed["export"]["hypotheses"] = []
    malformed["export"]["constants"] = []
    _refresh_component_digests(malformed)
    with pytest.raises(declaration_export.DeclarationReceiptError):
        declaration_export.validate_declaration_receipt(malformed)


def test_self_hash_is_required_and_authenticates_the_whole_receipt(
    receipt: dict[str, Any],
) -> None:
    stale = copy.deepcopy(receipt)
    stale["receipt_sha256"] = _different(stale["receipt_sha256"])
    with pytest.raises(
        declaration_export.DeclarationReceiptError, match="authenticate|hash|SHA-256"
    ):
        declaration_export.validate_declaration_receipt(stale)

    missing = copy.deepcopy(receipt)
    missing.pop("receipt_sha256")
    with pytest.raises(
        declaration_export.DeclarationReceiptError, match="missing|keys"
    ):
        declaration_export.validate_declaration_receipt(missing)


def test_canonical_bytes_round_trip_exactly(receipt: dict[str, Any]) -> None:
    payload = declaration_export.canonical_declaration_receipt_bytes(receipt)

    assert payload.endswith(b"\n")
    assert not payload.endswith(b"\n\n")
    assert declaration_export.parse_declaration_receipt_bytes(payload) == receipt
    assert declaration_export.canonical_declaration_receipt_bytes(receipt) == payload


def test_parser_rejects_duplicate_keys_and_noncanonical_spellings(
    receipt: dict[str, Any],
) -> None:
    payload = declaration_export.canonical_declaration_receipt_bytes(receipt)
    duplicate = (
        b'{"schema":"' + declaration_export.SCHEMA.encode("ascii") + b'",' + payload[1:]
    )
    with pytest.raises(
        declaration_export.DeclarationReceiptError, match="duplicate JSON"
    ):
        declaration_export.parse_declaration_receipt_bytes(duplicate)

    for malformed in (
        b" " + payload,
        payload[:-1],
        payload + b"\n",
        payload.replace(b":", b": ", 1),
    ):
        with pytest.raises(declaration_export.DeclarationReceiptError):
            declaration_export.parse_declaration_receipt_bytes(malformed)


@pytest.mark.parametrize(
    "payload",
    [
        b'{"value":1.5}\n',
        b'{"value":NaN}\n',
        b'{"value":"\xff"}\n',
        b"[]\n",
    ],
)
def test_parser_rejects_noninteger_numbers_invalid_utf8_and_wrong_root(
    payload: bytes,
) -> None:
    with pytest.raises(declaration_export.DeclarationReceiptError):
        declaration_export.parse_declaration_receipt_bytes(payload)


def test_parser_rejects_oversized_input_before_json_work() -> None:
    limit = getattr(declaration_export, "MAX_DOCUMENT_BYTES", 1024 * 1024)
    with pytest.raises(
        declaration_export.DeclarationReceiptError,
        match="size|large|bounded",
    ):
        declaration_export.parse_declaration_receipt_bytes(b"x" * (limit + 1))


def test_publish_is_create_once_and_load_revalidates(
    tmp_path: Path, receipt: dict[str, Any]
) -> None:
    path = tmp_path / "declaration-receipt.json"

    published = declaration_export.publish_declaration_receipt(path, receipt)
    assert published == path.absolute()
    assert path.read_bytes() == declaration_export.canonical_declaration_receipt_bytes(
        receipt
    )
    assert declaration_export.load_declaration_receipt(path) == receipt

    with pytest.raises(
        declaration_export.DeclarationReceiptError, match="overwrite|exists"
    ):
        declaration_export.publish_declaration_receipt(path, receipt)


def test_artifact_paths_must_be_absolute_and_lexically_canonical(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    receipt: dict[str, Any],
) -> None:
    path = tmp_path / "declaration-receipt.json"
    declaration_export.publish_declaration_receipt(path, receipt)
    monkeypatch.chdir(tmp_path)

    with pytest.raises(declaration_export.DeclarationReceiptError, match="absolute"):
        declaration_export.load_declaration_receipt(Path(path.name))
    with pytest.raises(declaration_export.DeclarationReceiptError, match="canonical"):
        declaration_export.load_declaration_receipt(
            tmp_path / "child" / ".." / path.name
        )
    with pytest.raises(declaration_export.DeclarationReceiptError, match="canonical"):
        declaration_export.load_declaration_receipt(f"{tmp_path}//{path.name}")


def test_cli_replay_keeps_relative_symlinks_visible_to_custody_checks(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    receipt: dict[str, Any],
) -> None:
    real = tmp_path / "real"
    real.mkdir()
    path = real / "declaration-receipt.json"
    declaration_export.publish_declaration_receipt(path, receipt)

    final_symlink = tmp_path / "final-symlink.json"
    final_symlink.symlink_to(path)
    ancestor_symlink = tmp_path / "ancestor-symlink"
    ancestor_symlink.symlink_to(real, target_is_directory=True)
    monkeypatch.chdir(tmp_path)

    with pytest.raises(declaration_export.DeclarationReceiptError):
        declaration_export.main(
            ["replay", "--input", final_symlink.relative_to(tmp_path).as_posix()]
        )
    with pytest.raises(declaration_export.DeclarationReceiptError):
        declaration_export.main(
            [
                "replay",
                "--input",
                (ancestor_symlink / path.name).relative_to(tmp_path).as_posix(),
            ]
        )


def test_symlinked_ancestor_and_hardlinked_file_are_rejected(
    tmp_path: Path,
    receipt: dict[str, Any],
) -> None:
    real = tmp_path / "real"
    real.mkdir()
    path = real / "declaration-receipt.json"
    declaration_export.publish_declaration_receipt(path, receipt)

    alias = tmp_path / "alias"
    alias.symlink_to(real, target_is_directory=True)
    with pytest.raises(
        declaration_export.DeclarationReceiptError, match="ancestor|symlink"
    ):
        declaration_export.load_declaration_receipt(alias / path.name)

    hardlink = tmp_path / "hardlink.json"
    os.link(path, hardlink)
    with pytest.raises(
        declaration_export.DeclarationReceiptError, match="single-link|hardlink"
    ):
        declaration_export.load_declaration_receipt(path)


def test_final_symlink_directory_and_fifo_collisions_are_rejected(
    tmp_path: Path,
    receipt: dict[str, Any],
) -> None:
    source = tmp_path / "source.json"
    declaration_export.publish_declaration_receipt(source, receipt)

    symlink = tmp_path / "symlink.json"
    symlink.symlink_to(source)
    with pytest.raises(declaration_export.DeclarationReceiptError):
        declaration_export.load_declaration_receipt(symlink)
    with pytest.raises(
        declaration_export.DeclarationReceiptError, match="overwrite|exists"
    ):
        declaration_export.publish_declaration_receipt(symlink, receipt)

    directory = tmp_path / "directory.json"
    directory.mkdir()
    with pytest.raises(
        declaration_export.DeclarationReceiptError, match="overwrite|exists"
    ):
        declaration_export.publish_declaration_receipt(directory, receipt)

    if hasattr(os, "mkfifo"):
        fifo = tmp_path / "collision.fifo"
        os.mkfifo(fifo)
        with pytest.raises(
            declaration_export.DeclarationReceiptError, match="overwrite|exists"
        ):
            declaration_export.publish_declaration_receipt(fifo, receipt)


def test_loader_rejects_fifo_without_blocking(tmp_path: Path) -> None:
    if not hasattr(os, "mkfifo"):
        pytest.skip("FIFO creation is unavailable")
    fifo = tmp_path / "declaration-receipt.fifo"
    os.mkfifo(fifo)

    with pytest.raises(
        declaration_export.DeclarationReceiptError, match="regular|FIFO"
    ):
        declaration_export.load_declaration_receipt(fifo)


def test_failed_publication_removes_its_partial_file(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    receipt: dict[str, Any],
) -> None:
    path = tmp_path / "declaration-receipt.json"

    def fail_write(_descriptor: int, _payload: object) -> int:
        raise OSError("injected write failure")

    monkeypatch.setattr(declaration_export.os, "write", fail_write)
    with pytest.raises(
        declaration_export.DeclarationReceiptError, match="publish|write"
    ):
        declaration_export.publish_declaration_receipt(path, receipt)
    assert not path.exists()


def test_loader_detects_source_mutation_during_read(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    receipt: dict[str, Any],
) -> None:
    path = tmp_path / "declaration-receipt.json"
    declaration_export.publish_declaration_receipt(path, receipt)
    real_read = os.read
    changed = False

    def racing_read(descriptor: int, count: int) -> bytes:
        nonlocal changed
        payload = real_read(descriptor, count)
        if payload and not changed:
            changed = True
            with path.open("r+b") as output:
                output.seek(0)
                output.write(b"X")
                output.flush()
                os.fsync(output.fileno())
        return payload

    monkeypatch.setattr(declaration_export.os, "read", racing_read)
    with pytest.raises(
        declaration_export.DeclarationReceiptError, match="mutated|changed"
    ):
        declaration_export.load_declaration_receipt(path)


def test_loader_detects_path_replacement_during_read(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    receipt: dict[str, Any],
) -> None:
    path = tmp_path / "declaration-receipt.json"
    declaration_export.publish_declaration_receipt(path, receipt)
    original_bytes = path.read_bytes()
    real_read = os.read
    replaced = False

    def racing_read(descriptor: int, count: int) -> bytes:
        nonlocal replaced
        payload = real_read(descriptor, count)
        if payload and not replaced:
            replaced = True
            path.rename(tmp_path / "original.json")
            path.write_bytes(original_bytes)
        return payload

    monkeypatch.setattr(declaration_export.os, "read", racing_read)
    with pytest.raises(
        declaration_export.DeclarationReceiptError, match="mutated|changed"
    ):
        declaration_export.load_declaration_receipt(path)


def test_replay_rejects_fully_rehashed_stored_export_mutation(
    receipt: dict[str, Any],
) -> None:
    receipt["export"]["elaborated_type"]["binder_name"] = "stored-mutation"
    receipt["export"]["hypotheses"][0]["binder_name"] = "stored-mutation"
    _refresh_component_digests(receipt)
    declaration_export.validate_declaration_receipt(receipt)

    with pytest.raises(
        declaration_export.DeclarationReceiptError, match="replay|differ|mismatch"
    ):
        declaration_export.replay_declaration_receipt(receipt)


def test_replay_rejects_changed_serializer_output(
    receipt: dict[str, Any],
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    def changed_export(
        _root: Path,
        registry: Mapping[str, Any],
        _toolchain: Mapping[str, Any],
    ) -> dict[str, Any]:
        exported = _fake_export(registry)
        exported["elaborated_type"]["binder_name"] = "producer-mutation"
        exported["hypotheses"][0]["binder_name"] = "producer-mutation"
        return exported

    monkeypatch.setattr(declaration_export, "_run_serializer", changed_export)
    with pytest.raises(
        declaration_export.DeclarationReceiptError, match="replay|differ|mismatch"
    ):
        declaration_export.replay_declaration_receipt(receipt)


@pytest.mark.parametrize(
    ("component", "path"),
    [
        ("serializer", ("sources", 0, "sha256")),
        ("toolchain", ("lean_executable_sha256",)),
        ("toolchain", ("lean_version",)),
        ("invocation", ("environment", "LANG")),
        ("invocation", ("argv", 0)),
    ],
)
def test_replay_rejects_reauthenticated_source_toolchain_and_invocation_tampering(
    receipt: dict[str, Any],
    component: str,
    path: tuple[str | int, ...],
) -> None:
    target = receipt[component]
    _set(target, path, _different(_at(target, path)))
    if component == "serializer":
        target["source_manifest_sha256"] = _sha256_json(target["sources"])
        _rehash_receipt(receipt)
    else:
        _refresh_nested_identity(receipt, component)

    with pytest.raises(declaration_export.DeclarationReceiptError):
        declaration_export.replay_declaration_receipt(receipt)


def test_producer_ref_inputs_replays_and_rejects_fully_rehashed_forgery(
    receipt: dict[str, Any],
) -> None:
    receipt["export"]["elaborated_type"]["binder_name"] = "forged"
    receipt["export"]["hypotheses"][0]["binder_name"] = "forged"
    _refresh_component_digests(receipt)
    declaration_export.validate_declaration_receipt(receipt)

    with pytest.raises(
        declaration_export.DeclarationReceiptError,
        match="replay|differs|mismatch",
    ):
        declaration_export.producer_ref_inputs(receipt)


def test_producer_ref_inputs_are_exact_and_nonpromotional(
    receipt: dict[str, Any],
) -> None:
    inputs = declaration_export.producer_ref_inputs(receipt)

    assert set(inputs) == PRODUCER_REF_INPUT_KEYS
    assert inputs["producer"] == {
        "kind": "LEAN_DECLARATION",
        "qualified_name": receipt["registry"]["qualified_name"],
    }
    assert inputs["toolchain"] == {
        "kind": "LEAN",
        "identity_sha256": receipt["toolchain"]["identity_sha256"],
    }
    assert (
        inputs["normalized_statement_sha256"]
        == receipt["digests"]["normalized_statement_sha256"]
    )
    assert inputs["hypothesis_sha256"] == receipt["digests"]["hypothesis_sha256"]
    assert inputs["import_sha256"] == receipt["digests"]["import_sha256"]
    assert inputs["trust_classification"] == receipt["registry"]["trust_classification"]
    assert inputs["validation_receipt_sha256"] == receipt["receipt_sha256"]
    assert set(inputs["input_digests"]) == PRODUCER_INPUT_DIGEST_KEYS
    assert inputs["input_digests"] == {
        "export_output_sha256": receipt["digests"]["export_output_sha256"],
        "serializer_source_manifest_sha256": receipt["serializer"][
            "source_manifest_sha256"
        ],
        "universe_levels_sha256": receipt["digests"]["universe_levels_sha256"],
        "constants_sha256": receipt["digests"]["constants_sha256"],
        "hypothesis_sha256": receipt["digests"]["hypothesis_sha256"],
        "import_sha256": receipt["digests"]["import_sha256"],
    }

    forbidden = {
        "repository",
        "transitive_source_sha256",
        "consumer_reachability",
        "verified",
        "success",
        "supports_source_promotion",
        "supports_theorem_promotion",
        "consumer_reachable",
    }
    assert forbidden.isdisjoint(_walk_object_keys(inputs))


def _pinned_lean_available() -> bool:
    if shutil.which("lake") is None or not LEAN_ROOT.is_dir():
        return False
    try:
        result = subprocess.run(
            ["lake", "env", "lean", "--version"],
            cwd=LEAN_ROOT,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
            check=False,
            timeout=30,
        )
    except (OSError, subprocess.TimeoutExpired):
        return False
    return result.returncode == 0


def test_real_pinned_control_export_is_deterministic_when_available() -> None:
    if not _pinned_lean_available():
        pytest.skip("the pinned lake env lean toolchain is unavailable")

    first = declaration_export.build_declaration_receipt(
        declaration_export.CONTROL_REGISTRY_ID
    )
    second = declaration_export.build_declaration_receipt(
        declaration_export.CONTROL_REGISTRY_ID
    )

    assert first == second
    declaration_export.validate_declaration_receipt(first)
    declaration_export.replay_declaration_receipt(first)
    assert first["registry"]["registry_id"] == declaration_export.CONTROL_REGISTRY_ID
    assert first["registry"]["qualified_name"] == first["export"]["qualified_name"]
    assert first["registry"]["import_module"] == first["export"]["import_module"]
