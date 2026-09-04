"""Replay a bounded search for the reported strict-Kalmanson catalog digest.

This is a serializer-custody audit, not a hash preimage search.  It enumerates
two fixed, documented families of natural encodings of the independently
generated local-collapse catalog.  A negative result says only that the target
is absent from these families.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections.abc import Callable, Iterable, Sequence
from pathlib import Path
from typing import Any, Final

from generate_strict_kalmanson_local_collapse_bank import (
    LocalCollapsePattern,
    complete_local_collapse_catalog,
    serialize_catalog,
)

TARGET_CATALOG_SHA256: Final = (
    "dbbae6a503866379882765aab8bfacb9c8ec9c179a21d4a637ecac5b239daf37"
)
SCAN_SCHEMA: Final = "p97-strict-kalmanson-catalog-identity-scan/v1"

JsonValue = Any
PatternOrder = Callable[
    [Sequence[LocalCollapsePattern]], list[LocalCollapsePattern]
]
PatternForm = Callable[[LocalCollapsePattern], JsonValue]


def _atoms(pattern: LocalCollapsePattern) -> tuple[tuple[int, int], ...]:
    return pattern.atoms


def _rows(pattern: LocalCollapsePattern) -> tuple[tuple[int, ...], ...]:
    return tuple(
        tuple(member for center, member in pattern.atoms if center == row)
        for row in range(pattern.support_size)
    )


def _row_label_masks(pattern: LocalCollapsePattern) -> tuple[int, ...]:
    return tuple(sum(1 << member for member in row) for row in _rows(pattern))


def _row_compact_masks(pattern: LocalCollapsePattern) -> tuple[int, ...]:
    result: list[int] = []
    for center, row in enumerate(_rows(pattern)):
        labels = [
            member
            for member in range(pattern.support_size)
            if member != center
        ]
        result.append(sum(1 << labels.index(member) for member in row))
    return tuple(result)


def _global_square_mask(pattern: LocalCollapsePattern) -> int:
    return sum(
        1 << (center * pattern.support_size + member)
        for center, member in pattern.atoms
    )


def _directed_mask(pattern: LocalCollapsePattern) -> int:
    atoms = tuple(
        (center, member)
        for center in range(pattern.support_size)
        for member in range(pattern.support_size)
        if center != member
    )
    selected = set(pattern.atoms)
    return sum(1 << index for index, atom in enumerate(atoms) if atom in selected)


def _collapsed(
    pattern: LocalCollapsePattern, kind_mode: str = "source"
) -> tuple[tuple[tuple[int, int, int, int], str | int], ...]:
    def kind(source: str) -> str | int:
        if kind_mode == "source":
            return source
        if kind_mode == "K":
            return "K1" if source == "ab_cd" else "K2"
        if kind_mode == "numeric":
            return 1 if source == "ab_cd" else 2
        raise ValueError(f"unknown comparison-kind mode: {kind_mode}")

    return tuple(
        (comparison.quadruple, kind(comparison.kind))
        for comparison in pattern.collapsed
    )


def _basic_forms() -> dict[str, PatternForm]:
    return {
        "atoms": _atoms,
        "support_atoms": lambda p: (p.support_size, _atoms(p)),
        "support_width_atoms": lambda p: (
            p.support_size,
            p.width,
            _atoms(p),
        ),
        "support_size_atoms_dict": lambda p: {
            "support_size": p.support_size,
            "atoms": _atoms(p),
        },
        "role_count_atoms_dict": lambda p: {
            "role_count": p.support_size,
            "atoms": _atoms(p),
        },
        "n_atoms_dict": lambda p: {"n": p.support_size, "atoms": _atoms(p)},
        "support_core_dict": lambda p: {
            "support": p.support_size,
            "core": _atoms(p),
        },
        "support_width_atoms_dict": lambda p: {
            "support_size": p.support_size,
            "width": p.width,
            "atoms": _atoms(p),
        },
        "support_atoms_collapsed_dict": lambda p: {
            "support_size": p.support_size,
            "atoms": _atoms(p),
            "collapsed": tuple(
                {
                    "kind": comparison.kind,
                    "quadruple": comparison.quadruple,
                }
                for comparison in p.collapsed
            ),
        },
        "support_rows": lambda p: (p.support_size, _rows(p)),
        "support_rows_dict": lambda p: {
            "support_size": p.support_size,
            "rows": _rows(p),
        },
    }


def _mask_forms() -> dict[str, PatternForm]:
    return {
        "rows": _rows,
        "row_label_masks": _row_label_masks,
        "row_compact_masks": _row_compact_masks,
        "global_square_mask": _global_square_mask,
        "directed_mask": _directed_mask,
        "atoms_tuple": _atoms,
        "support_rows": lambda p: (p.support_size, _rows(p)),
        "support_row_label_masks": lambda p: (
            p.support_size,
            _row_label_masks(p),
        ),
        "support_row_compact_masks": lambda p: (
            p.support_size,
            _row_compact_masks(p),
        ),
        "support_global_square_mask": lambda p: (
            p.support_size,
            _global_square_mask(p),
        ),
        "support_directed_mask": lambda p: (
            p.support_size,
            _directed_mask(p),
        ),
        "support_atoms": lambda p: (p.support_size, _atoms(p)),
        "support_width_rows": lambda p: (
            p.support_size,
            p.width,
            _rows(p),
        ),
        "support_width_masks": lambda p: (
            p.support_size,
            p.width,
            _row_label_masks(p),
        ),
        "support_atoms_collapsed": lambda p: (
            p.support_size,
            _atoms(p),
            _collapsed(p),
        ),
        "support_atoms_k_collapsed": lambda p: (
            p.support_size,
            _atoms(p),
            _collapsed(p, "K"),
        ),
        "support_atoms_numeric_collapsed": lambda p: (
            p.support_size,
            _atoms(p),
            _collapsed(p, "numeric"),
        ),
    }


def _basic_orders() -> dict[str, PatternOrder]:
    return {
        "native": lambda patterns: list(patterns),
        "support_width_atoms": lambda patterns: sorted(
            patterns, key=lambda p: (p.support_size, p.width, p.atoms)
        ),
        "width_support_atoms": lambda patterns: sorted(
            patterns, key=lambda p: (p.width, p.support_size, p.atoms)
        ),
        "atoms": lambda patterns: sorted(patterns, key=lambda p: p.atoms),
    }


def _mask_orders() -> dict[str, PatternOrder]:
    return {
        **_basic_orders(),
        "support_rows": lambda patterns: sorted(
            patterns, key=lambda p: (p.support_size, _rows(p))
        ),
        "support_label_masks": lambda patterns: sorted(
            patterns, key=lambda p: (p.support_size, _row_label_masks(p))
        ),
        "support_compact_masks": lambda patterns: sorted(
            patterns, key=lambda p: (p.support_size, _row_compact_masks(p))
        ),
        "support_global_mask": lambda patterns: sorted(
            patterns, key=lambda p: (p.support_size, _global_square_mask(p))
        ),
    }


class _Accumulator:
    def __init__(self, target: str) -> None:
        self.target = target
        self.attempts = 0
        self.payload_digests: set[str] = set()
        self.matches: list[str] = []

    def add(self, description: str, payload: bytes) -> None:
        self.attempts += 1
        digest = hashlib.sha256(payload).hexdigest()
        self.payload_digests.add(digest)
        if digest == self.target:
            self.matches.append(description)


def _json_bytes(value: JsonValue, *, sort_keys: bool, compact: bool) -> bytes:
    separators = (",", ":") if compact else None
    return json.dumps(
        value,
        sort_keys=sort_keys,
        separators=separators,
        ensure_ascii=True,
    ).encode("ascii")


def _scan_basic(
    patterns: Sequence[LocalCollapsePattern], accumulator: _Accumulator
) -> int:
    started = accumulator.attempts
    outer_forms: dict[str, Callable[[list[JsonValue]], JsonValue]] = {
        "bare": lambda records: records,
        "catalog": lambda records: {"catalog": records},
        "records": lambda records: {"records": records},
        "patterns": lambda records: {"patterns": records},
        "catalog_count": lambda records: {
            "catalog": records,
            "count": len(records),
        },
        "records_count": lambda records: {
            "records": records,
            "record_count": len(records),
        },
        "patterns_count": lambda records: {
            "patterns": records,
            "pattern_count": len(records),
        },
    }
    serializers: dict[str, Callable[[JsonValue], bytes]] = {
        "json_compact_sorted": lambda value: _json_bytes(
            value, sort_keys=True, compact=True
        ),
        "json_compact": lambda value: _json_bytes(
            value, sort_keys=False, compact=True
        ),
        "json_default_sorted": lambda value: _json_bytes(
            value, sort_keys=True, compact=False
        ),
        "json_default": lambda value: _json_bytes(
            value, sort_keys=False, compact=False
        ),
        "repr": lambda value: repr(value).encode("ascii"),
    }
    for order_name, order in _basic_orders().items():
        ordered = order(patterns)
        for form_name, form in _basic_forms().items():
            records = [form(pattern) for pattern in ordered]
            for outer_name, outer in outer_forms.items():
                value = outer(records)
                for serializer_name, serializer in serializers.items():
                    base = serializer(value)
                    for suffix_name, suffix in (("none", b""), ("lf", b"\n")):
                        accumulator.add(
                            f"basic/{order_name}/{form_name}/{outer_name}/"
                            f"{serializer_name}/{suffix_name}",
                            base + suffix,
                        )
            for compact in (True, False):
                lines = b"".join(
                    _json_bytes(record, sort_keys=True, compact=compact) + b"\n"
                    for record in records
                )
                for header_name, header in (
                    ("none", b""),
                    ("count", f"{len(records)}\n".encode("ascii")),
                ):
                    accumulator.add(
                        f"basic/{order_name}/{form_name}/jsonl/"
                        f"compact={compact}/{header_name}",
                        header + lines,
                    )
    return accumulator.attempts - started


def _scan_masks(
    patterns: Sequence[LocalCollapsePattern], accumulator: _Accumulator
) -> int:
    started = accumulator.attempts
    outer_names = (
        "bare",
        "catalog",
        "records",
        "patterns",
        "cores",
        "minimal_collapses",
    )
    for order_name, order in _mask_orders().items():
        ordered = order(patterns)
        for form_name, form in _mask_forms().items():
            records = [form(pattern) for pattern in ordered]
            for outer_name in outer_names:
                value: JsonValue = (
                    records if outer_name == "bare" else {outer_name: records}
                )
                for sort_keys in (False, True):
                    for compact in (False, True):
                        base = _json_bytes(
                            value, sort_keys=sort_keys, compact=compact
                        )
                        for suffix_name, suffix in (
                            ("none", b""),
                            ("lf", b"\n"),
                        ):
                            accumulator.add(
                                f"masks/{order_name}/{form_name}/{outer_name}/"
                                f"sort={sort_keys}/compact={compact}/{suffix_name}",
                                base + suffix,
                            )
                repr_values = (
                    value,
                    tuple(records) if outer_name == "bare" else value,
                )
                for index, repr_value in enumerate(repr_values):
                    accumulator.add(
                        f"masks/{order_name}/{form_name}/{outer_name}/repr/{index}",
                        repr(repr_value).encode("ascii"),
                    )
            for compact in (False, True):
                lines = b"".join(
                    _json_bytes(record, sort_keys=True, compact=compact) + b"\n"
                    for record in records
                )
                for header_name, header in (
                    ("none", b""),
                    ("count", f"{len(records)}\n".encode("ascii")),
                ):
                    accumulator.add(
                        f"masks/{order_name}/{form_name}/jsonl/"
                        f"compact={compact}/{header_name}",
                        header + lines,
                    )
    return accumulator.attempts - started


def _report_self_hash(report: dict[str, JsonValue]) -> str:
    unsigned = {key: value for key, value in report.items() if key != "report_sha256"}
    payload = _json_bytes(unsigned, sort_keys=True, compact=True) + b"\n"
    return hashlib.sha256(payload).hexdigest()


def scan_catalog_identity(
    patterns: Iterable[LocalCollapsePattern],
    *,
    target_sha256: str = TARGET_CATALOG_SHA256,
) -> dict[str, JsonValue]:
    """Run the fixed bounded serializer families and return a signed report."""

    inventory = tuple(sorted(patterns))
    accumulator = _Accumulator(target_sha256)
    family_attempt_counts = {
        "basic": _scan_basic(inventory, accumulator),
        "row_mask": _scan_masks(inventory, accumulator),
    }
    report: dict[str, JsonValue] = {
        "schema": SCAN_SCHEMA,
        "target_sha256": target_sha256,
        "catalog_pattern_count": len(inventory),
        "catalog_diagnostic_sha256": hashlib.sha256(
            serialize_catalog(inventory)
        ).hexdigest(),
        "family_attempt_counts": family_attempt_counts,
        "attempt_count": accumulator.attempts,
        "unique_payload_digest_count": len(accumulator.payload_digests),
        "match_count": len(accumulator.matches),
        "matches": accumulator.matches,
        "claim_scope": (
            "bounded deterministic serializer-family search; a zero match count "
            "does not exclude an undisclosed external schema"
        ),
    }
    report["report_sha256"] = _report_self_hash(report)
    return report


def canonical_report_bytes(report: dict[str, JsonValue]) -> bytes:
    """Serialize and verify one scan report as compact sorted-key JSON plus LF."""

    expected = report.get("report_sha256")
    if expected != _report_self_hash(report):
        raise ValueError("scan report self-hash mismatch")
    return _json_bytes(report, sort_keys=True, compact=True) + b"\n"


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    report = scan_catalog_identity(complete_local_collapse_catalog())
    payload = canonical_report_bytes(report)
    if args.output is not None:
        with args.output.open("xb") as stream:
            written = stream.write(payload)
        if written != len(payload):
            raise OSError(f"short write: wrote {written} of {len(payload)} bytes")
    print(payload.decode("ascii"), end="")


if __name__ == "__main__":
    main()
