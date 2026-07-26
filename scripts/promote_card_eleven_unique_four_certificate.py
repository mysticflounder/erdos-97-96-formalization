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
provenance; ``--check-source`` additionally reconstructs the promotion from
that provenance.
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

IMPORT_LINE = re.compile(
    r"(?P<prefix>[ \t]*import[ \t]+)"
    r"(?P<module>[^ \t\r\n]+)"
    r"(?P<suffix>[ \t]*)"
)
INCLUDE_ASSET = re.compile(r'\binclude_(?:str|bytes)\s+"(?P<path>[^"]+)"')
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


def absolute(path: Path) -> Path:
    return REPO_ROOT / path


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
    log_path = absolute(SOURCE_LOG)
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
    missing = [source for source in sources if not absolute(source).is_file()]
    if missing:
        rendered = "\n".join(f"  {path_text(path)}" for path in missing[:20])
        raise PromotionError(f"missing source files:\n{rendered}")
    non_lean = [source for source in sources if source.suffix != ".lean"]
    if non_lean:
        raise PromotionError(
            "non-Lean paths in source graph: "
            + ", ".join(path_text(path) for path in non_lean)
        )


def enumerate_replay_sources() -> tuple[list[Path], list[dict[str, object]]]:
    sources: list[Path] = []
    trees: list[dict[str, object]] = []
    for root, expected_count in REPLAY_SOURCE_ROOTS:
        full_root = absolute(root)
        if not full_root.is_dir():
            raise PromotionError(f"missing replay source root: {root}")
        tree_sources = sorted(
            path.relative_to(REPO_ROOT)
            for path in full_root.rglob("*.lean")
            if path.is_file()
        )
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


def enumerate_replay_assets() -> tuple[
    list[tuple[Path, Path, str, int]],
    list[dict[str, object]],
]:
    assets: list[tuple[Path, Path, str, int]] = []
    trees: list[dict[str, object]] = []
    for (module_root, _lean_count), (asset_root, expected_count) in zip(
        REPLAY_SOURCE_ROOTS, REPLAY_ASSET_ROOTS, strict=True
    ):
        full_asset_root = absolute(asset_root)
        if not full_asset_root.is_dir():
            raise PromotionError(f"missing replay asset root: {asset_root}")
        source_assets = sorted(
            path.relative_to(REPO_ROOT)
            for path in full_asset_root.rglob("*")
            if path.is_file()
        )
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
    for line in text.splitlines(keepends=True):
        if line.endswith("\r\n"):
            body, ending = line[:-2], "\r\n"
        elif line.endswith("\n"):
            body, ending = line[:-1], "\n"
        else:
            body, ending = line, ""
        match = IMPORT_LINE.fullmatch(body)
        if match is None:
            output.append(line)
            continue
        resolution = resolver.resolve(source, match.group("module"))
        resolutions.append(resolution)
        output.append(
            match.group("prefix")
            + resolution.rewritten
            + match.group("suffix")
            + ending
        )
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
        for match in INCLUDE_ASSET.finditer(text):
            reference = match.group("path")
            source_asset = (
                (absolute(source).parent / reference)
                .resolve()
                .relative_to(REPO_ROOT)
            )
            expected_destination = asset_destinations.get(source_asset)
            if expected_destination is None:
                raise PromotionError(
                    f"unpromoted replay asset from {source}: {reference}"
                )
            promoted_source = DEST_ROOT / source_to_destination[source]
            actual_destination = (
                (absolute(promoted_source).parent / reference)
                .resolve()
                .relative_to(REPO_ROOT)
            )
            if actual_destination != expected_destination:
                raise PromotionError(
                    f"replay asset layout drift from {source}: "
                    f"expected {expected_destination}, found {actual_destination}"
                )
            referenced.add(source_asset)
    unreferenced = set(asset_destinations) - referenced
    if unreferenced:
        first = sorted(unreferenced)[0]
        raise PromotionError(f"unreferenced replay asset: {first}")


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
        first_destination = sorted(collisions)[0]
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
    changed = 0
    unchanged = 0
    for path, data in sorted(outputs.items()):
        full_path = absolute(path)
        if full_path.is_file() and full_path.read_bytes() == data:
            unchanged += 1
            continue
        full_path.parent.mkdir(parents=True, exist_ok=True)
        full_path.write_bytes(data)
        changed += 1
    for source, destination, digest, size in assets:
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
    if manifest_full_path.is_file() and manifest_full_path.read_bytes() == manifest_bytes:
        unchanged += 1
    else:
        manifest_full_path.parent.mkdir(parents=True, exist_ok=True)
        manifest_full_path.write_bytes(manifest_bytes)
        changed += 1
    print(f"promotion write: changed={changed} unchanged={unchanged}")


def check_outputs(
    outputs: dict[Path, bytes],
    assets: list[tuple[Path, Path, str, int]],
    manifest_bytes: bytes,
) -> None:
    expected = dict(outputs)
    expected[MANIFEST_PATH] = manifest_bytes
    failures: list[str] = []
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
    print(f"promotion check: ok files={len(expected) + len(assets)}")


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


def check_installed_promotion() -> dict[str, object]:
    """Verify the checked-in promotion without consulting its scratch provenance."""
    manifest_full_path = absolute(MANIFEST_PATH)
    if not manifest_full_path.is_file():
        raise PromotionError(f"missing promotion manifest: {MANIFEST_PATH}")
    try:
        manifest = json.loads(manifest_full_path.read_text(encoding="utf-8"))
    except json.JSONDecodeError as exc:
        raise PromotionError(f"invalid promotion manifest JSON: {exc}") from exc
    if not isinstance(manifest, dict):
        raise PromotionError("promotion manifest root must be an object")
    if manifest.get("schema") != "card-eleven-unique-four-source-promotion-v2":
        raise PromotionError("unsupported promotion manifest schema")
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

    lean_records: dict[Path, tuple[str, str, int]] = {}
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
        if type(import_count) is not int or import_count < 0:
            raise PromotionError(f"{label}.import_count must be a nonnegative integer")
        if destination in lean_records:
            raise PromotionError(f"duplicate promoted destination: {destination}")
        if module in module_to_destination:
            raise PromotionError(f"duplicate promoted module: {module}")
        lean_records[destination] = (digest, module, import_count)
        module_to_destination[module] = destination

    asset_records: dict[Path, tuple[str, int]] = {}
    for index, raw_record in enumerate(raw_asset_records):
        label = f"replay_asset_promotion.files[{index}]"
        if not isinstance(raw_record, dict):
            raise PromotionError(f"{label} must be an object")
        destination = manifest_destination(
            raw_record.get("destination"), f"{label}.destination"
        )
        digest = manifest_sha256(raw_record.get("sha256"), f"{label}.sha256")
        byte_count = raw_record.get("byte_count")
        if type(byte_count) is not int or byte_count < 0:
            raise PromotionError(f"{label}.byte_count must be a nonnegative integer")
        if destination in lean_records or destination in asset_records:
            raise PromotionError(f"duplicate promoted destination: {destination}")
        asset_records[destination] = (digest, byte_count)

    expected_paths = set(lean_records) | set(asset_records) | {MANIFEST_PATH}
    destination_root = absolute(DEST_ROOT)
    actual_paths = {
        path.relative_to(REPO_ROOT)
        for path in destination_root.rglob("*")
        if path.is_file() or path.is_symlink()
    }
    missing_paths = sorted(expected_paths - actual_paths)
    extra_paths = sorted(actual_paths - expected_paths)
    failures = [f"missing {path_text(path)}" for path in missing_paths]
    failures.extend(f"unexpected {path_text(path)}" for path in extra_paths)

    referenced_assets: set[Path] = set()
    actual_import_count = 0
    for destination, (digest, _module, expected_import_count) in lean_records.items():
        full_path = absolute(destination)
        if full_path.is_symlink():
            failures.append(f"symlink not allowed {path_text(destination)}")
            continue
        if not full_path.is_file():
            continue
        data = full_path.read_bytes()
        if sha256_bytes(data) != digest:
            failures.append(f"digest mismatch {path_text(destination)}")
            continue
        text = data.decode("utf-8")
        imports = [
            match.group("module")
            for line in text.splitlines()
            if (match := IMPORT_LINE.fullmatch(line)) is not None
        ]
        actual_import_count += len(imports)
        if len(imports) != expected_import_count:
            failures.append(f"import-count mismatch {path_text(destination)}")
        for imported_module in imports:
            if (
                imported_module.startswith(f"{MODULE_PREFIX}.")
                and imported_module not in module_to_destination
            ):
                failures.append(
                    f"unresolved promoted import {imported_module} "
                    f"in {path_text(destination)}"
                )
        for match in INCLUDE_ASSET.finditer(text):
            included = (full_path.parent / match.group("path")).resolve()
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

    for destination, (digest, expected_size) in asset_records.items():
        full_path = absolute(destination)
        if full_path.is_symlink():
            failures.append(f"symlink not allowed {path_text(destination)}")
        elif not full_path.is_file():
            continue
        elif full_path.stat().st_size != expected_size:
            failures.append(f"size mismatch {path_text(destination)}")
        elif sha256_file(full_path) != digest:
            failures.append(f"digest mismatch {path_text(destination)}")
    for destination in sorted(set(asset_records) - referenced_assets):
        failures.append(f"unreferenced promoted asset {path_text(destination)}")

    recorded_asset_bytes = raw_asset_section.get("byte_count")
    actual_asset_bytes = sum(size for _digest, size in asset_records.values())
    if recorded_asset_bytes != actual_asset_bytes:
        failures.append("replay asset byte-count summary mismatch")

    if failures:
        print("promotion check failed:", file=sys.stderr)
        for failure in failures[:20]:
            print(f"  {failure}", file=sys.stderr)
        if len(failures) > 20:
            print(f"  ... and {len(failures) - 20} more", file=sys.stderr)
        raise SystemExit(1)

    resolution_counts = manifest.get("import_resolution_counts")
    external_counts = manifest.get("preexisting_external_imports")
    destination_split = manifest.get("destination_split")
    if not isinstance(resolution_counts, dict):
        raise PromotionError("manifest import_resolution_counts must be an object")
    if not isinstance(external_counts, dict):
        raise PromotionError("manifest preexisting_external_imports must be an object")
    if not isinstance(destination_split, dict):
        raise PromotionError("manifest destination_split must be an object")
    summary = {
        "promoted": len(lean_records),
        "split": destination_split,
        "imports": actual_import_count,
        "internal_rewrites": sum(
            count
            for kind, count in resolution_counts.items()
            if isinstance(kind, str)
            and kind.endswith("-internal")
            and type(count) is int
        ),
        "preexisting_external": sum(
            count for count in external_counts.values() if type(count) is int
        ),
        "assets": len(asset_records),
        "asset_bytes": actual_asset_bytes,
    }
    print(f"promotion check: ok files={len(expected_paths)}")
    return summary


def main() -> None:
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
    args = parser.parse_args()
    if args.check:
        try:
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
    print(
        "promotion graph: "
        f"promoted={summary['promoted']} "
        f"split={summary['split']} "
        f"imports={summary['imports']} "
        f"internal_rewrites={summary['internal_rewrites']} "
        f"assets={summary['assets']} "
        f"asset_bytes={summary['asset_bytes']} "
        f"preexisting_external={summary['preexisting_external']}"
    )


if __name__ == "__main__":
    main()
