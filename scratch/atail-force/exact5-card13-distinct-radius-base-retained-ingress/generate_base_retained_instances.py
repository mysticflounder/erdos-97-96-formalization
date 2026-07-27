#!/usr/bin/env python3
"""Generate source-faithful manifest-selected base/retained adapters.

The generator rebuilds each orientation independently and fails closed on the
pinned complete-cover manifest, source stream, selected indices, expression
shape, and supported theorem schema.  The initial generated family covers the
fixed-pair/at-most-two-centers assertions; additional schemas are added here as
their generic semantic theorem is kernel checked.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import re
import sys
from typing import Any

import z3


HERE = Path(__file__).resolve().parent
AUDIT_DIR = HERE.parent / "exact5-card13-distinct-radius-source-ingress-audit"
sys.path.insert(0, str(AUDIT_DIR))

from distinct_source_terms import (  # noqa: E402
    EXPECTED_ASSERTIONS,
    ORBIT_SPECS,
    build_source_assertions,
    resolve_orbit,
)


EXPECTED_MANIFEST_SOURCE_HASH = {
    "direct": "cf71dc4d0cf46e050fbbce43dce4a02c583989d5a4cf7533442e6c26afa8aec3",
    "mirror": "12c1f105e80a0094169b518b25e636ddbb263f657bb890929ed454ab28d38389",
}


# The source formulas in these two late chunks elaborate pathologically as one
# 64-theorem module (more than ten minutes and roughly 5.3 GiB in Lean 4.27).
# Keep the stable chunk wrapper names used by downstream imports, but emit the
# actual theorem declarations in bounded eight-theorem leaf modules.
SPLIT_CHUNKS = {
    "direct": {136},
    "mirror": {145},
}
SPLIT_CHUNK_SIZE = 8
SINGLETON_PARTS = {
    ("direct", 136): {7},
    ("mirror", 145): {6},
}


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write_text_if_changed(path: Path, contents: str) -> None:
    """Preserve source-current adjacent oleans when regeneration is identical."""
    if path.exists() and path.read_text(encoding="utf-8") == contents:
        return
    path.write_text(contents, encoding="utf-8")


def sexpr_sha256(expression: z3.ExprRef) -> str:
    return hashlib.sha256(expression.sexpr().encode("utf-8")).hexdigest()


def source_stream_sha256(assertions: list[z3.BoolRef]) -> str:
    digest = hashlib.sha256()
    for expression in assertions:
        data = expression.sexpr().encode("utf-8")
        digest.update(len(data).to_bytes(8, "big"))
        digest.update(data)
    return digest.hexdigest()


def manifest_orbit_packet(payload: dict[str, Any], source_orbit: str) -> dict[str, Any]:
    packet = payload.get("orbit")
    if isinstance(packet, dict) and packet.get("orbit") == source_orbit:
        return packet
    packets = payload.get("orbits")
    if isinstance(packets, list):
        matches = [item for item in packets if isinstance(item, dict)
                   and item.get("orbit") == source_orbit]
        if len(matches) == 1:
            return matches[0]
    raise ValueError("manifest has no unique packet for the requested orbit")


def load_selected_indices(
    path: Path, expected_sha256: str, orientation: str, source_orbit: str
) -> list[int]:
    actual_sha256 = sha256(path)
    if actual_sha256 != expected_sha256:
        raise AssertionError(
            f"manifest SHA-256 drift: {actual_sha256} != {expected_sha256}"
        )
    payload = json.loads(path.read_text(encoding="utf-8"))
    packet = manifest_orbit_packet(payload, source_orbit)
    if packet.get("epistemic_status") != "ALL_SOURCE_CUBES_HAVE_CHECKED_SOURCE_CORES":
        raise AssertionError("best-core manifest is not a complete checked cover")
    if packet.get("source_assertion_count") != EXPECTED_ASSERTIONS:
        raise AssertionError("best-core manifest source count drift")
    if packet.get("source_assertions_sha256") != EXPECTED_MANIFEST_SOURCE_HASH[orientation]:
        raise AssertionError("best-core manifest source fingerprint drift")
    leaves = packet.get("leaves")
    if not isinstance(leaves, list) or len(leaves) != 512:
        raise ValueError("best-core manifest must contain exactly 512 leaves")
    selected: set[int] = set()
    seen_leaves: set[int] = set()
    for leaf_packet in leaves:
        leaf = int(leaf_packet["leaf"])
        if leaf in seen_leaves:
            raise ValueError(f"duplicate source cube leaf {leaf}")
        seen_leaves.add(leaf)
        core = leaf_packet.get("best_checked_core")
        if not isinstance(core, dict):
            raise ValueError(f"leaf {leaf} has no checked core")
        indices = core.get("source_assertion_indices")
        if not isinstance(indices, list) or not indices:
            raise ValueError(f"leaf {leaf} has an empty source core")
        normalized = [int(index) for index in indices]
        if len(normalized) != len(set(normalized)):
            raise ValueError(f"leaf {leaf} repeats a source assertion")
        selected.update(normalized)
    return sorted(selected)


def atom(name: str) -> str:
    match = re.fullmatch(r"(m|g0|g1)_(\d+)_(\d+)", name)
    if match:
        family = {"m": 0, "g0": 1, "g1": 2}[match.group(1)]
        return f"rowBit (directSourceRows C) {family} {match.group(2)} {match.group(3)}"
    match = re.fullmatch(r"blocker_(\d+)", name)
    if match:
        return f"blockerAt (directSourceBlockers T) {match.group(1)}"
    match = re.fullmatch(r"shell_(\d+)", name)
    if match:
        return f"shellBit (directSourceShell T) {match.group(1)}"
    if name == "frontier_q":
        return "directSourceQ T"
    if name == "frontier_w":
        return "directSourceW T"
    match = re.fullmatch(r"b1_(\d+)", name)
    if match:
        return f"firstRowBit (directSourceFirstRow T) {match.group(1)}"
    match = re.fullmatch(r"parent_first_(\d+)", name)
    if match:
        return f"parentRowBit (directSourceParentFirst P) {match.group(1)}"
    match = re.fullmatch(r"parent_second_(\d+)", name)
    if match:
        return f"parentRowBit (directSourceParentSecond P) {match.group(1)}"
    raise ValueError(f"unsupported base/retained source atom {name!r}")


def value_width(expression: z3.ExprRef) -> int:
    if z3.is_bv(expression):
        return expression.size()
    if z3.is_int(expression):
        return 4
    raise ValueError(f"unsupported source value sort {expression.sort()}")


def emit_value(expression: z3.ExprRef, width: int | None = None) -> str:
    if z3.is_const(expression) and expression.decl().kind() == z3.Z3_OP_UNINTERPRETED:
        return atom(str(expression))
    if z3.is_int_value(expression):
        return f"{expression.as_long()}#{4 if width is None else width}"
    if z3.is_bv_value(expression):
        actual = expression.size()
        if width is not None and width != actual:
            raise ValueError("bit-vector numeral width mismatch")
        return f"{expression.as_long()}#{actual}"
    raise ValueError(f"unsupported source value {expression.sexpr()}")


def join_bool(operator: str, items: list[str], identity: str) -> str:
    if not items:
        return identity
    if len(items) == 1:
        return items[0]
    return "(" + f" {operator} ".join(items) + ")"


def emit_bool(expression: z3.BoolRef) -> str:
    if z3.is_true(expression):
        return "true"
    if z3.is_false(expression):
        return "false"
    if z3.is_const(expression) and expression.decl().kind() == z3.Z3_OP_UNINTERPRETED:
        return atom(str(expression))
    if z3.is_not(expression):
        return f"!({emit_bool(expression.arg(0))})"
    if z3.is_and(expression):
        return join_bool("&&", [emit_bool(item) for item in expression.children()], "true")
    if z3.is_or(expression):
        return join_bool("||", [emit_bool(item) for item in expression.children()], "false")
    if z3.is_implies(expression):
        return f"(!({emit_bool(expression.arg(0))}) || ({emit_bool(expression.arg(1))}))"
    if z3.is_eq(expression):
        left, right = expression.children()
        if z3.is_bool(left):
            return f"({emit_bool(left)} == {emit_bool(right)})"
        width = max(value_width(left), value_width(right))
        return f"({emit_value(left, width)} == {emit_value(right, width)})"
    if z3.is_distinct(expression):
        left, right = expression.children()
        width = max(value_width(left), value_width(right))
        return f"!({emit_value(left, width)} == {emit_value(right, width)})"
    kind = expression.decl().kind()
    if kind in {z3.Z3_OP_PB_AT_MOST, z3.Z3_OP_PB_AT_LEAST, z3.Z3_OP_PB_EQ}:
        params = expression.decl().params()
        bound = int(params[0])
        weights = ([1] * len(expression.children())
                   if kind in {z3.Z3_OP_PB_AT_MOST, z3.Z3_OP_PB_AT_LEAST}
                   else [int(weight) for weight in params[1:]])
        if weights != [1] * len(expression.children()):
            raise ValueError("only unit pseudo-Boolean weights are accepted")
        pieces = [f"(bif {emit_bool(item)} then 1#4 else 0#4)"
                  for item in expression.children()]
        total = "(" + " + ".join(pieces) + ")"
        if kind == z3.Z3_OP_PB_AT_MOST:
            return f"({total}).ule {bound}#4"
        if kind == z3.Z3_OP_PB_AT_LEAST:
            return f"({bound}#4).ule {total}"
        return f"({total} == {bound}#4)"
    raise ValueError(
        f"unsupported base/retained Boolean operation {expression.decl().name()}: "
        f"{expression.sexpr()}"
    )


def family_pair_center_parameters(expression: z3.BoolRef) -> tuple[int, int, int] | None:
    if expression.decl().kind() != z3.Z3_OP_PB_AT_MOST:
        return None
    if int(expression.decl().params()[0]) != 2:
        return None
    children = expression.children()
    if len(children) != 13:
        return None
    triples: list[tuple[str, int, int]] = []
    for center, child in enumerate(children):
        if not z3.is_and(child) or len(child.children()) != 2:
            return None
        names = [str(item) for item in child.children()]
        matches = [re.fullmatch(r"(m|g0|g1)_(\d+)_(\d+)", name) for name in names]
        if any(match is None for match in matches):
            return None
        assert matches[0] is not None and matches[1] is not None
        family0, center0, left = matches[0].groups()
        family1, center1, right = matches[1].groups()
        if family0 != family1 or int(center0) != center or int(center1) != center:
            return None
        triples.append((family0, int(left), int(right)))
    if len(set(triples)) != 1:
        return None
    family_name, left, right = triples[0]
    if left == right:
        return None
    return {"m": 0, "g0": 1, "g1": 2}[family_name], left, right


def row_atom_parameters(expression: z3.ExprRef) -> tuple[int, int, int] | None:
    match = re.fullmatch(r"(m|g0|g1)_(\d+)_(\d+)", str(expression))
    if match is None:
        return None
    family_name, center, point = match.groups()
    return {"m": 0, "g0": 1, "g1": 2}[family_name], int(center), int(point)


def parent_row_atom_parameters(expression: z3.ExprRef) -> tuple[str, int] | None:
    match = re.fullmatch(r"parent_(first|second)_(\d+)", str(expression))
    if match is None:
        return None
    return match.group(1), int(match.group(2))


def row_center_excluded_parameters(expression: z3.BoolRef) -> tuple[int, int] | None:
    if not z3.is_not(expression):
        return None
    parameters = row_atom_parameters(expression.arg(0))
    if parameters is None:
        return None
    family, center, point = parameters
    if center != point:
        return None
    return family, center


def row_card_eq_four_parameters(expression: z3.BoolRef) -> tuple[int, int] | None:
    if expression.decl().kind() != z3.Z3_OP_PB_EQ:
        return None
    params = expression.decl().params()
    if int(params[0]) != 4 or [int(weight) for weight in params[1:]] != [1] * 13:
        return None
    children = expression.children()
    if len(children) != 13:
        return None
    parsed = [row_atom_parameters(child) for child in children]
    if any(item is None for item in parsed):
        return None
    assert all(item is not None for item in parsed)
    family, center, _ = parsed[0]
    if parsed != [(family, center, point) for point in range(13)]:
        return None
    return family, center


def row_intersection_parameters(
    expression: z3.BoolRef,
) -> tuple[int, int, int, int] | None:
    if expression.decl().kind() != z3.Z3_OP_PB_AT_MOST:
        return None
    if int(expression.decl().params()[0]) != 2:
        return None
    children = expression.children()
    if len(children) != 13:
        return None
    pairs: list[tuple[tuple[int, int], tuple[int, int]]] = []
    for point, child in enumerate(children):
        if not z3.is_and(child) or len(child.children()) != 2:
            return None
        left = row_atom_parameters(child.arg(0))
        right = row_atom_parameters(child.arg(1))
        if left is None or right is None or left[2] != point or right[2] != point:
            return None
        pairs.append(((left[0], left[1]), (right[0], right[1])))
    if len(set(pairs)) != 1:
        return None
    (family1, center1), (family2, center2) = pairs[0]
    if center1 == center2:
        return None
    return family1, family2, center1, center2


def cap_cardinality_parameters(
    expression: z3.BoolRef,
) -> tuple[str, int, int, int] | None:
    if expression.decl().kind() != z3.Z3_OP_PB_AT_MOST:
        return None
    bound = int(expression.decl().params()[0])
    if bound not in {1, 2}:
        return None
    parsed = [row_atom_parameters(child) for child in expression.children()]
    if not parsed or any(item is None for item in parsed):
        return None
    assert all(item is not None for item in parsed)
    family, center, _ = parsed[0]
    points = [item[2] for item in parsed]
    if parsed != [(family, center, point) for point in points]:
        return None
    block_by_points = {
        (4, 5, 6, 7, 8): "middle",
        (0, 8, 9, 10, 11, 12): "firstWrap",
        (0, 1, 2, 3, 4): "second",
    }
    block = block_by_points.get(tuple(points))
    if block is None:
        return None
    centers_by_block_and_bound = {
        ("middle", 2): set(range(4, 9)),
        ("middle", 1): {4, 8},
        ("firstWrap", 2): {0, 8, 9, 10, 11, 12},
        ("firstWrap", 1): {0, 8},
        ("second", 2): set(range(0, 5)),
        ("second", 1): {0, 4},
    }
    if center not in centers_by_block_and_bound[(block, bound)]:
        return None
    return block, bound, family, center


def first_row_shared_pair_parameters(
    expression: z3.BoolRef, retained_prefix: str = "b1", retained_center: int = 4,
) -> tuple[int, int, int, int, tuple[int, int, int, int], int, str] | None:
    if not z3.is_not(expression):
        return None
    body = expression.arg(0)
    if not z3.is_and(body) or len(body.children()) != 4:
        return None
    first1 = re.fullmatch(rf"{re.escape(retained_prefix)}_(\d+)", str(body.arg(0)))
    first2 = re.fullmatch(rf"{re.escape(retained_prefix)}_(\d+)", str(body.arg(1)))
    row1 = row_atom_parameters(body.arg(2))
    row2 = row_atom_parameters(body.arg(3))
    if first1 is None or first2 is None or row1 is None or row2 is None:
        return None
    point1, point2 = int(first1.group(1)), int(first2.group(1))
    family, center, row_point1 = row1
    family2, center2, row_point2 = row2
    if not (
        point1 == row_point1
        and point2 == row_point2
        and family == family2
        and center == center2
        and point1 < point2
        and len({retained_center, center, point1, point2}) == 4
    ):
        return None
    pattern = "".join(
        "c" if vertex in {retained_center, center} else "p"
        for vertex in sorted((retained_center, center, point1, point2))
    )
    if pattern == "ccpp" and center < retained_center:
        vertices, branch, disjunct = (center, retained_center, point1, point2), 1, "inr"
    elif pattern == "ccpp":
        vertices, branch, disjunct = (retained_center, center, point1, point2), 1, "inl"
    elif pattern == "cppc" and center < retained_center:
        vertices, branch, disjunct = (center, point1, point2, retained_center), 2, "inl"
    elif pattern == "cppc":
        vertices, branch, disjunct = (retained_center, point1, point2, center), 2, "inr"
    elif pattern == "pccp" and center < retained_center:
        vertices, branch, disjunct = (point1, center, retained_center, point2), 2, "inl"
    elif pattern == "pccp":
        vertices, branch, disjunct = (point1, retained_center, center, point2), 2, "inr"
    elif pattern == "ppcc" and center < retained_center:
        vertices, branch, disjunct = (point1, point2, center, retained_center), 1, "inr"
    elif pattern == "ppcc":
        vertices, branch, disjunct = (point1, point2, retained_center, center), 1, "inl"
    else:
        return None
    return family, center, point1, point2, vertices, branch, disjunct


def any_pair_packed_center_parameters(
    expression: z3.BoolRef,
) -> tuple[int, int] | None:
    if expression.decl().kind() != z3.Z3_OP_PB_AT_MOST:
        return None
    if int(expression.decl().params()[0]) != 2:
        return None
    children = expression.children()
    if len(children) != 13:
        return None
    fixed_pair: tuple[int, int] | None = None
    for center, child in enumerate(children):
        if not z3.is_or(child):
            return None
        alternatives = child.children()
        if len(alternatives) != (4 if center == 4 else 3):
            return None
        for family, alternative in enumerate(alternatives[:3]):
            if not z3.is_and(alternative) or len(alternative.children()) != 2:
                return None
            left_atom = row_atom_parameters(alternative.arg(0))
            right_atom = row_atom_parameters(alternative.arg(1))
            if left_atom is None or right_atom is None:
                return None
            if left_atom[:2] != (family, center) or right_atom[:2] != (family, center):
                return None
            pair = (left_atom[2], right_atom[2])
            if fixed_pair is None:
                fixed_pair = pair
            elif pair != fixed_pair:
                return None
        if center == 4:
            first_alternative = alternatives[3]
            if not z3.is_and(first_alternative) or len(first_alternative.children()) != 2:
                return None
            first_left = re.fullmatch(r"b1_(\d+)", str(first_alternative.arg(0)))
            first_right = re.fullmatch(r"b1_(\d+)", str(first_alternative.arg(1)))
            if first_left is None or first_right is None:
                return None
            if fixed_pair != (int(first_left.group(1)), int(first_right.group(1))):
                return None
    if fixed_pair is None or fixed_pair[0] == fixed_pair[1]:
        return None
    return fixed_pair


def extended_any_pair_packed_center_parameters(
    expression: z3.BoolRef,
) -> tuple[int, int] | None:
    if expression.decl().kind() != z3.Z3_OP_PB_AT_MOST:
        return None
    if int(expression.decl().params()[0]) != 2:
        return None
    children = expression.children()
    if len(children) != 13:
        return None
    fixed_pair: tuple[int, int] | None = None
    for center, child in enumerate(children):
        if not z3.is_or(child):
            return None
        alternatives = child.children()
        expected_count = 5 if center == 4 else 4 if center == 8 else 3
        if len(alternatives) != expected_count:
            return None
        for family, alternative in enumerate(alternatives[:3]):
            if not z3.is_and(alternative) or len(alternative.children()) != 2:
                return None
            left_atom = row_atom_parameters(alternative.arg(0))
            right_atom = row_atom_parameters(alternative.arg(1))
            if left_atom is None or right_atom is None:
                return None
            if left_atom[:2] != (family, center) or right_atom[:2] != (family, center):
                return None
            pair = (left_atom[2], right_atom[2])
            if fixed_pair is None:
                fixed_pair = pair
            elif pair != fixed_pair:
                return None
        assert fixed_pair is not None
        if center == 4:
            for offset, expected_row in ((3, "b1"), (4, "parent_first")):
                alternative = alternatives[offset]
                if not z3.is_and(alternative) or len(alternative.children()) != 2:
                    return None
                names = [str(item) for item in alternative.children()]
                if names != [f"{expected_row}_{fixed_pair[0]}",
                             f"{expected_row}_{fixed_pair[1]}"]:
                    return None
        elif center == 8:
            alternative = alternatives[3]
            if not z3.is_and(alternative) or len(alternative.children()) != 2:
                return None
            names = [str(item) for item in alternative.children()]
            if names != [f"parent_second_{fixed_pair[0]}",
                         f"parent_second_{fixed_pair[1]}"]:
                return None
    if fixed_pair is None or fixed_pair[0] == fixed_pair[1]:
        return None
    return fixed_pair


def shell_basic_parameters(expression: z3.BoolRef) -> tuple[str, int | None] | None:
    if z3.is_not(expression) and str(expression.arg(0)) == "shell_8":
        return "excluded_eight", 8
    shell_match = re.fullmatch(r"shell_(\d+)", str(expression))
    if shell_match is not None:
        point = int(shell_match.group(1))
        if point in {1, 2, 3}:
            return "member", point
        return None
    if expression.decl().kind() != z3.Z3_OP_PB_EQ:
        return None
    params = expression.decl().params()
    bound = int(params[0])
    children = expression.children()
    weights = [int(weight) for weight in params[1:]]
    if weights != [1] * len(children):
        return None
    points: list[int] = []
    for child in children:
        match = re.fullmatch(r"shell_(\d+)", str(child))
        if match is None:
            return None
        points.append(int(match.group(1)))
    if bound == 5 and points == list(range(13)):
        return "card_eq_five", None
    if bound == 1 and points == [4, 5, 6, 7]:
        return "middle_four_eq_one", None
    if bound == 1 and points == [0, 9, 10, 11, 12]:
        return "first_wrap_five_eq_one", None
    return None


def second_apex_row_shell_parameters(
    expression: z3.BoolRef,
) -> tuple[int, int] | None:
    if not z3.is_implies(expression):
        return None
    row = row_atom_parameters(expression.arg(0))
    shell = re.fullmatch(r"shell_(\d+)", str(expression.arg(1)))
    if row is None or shell is None:
        return None
    family, center, point = row
    if center != 8 or point != int(shell.group(1)):
        return None
    return family, point


def blocker_image_sync_parameters(
    expression: z3.BoolRef,
) -> tuple[int, int] | None:
    if not z3.is_implies(expression):
        return None
    antecedent, conclusion = expression.children()
    if not z3.is_or(antecedent) or len(antecedent.children()) != 13:
        return None
    center: int | None = None
    for source, equality in enumerate(antecedent.children()):
        if not z3.is_eq(equality):
            return None
        left, right = equality.children()
        match = re.fullmatch(r"blocker_(\d+)", str(left))
        if match is None or int(match.group(1)) != source or not z3.is_int_value(right):
            return None
        candidate = right.as_long()
        if center is None:
            center = candidate
        elif center != candidate:
            return None
    if center != 2 or not z3.is_eq(conclusion):
        return None
    cover = row_atom_parameters(conclusion.arg(0))
    main = row_atom_parameters(conclusion.arg(1))
    if cover is None or main is None:
        return None
    family, cover_center, point = cover
    if not (
        family in {1, 2}
        and cover_center == center
        and main == (0, center, point)
    ):
        return None
    return family, point


def first_row_basic_parameters(expression: z3.BoolRef) -> str | None:
    if z3.is_not(expression) and str(expression.arg(0)) == "b1_4":
        return "four_excluded"
    if expression.decl().kind() != z3.Z3_OP_PB_EQ:
        return None
    params = expression.decl().params()
    if int(params[0]) != 4 or [int(weight) for weight in params[1:]] != [1] * 13:
        return None
    if [str(child) for child in expression.children()] != [
        f"b1_{point}" for point in range(13)
    ]:
        return None
    return "card_eq_four"


def parent_row_basic_parameters(expression: z3.BoolRef) -> tuple[str, str] | None:
    if z3.is_not(expression):
        parsed = parent_row_atom_parameters(expression.arg(0))
        if parsed is None:
            return None
        row, point = parsed
        expected_center = 4 if row == "first" else 8
        if point == expected_center:
            return row, "center_excluded"
        return None
    if expression.decl().kind() != z3.Z3_OP_PB_EQ:
        return None
    params = expression.decl().params()
    if int(params[0]) != 4 or [int(weight) for weight in params[1:]] != [1] * 13:
        return None
    parsed = [parent_row_atom_parameters(child) for child in expression.children()]
    if any(item is None for item in parsed):
        return None
    assert all(item is not None for item in parsed)
    row = parsed[0][0]
    if parsed != [(row, point) for point in range(13)]:
        return None
    return row, "card_eq_four"


def parent_first_physical_card_parameters(expression: z3.BoolRef) -> int | None:
    if expression.decl().kind() != z3.Z3_OP_PB_AT_MOST:
        return None
    bound = int(expression.decl().params()[0])
    if bound != 1:
        return None
    parsed = [parent_row_atom_parameters(child) for child in expression.children()]
    if parsed != [("first", 1), ("first", 2), ("first", 3)]:
        return None
    return bound


def parent_second_physical_card_parameters(expression: z3.BoolRef) -> int | None:
    if expression.decl().kind() != z3.Z3_OP_PB_AT_LEAST:
        return None
    bound = int(expression.decl().params()[0])
    if bound != 2:
        return None
    parsed = [parent_row_atom_parameters(child) for child in expression.children()]
    if parsed != [("second", 1), ("second", 2), ("second", 3)]:
        return None
    return bound


def parent_second_implies_shell_parameters(expression: z3.BoolRef) -> int | None:
    if not z3.is_implies(expression):
        return None
    antecedent, conclusion = expression.children()
    parent = parent_row_atom_parameters(antecedent)
    shell = re.fullmatch(r"shell_(\d+)", str(conclusion))
    if parent is None or shell is None:
        return None
    row, point = parent
    if row != "second" or int(shell.group(1)) != point:
        return None
    return point


def parent_row_adjacent_block_parameters(
    expression: z3.BoolRef,
) -> tuple[str, str] | None:
    if expression.decl().kind() != z3.Z3_OP_PB_AT_MOST:
        return None
    if int(expression.decl().params()[0]) != 1:
        return None
    parsed = [parent_row_atom_parameters(child) for child in expression.children()]
    if not parsed or any(item is None for item in parsed):
        return None
    assert all(item is not None for item in parsed)
    row = parsed[0][0]
    points = tuple(item[1] for item in parsed)
    if parsed != [(row, point) for point in points]:
        return None
    block = {
        (4, 5, 6, 7, 8): "middle",
        (0, 1, 2, 3, 4): "second",
        (0, 8, 9, 10, 11, 12): "firstWrap",
    }.get(points)
    if (row, block) not in {
        ("first", "middle"),
        ("first", "second"),
        ("second", "middle"),
        ("second", "firstWrap"),
    }:
        return None
    assert block is not None
    return row, block


def first_strict_card_ge_two_parameters(expression: z3.BoolRef) -> str | None:
    if expression.decl().kind() != z3.Z3_OP_PB_AT_LEAST:
        return None
    if int(expression.decl().params()[0]) != 2:
        return None
    names = [str(child) for child in expression.children()]
    if names == [f"m_4_{point}" for point in range(9, 13)]:
        return "main"
    if names == [f"b1_{point}" for point in range(9, 13)]:
        return "parent_first"
    return None


def frontier_strict_main_occurrence(expression: z3.BoolRef) -> bool:
    if not z3.is_or(expression) or len(expression.children()) != 8:
        return False
    expected = [(frontier, point) for frontier in ("frontier_q", "frontier_w")
                for point in range(9, 13)]
    actual: list[tuple[str, int]] = []
    for child in expression.children():
        if not z3.is_and(child) or len(child.children()) != 2:
            return False
        equality, row_expression = child.children()
        if not z3.is_eq(equality):
            return False
        frontier, value = equality.children()
        row = row_atom_parameters(row_expression)
        if not z3.is_int_value(value) or row is None or row[:2] != (0, 4):
            return False
        point = value.as_long()
        if row[2] != point:
            return False
        actual.append((str(frontier), point))
    return actual == expected


def main_four_first_row_disjoint_point(expression: z3.BoolRef) -> int | None:
    if not z3.is_not(expression):
        return None
    body = expression.arg(0)
    if not z3.is_and(body) or len(body.children()) != 2:
        return None
    row = row_atom_parameters(body.arg(0))
    first = re.fullmatch(r"b1_(\d+)", str(body.arg(1)))
    if row is None or row[:2] != (0, 4) or first is None:
        return None
    point = int(first.group(1))
    if row[2] != point:
        return None
    return point


def first_strict_card_eq_two_parameters(expression: z3.BoolRef) -> str | None:
    if expression.decl().kind() != z3.Z3_OP_PB_EQ:
        return None
    params = expression.decl().params()
    if int(params[0]) != 2 or [int(weight) for weight in params[1:]] != [1] * 4:
        return None
    names = [str(child) for child in expression.children()]
    if names == [f"m_4_{point}" for point in range(9, 13)]:
        return "main"
    if names == [f"b1_{point}" for point in range(9, 13)]:
        return "first_row"
    return None


def first_strict_main_or_first_point(expression: z3.BoolRef) -> int | None:
    if not z3.is_or(expression) or len(expression.children()) != 2:
        return None
    row = row_atom_parameters(expression.arg(0))
    first = re.fullmatch(r"b1_(\d+)", str(expression.arg(1)))
    if row is None or row[:2] != (0, 4) or first is None:
        return None
    point = int(first.group(1))
    if row[2] != point or point not in range(9, 13):
        return None
    return point


def parent_first_main_four_overlap_implies_eq(expression: z3.BoolRef) -> bool:
    if not z3.is_implies(expression):
        return False
    antecedent, conclusion = expression.children()
    if not z3.is_or(antecedent) or len(antecedent.children()) != 13:
        return False
    if not z3.is_and(conclusion) or len(conclusion.children()) != 13:
        return False
    for point, child in enumerate(antecedent.children()):
        if not z3.is_and(child) or len(child.children()) != 2:
            return False
        parent = parent_row_atom_parameters(child.arg(0))
        row = row_atom_parameters(child.arg(1))
        if parent != ("first", point) or row != (0, 4, point):
            return False
    for point, child in enumerate(conclusion.children()):
        if not z3.is_eq(child):
            return False
        parent = parent_row_atom_parameters(child.arg(0))
        row = row_atom_parameters(child.arg(1))
        if parent != ("first", point) or row != (0, 4, point):
            return False
    return True


def distinguished_blocker_role_parameters(
    expression: z3.BoolRef,
) -> tuple[int, int] | None:
    if not z3.is_eq(expression):
        return None
    left, right = expression.children()
    match = re.fullmatch(r"blocker_(\d+)", str(left))
    if match is None or not z3.is_int_value(right):
        return None
    return int(match.group(1)), right.as_long()


def distinguished_main_bit_parameters(
    expression: z3.BoolRef,
) -> tuple[int, bool] | None:
    positive = True
    atom_expression = expression
    if z3.is_not(expression):
        positive = False
        atom_expression = expression.arg(0)
    row = row_atom_parameters(atom_expression)
    if row is None or row[:2] != (0, 2):
        return None
    point = row[2]
    if (positive and point in {1, 3}) or (not positive and point in {0, 4}):
        return point, positive
    return None


def frontier_first_row_omission_parameters(
    expression: z3.BoolRef,
) -> tuple[str, int] | None:
    if not z3.is_implies(expression):
        return None
    antecedent, conclusion = expression.children()
    if not z3.is_eq(antecedent) or not z3.is_not(conclusion):
        return None
    left, right = antecedent.children()
    frontier = str(left)
    if frontier not in {"frontier_q", "frontier_w"} or not z3.is_int_value(right):
        return None
    point = right.as_long()
    match = re.fullmatch(r"b1_(\d+)", str(conclusion.arg(0)))
    if match is None or int(match.group(1)) != point:
        return None
    return frontier.removeprefix("frontier_"), point


def first_row_adjacent_block_parameters(
    expression: z3.BoolRef,
) -> str | None:
    if expression.decl().kind() != z3.Z3_OP_PB_AT_MOST:
        return None
    if int(expression.decl().params()[0]) != 1:
        return None
    points: list[int] = []
    for child in expression.children():
        match = re.fullmatch(r"b1_(\d+)", str(child))
        if match is None:
            return None
        points.append(int(match.group(1)))
    if points == [4, 5, 6, 7, 8]:
        return "middle"
    if points == [0, 1, 2, 3, 4]:
        return "second"
    return None


def cover_pair_omission_parameters(
    expression: z3.BoolRef,
) -> tuple[str, int] | None:
    if not z3.is_not(expression):
        return None
    body = expression.arg(0)
    if not z3.is_and(body) or len(body.children()) != 2:
        return None
    left = row_atom_parameters(body.arg(0))
    right = row_atom_parameters(body.arg(1))
    if left is None or right is None or left[:2] != right[:2]:
        return None
    family, center, left_point = left
    right_point = right[2]
    if family == 1 and (left_point, right_point) == (2, 1):
        return "left", center
    if family == 2 and (left_point, right_point) == (2, 3):
        return "right", center
    return None


def blocker_main_omission_lookup_parameters(
    expression: z3.BoolRef,
) -> tuple[int, int] | None:
    if not z3.is_not(expression):
        return None
    body = expression.arg(0)
    if not z3.is_or(body) or len(body.children()) != 13:
        return None
    source: int | None = None
    target: int | None = None
    for center, alternative in enumerate(body.children()):
        if not z3.is_and(alternative) or len(alternative.children()) != 2:
            return None
        equality, row_expression = alternative.children()
        if not z3.is_eq(equality):
            return None
        left, right = equality.children()
        blocker = re.fullmatch(r"blocker_(\d+)", str(left))
        row = row_atom_parameters(row_expression)
        if (
            blocker is None
            or not z3.is_int_value(right)
            or right.as_long() != center
            or row is None
            or row[:2] != (0, center)
        ):
            return None
        candidate_source = int(blocker.group(1))
        candidate_target = row[2]
        if source is None:
            source, target = candidate_source, candidate_target
        elif source != candidate_source or target != candidate_target:
            return None
    assert source is not None and target is not None
    return source, target


def shared_pair_parameters(
    expression: z3.BoolRef,
) -> tuple[str, int, int, int, int, int, int] | None:
    if not z3.is_not(expression):
        return None
    body = expression.arg(0)
    if not z3.is_and(body) or len(body.children()) != 4:
        return None
    entries: list[tuple[int, int, int]] = []
    for atom_expr in body.children():
        match = re.fullmatch(r"(m|g0|g1)_(\d+)_(\d+)", str(atom_expr))
        if match is None:
            return None
        family_name, center, point = match.groups()
        entries.append(({"m": 0, "g0": 1, "g1": 2}[family_name],
                        int(center), int(point)))
    family1, center1, point1 = entries[0]
    family1b, center1b, point2 = entries[1]
    family2, center2, point1b = entries[2]
    family2b, center2b, point2b = entries[3]
    if not (
        family1 == family1b
        and center1 == center1b
        and family2 == family2b
        and center2 == center2b
        and point1 == point1b
        and point2 == point2b
        and center1 < center2
        and point1 < point2
        and len({center1, center2, point1, point2}) == 4
    ):
        return None
    pattern = "".join(
        "c" if vertex in {center1, center2} else "p"
        for vertex in sorted((center1, center2, point1, point2))
    )
    theorem_by_pattern = {
        "ccpp": "directSource_sharedPair_centersBeforePoints",
        "ppcc": "directSource_sharedPair_pointsBeforeCenters",
        "cppc": "directSource_sharedPair_centersAroundPoints",
        "pccp": "directSource_sharedPair_pointsAroundCenters",
    }
    theorem = theorem_by_pattern.get(pattern)
    if theorem is None:
        return None
    return theorem, family1, family2, center1, center2, point1, point2


HEADER = """/-
Generated from a pinned complete source-core cover.  Each theorem is a
source-faithful semantic adapter for one literal assertion in the rebuilt
direct or mirror source stream.
-/
import BaseRetainedGeometryFacts

/-!
# Generated distinct-radius base/retained source adapters

Manifest-selected specializations of source-faithful semantic schemas.
-/

namespace Problem97
namespace ATailExactFiveCard13DistinctBaseRetainedIngressScratch

open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailExactFiveCard13CnfIngressScratch
open ATailExactFiveCard13CommonLabelTransportScratch
open ATailExactFiveCard13DistinctRadiusSourceIngressCoordinatorScratch
open ATailExactFiveGlobalCrossDeletionPair
open ATailExactFiveMutualOneHitGeometry
open ATailFirstApexShellRole
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion
open CanonicalAsymmetricSemanticRowTable

attribute [local instance] Classical.propDecidable

set_option maxHeartbeats 0
set_option maxRecDepth 1000000
set_option linter.unusedVariables false

noncomputable section

"""

FOOTER = """
end

end ATailExactFiveCard13DistinctBaseRetainedIngressScratch
end Problem97
"""


def theorem_text(
    prefix: str, index: int, expression: z3.BoolRef
) -> tuple[str, str, dict[str, int | str], str] | None:
    conclusion = emit_bool(expression)
    theorem_name = f"{prefix}Source_h{index:05d}"
    if parameters := parent_row_basic_parameters(expression):
        row, kind = parameters
        schema = f"parent_{row}_{kind}"
        schema_parameters = {"row": row, "kind": kind}
        if row == "first" and kind == "card_eq_four":
            source_theorem = "directSource_parentFirst_card_eq_four"
            proof = """  simpa only [bitCount13] using
    directSource_parentFirst_card_eq_four T _hcard _hdistinct"""
        elif row == "first":
            source_theorem = "directSource_parentFirst_four_excluded"
            proof = "  exact directSource_parentFirst_four_excluded T _hcard _hdistinct"
        elif kind == "card_eq_four":
            source_theorem = "directSource_parentSecond_card_eq_four"
            proof = """  simpa only [bitCount13] using
    directSource_parentSecond_card_eq_four P"""
        else:
            source_theorem = "directSource_parentSecond_eight_excluded"
            proof = "  exact directSource_parentSecond_eight_excluded P"
    elif bound := parent_first_physical_card_parameters(expression):
        schema = "parent_first_physical_card_le_one"
        schema_parameters = {"row": "first", "block": "physical", "bound": bound}
        source_theorem = "directSource_parentFirst_physical_card_le_one"
        proof = "  exact directSource_parentFirst_physical_card_le_one P"
    elif bound := parent_second_physical_card_parameters(expression):
        schema = "parent_second_physical_card_ge_two"
        schema_parameters = {"row": "second", "block": "physical", "bound": bound}
        source_theorem = "directSource_parentSecond_physical_card_ge_two"
        proof = "  exact directSource_parentSecond_physical_card_ge_two P"
    elif (point := parent_second_implies_shell_parameters(expression)) is not None:
        schema = "parent_second_implies_shell"
        schema_parameters = {"row": "second", "point": point}
        source_theorem = "directSource_parentSecond_imp_shell"
        proof = f"  exact directSource_parentSecond_imp_shell T ({point} : Fin 13)"
    elif parameters := parent_row_adjacent_block_parameters(expression):
        row, block = parameters
        schema = f"parent_{row}_{block}_card_le_one"
        schema_parameters = {"row": row, "block": block, "bound": 1}
        if row == "first":
            source_theorem = "directSource_parentFirst_adjacent_blocks_ule_one"
            projection = "1" if block == "middle" else "2"
            bit_count = "bitCountMiddleFive" if block == "middle" else "bitCountSecondFive"
            proof = f"""  simpa only [{bit_count}] using
    (directSource_parentFirst_adjacent_blocks_ule_one T _hcard _hdistinct).{projection}"""
        else:
            source_theorem = "directSource_parentSecond_adjacent_blocks_ule_one"
            projection = "1" if block == "middle" else "2"
            bit_count = "bitCountMiddleFive" if block == "middle" else "bitCountFirstWrapSix"
            proof = f"""  simpa only [{bit_count}] using
    (directSource_parentSecond_adjacent_blocks_ule_one P).{projection}"""
    elif row := first_strict_card_ge_two_parameters(expression):
        schema = f"{row}_first_strict_card_ge_two"
        schema_parameters = {"row": row, "block": "first_strict", "bound": 2}
        if row == "main":
            source_theorem = "directSource_mainFour_firstStrict_card_ge_two"
            proof = "  exact directSource_mainFour_firstStrict_card_ge_two C"
        else:
            source_theorem = "directSource_parentFirst_firstStrict_card_ge_two"
            proof = """  have h9 : parentRowBit (directSourceParentFirst P) 9 =
      firstRowBit (directSourceFirstRow T) 9 := by
    simpa using directSource_parentFirst_eq_firstRow T _hcard _hdistinct (9 : Fin 13)
  have h10 : parentRowBit (directSourceParentFirst P) 10 =
      firstRowBit (directSourceFirstRow T) 10 := by
    simpa using directSource_parentFirst_eq_firstRow T _hcard _hdistinct (10 : Fin 13)
  have h11 : parentRowBit (directSourceParentFirst P) 11 =
      firstRowBit (directSourceFirstRow T) 11 := by
    simpa using directSource_parentFirst_eq_firstRow T _hcard _hdistinct (11 : Fin 13)
  have h12 : parentRowBit (directSourceParentFirst P) 12 =
      firstRowBit (directSourceFirstRow T) 12 := by
    simpa using directSource_parentFirst_eq_firstRow T _hcard _hdistinct (12 : Fin 13)
  rw [← h9, ← h10, ← h11, ← h12]
  exact directSource_parentFirst_firstStrict_card_ge_two T _hcard _hdistinct"""
    elif frontier_strict_main_occurrence(expression):
        schema = "frontier_strict_main_occurrence"
        schema_parameters = {"row": "main", "center": 4, "block": "first_strict"}
        source_theorem = "directSource_frontier_strict_main_occurrence"
        proof = "  exact directSource_frontier_strict_main_occurrence C"
    elif (point := main_four_first_row_disjoint_point(expression)) is not None:
        schema = "main_four_first_row_disjoint"
        schema_parameters = {"center": 4, "point": point}
        source_theorem = "directSource_mainFour_firstRow_disjoint"
        proof = f"  exact directSource_mainFour_firstRow_disjoint C _hdistinct ({point} : Fin 13)"
    elif row := first_strict_card_eq_two_parameters(expression):
        schema = f"{row}_first_strict_card_eq_two"
        schema_parameters = {"row": row, "block": "first_strict", "card": 2}
        source_theorem = "directSource_firstApex_strict_exact_two_and_cover"
        projection = "1" if row == "main" else "2.1"
        proof = f"""  simpa only [bitCountFirstStrictFour] using
    (directSource_firstApex_strict_exact_two_and_cover C _hcard _hdistinct).{projection}"""
    elif (point := first_strict_main_or_first_point(expression)) is not None:
        schema = "first_strict_main_or_first_cover"
        schema_parameters = {"center": 4, "point": point}
        source_theorem = "directSource_firstApex_strict_exact_two_and_cover"
        projection = {
            9: "2.2.1",
            10: "2.2.2.1",
            11: "2.2.2.2.1",
            12: "2.2.2.2.2",
        }[point]
        proof = f"  exact (directSource_firstApex_strict_exact_two_and_cover C _hcard _hdistinct).{projection}"
    elif parent_first_main_four_overlap_implies_eq(expression):
        schema = "parent_first_main_four_overlap_implies_eq"
        schema_parameters = {"parent_row": "first", "family": 0, "center": 4}
        source_theorem = "directSource_parentFirst_mainFour_overlap_implies_eq"
        proof = """  simpa only [directSourceParentFirstMainFourOverlap,
    directSourceParentFirstMainFourEq] using
    directSource_parentFirst_mainFour_overlap_implies_eq C _hcard _hdistinct"""
    elif parameters := distinguished_blocker_role_parameters(expression):
        source, center = parameters
        expected_source = 1 if prefix == "direct" else 3
        if source != expected_source or center != 2:
            return None
        schema = "distinguished_blocker_role"
        schema_parameters = {"source": source, "center": center}
        source_theorem = "directSource_distinguished_blocker_eq_two"
        proof = """  simpa only [hroles.1] using
    directSource_distinguished_blocker_eq_two T"""
    elif parameters := distinguished_main_bit_parameters(expression):
        point, positive = parameters
        schema = "distinguished_main_membership" if positive else "distinguished_main_omission"
        schema_parameters = {"center": 2, "point": point, "positive": positive}
        source_theorem = "directSource_mainTwo_bits_normal_form"
        projection = {
            (1, True): "1",
            (3, True): "2.1",
            (0, False): "2.2.1",
            (4, False): "2.2.2",
        }[(point, positive)]
        proof = f"""  simpa using
    (directSource_mainTwo_bits_normal_form C).{projection}"""
    elif parameters := frontier_first_row_omission_parameters(expression):
        frontier, point = parameters
        schema = f"frontier_{frontier}_first_row_omission"
        schema_parameters = {"frontier": frontier, "point": point}
        source_theorem = "directSource_frontier_or_not_firstRow"
        projection = "1" if frontier == "q" else "2"
        proof = f"""  simpa using
    (directSource_frontier_or_not_firstRow T ({point} : Fin 13)).{projection}"""
    elif first_row_kind := first_row_basic_parameters(expression):
        schema = f"first_row_{first_row_kind}"
        schema_parameters = {"kind": first_row_kind}
        if first_row_kind == "four_excluded":
            source_theorem = "directSource_firstRow_four_excluded"
            proof = "  exact directSource_firstRow_four_excluded T"
        else:
            source_theorem = "directSource_firstRow_card_eq_four"
            proof = """  simpa only [bitCount13] using
    directSource_firstRow_card_eq_four T"""
    elif block := first_row_adjacent_block_parameters(expression):
        schema = f"first_row_{block}_card_le_one"
        schema_parameters = {"block": block, "bound": 1}
        source_theorem = "directSource_firstRow_adjacent_blocks_ule_one"
        projection = "1" if block == "middle" else "2"
        bit_count = "bitCountMiddleFive" if block == "middle" else "bitCountSecondFive"
        proof = f"""  simpa only [{bit_count}] using
    (directSource_firstRow_adjacent_blocks_ule_one T).{projection}"""
    elif parameters := cover_pair_omission_parameters(expression):
        side, center = parameters
        schema = f"{side}_cover_pair_omission"
        schema_parameters = {"side": side, "center": center}
        source_theorem = f"directSource_{side}_cover_pair_omission"
        proof = f"  exact {source_theorem} C ({center} : Fin 13)"
    elif parameters := blocker_main_omission_lookup_parameters(expression):
        source, target = parameters
        expected_source_target = 1 if prefix == "direct" else 3
        expected_third_target = 3 if prefix == "direct" else 1
        if source != 2 or target not in {expected_source_target, expected_third_target}:
            return None
        role = "source" if target == expected_source_target else "third"
        schema = f"distinguished_reverse_{role}_omission_lookup"
        schema_parameters = {"source": source, "target": target, "target_role": role}
        source_theorem = (
            "directSource_distinguished_reverse_omission_lookup"
            if role == "source"
            else "directSource_distinguished_reverse_third_omission_lookup"
        )
        target_role_eq = "hroles.1" if role == "source" else "hroles.2.2"
        proof = f"""  change (!(directSourceIndexLookupBit
    (blockerAt (directSourceBlockers T) {source})
    (fun center ↦ rowBit (directSourceRows C) 0 center.val {target}))) = true
  simpa only [hroles.2.1, {target_role_eq}] using
    {source_theorem} C"""
    elif parameters := shell_basic_parameters(expression):
        shell_kind, point = parameters
        schema = f"shell_{shell_kind}"
        schema_parameters = {"kind": shell_kind}
        if point is not None:
            schema_parameters["point"] = point
        if shell_kind == "excluded_eight":
            source_theorem = "directSource_shell_eight_excluded"
            proof = "  exact directSource_shell_eight_excluded T"
        elif shell_kind == "member":
            assert point is not None
            source_theorem = "directSource_shell_mem_one_two_three"
            proof = f"""  exact directSource_shell_mem_one_two_three T
    ({point} : Fin 13) (by simp)"""
        elif shell_kind == "card_eq_five":
            source_theorem = "directSource_shell_card_eq_five"
            proof = """  simpa only [bitCount13] using
    directSource_shell_card_eq_five T"""
        elif shell_kind == "middle_four_eq_one":
            source_theorem = "directSource_shell_adjacent_blocks_eq_one"
            proof = """  simpa only [bitCountMiddleFour] using
    (directSource_shell_adjacent_blocks_eq_one T).1"""
        elif shell_kind == "first_wrap_five_eq_one":
            source_theorem = "directSource_shell_adjacent_blocks_eq_one"
            proof = """  simpa only [bitCountFirstWrapFive] using
    (directSource_shell_adjacent_blocks_eq_one T).2"""
        else:
            raise AssertionError(f"unhandled shell schema {shell_kind}")
    elif parameters := second_apex_row_shell_parameters(expression):
        family, point = parameters
        schema = "second_apex_row_imp_shell"
        source_theorem = "directSource_secondApex_row_imp_shell"
        schema_parameters = {"family": family, "point": point}
        proof = f"""  exact directSource_secondApex_row_imp_shell C
    ({family} : Fin 3) ({point} : Fin 13)"""
    elif parameters := blocker_image_sync_parameters(expression):
        family, point = parameters
        schema = "distinguished_blocker_cover_sync"
        source_theorem = "directSource_coverTwo_eq_mainTwo"
        schema_parameters = {"center": 2, "family": family, "point": point}
        proof = f"""  have heq := directSource_coverTwo_eq_mainTwo C
    ({family} : Fin 3) ({point} : Fin 13) (by decide)
  have heq' : rowBit (directSourceRows C) {family} 2 {point} =
      rowBit (directSourceRows C) 0 2 {point} := by
    simpa using heq
  rw [Bool.or_eq_true]
  right
  simp only [heq', beq_self_eq_true]"""
    elif parameters := row_center_excluded_parameters(expression):
        family, center = parameters
        schema = "row_center_excluded"
        source_theorem = "directSource_row_center_excluded"
        schema_parameters = {"family": family, "center": center}
        proof = f"""  exact directSource_row_center_excluded C
    ({family} : Fin 3) ({center} : Fin 13)"""
    elif parameters := row_card_eq_four_parameters(expression):
        family, center = parameters
        schema = "row_card_eq_four"
        source_theorem = "directSource_row_card_eq_four"
        schema_parameters = {"family": family, "center": center}
        proof = f"""  simpa only [bitCount13] using
    directSource_row_card_eq_four C ({family} : Fin 3) ({center} : Fin 13)"""
    elif parameters := row_intersection_parameters(expression):
        family1, family2, center1, center2 = parameters
        schema = "row_intersection_card_le_two"
        source_theorem = "directSource_row_inter_card_le_two"
        schema_parameters = {
            "family1": family1,
            "family2": family2,
            "center1": center1,
            "center2": center2,
        }
        proof = f"""  simpa only [bitCount13] using
    directSource_row_inter_card_le_two C
      ({family1} : Fin 3) ({family2} : Fin 3)
      ({center1} : Fin 13) ({center2} : Fin 13) (by decide)"""
    elif parameters := family_pair_center_parameters(expression):
        family, left, right = parameters
        schema = "family_pair_center_count"
        source_theorem = "directSource_family_pair_center_count_le_two"
        schema_parameters = {"family": family, "left": left, "right": right}
        proof = f"""  simpa only [bitCount13] using
    directSource_family_pair_center_count_le_two C
      ({family} : Fin 3) ({left} : Fin 13) ({right} : Fin 13) (by decide)"""
    elif parameters := any_pair_packed_center_parameters(expression):
        left, right = parameters
        schema = "any_pair_packed_center_count"
        source_theorem = "directSource_any_pair_packed_center_count_le_two"
        schema_parameters = {"left": left, "right": right}
        proof = f"""  simpa [bitCount13, directSourceAnyPairPackedCenterBit] using
    directSource_any_pair_packed_center_count_le_two C
      ({left} : Fin 13) ({right} : Fin 13) (by decide)"""
    elif parameters := extended_any_pair_packed_center_parameters(expression):
        left, right = parameters
        schema = "extended_any_pair_packed_center_count"
        source_theorem = "directSource_extended_any_pair_packed_center_count_le_two"
        schema_parameters = {"left": left, "right": right}
        proof = f"""  simpa [bitCount13,
    directSourceExtendedAnyPairPackedCenterBit] using
    directSource_extended_any_pair_packed_center_count_le_two C
      _hcard _hdistinct ({left} : Fin 13) ({right} : Fin 13) (by decide)"""
    elif parameters := cap_cardinality_parameters(expression):
        block, bound, family, center = parameters
        schema = f"{block}_card_le_{'one' if bound == 1 else 'two'}"
        source_theorem = f"directSource_{block}_card_le_{'one' if bound == 1 else 'two'}"
        schema_parameters = {
            "block": block,
            "bound": bound,
            "family": family,
            "center": center,
        }
        if block == "middle" and bound == 2:
            conditions = "(by decide) (by decide)"
        elif block == "middle":
            conditions = "(by decide)"
        elif block == "firstWrap":
            conditions = "(by decide)"
        else:
            conditions = "(by decide)"
        bit_count = {
            "middle": "bitCountMiddleFive",
            "firstWrap": "bitCountFirstWrapSix",
            "second": "bitCountSecondFive",
        }[block]
        proof = f"""  simpa only [{bit_count}] using
    {source_theorem} C ({family} : Fin 3) ({center} : Fin 13) {conditions}"""
    elif parameters := first_row_shared_pair_parameters(expression):
        family, center, point1, point2, vertices, branch, disjunct = parameters
        a, b, c, d = vertices
        schema = "first_row_source_row_shared_pair"
        source_theorem = "directSource_firstRow_sharedPair_false_of_strict"
        schema_parameters = {
            "family": family,
            "center": center,
            "point1": point1,
            "point2": point2,
            "kalmanson_a": a,
            "kalmanson_b": b,
            "kalmanson_c": c,
            "kalmanson_d": d,
            "kalmanson_branch": branch,
            "or_disjunct": disjunct,
        }
        proof = f"""  apply directSource_firstRow_sharedPair_false_of_strict C
    ({family} : Fin 3) ({center} : Fin 13)
    ({point1} : Fin 13) ({point2} : Fin 13)
  have hk := P.strictKalmanson
    (a := ({a} : Fin 13)) (b := ({b} : Fin 13))
    (c := ({c} : Fin 13)) (d := ({d} : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.{disjunct} (by simpa only [dist_comm, add_comm] using hk.{branch})"""
    elif parameters := first_row_shared_pair_parameters(expression, "parent_first"):
        family, center, point1, point2, vertices, branch, disjunct = parameters
        a, b, c, d = vertices
        schema = "parent_first_source_row_shared_pair"
        source_theorem = "directSource_parentFirst_sharedPair_false_of_strict"
        schema_parameters = {
            "family": family,
            "center": center,
            "point1": point1,
            "point2": point2,
            "kalmanson_a": a,
            "kalmanson_b": b,
            "kalmanson_c": c,
            "kalmanson_d": d,
            "kalmanson_branch": branch,
            "or_disjunct": disjunct,
        }
        proof = f"""  apply directSource_parentFirst_sharedPair_false_of_strict C
    _hcard _hdistinct ({family} : Fin 3) ({center} : Fin 13)
    ({point1} : Fin 13) ({point2} : Fin 13)
  have hk := P.strictKalmanson
    (a := ({a} : Fin 13)) (b := ({b} : Fin 13))
    (c := ({c} : Fin 13)) (d := ({d} : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.{disjunct} (by simpa only [dist_comm, add_comm] using hk.{branch})"""
    elif parameters := first_row_shared_pair_parameters(expression, "parent_second", 8):
        family, center, point1, point2, vertices, branch, disjunct = parameters
        a, b, c, d = vertices
        schema = "parent_second_source_row_shared_pair"
        source_theorem = "directSource_parentSecond_sharedPair_false_of_strict"
        schema_parameters = {
            "family": family,
            "center": center,
            "point1": point1,
            "point2": point2,
            "kalmanson_a": a,
            "kalmanson_b": b,
            "kalmanson_c": c,
            "kalmanson_d": d,
            "kalmanson_branch": branch,
            "or_disjunct": disjunct,
        }
        proof = f"""  apply directSource_parentSecond_sharedPair_false_of_strict C
    ({family} : Fin 3) ({center} : Fin 13)
    ({point1} : Fin 13) ({point2} : Fin 13)
  have hk := P.strictKalmanson
    (a := ({a} : Fin 13)) (b := ({b} : Fin 13))
    (c := ({c} : Fin 13)) (d := ({d} : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.{disjunct} (by simpa only [dist_comm, add_comm] using hk.{branch})"""
    elif parameters := shared_pair_parameters(expression):
        theorem, family1, family2, center1, center2, point1, point2 = parameters
        schema = "shared_pair"
        source_theorem = theorem
        schema_parameters = {
            "family1": family1,
            "family2": family2,
            "center1": center1,
            "center2": center2,
            "point1": point1,
            "point2": point2,
        }
        proof = f"""  exact {theorem} C
    ({family1} : Fin 3) ({family2} : Fin 3)
    ({center1} : Fin 13) ({center2} : Fin 13)
    ({point1} : Fin 13) ({point2} : Fin 13)
    (by decide) (by decide) (by decide)"""
    else:
        return None
    text = f"""/-- Manifest-selected source assertion `h{index:05d}`. -/
theorem {theorem_name}
    {{D : CounterexampleData}} {{S : SurplusCapPacket D.A}} {{radius : ℝ}}
    {{H : CriticalShellSystem D.A}}
    {{F : CriticalPairFrontier D S radius H}}
    {{R : FrontierCommonDeletionParentResidual F}}
    {{B : FrontierBiApexRobustResidual R}}
    {{Q : FrontierBiApexRobustExactFiveSecondCapResidual B}}
    {{profile : LargeCapUniqueFiveSecondApexRadius D S}}
    {{M : PhysicalActualCriticalMutualOmissionPair H profile}}
    {{N : SourceTwoHitNormalForm Q profile M}}
    (P : CanonicalAsymmetricRolePrepacket N)
    {{star : PhysicalGlobalCrossDeletionStar profile}}
    {{first : FirstApexShellRolePacket F R}}
    (T : CanonicalAsymmetricSemanticRowTable P star first)
    (C : CanonicalCoverFamilies T)
    (hroles :
      P.sourceIndex = ({1 if prefix == "direct" else 3} : Fin 13) ∧
        P.blockerIndex = (2 : Fin 13) ∧
        P.thirdIndex = ({3 if prefix == "direct" else 1} : Fin 13))
    (_hcard : D.A.card = 13) (_hdistinct : first.doubleRadius ≠ radius) :
    ({conclusion}) = true := by
{proof}
"""
    return schema, source_theorem, schema_parameters, text


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orientation", choices=sorted(ORBIT_SPECS), required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--manifest-sha256", required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument("--output-map", type=Path, required=True)
    parser.add_argument("--chunk-size", type=int, default=64)
    args = parser.parse_args()

    short, spec = resolve_orbit(args.orientation)
    selected = load_selected_indices(
        args.manifest, args.manifest_sha256, short, str(spec["source_orbit"])
    )
    assertions, _counts, _outer, _ranks = build_source_assertions(short)
    if len(assertions) != EXPECTED_ASSERTIONS:
        raise AssertionError("rebuilt source assertion count drift")

    prefix = "direct" if short == "direct" else "mirror"
    entries: list[dict[str, Any]] = []
    theorems: list[str] = []
    first_unsupported: dict[str, Any] | None = None
    for index in selected:
        if not 2 <= index < 40_210:
            continue
        generated = theorem_text(prefix, index, assertions[index])
        if generated is None:
            if first_unsupported is None:
                first_unsupported = {
                    "index": index,
                    "sexpr": assertions[index].sexpr(),
                }
            continue
        schema, source_theorem, schema_parameters, theorem = generated
        theorems.append(theorem)
        entries.append({
            "source_index": index,
            "theorem": f"{prefix}Source_h{index:05d}",
            "schema": schema,
            "source_theorem": source_theorem,
            "schema_parameters": schema_parameters,
            "sexpr": assertions[index].sexpr(),
            "sexpr_sha256": sexpr_sha256(assertions[index]),
        })

    # Fail closed by re-indexing every mapped entry into the independently
    # rebuilt current source stream and re-running its exact structural
    # classifier.  This prevents legacy h-number assumptions from entering the
    # generated theorem map.
    for entry in entries:
        index = int(entry["source_index"])
        current = assertions[index]
        if entry["sexpr"] != current.sexpr():
            raise AssertionError(f"source s-expression drift at h{index:05d}")
        if entry["sexpr_sha256"] != sexpr_sha256(current):
            raise AssertionError(f"source s-expression fingerprint drift at h{index:05d}")
        regenerated = theorem_text(prefix, index, current)
        if regenerated is None:
            raise AssertionError(f"mapped schema no longer recognizes h{index:05d}")
        schema, source_theorem, schema_parameters, theorem = regenerated
        if (
            entry["schema"] != schema
            or entry["source_theorem"] != source_theorem
            or entry["schema_parameters"] != schema_parameters
            or f"theorem {entry['theorem']}" not in theorem
        ):
            raise AssertionError(f"mapped theorem/schema drift at h{index:05d}")

    args.output_dir.mkdir(parents=True, exist_ok=True)
    modules: list[str] = []
    aggregate_modules: list[str] = []
    split_modules: dict[str, list[str]] = {}
    singleton_split_modules: dict[str, list[str]] = {}
    module_prefix = "Direct" if short == "direct" else "Mirror"
    for chunk_index, start in enumerate(range(0, len(theorems), args.chunk_size)):
        module = f"{module_prefix}BaseRetainedInstancesChunk{chunk_index:03d}"
        aggregate_modules.append(module)
        end = min(start + args.chunk_size, len(theorems))
        if chunk_index in SPLIT_CHUNKS[short]:
            part_modules: list[str] = []
            for part_index, part_start in enumerate(
                range(start, end, SPLIT_CHUNK_SIZE)
            ):
                part_end = min(part_start + SPLIT_CHUNK_SIZE, end)
                part_module = f"{module}Part{part_index:02d}"
                part_modules.append(part_module)
                if part_index in SINGLETON_PARTS.get((short, chunk_index), set()):
                    item_modules: list[str] = []
                    for item_index, item_start in enumerate(range(part_start, part_end)):
                        item_module = f"{part_module}Item{item_index:02d}"
                        item_modules.append(item_module)
                        modules.append(item_module)
                        entries[item_start]["module"] = item_module
                        write_text_if_changed(
                            args.output_dir / f"{item_module}.lean",
                            HEADER + theorems[item_start] + FOOTER,
                        )
                    singleton_split_modules[part_module] = item_modules
                    write_text_if_changed(
                        args.output_dir / f"{part_module}.lean",
                        "\n".join(f"import {item}" for item in item_modules)
                        + "\n\n/-!\n# Generated singleton-leaf wrapper\n-/\n",
                    )
                    modules.append(part_module)
                else:
                    modules.append(part_module)
                    for entry in entries[part_start:part_end]:
                        entry["module"] = part_module
                    write_text_if_changed(
                        args.output_dir / f"{part_module}.lean",
                        HEADER + "\n".join(theorems[part_start:part_end]) + FOOTER,
                    )
            split_modules[module] = part_modules
            write_text_if_changed(
                args.output_dir / f"{module}.lean",
                "\n".join(f"import {part}" for part in part_modules)
                + "\n\n/-!\n# Generated bounded-leaf wrapper\n-/\n",
            )
            modules.append(module)
        else:
            for entry in entries[start:end]:
                entry["module"] = module
            modules.append(module)
            write_text_if_changed(
                args.output_dir / f"{module}.lean",
                HEADER + "\n".join(theorems[start:end]) + FOOTER,
            )
    aggregate = (
        f"{'Direct' if short == 'direct' else 'Mirror'}BaseRetainedInstances"
    )
    write_text_if_changed(
        args.output_dir / f"{aggregate}.lean",
        "\n".join(f"import {module}" for module in aggregate_modules)
        + "\n\n/-!\n# Generated base/retained adapter aggregate\n-/\n",
    )

    result = {
        "schema": "p97-exact5-card13-distinct-base-retained-instance-map-v1",
        "orientation": short,
        "source_orbit": spec["source_orbit"],
        "current_source_assertion_count": len(assertions),
        "current_source_stream_sha256": source_stream_sha256(assertions),
        "manifest": str(args.manifest),
        "manifest_sha256": args.manifest_sha256,
        "selected_union_count": len(selected),
        "owned_selected_count": sum(2 <= index < 40_210 for index in selected),
        "generated_count": len(entries),
        "mapped_current_indices_revalidated": len(entries),
        "all_mapped_current_indices_revalidated": True,
        "first_unsupported": first_unsupported,
        "modules": modules,
        "aggregate_modules": aggregate_modules,
        "split_modules": split_modules,
        "singleton_split_modules": singleton_split_modules,
        "entries": entries,
    }
    args.output_map.parent.mkdir(parents=True, exist_ok=True)
    args.output_map.write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps({
        "orientation": short,
        "generated_count": len(entries),
        "first_unsupported": first_unsupported,
        "output_map": str(args.output_map),
    }, sort_keys=True))


if __name__ == "__main__":
    main()
