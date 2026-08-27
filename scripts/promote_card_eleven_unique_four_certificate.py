#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna
# Released under Apache 2.0 license as described in the file LICENSE.
# Authors: Adam McKenna
"""Promote the Card Eleven unique-four scratch certificate source graph.

The input census is deliberately pinned to the audited closure log.  One
audited correction adds the compact-atom-binding files reached by
DirectOuterBindingIntegrity.  The two checkpointed replay trees and their
directly referenced source assets are promoted in full so the production proof
has no dependency on a historical Lean tree or on precompiled artifacts
outside the main library.

Every promoted internal import is rewritten to its fully-qualified production
module.  Ambiguous basename/suffix resolution is an error unless it appears in
the explicit resolution table below.  ``--check`` verifies the checked-in
production tree from its checked-in manifest and does not read the scratch
provenance; ``--check-manifest-scope`` applies only the pinned off-manifest
package exclusions and post-promotion support amendments below;
``--check-source`` additionally reconstructs the promotion from provenance.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import shutil
import sys
from collections import Counter, defaultdict
from dataclasses import dataclass
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[1]
SOURCE_BASE = Path("scratch/atail-force")
SOURCE_LOG = Path("scratch/logs/card11-selected-import-closure-files-2026-07-25.log")
DEST_ROOT = Path(
    "lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate"
)
MANIFEST_PATH = DEST_ROOT / "promotion-manifest.json"
MODULE_PREFIX = "Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate"
MANIFEST_SCOPE_EXCLUDED_ROOTS = (
    Path(
        "lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/"
        "Generated/ExactFiveCommonShellV7G3Replay"
    ),
    Path(
        "lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/"
        "Support/ExactFiveCommonShellV7"
    ),
    Path(
        "lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/"
        "Support/ExactFiveCommonShellAdapter.lean"
    ),
)

EXPECTED_LOG_FILE_COUNT = 386
EXPECTED_LOG_UNRESOLVED_COUNT = 8

PUBLIC_DESTINATIONS = {
    Path(
        "scratch/atail-force/unique4-n11-source-lift/"
        "CardElevenUniqueFourCoverage.lean"
    ): Path("Coverage.lean"),
    Path(
        "scratch/atail-force/unique4-n11-source-lift/"
        "CardElevenUniqueFourCertificateCoordinator.lean"
    ): Path("Coordinator.lean"),
    Path(
        "scratch/atail-force/unique-arm-route-audit/"
        "OriginalUniqueResidualDispatch.lean"
    ): Path("Support/UniqueArmRouteAudit/OriginalUniqueResidualDispatch.lean"),
}

COMPACT_BINDING_BASE = Path(
    "scratch/atail-force/unique4-p4-compact-atom-binding"
)
AUDITED_CLOSURE_CORRECTION = (
    COMPACT_BINDING_BASE / "AtomBinding.lean",
    COMPACT_BINDING_BASE / "BindingData.lean",
    COMPACT_BINDING_BASE / "Main.lean",
    *(COMPACT_BINDING_BASE / f"generated/BindingChunk{i:02}.lean" for i in range(1, 11)),
)

REPLAY_SOURCE_ROOTS = (
    (
        Path(
            "scratch/atail-force/unique4-exact-two-lrat-ingress/generated/"
            "p4-seed0-compact-windowed-replay/CompactWindowedRupReplay"
        ),
        922,
    ),
    (
        Path(
            "scratch/atail-force/unique4-exact-two-lrat-ingress/generated/"
            "p5-largest-windowed-replay/WindowedRupReplay"
        ),
        742,
    ),
)
REPLAY_COMPOSE_SOURCES = {
    root / "Compose.lean" for root, _expected_count in REPLAY_SOURCE_ROOTS
}
REPLAY_ASSET_ROOTS = (
    (REPLAY_SOURCE_ROOTS[0][0].parent / "data", 918),
    (REPLAY_SOURCE_ROOTS[1][0].parent / "data", 738),
)

EXPLICIT_INTERNAL_IMPORTS = {
    (
        Path(
            "scratch/atail-force/unique4-p4-right-cap-source-bridge/"
            "RightCapOccurrences.lean"
        ),
        "Families",
    ): Path(
        "scratch/atail-force/unique4-p4-critical-support-occurrence-bridge/"
        "Families.lean"
    ),
    (
        Path(
            "scratch/atail-force/unique4-p4-direct-valuation/"
            "DirectSourceAdapter.lean"
        ),
        "Core",
    ): Path(
        "scratch/atail-force/unique4-p4-critical-support-occurrence-bridge/"
        "Core.lean"
    ),
    (
        Path(
            "scratch/atail-force/unique4-p4-direct-valuation/"
            "DirectOuterBindingIntegrity.lean"
        ),
        "Main",
    ): COMPACT_BINDING_BASE / "Main.lean",
    (
        Path(
            "scratch/atail-force/unique4-p4-strict-unit-source-bridge/"
            "P4StrictUnitValuation.lean"
        ),
        "Families",
    ): Path(
        "scratch/atail-force/unique4-p4-critical-support-occurrence-bridge/"
        "Families.lean"
    ),
}

LEAN_COMPONENT = re.compile(r"^[A-Za-z_][A-Za-z0-9_']*$")


class PromotionError(RuntimeError):
    """A deterministic-promotion invariant failed."""


@dataclass(frozen=True)
class LoggedUnresolved:
    source: Path
    module: str
    candidate_count: int


@dataclass(frozen=True)
class ImportResolution:
    source: Path
    original: str
    rewritten: str
    kind: str


@dataclass(frozen=True)
class ImportOccurrence:
    module_start: int
    module_end: int
    module: str


@dataclass(frozen=True)
class InventoryDrift:
    failures: tuple[str, ...]
    excluded_extra_files: tuple[Path, ...]
    excluded_extra_directories: tuple[Path, ...]


@dataclass(frozen=True)
class ManifestScopeSupportAmendment:
    manifest_sha256: str
    current_sha256: str
    source_commit: str
    current_import_count: int
    current_internal_import_count: int
    external_import_deltas: tuple[tuple[str, int], ...]
    reason: str


MANIFEST_SCOPE_SUPPORT_AMENDMENTS = {
    DEST_ROOT
    / "Support/UniqueArmRouteAudit/UniqueArmDeletionNormalForm.lean": (
        ManifestScopeSupportAmendment(
            manifest_sha256=(
                "a87dcf3a8f40487e71d7337cf68e119c8ac077f23290b1475f97f91c0b605754"
            ),
            current_sha256=(
                "73d7b3d9d934613273d874f82a46aee79bc9f4827fcc667e055699e754ab9468"
            ),
            source_commit="a0f73bc1ed1e7e57ec5ccc36fe7ca934ce1adaf6",
            current_import_count=1,
            current_internal_import_count=0,
            external_import_deltas=(),
            reason="intentional post-promotion support refactor",
        )
    ),
    DEST_ROOT
    / "Support/UniqueRowProducer/card_five_cross_blocker_localization.lean": (
        ManifestScopeSupportAmendment(
            manifest_sha256=(
                "f6ba77aff5e9d48b8dc66156fef257b17cc3814b54c807ba4d1594037529a2d1"
            ),
            current_sha256=(
                "a5dcab9ed1d2751646fb0c1b7ac6f4e1c16a42f3c64342ab5771f194ff57d403"
            ),
            source_commit="a0f73bc1ed1e7e57ec5ccc36fe7ca934ce1adaf6",
            current_import_count=2,
            current_internal_import_count=1,
            external_import_deltas=(),
            reason="intentional post-promotion support refactor",
        )
    ),
    DEST_ROOT
    / "Support/UniqueRowProducer/card_five_interior_bisector_localization.lean": (
        ManifestScopeSupportAmendment(
            manifest_sha256=(
                "9e665876b45c8f5d743ba0ac0f8d3c55e3a503b1b1d7daf0dbf612de6ac37aa5"
            ),
            current_sha256=(
                "9b7440c4cf94dc1426982e0fd27de2f0398966168c92114b6fcbec08908011df"
            ),
            source_commit="a0f73bc1ed1e7e57ec5ccc36fe7ca934ce1adaf6",
            current_import_count=3,
            current_internal_import_count=1,
            external_import_deltas=(
                ("Erdos9796Proof.P97.CapSelectedRowCounting", -1),
            ),
            reason=(
                "intentional post-promotion support refactor removing the unused "
                "CapSelectedRowCounting import"
            ),
        )
    ),
    DEST_ROOT
    / "Support/Unique4KalmansonOccurrence/SixRoleKalmansonTriangle.lean": (
        ManifestScopeSupportAmendment(
            manifest_sha256=(
                "641e6f7346f3fe524352053ba8d7cc0ce85aeeb4f5ac7397ed267645767916c1"
            ),
            current_sha256=(
                "84a528c78982e4f1df6ecd751e042addf7693947e80fb973f78a5f1ab1852c41"
            ),
            source_commit="25271543e8558ccde737b55197a45e0fd7b4ba8c",
            current_import_count=1,
            current_internal_import_count=0,
            external_import_deltas=(),
            reason="intentional post-promotion support refactor",
        )
    ),
}


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def path_text(path: Path) -> str:
    return path.as_posix()


def reject_duplicate_json_keys(
    pairs: list[tuple[str, object]],
) -> dict[str, object]:
    """Build one JSON object while rejecting every duplicate key."""
    result: dict[str, object] = {}
    for key, value in pairs:
        if key in result:
            raise PromotionError(
                f"promotion manifest JSON contains duplicate key: {key}"
            )
        result[key] = value
    return result


def absolute(path: Path) -> Path:
    return REPO_ROOT / path


def reject_symlink_components(path: Path, label: str) -> None:
    """Reject repository-relative paths that escape lexically or through symlinks."""
    if path.is_absolute() or ".." in path.parts:
        raise PromotionError(f"{label} is not a repository-relative path: {path}")
    current = REPO_ROOT
    for component in path.parts:
        current /= component
        if current.is_symlink():
            raise PromotionError(f"{label} traverses symlink: {current}")


def require_regular_file(
    path: Path,
    label: str,
    *,
    within: Path | None = None,
) -> Path:
    reject_symlink_components(path, label)
    full_path = absolute(path)
    if not full_path.is_file():
        raise PromotionError(f"missing regular file for {label}: {path}")
    if within is not None:
        reject_symlink_components(within, f"{label} containment root")
        try:
            full_path.resolve(strict=True).relative_to(
                absolute(within).resolve(strict=True)
            )
        except ValueError as exc:
            raise PromotionError(f"{label} is outside {within}: {path}") from exc
    return full_path


def require_directory(path: Path, label: str) -> Path:
    reject_symlink_components(path, label)
    full_path = absolute(path)
    if not full_path.is_dir():
        raise PromotionError(f"missing directory for {label}: {path}")
    return full_path


def iter_include_asset_paths(text: str) -> list[str]:
    """Extract include_str/include_bytes paths outside Lean comments and strings."""
    references: list[str] = []
    index = 0
    block_depth = 0
    length = len(text)
    tokens = ("include_str", "include_bytes")
    while index < length:
        if block_depth:
            if text.startswith("/-", index):
                block_depth += 1
                index += 2
            elif text.startswith("-/", index):
                block_depth -= 1
                index += 2
            else:
                index += 1
            continue
        if text.startswith("--", index):
            newline = text.find("\n", index + 2)
            index = length if newline < 0 else newline + 1
            continue
        if text.startswith("/-", index):
            block_depth = 1
            index += 2
            continue
        if text[index] == '"':
            index += 1
            while index < length:
                if text[index] == "\\":
                    index += 2
                elif text[index] == '"':
                    index += 1
                    break
                else:
                    index += 1
            continue

        token = next(
            (
                candidate
                for candidate in tokens
                if text.startswith(candidate, index)
                and (
                    index == 0
                    or not (text[index - 1].isalnum() or text[index - 1] in "_'")
                )
                and (
                    index + len(candidate) == length
                    or not (
                        text[index + len(candidate)].isalnum()
                        or text[index + len(candidate)] in "_'"
                    )
                )
            ),
            None,
        )
        if token is None:
            index += 1
            continue
        cursor = index + len(token)
        while cursor < length and text[cursor].isspace():
            cursor += 1
        if cursor >= length or text[cursor] != '"':
            index += len(token)
            continue
        cursor += 1
        start = cursor
        while cursor < length and text[cursor] != '"':
            if text[cursor] == "\\":
                raise PromotionError("escaped include asset paths are unsupported")
            cursor += 1
        if cursor >= length:
            raise PromotionError("unterminated include asset path")
        references.append(text[start:cursor])
        index = cursor + 1
    if block_depth:
        raise PromotionError("unterminated Lean block comment")
    return references


def iter_import_occurrences(text: str) -> list[ImportOccurrence]:
    """Find every Lean import command outside comments and string literals."""
    occurrences: list[ImportOccurrence] = []
    index = 0
    block_depth = 0
    length = len(text)
    while index < length:
        if block_depth:
            if text.startswith("/-", index):
                block_depth += 1
                index += 2
            elif text.startswith("-/", index):
                block_depth -= 1
                index += 2
            else:
                index += 1
            continue
        if text.startswith("--", index):
            newline = text.find("\n", index + 2)
            index = length if newline < 0 else newline + 1
            continue
        if text.startswith("/-", index):
            block_depth = 1
            index += 2
            continue
        if text[index] == '"':
            index += 1
            while index < length:
                if text[index] == "\\":
                    index += 2
                elif text[index] == '"':
                    index += 1
                    break
                else:
                    index += 1
            continue
        if not (
            text.startswith("import", index)
            and (
                index == 0
                or not (
                    text[index - 1].isalnum()
                    or text[index - 1] in "_'«"
                )
            )
            and (
                index + len("import") == length
                or not (
                    text[index + len("import")].isalnum()
                    or text[index + len("import")] in "_'»"
                )
            )
        ):
            index += 1
            continue

        cursor = index + len("import")
        saw_layout = False
        while cursor < length:
            if text[cursor].isspace():
                saw_layout = True
                cursor += 1
                continue
            if text.startswith("--", cursor):
                saw_layout = True
                newline = text.find("\n", cursor + 2)
                cursor = length if newline < 0 else newline + 1
                continue
            if text.startswith("/-", cursor):
                saw_layout = True
                comment_depth = 1
                cursor += 2
                while cursor < length and comment_depth:
                    if text.startswith("/-", cursor):
                        comment_depth += 1
                        cursor += 2
                    elif text.startswith("-/", cursor):
                        comment_depth -= 1
                        cursor += 2
                    else:
                        cursor += 1
                if comment_depth:
                    raise PromotionError("unterminated Lean block comment after import")
                continue
            break
        if not saw_layout or cursor >= length:
            raise PromotionError("Lean import command has no module")

        module_start = cursor
        while (
            cursor < length
            and not text[cursor].isspace()
            and not text.startswith("--", cursor)
            and not text.startswith("/-", cursor)
        ):
            cursor += 1
        if cursor == module_start:
            raise PromotionError("Lean import command has no module")
        module = text[module_start:cursor]
        occurrences.append(ImportOccurrence(module_start, cursor, module))
        index = cursor
    if block_depth:
        raise PromotionError("unterminated Lean block comment")
    return occurrences


def upper_camel(text: str) -> str:
    parts = [part for part in re.split(r"[^A-Za-z0-9]+", text) if part]
    if not parts:
        raise PromotionError(f"cannot normalize empty module component from {text!r}")
    result = "".join(part[0].upper() + part[1:] for part in parts)
    if result[0].isdigit():
        result = "M" + result
    if not LEAN_COMPONENT.fullmatch(result):
        raise PromotionError(f"normalization of {text!r} is not a Lean component: {result!r}")
    return result


def normalize_generated_directory(component: str) -> str:
    if LEAN_COMPONENT.fullmatch(component):
        return component
    return upper_camel(component)


def parse_source_log() -> tuple[list[Path], list[LoggedUnresolved], str]:
    log_path = require_regular_file(
        SOURCE_LOG, "source closure log", within=Path("scratch")
    )
    raw = log_path.read_bytes()
    lines = raw.decode("utf-8").splitlines()
    if not lines:
        raise PromotionError(f"empty source log: {SOURCE_LOG}")
    header = re.fullmatch(r"FILES ([0-9]+) UNRESOLVED ([0-9]+)", lines[0])
    if header is None:
        raise PromotionError(f"unexpected source-log header: {lines[0]!r}")
    file_count, unresolved_count = map(int, header.groups())
    if (file_count, unresolved_count) != (
        EXPECTED_LOG_FILE_COUNT,
        EXPECTED_LOG_UNRESOLVED_COUNT,
    ):
        raise PromotionError(
            "source-log census drift: "
            f"expected ({EXPECTED_LOG_FILE_COUNT}, {EXPECTED_LOG_UNRESOLVED_COUNT}), "
            f"found ({file_count}, {unresolved_count})"
        )
    try:
        divider = lines.index("UNRESOLVED")
    except ValueError as exc:
        raise PromotionError("source log has no UNRESOLVED divider") from exc

    sources = [Path(line) for line in lines[1:divider]]
    if len(sources) != file_count:
        raise PromotionError(
            f"source-log file count mismatch: header {file_count}, body {len(sources)}"
        )
    if len(set(sources)) != len(sources):
        raise PromotionError("source log contains duplicate file paths")

    unresolved: list[LoggedUnresolved] = []
    for line in lines[divider + 1 :]:
        try:
            source_text, module, count_text = line.rsplit(" ", 2)
            count = int(count_text)
        except ValueError as exc:
            raise PromotionError(f"malformed unresolved entry: {line!r}") from exc
        unresolved.append(LoggedUnresolved(Path(source_text), module, count))
    if len(unresolved) != unresolved_count:
        raise PromotionError(
            "source-log unresolved count mismatch: "
            f"header {unresolved_count}, body {len(unresolved)}"
        )
    return sources, unresolved, sha256_bytes(raw)


def assert_sources_exist(sources: list[Path]) -> None:
    non_lean = [source for source in sources if source.suffix != ".lean"]
    if non_lean:
        raise PromotionError(
            "non-Lean paths in source graph: "
            + ", ".join(path_text(path) for path in non_lean)
        )
    for source in sources:
        require_regular_file(source, "promotion source", within=SOURCE_BASE)


def enumerate_replay_sources() -> tuple[list[Path], list[dict[str, object]]]:
    sources: list[Path] = []
    trees: list[dict[str, object]] = []
    for root, expected_count in REPLAY_SOURCE_ROOTS:
        full_root = require_directory(root, "replay source root")
        tree_sources: list[Path] = []
        for path in full_root.rglob("*"):
            relative = path.relative_to(REPO_ROOT)
            if path.is_symlink():
                raise PromotionError(f"replay source tree contains symlink: {relative}")
            if path.is_file() and path.suffix == ".lean":
                require_regular_file(relative, "replay source", within=root)
                tree_sources.append(relative)
        tree_sources.sort()
        if len(tree_sources) != expected_count:
            raise PromotionError(
                f"replay source census drift at {root}: "
                f"expected {expected_count}, found {len(tree_sources)}"
            )
        sources.extend(tree_sources)
        trees.append(
            {
                "root": path_text(root),
                "file_count": len(tree_sources),
            }
        )
    if len(set(sources)) != len(sources):
        raise PromotionError("replay source roots overlap")
    return sources, trees


def destination_relative(source: Path) -> Path:
    if source in PUBLIC_DESTINATIONS:
        return PUBLIC_DESTINATIONS[source]
    try:
        relative = source.relative_to(SOURCE_BASE)
    except ValueError as exc:
        raise PromotionError(f"source is outside {SOURCE_BASE}: {source}") from exc
    if len(relative.parts) < 2:
        raise PromotionError(f"source has no lane-relative path: {source}")

    lane, *within_lane = relative.parts
    lane_component = upper_camel(lane)
    within = Path(*within_lane)
    if within.parts[0] == "generated":
        tail = within.parts[1:]
        if not tail:
            raise PromotionError(f"generated source has no filename: {source}")
        normalized_dirs = [
            normalize_generated_directory(component) for component in tail[:-1]
        ]
        filename = tail[-1]
        if not LEAN_COMPONENT.fullmatch(Path(filename).stem):
            raise PromotionError(f"invalid generated Lean filename: {source}")
        return Path("Generated", lane_component, *normalized_dirs, filename)

    for component in within.parts[:-1]:
        if not LEAN_COMPONENT.fullmatch(component):
            raise PromotionError(f"invalid support module directory in {source}: {component}")
    if not LEAN_COMPONENT.fullmatch(within.stem):
        raise PromotionError(f"invalid support Lean filename: {source}")
    return Path("Support", lane_component, within)


def production_module(destination: Path) -> str:
    if destination.suffix != ".lean":
        raise PromotionError(f"destination is not a Lean file: {destination}")
    components = destination.with_suffix("").parts
    for component in components:
        if not LEAN_COMPONENT.fullmatch(component):
            raise PromotionError(
                f"invalid production module component {component!r} in {destination}"
            )
    return ".".join((MODULE_PREFIX, *components))


def validate_preexisting_external_module(module: str, label: str) -> None:
    if module == "Mathlib" or module.startswith("Mathlib."):
        return
    if not module.startswith("Erdos9796Proof."):
        raise PromotionError(f"{label} has unsupported external import: {module}")
    components = module.split(".")
    if any(LEAN_COMPONENT.fullmatch(component) is None for component in components):
        raise PromotionError(f"{label} has invalid project module import: {module}")
    module_path = Path("lean", *components).with_suffix(".lean")
    require_regular_file(
        module_path,
        f"{label} project module {module}",
        within=Path("lean/Erdos9796Proof"),
    )


def enumerate_replay_assets() -> tuple[
    list[tuple[Path, Path, str, int]],
    list[dict[str, object]],
]:
    assets: list[tuple[Path, Path, str, int]] = []
    trees: list[dict[str, object]] = []
    for (module_root, _lean_count), (asset_root, expected_count) in zip(
        REPLAY_SOURCE_ROOTS, REPLAY_ASSET_ROOTS, strict=True
    ):
        full_asset_root = require_directory(asset_root, "replay asset root")
        source_assets: list[Path] = []
        for path in full_asset_root.rglob("*"):
            relative = path.relative_to(REPO_ROOT)
            if path.is_symlink():
                raise PromotionError(f"replay asset tree contains symlink: {relative}")
            if path.is_file():
                require_regular_file(relative, "replay asset", within=asset_root)
                source_assets.append(relative)
        source_assets.sort()
        if len(source_assets) != expected_count:
            raise PromotionError(
                f"replay asset census drift at {asset_root}: "
                f"expected {expected_count}, found {len(source_assets)}"
            )
        module_destination = destination_relative(module_root / "Common.lean")
        package_destination = module_destination.parent.parent
        byte_count = 0
        for source in source_assets:
            size = absolute(source).stat().st_size
            byte_count += size
            destination = (
                DEST_ROOT
                / package_destination
                / "data"
                / source.relative_to(asset_root)
            )
            assets.append((source, destination, sha256_file(absolute(source)), size))
        trees.append(
            {
                "root": path_text(asset_root),
                "file_count": len(source_assets),
                "byte_count": byte_count,
                "destination": path_text(DEST_ROOT / package_destination / "data"),
            }
        )
    destinations = [destination for _source, destination, _digest, _size in assets]
    if len(set(destinations)) != len(destinations):
        raise PromotionError("replay asset destination collision")
    return assets, trees


def expected_replay_layout() -> list[tuple[Path, Path, int, int]]:
    """Return production package/data roots with expected source and asset counts."""
    layout: list[tuple[Path, Path, int, int]] = []
    for (source_root, source_count), (_asset_root, asset_count) in zip(
        REPLAY_SOURCE_ROOTS, REPLAY_ASSET_ROOTS, strict=True
    ):
        package_root = DEST_ROOT / destination_relative(
            source_root / "Common.lean"
        ).parent.parent
        layout.append((package_root, package_root / "data", source_count, asset_count))
    return layout


def lane_relative_module_parts(source: Path) -> tuple[str, ...]:
    relative = source.relative_to(SOURCE_BASE)
    within_lane = Path(*relative.parts[1:]).with_suffix("")
    return within_lane.parts


class ImportResolver:
    def __init__(
        self,
        sources: list[Path],
        source_to_module: dict[Path, str],
    ) -> None:
        self.sources = set(sources)
        self.source_to_module = source_to_module
        aliases: dict[str, set[Path]] = defaultdict(set)
        for source in sources:
            parts = lane_relative_module_parts(source)
            for index in range(len(parts)):
                aliases[".".join(parts[index:])].add(source)
        self.aliases = aliases

    def resolve(self, source: Path, module: str) -> ImportResolution:
        if module == "Mathlib" or module.startswith("Mathlib."):
            return ImportResolution(source, module, module, "preexisting-external")
        if module.startswith("Erdos9796Proof."):
            validate_preexisting_external_module(module, path_text(source))
            return ImportResolution(source, module, module, "preexisting-external")

        explicit = EXPLICIT_INTERNAL_IMPORTS.get((source, module))
        if explicit is not None:
            if explicit not in self.sources:
                raise PromotionError(
                    f"explicit target is not promoted: {source} imports {module} -> {explicit}"
                )
            return ImportResolution(
                source,
                module,
                self.source_to_module[explicit],
                "explicit-internal",
            )

        same_directory = source.parent.joinpath(*module.split(".")).with_suffix(".lean")
        if same_directory in self.sources:
            return ImportResolution(
                source,
                module,
                self.source_to_module[same_directory],
                "same-directory-internal",
            )

        candidates = self.aliases.get(module, set())
        if len(candidates) == 1:
            target = next(iter(candidates))
            return ImportResolution(
                source,
                module,
                self.source_to_module[target],
                "unique-suffix-internal",
            )
        if candidates:
            choices = ", ".join(path_text(path) for path in sorted(candidates))
            raise PromotionError(
                f"ambiguous internal import {module!r} from {source}: {choices}"
            )
        raise PromotionError(f"unresolved non-external import {module!r} from {source}")


def rewrite_source(
    source: Path,
    resolver: ImportResolver,
) -> tuple[bytes, list[ImportResolution]]:
    text = absolute(source).read_text(encoding="utf-8")
    output: list[str] = []
    resolutions: list[ImportResolution] = []
    previous_end = 0
    for occurrence in iter_import_occurrences(text):
        resolution = resolver.resolve(source, occurrence.module)
        resolutions.append(resolution)
        output.append(text[previous_end:occurrence.module_start])
        output.append(resolution.rewritten)
        previous_end = occurrence.module_end
    output.append(text[previous_end:])
    return "".join(output).encode("utf-8"), resolutions


def validate_replay_asset_references(
    replay_sources: list[Path],
    source_to_destination: dict[Path, Path],
    assets: list[tuple[Path, Path, str, int]],
) -> None:
    asset_destinations = {
        source: destination for source, destination, _digest, _size in assets
    }
    referenced: set[Path] = set()
    for source in replay_sources:
        text = absolute(source).read_text(encoding="utf-8")
        for reference in iter_include_asset_paths(text):
            source_asset = repository_relative_replay_include(
                absolute(source).parent,
                reference,
                source,
            )
            expected_destination = asset_destinations.get(source_asset)
            if expected_destination is None:
                raise PromotionError(
                    f"unpromoted replay asset from {source}: {reference}"
                )
            promoted_source = DEST_ROOT / source_to_destination[source]
            actual_destination = repository_relative_replay_include(
                absolute(promoted_source).parent,
                reference,
                promoted_source,
            )
            if actual_destination != expected_destination:
                raise PromotionError(
                    f"replay asset layout drift from {source}: "
                    f"expected {expected_destination}, found {actual_destination}"
                )
            referenced.add(source_asset)
    unreferenced = set(asset_destinations) - referenced
    if unreferenced:
        first = min(unreferenced)
        raise PromotionError(f"unreferenced replay asset: {first}")


def repository_relative_replay_include(
    base: Path,
    reference: str,
    owner: Path,
) -> Path:
    """Resolve one replay include and reject repository escapes without traceback."""
    try:
        return (base / reference).resolve().relative_to(REPO_ROOT)
    except ValueError:
        raise PromotionError(
            f"replay include path escapes repository from {path_text(owner)}: "
            f"{reference}"
        ) from None


def classify_logged_unresolved(
    entries: list[LoggedUnresolved],
) -> list[dict[str, object]]:
    classified: list[dict[str, object]] = []
    for entry in entries:
        key = (entry.source, entry.module)
        if entry.source in REPLAY_COMPOSE_SOURCES:
            classification = "promoted-replay-internal-resolution"
        elif key in EXPLICIT_INTERNAL_IMPORTS:
            classification = "explicit-internal-resolution"
        else:
            raise PromotionError(
                "unclassified source-log unresolved entry: "
                f"{entry.source} {entry.module} {entry.candidate_count}"
            )
        classified.append(
            {
                "source": path_text(entry.source),
                "module": entry.module,
                "candidate_count_in_stale_global_scan": entry.candidate_count,
                "classification": classification,
            }
        )
    return classified


def build_promotion() -> tuple[
    dict[Path, bytes],
    list[tuple[Path, Path, str, int]],
    bytes,
    dict[str, object],
]:
    logged, logged_unresolved, source_log_hash = parse_source_log()
    replay_sources, replay_trees = enumerate_replay_sources()
    replay_assets, replay_asset_trees = enumerate_replay_assets()
    if set(AUDITED_CLOSURE_CORRECTION) & set(logged):
        raise PromotionError("audited closure correction unexpectedly overlaps source log")
    assert_sources_exist(logged + list(AUDITED_CLOSURE_CORRECTION) + replay_sources)
    if not REPLAY_COMPOSE_SOURCES <= set(logged):
        raise PromotionError("one or more replay Compose sources are absent from source log")

    candidates = sorted(
        set(logged) | set(AUDITED_CLOSURE_CORRECTION) | set(replay_sources)
    )
    promoted_sources = candidates
    if len(candidates) != 2061:
        raise PromotionError(
            f"source graph drift: candidates={len(candidates)}"
        )

    source_to_destination = {
        source: destination_relative(source) for source in promoted_sources
    }
    destination_to_sources: dict[Path, list[Path]] = defaultdict(list)
    for source, destination in source_to_destination.items():
        destination_to_sources[destination].append(source)
    collisions = {
        destination: sources
        for destination, sources in destination_to_sources.items()
        if len(sources) > 1
    }
    if collisions:
        first_destination = min(collisions)
        sources = ", ".join(path_text(path) for path in collisions[first_destination])
        raise PromotionError(
            f"destination collision at {first_destination}: {sources}"
        )

    source_to_module = {
        source: production_module(destination)
        for source, destination in source_to_destination.items()
    }
    if len(set(source_to_module.values())) != len(source_to_module):
        raise PromotionError("production module collision")
    validate_replay_asset_references(
        replay_sources, source_to_destination, replay_assets
    )
    resolver = ImportResolver(promoted_sources, source_to_module)

    outputs: dict[Path, bytes] = {}
    all_resolutions: list[ImportResolution] = []
    file_records: list[dict[str, object]] = []
    for source in promoted_sources:
        destination = source_to_destination[source]
        promoted_bytes, resolutions = rewrite_source(source, resolver)
        all_resolutions.extend(resolutions)
        output_path = DEST_ROOT / destination
        outputs[output_path] = promoted_bytes
        source_bytes = absolute(source).read_bytes()
        file_records.append(
            {
                "source": path_text(source),
                "destination": path_text(output_path),
                "module": source_to_module[source],
                "source_sha256": sha256_bytes(source_bytes),
                "promoted_sha256": sha256_bytes(promoted_bytes),
                "import_count": len(resolutions),
                "rewritten_internal_import_count": sum(
                    resolution.kind.endswith("-internal")
                    for resolution in resolutions
                ),
            }
        )

    promoted_modules = set(source_to_module.values())
    for resolution in all_resolutions:
        if resolution.kind.endswith("-internal") and resolution.rewritten not in promoted_modules:
            raise PromotionError(
                f"rewritten internal import is outside promoted graph: {resolution}"
            )

    resolution_counts = Counter(resolution.kind for resolution in all_resolutions)
    external_counts = Counter(
        resolution.rewritten
        for resolution in all_resolutions
        if resolution.kind == "preexisting-external"
    )
    destination_split = Counter(
        "root"
        if len(destination.parts) == 1
        else destination.parts[0].lower()
        for destination in source_to_destination.values()
    )

    normalization_counts: Counter[tuple[str, str]] = Counter()
    for source in promoted_sources:
        relative = source.relative_to(SOURCE_BASE)
        within = relative.parts[1:]
        if within and within[0] == "generated":
            for component in within[1:-1]:
                normalized = normalize_generated_directory(component)
                if normalized != component:
                    normalization_counts[(component, normalized)] += 1

    manifest: dict[str, object] = {
        "schema": "card-eleven-unique-four-source-promotion-v2",
        "module_prefix": MODULE_PREFIX,
        "source_log": {
            "path": path_text(SOURCE_LOG),
            "sha256": source_log_hash,
            "recorded_file_count": len(logged),
            "recorded_unresolved_count": len(logged_unresolved),
            "unresolved_entries": classify_logged_unresolved(logged_unresolved),
        },
        "audited_closure_correction": {
            "reason": (
                "DirectOuterBindingIntegrity imports compact-atom-binding Main; "
                "the stale closure log omitted its 13-file transitive source closure."
            ),
            "file_count": len(AUDITED_CLOSURE_CORRECTION),
            "files": [
                path_text(path) for path in sorted(AUDITED_CLOSURE_CORRECTION)
            ],
        },
        "source_partition": {
            "candidate_file_count": len(candidates),
            "promoted_file_count": len(promoted_sources),
        },
        "replay_source_promotion": {
            "trees": replay_trees,
            "file_count": len(replay_sources),
            "note": (
                "Both checkpointed replay trees are source-promoted into the "
                "main Erdos9796Proof library; no historical-tree path package "
                "or precompiled replay artifact is required."
            ),
        },
        "replay_asset_promotion": {
            "trees": replay_asset_trees,
            "file_count": len(replay_assets),
            "byte_count": sum(size for _source, _destination, _digest, size in replay_assets),
            "files": [
                {
                    "source": path_text(source),
                    "destination": path_text(destination),
                    "sha256": digest,
                    "byte_count": size,
                }
                for source, destination, digest, size in replay_assets
            ],
        },
        "generated_component_normalizations": [
            {
                "source_component": source_component,
                "production_component": production_component,
                "file_count": count,
            }
            for (source_component, production_component), count
            in sorted(normalization_counts.items())
        ],
        "explicit_internal_import_resolutions": [
            {
                "source": path_text(source),
                "original_import": original_import,
                "target_source": path_text(target),
                "target_module": source_to_module[target],
            }
            for (source, original_import), target
            in sorted(
                EXPLICIT_INTERNAL_IMPORTS.items(),
                key=lambda item: (path_text(item[0][0]), item[0][1]),
            )
        ],
        "destination_split": dict(sorted(destination_split.items())),
        "import_resolution_counts": dict(sorted(resolution_counts.items())),
        "preexisting_external_imports": dict(sorted(external_counts.items())),
        "unresolved_promoted_imports": [],
        "files": file_records,
    }
    manifest_bytes = (
        json.dumps(manifest, indent=2, sort_keys=True, ensure_ascii=False) + "\n"
    ).encode("utf-8")
    summary = {
        "promoted": len(promoted_sources),
        "split": dict(sorted(destination_split.items())),
        "imports": len(all_resolutions),
        "internal_rewrites": sum(
            count
            for kind, count in resolution_counts.items()
            if kind.endswith("-internal")
        ),
        "preexisting_external": sum(external_counts.values()),
        "assets": len(replay_assets),
        "asset_bytes": sum(
            size for _source, _destination, _digest, size in replay_assets
        ),
    }
    return outputs, replay_assets, manifest_bytes, summary


def write_outputs(
    outputs: dict[Path, bytes],
    assets: list[tuple[Path, Path, str, int]],
    manifest_bytes: bytes,
) -> None:
    reject_symlink_components(DEST_ROOT, "promotion destination root")
    changed = 0
    unchanged = 0
    for path, data in sorted(outputs.items()):
        reject_symlink_components(path, "promotion destination")
        full_path = absolute(path)
        if full_path.is_file() and full_path.read_bytes() == data:
            unchanged += 1
            continue
        full_path.parent.mkdir(parents=True, exist_ok=True)
        full_path.write_bytes(data)
        changed += 1
    for source, destination, digest, size in assets:
        require_regular_file(source, "replay asset source", within=SOURCE_BASE)
        reject_symlink_components(destination, "replay asset destination")
        full_destination = absolute(destination)
        if (
            full_destination.is_file()
            and full_destination.stat().st_size == size
            and sha256_file(full_destination) == digest
        ):
            unchanged += 1
            continue
        full_destination.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(absolute(source), full_destination)
        if (
            full_destination.stat().st_size != size
            or sha256_file(full_destination) != digest
        ):
            raise PromotionError(f"replay asset copy verification failed: {destination}")
        changed += 1
    manifest_full_path = absolute(MANIFEST_PATH)
    reject_symlink_components(MANIFEST_PATH, "promotion manifest destination")
    if manifest_full_path.is_file() and manifest_full_path.read_bytes() == manifest_bytes:
        unchanged += 1
    else:
        manifest_full_path.parent.mkdir(parents=True, exist_ok=True)
        manifest_full_path.write_bytes(manifest_bytes)
        changed += 1
    print(f"promotion write: changed={changed} unchanged={unchanged}")


def installed_inventory() -> tuple[set[Path], set[Path]]:
    destination_root = require_directory(DEST_ROOT, "promotion destination root")
    files: set[Path] = set()
    directories: set[Path] = set()
    for path in destination_root.rglob("*"):
        relative = path.relative_to(REPO_ROOT)
        if path.is_symlink():
            raise PromotionError(f"promotion destination contains symlink: {relative}")
        if path.is_file():
            files.add(relative)
        elif path.is_dir():
            directories.add(relative)
        else:
            raise PromotionError(
                f"promotion destination contains unsupported filesystem entry: {relative}"
            )
    return files, directories


def inventory_directories(paths: set[Path]) -> set[Path]:
    directories: set[Path] = set()
    for path in paths:
        try:
            path.relative_to(DEST_ROOT)
        except ValueError as exc:
            raise PromotionError(f"inventory path is outside {DEST_ROOT}: {path}") from exc
        parent = path.parent
        while parent != DEST_ROOT:
            directories.add(parent)
            parent = parent.parent
    return directories


def validate_allowed_extra_roots(
    allowed_extra_roots: tuple[Path, ...], expected_paths: set[Path]
) -> tuple[Path, ...]:
    """Validate narrowly scoped inventory exclusions without touching the filesystem."""
    validated: list[Path] = []
    for index, root in enumerate(allowed_extra_roots):
        label = f"allowed_extra_roots[{index}]"
        if not isinstance(root, Path):
            raise PromotionError(f"{label} must be a Path")
        if root.is_absolute() or not root.parts or ".." in root.parts:
            raise PromotionError(
                f"{label} is not a normalized repository-relative path: {root}"
            )
        try:
            relative = root.relative_to(DEST_ROOT)
        except ValueError as exc:
            raise PromotionError(f"{label} is outside {DEST_ROOT}: {root}") from exc
        if not relative.parts or root != DEST_ROOT.joinpath(*relative.parts):
            raise PromotionError(
                f"{label} is not a normalized strict descendant of {DEST_ROOT}: {root}"
            )
        for expected_path in expected_paths:
            if expected_path.is_relative_to(root) or root.is_relative_to(expected_path):
                raise PromotionError(
                    f"{label} overlaps expected manifest path {expected_path}: {root}"
                )
        for previous in validated:
            if root.is_relative_to(previous) or previous.is_relative_to(root):
                raise PromotionError(
                    f"{label} overlaps allowed extra root {previous}: {root}"
                )
        validated.append(root)
    return tuple(validated)


def partition_inventory_drift(
    expected_paths: set[Path],
    actual_paths: set[Path],
    actual_directories: set[Path],
    *,
    allowed_extra_roots: tuple[Path, ...] = (),
) -> InventoryDrift:
    """Partition exact inventory drift from explicit paths and descendants."""
    allowed_roots = validate_allowed_extra_roots(
        allowed_extra_roots, expected_paths
    )
    expected_directories = inventory_directories(expected_paths)
    missing_paths = sorted(expected_paths - actual_paths)
    missing_directories = sorted(expected_directories - actual_directories)
    extra_files = sorted(actual_paths - expected_paths)
    extra_directories = sorted(actual_directories - expected_directories)

    def matches_allowed_root(path: Path) -> bool:
        return any(path == root or path.is_relative_to(root) for root in allowed_roots)

    excluded_extra_files = tuple(
        path for path in extra_files if matches_allowed_root(path)
    )
    excluded_extra_directories = tuple(
        path for path in extra_directories if matches_allowed_root(path)
    )
    rejected_extra_files = sorted(set(extra_files) - set(excluded_extra_files))
    rejected_extra_directories = sorted(
        set(extra_directories) - set(excluded_extra_directories)
    )
    failures = tuple(
        [f"missing {path_text(path)}" for path in missing_paths]
        + [f"unexpected {path_text(path)}" for path in rejected_extra_files]
        + [
            f"missing directory {path_text(path)}"
            for path in missing_directories
        ]
        + [
            f"unexpected directory {path_text(path)}"
            for path in rejected_extra_directories
        ]
    )
    return InventoryDrift(
        failures=failures,
        excluded_extra_files=excluded_extra_files,
        excluded_extra_directories=excluded_extra_directories,
    )


def check_outputs(
    outputs: dict[Path, bytes],
    assets: list[tuple[Path, Path, str, int]],
    manifest_bytes: bytes,
) -> None:
    expected = dict(outputs)
    expected[MANIFEST_PATH] = manifest_bytes
    expected_paths = (
        set(expected)
        | {destination for _source, destination, _digest, _size in assets}
    )
    actual_paths, actual_directories = installed_inventory()
    drift = partition_inventory_drift(
        expected_paths, actual_paths, actual_directories
    )
    failures = list(drift.failures)
    for path, data in sorted(expected.items()):
        full_path = absolute(path)
        if not full_path.is_file():
            failures.append(f"missing {path_text(path)}")
        elif full_path.read_bytes() != data:
            failures.append(f"mismatch {path_text(path)}")
    for _source, destination, digest, size in assets:
        full_destination = absolute(destination)
        if not full_destination.is_file():
            failures.append(f"missing {path_text(destination)}")
        elif full_destination.stat().st_size != size:
            failures.append(f"size mismatch {path_text(destination)}")
        elif sha256_file(full_destination) != digest:
            failures.append(f"digest mismatch {path_text(destination)}")
    if failures:
        print("promotion check failed:", file=sys.stderr)
        for failure in failures[:20]:
            print(f"  {failure}", file=sys.stderr)
        if len(failures) > 20:
            print(f"  ... and {len(failures) - 20} more", file=sys.stderr)
        raise SystemExit(1)
    print(f"promotion check: ok files={len(expected_paths)}")


def manifest_destination(value: object, label: str) -> Path:
    if not isinstance(value, str):
        raise PromotionError(f"{label} must be a string")
    destination = Path(value)
    if destination.is_absolute() or ".." in destination.parts:
        raise PromotionError(f"{label} is not a repository-relative path: {value}")
    try:
        destination.relative_to(DEST_ROOT)
    except ValueError as exc:
        raise PromotionError(f"{label} is outside {DEST_ROOT}: {value}") from exc
    return destination


def manifest_sha256(value: object, label: str) -> str:
    if (
        not isinstance(value, str)
        or len(value) != 64
        or any(character not in "0123456789abcdef" for character in value)
    ):
        raise PromotionError(f"{label} is not a lowercase SHA-256 digest")
    return value


def manifest_nonnegative_int(value: object, label: str) -> int:
    if type(value) is not int or value < 0:
        raise PromotionError(f"{label} must be a nonnegative integer")
    return value


def manifest_counter(value: object, label: str) -> Counter[str]:
    if not isinstance(value, dict):
        raise PromotionError(f"{label} must be an object")
    result: Counter[str] = Counter()
    for key, count in value.items():
        if not isinstance(key, str):
            raise PromotionError(f"{label} keys must be strings")
        result[key] = manifest_nonnegative_int(count, f"{label}.{key}")
    return result


def validate_manifest_scope_support_amendments(
    amendments: dict[Path, ManifestScopeSupportAmendment],
    lean_records: dict[Path, tuple[str, str, int, int]],
) -> dict[Path, ManifestScopeSupportAmendment]:
    """Bind every scoped support amendment to one exact manifest record."""
    validated: dict[Path, ManifestScopeSupportAmendment] = {}
    for index, (destination, amendment) in enumerate(sorted(amendments.items())):
        label = f"support_amendments[{index}]"
        if not isinstance(destination, Path):
            raise PromotionError(f"{label}.destination must be a Path")
        normalized_destination = manifest_destination(
            path_text(destination), f"{label}.destination"
        )
        if normalized_destination != destination or destination.suffix != ".lean":
            raise PromotionError(
                f"{label}.destination is not a normalized Lean source path"
            )
        if not isinstance(amendment, ManifestScopeSupportAmendment):
            raise PromotionError(f"{label} has the wrong record type")
        manifest_digest = manifest_sha256(
            amendment.manifest_sha256, f"{label}.manifest_sha256"
        )
        current_digest = manifest_sha256(
            amendment.current_sha256, f"{label}.current_sha256"
        )
        if manifest_digest == current_digest:
            raise PromotionError(f"{label} does not record a digest transition")
        if not re.fullmatch(r"[0-9a-f]{40}", amendment.source_commit):
            raise PromotionError(
                f"{label}.source_commit is not a full lowercase commit SHA"
            )
        current_import_count = manifest_nonnegative_int(
            amendment.current_import_count, f"{label}.current_import_count"
        )
        current_internal_import_count = manifest_nonnegative_int(
            amendment.current_internal_import_count,
            f"{label}.current_internal_import_count",
        )
        if current_internal_import_count > current_import_count:
            raise PromotionError(
                f"{label}.current_internal_import_count exceeds current_import_count"
            )
        if not amendment.reason.strip():
            raise PromotionError(f"{label}.reason must be nonempty")
        record = lean_records.get(destination)
        if record is None:
            raise PromotionError(
                f"{label}.destination is not an expected manifest Lean source"
            )
        (
            recorded_digest,
            _module,
            recorded_import_count,
            recorded_internal_import_count,
        ) = record
        if manifest_digest != recorded_digest:
            raise PromotionError(
                f"{label}.manifest_sha256 does not match the manifest record"
            )
        if current_internal_import_count != recorded_internal_import_count:
            raise PromotionError(
                f"{label} changes internal imports without a resolution-kind binding"
            )
        external_deltas: Counter[str] = Counter()
        for delta_index, raw_delta in enumerate(amendment.external_import_deltas):
            delta_label = f"{label}.external_import_deltas[{delta_index}]"
            if (
                not isinstance(raw_delta, tuple)
                or len(raw_delta) != 2
                or not isinstance(raw_delta[0], str)
                or type(raw_delta[1]) is not int
                or raw_delta[1] == 0
            ):
                raise PromotionError(
                    f"{delta_label} must be a module and nonzero integer"
                )
            module, delta = raw_delta
            if module in external_deltas:
                raise PromotionError(f"{delta_label} repeats module {module}")
            if module == MODULE_PREFIX or module.startswith(f"{MODULE_PREFIX}."):
                raise PromotionError(f"{delta_label} names an internal module")
            external_deltas[module] = delta
        expected_external_delta = (
            current_import_count
            - recorded_import_count
            - (current_internal_import_count - recorded_internal_import_count)
        )
        if sum(external_deltas.values()) != expected_external_delta:
            raise PromotionError(
                f"{label}.external_import_deltas do not bind the import-count change"
            )
        validated[destination] = amendment
    return validated


def adjusted_manifest_scope_import_counters(
    resolution_counts: Counter[str],
    external_counts: Counter[str],
    lean_records: dict[Path, tuple[str, str, int, int]],
    amendments: dict[Path, ManifestScopeSupportAmendment],
) -> tuple[Counter[str], Counter[str]]:
    """Apply the exact import deltas bound by validated support amendments."""
    adjusted_resolution_counts = resolution_counts.copy()
    adjusted_external_counts = external_counts.copy()
    for destination, amendment in amendments.items():
        _digest, _module, recorded_import_count, _recorded_internal = lean_records[
            destination
        ]
        import_delta = amendment.current_import_count - recorded_import_count
        external_deltas = Counter(dict(amendment.external_import_deltas))
        if sum(external_deltas.values()) != import_delta:
            raise PromotionError(
                f"support amendment import delta mismatch {path_text(destination)}"
            )
        adjusted_resolution_counts["preexisting-external"] += import_delta
        adjusted_external_counts.update(external_deltas)
    if any(count < 0 for count in adjusted_resolution_counts.values()):
        raise PromotionError("support amendments make an import resolution count negative")
    if any(count < 0 for count in adjusted_external_counts.values()):
        raise PromotionError("support amendments make an external import count negative")
    return adjusted_resolution_counts, adjusted_external_counts


def match_manifest_scope_support_amendment(
    destination: Path,
    manifest_digest: str,
    current_digest: str,
    amendments: dict[Path, ManifestScopeSupportAmendment],
) -> ManifestScopeSupportAmendment | None:
    """Accept an exact pinned support transition or require the manifest digest."""
    amendment = amendments.get(destination)
    if amendment is None:
        if current_digest != manifest_digest:
            raise PromotionError(f"digest mismatch {path_text(destination)}")
        return None
    if amendment.manifest_sha256 != manifest_digest:
        raise PromotionError(
            f"support amendment manifest digest mismatch {path_text(destination)}"
        )
    if amendment.current_sha256 != current_digest:
        raise PromotionError(
            f"support amendment current digest mismatch {path_text(destination)}"
        )
    return amendment


def manifest_scope_support_amendment_summary(
    amendments: dict[Path, ManifestScopeSupportAmendment],
) -> list[dict[str, object]]:
    return [
        {
            "destination": path_text(destination),
            "manifest_sha256": amendment.manifest_sha256,
            "current_sha256": amendment.current_sha256,
            "source_commit": amendment.source_commit,
            "current_import_count": amendment.current_import_count,
            "current_internal_import_count": amendment.current_internal_import_count,
            "external_import_deltas": dict(amendment.external_import_deltas),
            "reason": amendment.reason,
        }
        for destination, amendment in sorted(amendments.items())
    ]


def check_installed_promotion(
    *,
    allowed_extra_roots: tuple[Path, ...] = (),
    support_amendments: dict[Path, ManifestScopeSupportAmendment] | None = None,
) -> dict[str, object]:
    """Verify the checked-in promotion without consulting its scratch provenance."""
    manifest_full_path = require_regular_file(
        MANIFEST_PATH, "promotion manifest", within=DEST_ROOT
    )
    try:
        manifest = json.loads(
            manifest_full_path.read_text(encoding="utf-8"),
            object_pairs_hook=reject_duplicate_json_keys,
        )
    except json.JSONDecodeError as exc:
        raise PromotionError(f"invalid promotion manifest JSON: {exc}") from exc
    if not isinstance(manifest, dict):
        raise PromotionError("promotion manifest root must be an object")
    if manifest.get("schema") != "card-eleven-unique-four-source-promotion-v2":
        raise PromotionError("unsupported promotion manifest schema")
    if manifest.get("module_prefix") != MODULE_PREFIX:
        raise PromotionError("promotion manifest module prefix mismatch")
    if manifest.get("unresolved_promoted_imports") != []:
        raise PromotionError("promotion manifest records unresolved internal imports")

    raw_file_records = manifest.get("files")
    if not isinstance(raw_file_records, list) or len(raw_file_records) != 2061:
        raise PromotionError("promotion manifest must record exactly 2061 Lean files")
    raw_asset_section = manifest.get("replay_asset_promotion")
    if not isinstance(raw_asset_section, dict):
        raise PromotionError("promotion manifest has no replay_asset_promotion object")
    raw_asset_records = raw_asset_section.get("files")
    if not isinstance(raw_asset_records, list) or len(raw_asset_records) != 1656:
        raise PromotionError("promotion manifest must record exactly 1656 replay assets")

    lean_records: dict[Path, tuple[str, str, int, int]] = {}
    module_to_destination: dict[str, Path] = {}
    for index, raw_record in enumerate(raw_file_records):
        label = f"files[{index}]"
        if not isinstance(raw_record, dict):
            raise PromotionError(f"{label} must be an object")
        destination = manifest_destination(
            raw_record.get("destination"), f"{label}.destination"
        )
        if destination.suffix != ".lean":
            raise PromotionError(f"{label}.destination is not a Lean source")
        digest = manifest_sha256(
            raw_record.get("promoted_sha256"), f"{label}.promoted_sha256"
        )
        module = raw_record.get("module")
        if not isinstance(module, str):
            raise PromotionError(f"{label}.module must be a string")
        expected_module = production_module(destination.relative_to(DEST_ROOT))
        if module != expected_module:
            raise PromotionError(
                f"{label}.module mismatch: expected {expected_module}, found {module}"
            )
        import_count = raw_record.get("import_count")
        import_count = manifest_nonnegative_int(
            import_count, f"{label}.import_count"
        )
        internal_import_count = manifest_nonnegative_int(
            raw_record.get("rewritten_internal_import_count"),
            f"{label}.rewritten_internal_import_count",
        )
        if internal_import_count > import_count:
            raise PromotionError(
                f"{label}.rewritten_internal_import_count exceeds import_count"
            )
        if destination in lean_records:
            raise PromotionError(f"duplicate promoted destination: {destination}")
        if module in module_to_destination:
            raise PromotionError(f"duplicate promoted module: {module}")
        lean_records[destination] = (
            digest,
            module,
            import_count,
            internal_import_count,
        )
        module_to_destination[module] = destination

    requested_support_amendments = (
        {} if support_amendments is None else support_amendments
    )
    validated_support_amendments = validate_manifest_scope_support_amendments(
        requested_support_amendments, lean_records
    )

    replay_layout = expected_replay_layout()
    expected_data_roots = {data_root for _package, data_root, _sources, _assets in replay_layout}
    asset_records: dict[Path, tuple[str, int]] = {}
    for index, raw_record in enumerate(raw_asset_records):
        label = f"replay_asset_promotion.files[{index}]"
        if not isinstance(raw_record, dict):
            raise PromotionError(f"{label} must be an object")
        destination = manifest_destination(
            raw_record.get("destination"), f"{label}.destination"
        )
        if destination.suffix == ".lean":
            raise PromotionError(f"{label}.destination may not be a Lean source")
        containing_data_roots = [
            root for root in expected_data_roots if destination.is_relative_to(root)
        ]
        if len(containing_data_roots) != 1 or destination == containing_data_roots[0]:
            raise PromotionError(
                f"{label}.destination is outside a replay package data tree"
            )
        digest = manifest_sha256(raw_record.get("sha256"), f"{label}.sha256")
        byte_count = manifest_nonnegative_int(
            raw_record.get("byte_count"), f"{label}.byte_count"
        )
        if destination in lean_records or destination in asset_records:
            raise PromotionError(f"duplicate promoted destination: {destination}")
        asset_records[destination] = (digest, byte_count)

    expected_paths = set(lean_records) | set(asset_records) | {MANIFEST_PATH}
    actual_paths, actual_directories = installed_inventory()
    validated_allowed_roots = validate_allowed_extra_roots(
        allowed_extra_roots, expected_paths
    )
    drift = partition_inventory_drift(
        expected_paths,
        actual_paths,
        actual_directories,
        allowed_extra_roots=validated_allowed_roots,
    )
    failures = list(drift.failures)

    source_partition = manifest.get("source_partition")
    if source_partition != {
        "candidate_file_count": len(lean_records),
        "promoted_file_count": len(lean_records),
    }:
        failures.append("source partition summary mismatch")

    raw_replay_source = manifest.get("replay_source_promotion")
    if not isinstance(raw_replay_source, dict):
        raise PromotionError("manifest has no replay_source_promotion object")
    expected_source_trees = [
        {"root": path_text(root), "file_count": count}
        for root, count in REPLAY_SOURCE_ROOTS
    ]
    if raw_replay_source.get("trees") != expected_source_trees:
        failures.append("replay source tree metadata mismatch")
    if raw_replay_source.get("file_count") != sum(
        count for _root, count in REPLAY_SOURCE_ROOTS
    ):
        failures.append("replay source file-count summary mismatch")
    for package_root, _data_root, expected_sources, _expected_assets in replay_layout:
        actual_sources = sum(
            destination.is_relative_to(package_root)
            for destination in lean_records
        )
        if actual_sources != expected_sources:
            failures.append(
                f"replay source package count mismatch {path_text(package_root)}"
            )

    raw_asset_trees = raw_asset_section.get("trees")
    if not isinstance(raw_asset_trees, list) or len(raw_asset_trees) != len(
        replay_layout
    ):
        raise PromotionError("manifest replay asset trees have wrong cardinality")
    for index, (
        (_source_root, _source_count),
        (asset_source_root, expected_asset_count),
        (_package_root, data_root, _expected_sources, _layout_asset_count),
    ) in enumerate(
        zip(REPLAY_SOURCE_ROOTS, REPLAY_ASSET_ROOTS, replay_layout, strict=True)
    ):
        raw_tree = raw_asset_trees[index]
        if not isinstance(raw_tree, dict):
            raise PromotionError(f"replay_asset_promotion.trees[{index}] is not an object")
        tree_assets = {
            destination: record
            for destination, record in asset_records.items()
            if destination.is_relative_to(data_root)
        }
        tree_bytes = sum(size for _digest, size in tree_assets.values())
        expected_tree = {
            "root": path_text(asset_source_root),
            "file_count": expected_asset_count,
            "byte_count": tree_bytes,
            "destination": path_text(data_root),
        }
        if raw_tree != expected_tree or len(tree_assets) != expected_asset_count:
            failures.append(f"replay asset tree metadata mismatch at index {index}")

    recorded_asset_count = raw_asset_section.get("file_count")
    if recorded_asset_count != len(asset_records):
        failures.append("replay asset file-count summary mismatch")

    resolution_counts = manifest_counter(
        manifest.get("import_resolution_counts"), "import_resolution_counts"
    )
    allowed_resolution_kinds = {
        "explicit-internal",
        "preexisting-external",
        "same-directory-internal",
        "unique-suffix-internal",
    }
    if not set(resolution_counts) <= allowed_resolution_kinds:
        raise PromotionError("manifest records an unsupported import resolution kind")
    external_counts = manifest_counter(
        manifest.get("preexisting_external_imports"),
        "preexisting_external_imports",
    )
    (
        expected_resolution_counts,
        expected_external_counts,
    ) = adjusted_manifest_scope_import_counters(
        resolution_counts,
        external_counts,
        lean_records,
        validated_support_amendments,
    )
    destination_split = manifest_counter(
        manifest.get("destination_split"), "destination_split"
    )
    actual_destination_split = Counter(
        "root"
        if len(destination.relative_to(DEST_ROOT).parts) == 1
        else destination.relative_to(DEST_ROOT).parts[0].lower()
        for destination in lean_records
    )
    if destination_split != actual_destination_split:
        failures.append("destination split summary mismatch")

    referenced_assets: set[Path] = set()
    actual_import_count = 0
    actual_internal_import_count = 0
    actual_external_counts: Counter[str] = Counter()
    applied_support_amendments: set[Path] = set()
    for destination, (
        manifest_digest,
        _module,
        recorded_import_count,
        recorded_internal_import_count,
    ) in lean_records.items():
        full_path = absolute(destination)
        if not full_path.is_file():
            continue
        data = full_path.read_bytes()
        current_digest = sha256_bytes(data)
        try:
            amendment = match_manifest_scope_support_amendment(
                destination,
                manifest_digest,
                current_digest,
                validated_support_amendments,
            )
        except PromotionError as exc:
            failures.append(str(exc))
            continue
        if amendment is None:
            expected_import_count = recorded_import_count
            expected_internal_import_count = recorded_internal_import_count
        else:
            applied_support_amendments.add(destination)
            expected_import_count = amendment.current_import_count
            expected_internal_import_count = amendment.current_internal_import_count
        text = data.decode("utf-8")
        imports = [
            occurrence.module for occurrence in iter_import_occurrences(text)
        ]
        actual_import_count += len(imports)
        if len(imports) != expected_import_count:
            failures.append(f"import-count mismatch {path_text(destination)}")
        file_internal_import_count = 0
        for imported_module in imports:
            if imported_module == MODULE_PREFIX or imported_module.startswith(
                f"{MODULE_PREFIX}."
            ):
                file_internal_import_count += 1
                if imported_module not in module_to_destination:
                    failures.append(
                        f"unresolved promoted import {imported_module} "
                        f"in {path_text(destination)}"
                    )
                continue
            try:
                validate_preexisting_external_module(
                    imported_module, path_text(destination)
                )
            except PromotionError as exc:
                failures.append(str(exc))
                continue
            actual_external_counts[imported_module] += 1
        actual_internal_import_count += file_internal_import_count
        if file_internal_import_count != expected_internal_import_count:
            failures.append(
                f"internal-import-count mismatch {path_text(destination)}"
            )

        containing_layout = [
            (package_root, data_root)
            for package_root, data_root, _sources, _assets in replay_layout
            if destination.is_relative_to(package_root)
        ]
        for reference in iter_include_asset_paths(text):
            included = (full_path.parent / reference).resolve()
            try:
                included_relative = included.relative_to(REPO_ROOT)
            except ValueError:
                failures.append(
                    f"asset reference escapes repository in {path_text(destination)}"
                )
                continue
            referenced_assets.add(included_relative)
            if included_relative not in asset_records:
                failures.append(
                    f"unpromoted asset reference {path_text(included_relative)} "
                    f"in {path_text(destination)}"
                )
                continue
            if (
                len(containing_layout) != 1
                or not included_relative.is_relative_to(containing_layout[0][1])
            ):
                failures.append(
                    f"asset reference crosses replay package boundary "
                    f"in {path_text(destination)}"
                )

    for destination in sorted(
        set(validated_support_amendments) - applied_support_amendments
    ):
        failures.append(
            f"support amendment was not verified {path_text(destination)}"
        )

    for destination, (digest, expected_size) in asset_records.items():
        full_path = absolute(destination)
        if not full_path.is_file():
            continue
        if full_path.stat().st_size != expected_size:
            failures.append(f"size mismatch {path_text(destination)}")
        elif sha256_file(full_path) != digest:
            failures.append(f"digest mismatch {path_text(destination)}")
    for destination in sorted(set(asset_records) - referenced_assets):
        failures.append(f"unreferenced promoted asset {path_text(destination)}")

    recorded_asset_bytes = raw_asset_section.get("byte_count")
    actual_asset_bytes = sum(size for _digest, size in asset_records.values())
    if recorded_asset_bytes != actual_asset_bytes:
        failures.append("replay asset byte-count summary mismatch")

    expected_internal_import_count = sum(
        count
        for kind, count in expected_resolution_counts.items()
        if kind.endswith("-internal")
    )
    if expected_internal_import_count != actual_internal_import_count:
        failures.append("internal import resolution summary mismatch")
    if expected_resolution_counts.get("preexisting-external", 0) != sum(
        actual_external_counts.values()
    ):
        failures.append("external import resolution summary mismatch")
    if sum(expected_resolution_counts.values()) != actual_import_count:
        failures.append("total import resolution summary mismatch")
    if expected_external_counts != actual_external_counts:
        failures.append("preexisting external import census mismatch")

    if failures:
        print("promotion check failed:", file=sys.stderr)
        for failure in failures[:20]:
            print(f"  {failure}", file=sys.stderr)
        if len(failures) > 20:
            print(f"  ... and {len(failures) - 20} more", file=sys.stderr)
        raise SystemExit(1)

    summary = {
        "promoted": len(lean_records),
        "split": dict(sorted(actual_destination_split.items())),
        "imports": actual_import_count,
        "internal_rewrites": actual_internal_import_count,
        "preexisting_external": sum(actual_external_counts.values()),
        "assets": len(asset_records),
        "asset_bytes": actual_asset_bytes,
    }
    if validated_allowed_roots:
        summary.update(
            {
                "excluded_extra_files": len(drift.excluded_extra_files),
                "excluded_extra_directories": len(
                    drift.excluded_extra_directories
                ),
                "allowed_extra_roots": [
                    path_text(root) for root in validated_allowed_roots
                ],
            }
        )
    if validated_support_amendments:
        summary["support_amendments"] = manifest_scope_support_amendment_summary(
            validated_support_amendments
        )
    print(f"promotion check: ok files={len(expected_paths)}")
    return summary


def main(argv: list[str] | None = None) -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument(
        "--check",
        action="store_true",
        help=(
            "verify the checked-in promotion from its manifest, without "
            "consulting scratch provenance"
        ),
    )
    mode.add_argument(
        "--check-source",
        action="store_true",
        help="reconstruct from scratch provenance and compare without writing",
    )
    mode.add_argument(
        "--check-manifest-scope",
        action="store_true",
        help=(
            "verify the checked-in manifest while excluding only the declared "
            "off-manifest package paths"
        ),
    )
    args = parser.parse_args(argv)
    if args.check or args.check_manifest_scope:
        try:
            if args.check_manifest_scope:
                summary = check_installed_promotion(
                    allowed_extra_roots=MANIFEST_SCOPE_EXCLUDED_ROOTS,
                    support_amendments=MANIFEST_SCOPE_SUPPORT_AMENDMENTS,
                )
            else:
                summary = check_installed_promotion()
        except (OSError, UnicodeError, PromotionError) as exc:
            print(f"promotion error: {exc}", file=sys.stderr)
            raise SystemExit(2) from exc
    else:
        try:
            outputs, assets, manifest_bytes, summary = build_promotion()
        except (OSError, UnicodeError, PromotionError) as exc:
            print(f"promotion error: {exc}", file=sys.stderr)
            raise SystemExit(2) from exc
        if args.check_source:
            check_outputs(outputs, assets, manifest_bytes)
        else:
            write_outputs(outputs, assets, manifest_bytes)
            check_outputs(outputs, assets, manifest_bytes)
    scope_summary = ""
    if args.check_manifest_scope:
        scope_summary = (
            f" excluded_extra_files={summary['excluded_extra_files']}"
            f" excluded_extra_directories={summary['excluded_extra_directories']}"
            f" allowed_extra_roots={summary['allowed_extra_roots']}"
            f" support_amendments={json.dumps(summary['support_amendments'], sort_keys=True)}"
        )
    print(
        "promotion graph: "
        f"promoted={summary['promoted']} "
        f"split={summary['split']} "
        f"imports={summary['imports']} "
        f"internal_rewrites={summary['internal_rewrites']} "
        f"assets={summary['assets']} "
        f"asset_bytes={summary['asset_bytes']} "
        f"preexisting_external={summary['preexisting_external']}"
        f"{scope_summary}"
    )


if __name__ == "__main__":
    main()
