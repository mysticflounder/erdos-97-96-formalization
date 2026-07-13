"""Read-only structural audit for the historical card-12 ``654_all`` bank.

The historical certificate directory is multi-gigabyte.  This module does not
parse or re-verify those Nullstellensatz identities.  It validates the small
bank index against the permanent profile/candidate surface, recomputes every
profile-automorphism orbit and role-blind shape label, and inventories the
referenced certificate payload without promoting file existence to proof.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter
from collections.abc import Collection, Mapping
from functools import cache
from itertools import permutations, product
from pathlib import Path
from typing import Any

from .candidate_surface import CapHeadModel, build_model, candidate_classes


AUDIT_SCHEMA = "p97_ahead_historical_654_all_structural_audit.v1"
AUDIT_SCOPE = (
    "Structural replay of the historical finite bank index only; certificate "
    "files are inventoried but their polynomial identities are not rechecked"
)


class HistoricalBankError(ValueError):
    """Raised when the historical bank fails permanent structural replay."""


@cache
def profile_automorphisms(model: CapHeadModel) -> tuple[tuple[int, ...], ...]:
    """Enumerate cap-interior permutations fixing U, V, W and cap labels."""

    result: list[tuple[int, ...]] = []
    permutation_blocks = [tuple(permutations(block)) for block in model.interiors]
    for images in product(*permutation_blocks):
        mapping = list(range(model.cardinality))
        for source_block, image_block in zip(model.interiors, images):
            for source, image in zip(source_block, image_block):
                mapping[source] = image
        result.append(tuple(mapping))
    return tuple(result)


def normalize_pattern(
    model: CapHeadModel, pattern: Mapping[Any, Collection[Any]]
) -> dict[int, frozenset[int]]:
    """Normalize and validate one apex-to-required-members pattern."""

    normalized: dict[int, frozenset[int]] = {}
    for raw_center, raw_members in pattern.items():
        try:
            center = int(raw_center)
            members = frozenset(int(member) for member in raw_members)
        except (TypeError, ValueError) as exc:
            raise HistoricalBankError("pattern contains a noninteger label") from exc
        if not 0 <= center < model.cardinality:
            raise HistoricalBankError("pattern center is outside the model")
        if len(members) < 2 or center in members:
            raise HistoricalBankError("pattern mask is too small or contains its center")
        if any(not 0 <= member < model.cardinality for member in members):
            raise HistoricalBankError("pattern member is outside the model")
        if center in normalized:
            raise HistoricalBankError("pattern repeats a center")
        normalized[center] = members
    if not normalized:
        raise HistoricalBankError("pattern must be nonempty")
    return normalized


def pattern_key(
    pattern: Mapping[int, Collection[int]],
) -> tuple[tuple[int, tuple[int, ...]], ...]:
    return tuple(
        sorted((center, tuple(sorted(members))) for center, members in pattern.items())
    )


def image_pattern(
    pattern: Mapping[int, Collection[int]], mapping: tuple[int, ...]
) -> dict[int, frozenset[int]]:
    return {
        mapping[center]: frozenset(mapping[member] for member in members)
        for center, members in pattern.items()
    }


def pattern_orbit(
    model: CapHeadModel, pattern: Mapping[int, Collection[int]]
) -> tuple[dict[int, frozenset[int]], ...]:
    """Return the deduplicated profile-automorphism orbit in stable order."""

    normalized = normalize_pattern(model, pattern)
    images: dict[tuple[tuple[int, tuple[int, ...]], ...], dict[int, frozenset[int]]] = {}
    for mapping in profile_automorphisms(model):
        image = image_pattern(normalized, mapping)
        images[pattern_key(image)] = image
    return tuple(images[key] for key in sorted(images))


def canonical_pattern_key(
    model: CapHeadModel, pattern: Mapping[int, Collection[int]]
) -> tuple[tuple[int, tuple[int, ...]], ...]:
    return min(pattern_key(image) for image in pattern_orbit(model, pattern))


def pattern_points(pattern: Mapping[int, Collection[int]]) -> tuple[int, ...]:
    points: set[int] = set()
    for center, members in pattern.items():
        points.add(center)
        points.update(members)
    return tuple(sorted(points))


def window_shape_canon(
    pattern: Mapping[int, Collection[int]],
) -> tuple[tuple[int, tuple[int, ...]], ...]:
    """Canonicalize the apex/member hypergraph under all point relabelings."""

    points = pattern_points(pattern)
    index = {point: position for position, point in enumerate(points)}
    structure = [
        (index[center], tuple(sorted(index[member] for member in members)))
        for center, members in pattern.items()
    ]
    signatures = {position: [0, 0, 0] for position in range(len(points))}
    for apex, members in structure:
        signatures[apex][0] = 1
        signatures[apex][1] = len(members)
        for member in members:
            signatures[member][2] += 1
    classes: dict[tuple[int, int, int], list[int]] = {}
    for position in range(len(points)):
        classes.setdefault(tuple(signatures[position]), []).append(position)
    groups = list(classes.values())
    targets: dict[tuple[int, int, int], list[int]] = {}
    offset = 0
    for signature, members in sorted(classes.items()):
        targets[signature] = list(range(offset, offset + len(members)))
        offset += len(members)

    best: tuple[tuple[int, tuple[int, ...]], ...] | None = None

    def generate(group_index: int, partial: list[tuple[int, int]]) -> None:
        nonlocal best
        if group_index == len(groups):
            mapping = [0] * len(points)
            for source, target in partial:
                mapping[source] = target
            key = tuple(
                sorted(
                    (
                        mapping[apex],
                        tuple(sorted(mapping[member] for member in members)),
                    )
                    for apex, members in structure
                )
            )
            if best is None or key < best:
                best = key
            return
        group = groups[group_index]
        signature = tuple(signatures[group[0]])
        for target_permutation in permutations(targets[signature]):
            generate(
                group_index + 1,
                partial + list(zip(group, target_permutation)),
            )

    generate(0, [])
    if best is None:
        raise AssertionError("nonempty pattern produced no shape canonicalization")
    return best


def _safe_child(root: Path, relative: str) -> Path:
    candidate = Path(relative)
    if candidate.is_absolute():
        raise HistoricalBankError("certificate path must be relative")
    resolved_root = root.resolve()
    resolved = (resolved_root / candidate).resolve()
    try:
        resolved.relative_to(resolved_root)
    except ValueError as exc:
        raise HistoricalBankError("certificate path escapes the historical root") from exc
    return resolved


def _candidate_compatible(
    candidate_rows: Mapping[int, tuple[frozenset[int], ...]],
    pattern: Mapping[int, Collection[int]],
) -> bool:
    return all(
        any(frozenset(required) <= candidate for candidate in candidate_rows[center])
        for center, required in pattern.items()
    )


def audit_historical_654_all(root: Path) -> dict[str, Any]:
    """Audit the historical index without loading the 8+ GiB certificate JSON."""

    resolved_root = root.resolve()
    bank_path = resolved_root / "bank12_654_all.jsonl"
    if not bank_path.is_file():
        raise HistoricalBankError("historical 654_all bank is missing")
    records = [
        json.loads(line)
        for line in bank_path.read_text(encoding="utf-8").splitlines()
        if line.strip()
    ]
    model = build_model(12, (6, 5, 4))
    candidate_rows = {
        center: tuple(frozenset(row) for row in candidate_classes(model, center))
        for center in range(model.cardinality)
    }
    canonical_keys: set[tuple[tuple[int, tuple[int, ...]], ...]] = set()
    referenced_certificates: set[Path] = set()
    stored_shapes: set[str] = set()
    kill_counts: Counter[str] = Counter()
    orbit_counts: Counter[int] = Counter()
    point_counts: Counter[int] = Counter()
    total_orbit_instances = 0

    for index, record in enumerate(records):
        pid = f"pat_{index:05d}"
        if record.get("pid") != pid:
            raise HistoricalBankError(f"bank PID sequence breaks at {pid}")
        pattern = normalize_pattern(model, record.get("pattern", {}))
        points = set(pattern_points(pattern))
        stored_point_count = record.get("k")
        if stored_point_count is None:
            if len(points) != model.cardinality:
                raise HistoricalBankError(f"{pid}: null k is not a full-cube row")
        elif stored_point_count != len(points):
            raise HistoricalBankError(f"{pid}: stored point count is stale")
        orbit = pattern_orbit(model, pattern)
        if record.get("n_orbit") != len(orbit):
            raise HistoricalBankError(f"{pid}: stored orbit size is stale")
        canonical = min(pattern_key(image) for image in orbit)
        if canonical in canonical_keys:
            raise HistoricalBankError(f"{pid}: duplicate profile-automorphism orbit")
        canonical_keys.add(canonical)
        if not all(_candidate_compatible(candidate_rows, image) for image in orbit):
            raise HistoricalBankError(f"{pid}: orbit is not candidate-compatible")

        shape = json.dumps(window_shape_canon(pattern), separators=(",", ":"))
        if record.get("shape") != shape:
            raise HistoricalBankError(f"{pid}: role-blind shape label is stale")
        stored_shapes.add(shape)

        kill = record.get("kill")
        if kill == "base" or kill == "multi_pair":
            pass
        elif isinstance(kill, str) and kill.startswith("pair:"):
            try:
                first, second = (int(value) for value in kill[5:].split("-"))
            except (TypeError, ValueError) as exc:
                raise HistoricalBankError(f"{pid}: malformed pair kill") from exc
            if first not in points or second not in points or (first, second) == (0, 1):
                raise HistoricalBankError(f"{pid}: pair kill is outside its pattern")
        else:
            raise HistoricalBankError(f"{pid}: unknown kill label")

        certificate = _safe_child(resolved_root, record.get("cert", ""))
        if certificate.name != f"{pid}.json" or not certificate.is_file():
            raise HistoricalBankError(f"{pid}: referenced certificate is missing")
        if certificate.stat().st_size <= 0:
            raise HistoricalBankError(f"{pid}: referenced certificate is empty")
        referenced_certificates.add(certificate)
        kill_counts[kill] += 1
        orbit_counts[len(orbit)] += 1
        point_counts[len(points)] += 1
        total_orbit_instances += len(orbit)

    on_disk = set((resolved_root / "certs12_654_all").glob("pat_*.json"))
    if on_disk != referenced_certificates:
        raise HistoricalBankError("certificate directory differs from the bank index")
    certificate_bytes = sum(path.stat().st_size for path in referenced_certificates)
    return {
        "schema": AUDIT_SCHEMA,
        "status": "PASS_STRUCTURAL_ONLY",
        "profile": [6, 5, 4],
        "historical_cut_label": "all",
        "current_proof_tier": "PROVEN_POST_SUB2",
        "bank_sha256": hashlib.sha256(bank_path.read_bytes()).hexdigest(),
        "bank_records": len(records),
        "profile_orbit_instances": total_orbit_instances,
        "distinct_window_shapes": len(stored_shapes),
        "kill_counts": dict(sorted(kill_counts.items())),
        "orbit_size_counts": {
            str(size): count for size, count in sorted(orbit_counts.items())
        },
        "pattern_point_counts": {
            str(size): count for size, count in sorted(point_counts.items())
        },
        "certificate_files_present": len(referenced_certificates),
        "certificate_payload_bytes": certificate_bytes,
        "candidate_compatible_every_orbit": True,
        "canonical_orbits_unique": True,
        "shape_labels_recomputed": True,
        "certificate_identity_replay": {
            "status": "NOT_RUN",
            "reason": (
                "the historical certificate payload is multi-gigabyte; file "
                "existence and index fidelity are not polynomial-identity proof"
            ),
        },
        "scope": AUDIT_SCOPE,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("root", type=Path)
    args = parser.parse_args()
    try:
        result = audit_historical_654_all(args.root)
    except (HistoricalBankError, OSError, json.JSONDecodeError) as exc:
        parser.error(str(exc))
    print(json.dumps(result, sort_keys=True, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
