#!/usr/bin/env python3
"""Validate the pinned Lean/Lake configuration without invoking a toolchain."""

from __future__ import annotations

import argparse
import json
import sys
import tomllib
from pathlib import Path
from typing import Any

DEFAULT_CONFIG = Path("comparator/toolchain-pins.json")
REQUIRED_PACKAGES = ("mathlib", "formal_conjectures")


def _read_json(path: Path) -> Any:
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        raise ValueError(f"cannot read JSON {path}: {exc}") from exc


def _read_toml(path: Path) -> dict[str, Any]:
    try:
        return tomllib.loads(path.read_text(encoding="utf-8"))
    except (OSError, tomllib.TOMLDecodeError) as exc:
        raise ValueError(f"cannot read TOML {path}: {exc}") from exc


def _require_mapping(value: Any, label: str) -> dict[str, Any]:
    if not isinstance(value, dict):
        raise TypeError(f"{label} must be an object")
    return value


def _unique_named(rows: Any, label: str) -> dict[str, dict[str, Any]]:
    if not isinstance(rows, list):
        raise TypeError(f"{label} must be an array")
    result: dict[str, dict[str, Any]] = {}
    for row in rows:
        item = _require_mapping(row, f"{label} entry")
        name = item.get("name")
        if not isinstance(name, str) or not name:
            raise ValueError(f"{label} entry has no name")
        if name in result:
            raise ValueError(f"duplicate {label} name: {name}")
        result[name] = item
    return result


def validate(repo_root: Path, config_path: Path = DEFAULT_CONFIG) -> list[str]:
    """Return configuration violations; an empty list means the gate passes."""
    errors: list[str] = []
    try:
        config = _require_mapping(_read_json(repo_root / config_path), "pin manifest")
        if config.get("schema") != "lean-upgrade-pins/v1":
            errors.append("pin manifest has the wrong schema")

        expected_toolchain = config.get("lean_toolchain")
        if not isinstance(expected_toolchain, str) or not expected_toolchain:
            errors.append("pin manifest has no lean_toolchain")
        else:
            values = {}
            for relative in ("lean-toolchain", "lean/lean-toolchain"):
                path = repo_root / relative
                try:
                    values[relative] = path.read_text(encoding="utf-8").strip()
                except OSError as exc:
                    errors.append(f"cannot read {relative}: {exc}")
            if len(values) == 2:
                if values["lean-toolchain"] != values["lean/lean-toolchain"]:
                    errors.append("lean-toolchain files disagree")
                if values["lean-toolchain"] != expected_toolchain:
                    errors.append(
                        f"toolchain is {values['lean-toolchain']!r}, expected {expected_toolchain!r}"
                    )

        lakefile = _read_toml(repo_root / "lean/lakefile.toml")
        requirements = _unique_named(lakefile.get("require", []), "Lake requirement")
        if set(requirements) != set(REQUIRED_PACKAGES):
            errors.append(
                "Lake requirements must contain exactly mathlib and formal_conjectures "
                f"(got {sorted(requirements)})"
            )
        expected_requirements = {
            "mathlib": config.get("mathlib_requirement"),
            "formal_conjectures": config.get("formal_conjectures_requirement"),
        }
        source_pins = _require_mapping(config.get("source_pins"), "source_pins")
        for name in REQUIRED_PACKAGES:
            row = requirements.get(name)
            if row is None:
                continue
            if row.get("rev") != expected_requirements[name]:
                errors.append(
                    f"Lake requirement {name} rev {row.get('rev')!r} != "
                    f"{expected_requirements[name]!r}"
                )
            source = source_pins.get(name)
            if source is None:
                errors.append(f"source_pins is missing: {name}")
                continue
            source = _require_mapping(source, f"source_pins.{name}")
            if row.get("scope", "") != source.get("scope"):
                errors.append(f"Lake requirement {name} scope is not pinned")
            if source.get("require_direct_git") and row.get("git") != source.get("url"):
                errors.append(f"Lake requirement {name} git source is not pinned")

        manifest = _require_mapping(_read_json(repo_root / "lean/lake-manifest.json"), "Lake manifest")
        packages = _unique_named(manifest.get("packages", []), "manifest package")
        if set(REQUIRED_PACKAGES) - set(packages):
            errors.append("Lake manifest is missing: " + ", ".join(sorted(set(REQUIRED_PACKAGES) - set(packages))))
        for name, key in (("mathlib", "mathlib_resolved_rev"), ("formal_conjectures", "formal_conjectures_resolved_rev")):
            row = packages.get(name)
            if row is None:
                continue
            if row.get("rev") != config.get(key):
                errors.append(f"manifest package {name} rev {row.get('rev')!r} != {config.get(key)!r}")
            source = _require_mapping(source_pins.get(name), f"source_pins.{name}")
            if row.get("type") != "git":
                errors.append(f"manifest package {name} is not a git package")
            if row.get("url") != source.get("url"):
                errors.append(f"manifest package {name} URL is not pinned")
            if row.get("scope", "") != source.get("scope"):
                errors.append(f"manifest package {name} scope is not pinned")
            direct = requirements.get(name)
            if direct is not None and row.get("inputRev") != direct.get("rev"):
                errors.append(f"manifest package {name} inputRev does not match the direct requirement")

        default_roots = config.get("default_roots")
        actual_defaults = lakefile.get("defaultTargets")
        if actual_defaults != default_roots:
            errors.append(f"defaultTargets {actual_defaults!r} != {default_roots!r}")

        libraries = _unique_named(lakefile.get("lean_lib", []), "Lean library")
        default_libraries = _require_mapping(config.get("default_libraries"), "default_libraries")
        if set(default_libraries) != set(default_roots or []):
            errors.append("default_libraries must cover exactly default_roots")
        for name, expected in default_libraries.items():
            expected = _require_mapping(expected, f"default_libraries.{name}")
            actual = libraries.get(name)
            if actual is None:
                errors.append(f"missing default library: {name}")
                continue
            actual_roots = actual.get("roots", [name])
            if actual_roots != expected.get("roots"):
                errors.append(f"default library {name} has wrong effective roots")
        comparator = _require_mapping(config.get("comparator_libraries"), "comparator_libraries")
        for name, expected in comparator.items():
            actual = libraries.get(name)
            if actual is None:
                errors.append(f"missing comparator library: {name}")
                continue
            if actual.get("srcDir") != expected.get("srcDir"):
                errors.append(f"comparator library {name} has wrong srcDir")
            if "roots" in expected and actual.get("roots") != expected["roots"]:
                errors.append(f"comparator library {name} has wrong roots")
            if "roots" not in expected and "roots" in actual:
                errors.append(f"comparator library {name} unexpectedly declares roots")

        executables = _unique_named(lakefile.get("lean_exe", []), "Lean executable")
        diagnostics = _require_mapping(config.get("diagnostic_executables"), "diagnostic_executables")
        for name, expected in diagnostics.items():
            actual = executables.get(name)
            if actual is None:
                errors.append(f"missing diagnostic executable: {name}")
            elif actual.get("root") != expected.get("root"):
                errors.append(f"diagnostic executable {name} has wrong root")
    except (TypeError, ValueError) as exc:
        errors.append(str(exc))
    return errors


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--config", type=Path, default=DEFAULT_CONFIG)
    args = parser.parse_args(argv)
    errors = validate(args.repo_root.resolve(), args.config)
    if errors:
        for error in errors:
            print(f"FAIL: {error}", file=sys.stderr)
        return 1
    print("OK: Lean toolchain, Lake pins, supported roots, comparator libraries, and diagnostic target match")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
