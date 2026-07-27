#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Emit a deterministic Lean replay tree for a whole windowed RUP package."""

from __future__ import annotations

import argparse
import copy
import hashlib
import json
import os
from pathlib import Path
import shutil
import sys
import tempfile
from typing import Any

import materialize_windowed_rup


SCHEMA = "p97-windowed-rup-lean-replay-v1"
MANIFEST_NAME = "replay-manifest.json"
MODULE_NAMESPACE = "WindowedRupReplay"
EXPECTED_TRUST_AXIOMS = [
    "propext",
    "Classical.choice",
    "Quot.sound",
    "Lean.ofReduceBool",
    "Lean.trustCompiler",
]
EPISTEMIC_STATUS = (
    "STRUCTURALLY VERIFIED REPLAY PACKAGE; "
    "LEAN BUILD AND AXIOM AUDIT REQUIRED"
)
TRUST_AUDIT_STATUS = "NOT_AUDITED"
FORBIDDEN_GENERATED_TOKENS = (
    "axiom",
    "sorry",
    "admit",
    "implemented_by",
)


class ReplayPackageError(RuntimeError):
    """The replay package is malformed or cannot be emitted safely."""


def _canonical_json(payload: object) -> bytes:
    return json.dumps(
        payload, separators=(",", ":"), sort_keys=True
    ).encode("utf-8")


def compute_replay_package_digest(payload: dict[str, Any]) -> str:
    """Hash all relocation-stable manifest content except the digest itself."""

    digest_payload = copy.deepcopy(payload)
    digest_payload.pop("replay_package_sha256", None)
    return hashlib.sha256(_canonical_json(digest_payload)).hexdigest()


def _sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as source:
        while block := source.read(1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def _safe_relative(value: object, *, label: str) -> Path:
    relative = Path(str(value))
    if (
        not relative.parts
        or relative.is_absolute()
        or ".." in relative.parts
        or relative == Path(".")
    ):
        raise ReplayPackageError(f"unsafe {label} path: {relative}")
    return relative


def _source_record(source: str, *, path: str) -> dict[str, Any]:
    encoded = source.encode("utf-8")
    return {
        "path": path,
        "byte_count": len(encoded),
        "sha256": hashlib.sha256(encoded).hexdigest(),
    }


def _copied_record(
    path: Path,
    *,
    relative: str,
    source_relative: str,
    kind: str,
) -> dict[str, Any]:
    return {
        "kind": kind,
        "path": relative,
        "source_path": source_relative,
        "byte_count": path.stat().st_size,
        "sha256": _sha256(path),
    }


def _assert_safe_generated_source(source: str, *, label: str) -> None:
    lowered = source.lower()
    for token in FORBIDDEN_GENERATED_TOKENS:
        if token in lowered:
            raise ReplayPackageError(
                f"generated {label} contains forbidden token {token}"
            )


def _common_module(n: int) -> str:
    return f'''/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Certificate.CheckpointedRupTextBoundary

namespace {MODULE_NAMESPACE}

/-- One larger than the DIMACS variable count. -/
abbrev n : Nat := {n}

end {MODULE_NAMESPACE}
'''


def _checkpoint_module(index: int) -> str:
    name = f"C{index:04d}"
    return f'''/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import {MODULE_NAMESPACE}.Common

namespace {MODULE_NAMESPACE}.Checkpoint.{name}

/-- Canonical text for checkpoint {index}. -/
def text : String :=
  include_str "../../data/checkpoints/checkpoint-{index:04d}.cnf"

end {MODULE_NAMESPACE}.Checkpoint.{name}
'''


def _window_module(shard: int, record: dict[str, Any]) -> str:
    index = int(record["index"])
    role = str(record["role"])
    start = int(record["start_checkpoint"])
    finish = int(record["end_checkpoint"])
    window_name = f"W{index:04d}"
    start_name = f"C{start:04d}"
    finish_name = f"C{finish:04d}"
    imports = [
        f"import {MODULE_NAMESPACE}.Checkpoint.{start_name}",
    ]
    if role == "rebase":
        imports.append(
            f"import {MODULE_NAMESPACE}.Checkpoint.{finish_name}"
        )
    elif role != "terminal":
        raise ReplayPackageError(
            f"unsupported role for shard {shard} window {index}: {role}"
        )
    action_path = (
        f'../../data/shard-{shard}/window-{index:04d}/actions.lrat'
    )
    if role == "rebase":
        accepted_type = f"""\
    TextIngress.checkRebaseText (n := n)
      Checkpoint.{start_name}.text actionText
      Checkpoint.{finish_name}.text = true"""
        unfold_names = (
            f"n Checkpoint.{start_name}.text actionText "
            f"Checkpoint.{finish_name}.text"
        )
        sound_type = f"""\
    Limplies (PosFin n)
      (formulaOfText (n := n) Checkpoint.{start_name}.text)
      (formulaOfText (n := n) Checkpoint.{finish_name}.text)"""
        sound_value = "  checkRebaseText_sound_of_text accepted"
    else:
        accepted_type = f"""\
    TextIngress.checkTerminalText (n := n)
      Checkpoint.{start_name}.text actionText = true"""
        unfold_names = f"n Checkpoint.{start_name}.text actionText"
        sound_type = f"""\
    Unsatisfiable (PosFin n)
      (formulaOfText (n := n) Checkpoint.{start_name}.text)"""
        sound_value = "  checkTerminalText_sound_of_text accepted"
    return f'''/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
{chr(10).join(imports)}

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace {MODULE_NAMESPACE}.Shard{shard}.{window_name}

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.TextBoundary

private def actionText : String :=
  include_str "{action_path}"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem accepted :
{accepted_type} := by
  unfold {unfold_names}
  native_decide

theorem sound :
{sound_type} :=
{sound_value}

end {MODULE_NAMESPACE}.Shard{shard}.{window_name}
'''


def _rebase_type(start: int, finish: int) -> str:
    return f"""\
    Limplies (PosFin n)
      (formulaOfText (n := n) Checkpoint.C{start:04d}.text)
      (formulaOfText (n := n) Checkpoint.C{finish:04d}.text)"""


def _unsat_type(start: int) -> str:
    return f"""\
    Unsatisfiable (PosFin n)
      (formulaOfText (n := n) Checkpoint.C{start:04d}.text)"""


def _shard_module(shard: int, records: list[dict[str, Any]]) -> str:
    if not records:
        raise ReplayPackageError(f"shard_{shard} has no windows")
    imports = [
        f"import {MODULE_NAMESPACE}.Shard{shard}.W{int(r['index']):04d}"
        for r in records
    ]
    lines = [
        "/-",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Authors: Adam McKenna",
        "-/",
        *imports,
        "",
        "open Std.Sat",
        "open Std.Tactic.BVDecide.LRAT.Internal",
        "",
        f"namespace {MODULE_NAMESPACE}.Shard{shard}",
        "",
        "open Problem97.CheckpointedRup.TextBoundary",
        "",
    ]
    first_start = int(records[0]["start_checkpoint"])
    if shard == 1:
        if any(r["role"] != "rebase" for r in records):
            raise ReplayPackageError("shard_1 must contain only rebase windows")
        previous_name = ""
        for offset, record in enumerate(records):
            index = int(record["index"])
            finish = int(record["end_checkpoint"])
            theorem_name = f"throughW{index:04d}"
            lines.extend(
                [
                    f"theorem {theorem_name} :",
                    _rebase_type(first_start, finish) + " :=",
                ]
            )
            if offset == 0:
                lines.append(f"  W{index:04d}.sound")
            else:
                lines.append(
                    "  composeRebaseText "
                    f"{previous_name} W{index:04d}.sound"
                )
            lines.append("")
            previous_name = theorem_name
        final_finish = int(records[-1]["end_checkpoint"])
        lines.extend(
            [
                "theorem sound :",
                _rebase_type(first_start, final_finish) + " :=",
                f"  {previous_name}",
            ]
        )
    else:
        if records[-1]["role"] != "terminal":
            raise ReplayPackageError(
                "the final shard_2 window must be terminal"
            )
        if any(r["role"] != "rebase" for r in records[:-1]):
            raise ReplayPackageError(
                "only the final shard_2 window may be terminal"
            )
        rebase_records = records[:-1]
        terminal_index = int(records[-1]["index"])
        previous_name = ""
        for offset, record in enumerate(rebase_records):
            index = int(record["index"])
            finish = int(record["end_checkpoint"])
            theorem_name = f"throughW{index:04d}"
            lines.extend(
                [
                    f"theorem {theorem_name} :",
                    _rebase_type(first_start, finish) + " :=",
                ]
            )
            if offset == 0:
                lines.append(f"  W{index:04d}.sound")
            else:
                lines.append(
                    "  composeRebaseText "
                    f"{previous_name} W{index:04d}.sound"
                )
            lines.append("")
            previous_name = theorem_name
        lines.extend(["theorem sound :", _unsat_type(first_start) + " :="])
        if rebase_records:
            lines.append(
                "  closeRebaseText "
                f"{previous_name} W{terminal_index:04d}.sound"
            )
        else:
            lines.append(f"  W{terminal_index:04d}.sound")
    lines.extend(["", f"end {MODULE_NAMESPACE}.Shard{shard}", ""])
    return "\n".join(lines)


def _compose_module(
    shard_1_start: int, boundary: int
) -> str:
    return f'''/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import {MODULE_NAMESPACE}.Shard1
import {MODULE_NAMESPACE}.Shard2

open Std.Sat
open Std.Tactic.BVDecide.LRAT.Internal

namespace {MODULE_NAMESPACE}

open Problem97.CheckpointedRup.TextBoundary

theorem startUnsatisfiable :
{_unsat_type(shard_1_start)} :=
  closeRebaseText Shard1.sound Shard2.sound

end {MODULE_NAMESPACE}
'''


def _validate_window_layout(
    payload: dict[str, Any],
) -> tuple[list[dict[str, Any]], list[dict[str, Any]], set[int]]:
    windows = payload.get("windows")
    if not isinstance(windows, dict):
        raise ReplayPackageError("verified package has no windows object")
    shards: list[list[dict[str, Any]]] = []
    consumed: set[int] = set()
    previous_end: int | None = None
    for shard in (1, 2):
        records = windows.get(f"shard_{shard}")
        if not isinstance(records, list) or not records:
            raise ReplayPackageError(f"verified package has no shard_{shard}")
        for expected_index, record in enumerate(records, 1):
            if int(record.get("index", -1)) != expected_index:
                raise ReplayPackageError(
                    f"non-dense shard_{shard} window index"
                )
            start = int(record["start_checkpoint"])
            finish = int(record["end_checkpoint"])
            if finish != start + 1:
                raise ReplayPackageError(
                    f"shard_{shard} window {expected_index} skips checkpoints"
                )
            if previous_end is not None and start != previous_end:
                raise ReplayPackageError(
                    f"shard_{shard} window {expected_index} breaks the chain"
                )
            consumed.add(start)
            if record["role"] == "rebase":
                consumed.add(finish)
            previous_end = finish
        shards.append(records)
    return shards[0], shards[1], consumed


def emit(package_dir: Path, output_dir: Path) -> dict[str, Any]:
    """Verify once, then atomically emit the complete Lean replay package."""

    package_dir = package_dir.resolve()
    output_dir = output_dir.resolve()
    if output_dir.exists():
        raise ReplayPackageError(
            f"refusing to overwrite existing replay output: {output_dir}"
        )
    payload = materialize_windowed_rup.verify_windowed_package(package_dir)
    shard_1, shard_2, consumed_checkpoints = _validate_window_layout(payload)
    counts = payload.get("counts")
    checkpoints = payload.get("checkpoints")
    if not isinstance(counts, dict) or not isinstance(checkpoints, list):
        raise ReplayPackageError("verified package is missing counts")
    variable_count = int(counts["variable_count"])
    if variable_count <= 0:
        raise ReplayPackageError("variable_count must be positive")
    n = variable_count + 1
    if max(consumed_checkpoints) >= len(checkpoints):
        raise ReplayPackageError("window references a missing checkpoint")

    sources: dict[str, str] = {
        f"{MODULE_NAMESPACE}/Common.lean": _common_module(n),
    }
    for checkpoint_index in sorted(consumed_checkpoints):
        relative = (
            f"{MODULE_NAMESPACE}/Checkpoint/C{checkpoint_index:04d}.lean"
        )
        sources[relative] = _checkpoint_module(checkpoint_index)
    for shard, records in ((1, shard_1), (2, shard_2)):
        for record in records:
            index = int(record["index"])
            relative = (
                f"{MODULE_NAMESPACE}/Shard{shard}/W{index:04d}.lean"
            )
            sources[relative] = _window_module(shard, record)
        sources[f"{MODULE_NAMESPACE}/Shard{shard}.lean"] = (
            _shard_module(shard, records)
        )
    boundary = int(shard_1[-1]["end_checkpoint"])
    if int(shard_2[0]["start_checkpoint"]) != boundary:
        raise ReplayPackageError("shard boundary checkpoint drift")
    sources[f"{MODULE_NAMESPACE}/Compose.lean"] = _compose_module(
        int(shard_1[0]["start_checkpoint"]), boundary
    )
    for relative, source in sources.items():
        _assert_safe_generated_source(source, label=relative)

    output_dir.parent.mkdir(parents=True, exist_ok=True)
    stage = Path(
        tempfile.mkdtemp(
            prefix=f".{output_dir.name}.stage-", dir=output_dir.parent
        )
    )
    try:
        copied_inputs: list[dict[str, Any]] = []
        for checkpoint_index in sorted(consumed_checkpoints):
            source_record = checkpoints[checkpoint_index]
            source_path = materialize_windowed_rup.resolve_package_relative(
                package_dir,
                source_record,
                label=f"checkpoint {checkpoint_index}",
            )
            relative = (
                f"data/checkpoints/checkpoint-{checkpoint_index:04d}.cnf"
            )
            target = stage / relative
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(source_path, target)
            copied = _copied_record(
                target,
                relative=relative,
                source_relative=str(source_record["path"]),
                kind="checkpoint",
            )
            if (
                copied["byte_count"] != int(source_record["byte_count"])
                or copied["sha256"] != source_record["sha256"]
            ):
                raise ReplayPackageError(
                    f"checkpoint {checkpoint_index} changed after "
                    "source-package verification"
                )
            copied_inputs.append(copied)
        for shard, records in ((1, shard_1), (2, shard_2)):
            for record in records:
                index = int(record["index"])
                action_record = record["artifacts"]["actions_lrat"]
                source_path = (
                    materialize_windowed_rup.resolve_package_relative(
                        package_dir,
                        action_record,
                        label=f"shard {shard} window {index} actions",
                    )
                )
                relative = (
                    f"data/shard-{shard}/window-{index:04d}/actions.lrat"
                )
                target = stage / relative
                target.parent.mkdir(parents=True, exist_ok=True)
                shutil.copyfile(source_path, target)
                copied = _copied_record(
                    target,
                    relative=relative,
                    source_relative=str(action_record["path"]),
                    kind="actions_lrat",
                )
                if (
                    copied["byte_count"]
                    != int(action_record["byte_count"])
                    or copied["sha256"] != action_record["sha256"]
                ):
                    raise ReplayPackageError(
                        f"shard {shard} window {index} actions changed "
                        "after source-package verification"
                    )
                copied_inputs.append(copied)
        lean_sources: list[dict[str, Any]] = []
        for relative, source in sources.items():
            target = stage / relative
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_text(source, encoding="utf-8")
            lean_sources.append(_source_record(source, path=relative))
        manifest: dict[str, Any] = {
            "schema": SCHEMA,
            "epistemic_status": EPISTEMIC_STATUS,
            "generator": {
                "path": Path(__file__).name,
                "byte_count": Path(__file__).stat().st_size,
                "sha256": _sha256(Path(__file__)),
            },
            "source": {
                "schema": payload.get("schema"),
                "package_sha256": payload.get("package_sha256"),
                "epistemic_status": payload.get("epistemic_status"),
                "tools": copy.deepcopy(payload.get("tools")),
            },
            "counts": {
                "variable_count": variable_count,
                "n": n,
                "shard_1_windows": len(shard_1),
                "shard_2_windows": len(shard_2),
                "windows": len(shard_1) + len(shard_2),
                "consumed_checkpoints": len(consumed_checkpoints),
                "copied_inputs": len(copied_inputs),
                "lean_sources": len(lean_sources),
            },
            "source_counts": copy.deepcopy(counts),
            "trust_profile": {
                "audit_status": TRUST_AUDIT_STATUS,
                "allowed_axioms": EXPECTED_TRUST_AXIOMS,
            },
            "copied_inputs": copied_inputs,
            "lean_sources": lean_sources,
        }
        manifest["replay_package_sha256"] = (
            compute_replay_package_digest(manifest)
        )
        (stage / MANIFEST_NAME).write_text(
            json.dumps(manifest, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
        if output_dir.exists():
            raise ReplayPackageError(
                f"refusing to overwrite existing replay output: {output_dir}"
            )
        stage.rename(output_dir)
    except BaseException:
        shutil.rmtree(stage, ignore_errors=True)
        raise
    return manifest


def verify_replay_package(output_dir: Path) -> dict[str, Any]:
    """Reject manifest, content, digest, or file-set drift."""

    output_dir = output_dir.resolve()
    manifest_path = output_dir / MANIFEST_NAME
    try:
        payload = json.loads(manifest_path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        raise ReplayPackageError(
            f"cannot read replay manifest: {manifest_path}"
        ) from exc
    if payload.get("schema") != SCHEMA:
        raise ReplayPackageError(
            f"unexpected replay schema: {payload.get('schema')!r}"
        )
    if payload.get("epistemic_status") != EPISTEMIC_STATUS:
        raise ReplayPackageError("replay epistemic-status drift")
    if payload.get("trust_profile") != {
        "audit_status": TRUST_AUDIT_STATUS,
        "allowed_axioms": EXPECTED_TRUST_AXIOMS,
    }:
        raise ReplayPackageError("expected trust profile drift")
    if payload.get("replay_package_sha256") != (
        compute_replay_package_digest(payload)
    ):
        raise ReplayPackageError("replay package SHA-256 drift")
    records: list[dict[str, Any]] = []
    for key in ("copied_inputs", "lean_sources"):
        value = payload.get(key)
        if not isinstance(value, list):
            raise ReplayPackageError(f"manifest {key} is not a list")
        records.extend(value)
    expected_paths = {MANIFEST_NAME}
    for record in records:
        relative = _safe_relative(record.get("path"), label="manifest")
        relative_text = relative.as_posix()
        if relative_text in expected_paths:
            raise ReplayPackageError(
                f"duplicate replay manifest path: {relative_text}"
            )
        expected_paths.add(relative_text)
        path = output_dir / relative
        if path.is_symlink() or not path.is_file():
            raise ReplayPackageError(
                f"replay package file is missing: {relative_text}"
            )
        if path.stat().st_size != int(record.get("byte_count", -1)):
            raise ReplayPackageError(
                f"replay package byte-count drift: {relative_text}"
            )
        if _sha256(path) != record.get("sha256"):
            raise ReplayPackageError(
                f"replay package SHA-256 drift: {relative_text}"
            )
        if record in payload["lean_sources"]:
            try:
                source = path.read_text(encoding="utf-8")
            except (OSError, UnicodeDecodeError) as exc:
                raise ReplayPackageError(
                    f"cannot read generated Lean source: {relative_text}"
                ) from exc
            _assert_safe_generated_source(
                source, label=relative_text
            )
    actual_paths: set[str] = set()
    for path in output_dir.rglob("*"):
        if path.is_symlink():
            raise ReplayPackageError(
                f"replay package contains symlink: "
                f"{path.relative_to(output_dir)}"
            )
        if path.is_file():
            actual_paths.add(path.relative_to(output_dir).as_posix())
    if actual_paths != expected_paths:
        missing = sorted(expected_paths - actual_paths)
        unexpected = sorted(actual_paths - expected_paths)
        raise ReplayPackageError(
            f"replay package path-set drift: missing={missing}, "
            f"unexpected={unexpected}"
        )
    counts = payload.get("counts")
    if not isinstance(counts, dict):
        raise ReplayPackageError("manifest counts is not an object")
    if int(counts.get("copied_inputs", -1)) != len(
        payload["copied_inputs"]
    ):
        raise ReplayPackageError("copied input count drift")
    if int(counts.get("lean_sources", -1)) != len(
        payload["lean_sources"]
    ):
        raise ReplayPackageError("Lean source count drift")
    return payload


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--package-dir", type=Path)
    mode.add_argument("--verify-replay-package", type=Path)
    parser.add_argument("--output-dir", type=Path)
    args = parser.parse_args(argv)
    try:
        if args.verify_replay_package is not None:
            if args.output_dir is not None:
                parser.error(
                    "--verify-replay-package cannot be combined with "
                    "--output-dir"
                )
            manifest = verify_replay_package(
                args.verify_replay_package
            )
            result = {
                "status": "STRUCTURALLY_VERIFIED",
                "epistemic_status": manifest["epistemic_status"],
                "output_dir": str(args.verify_replay_package.resolve()),
                "replay_package_sha256": (
                    manifest["replay_package_sha256"]
                ),
            }
        else:
            if args.output_dir is None:
                parser.error("--package-dir requires --output-dir")
            manifest = emit(args.package_dir, args.output_dir)
            result = {
                "status": "EMITTED",
                "output_dir": str(args.output_dir.resolve()),
                "replay_package_sha256": (
                    manifest["replay_package_sha256"]
                ),
                "counts": manifest["counts"],
            }
    except (
        materialize_windowed_rup.MaterializationError,
        ReplayPackageError,
        KeyError,
        TypeError,
        ValueError,
        OSError,
    ) as exc:
        parser.error(str(exc))
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    sys.exit(main())
