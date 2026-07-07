#!/usr/bin/env python3
#
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
#
"""Generate the erased-pin exact-count row census.

This is the finite row surface consumed by
`IsM44NonSurplusContainmentErasedPinTripleCountRowsFactsStatement`.

The output is intentionally a row-spec census, not a metric feasibility or
Nullstellensatz certificate.  Follow-up generators should attach certificate
payloads to these stable row ids.
"""

from __future__ import annotations

import argparse
import json
from dataclasses import asdict, dataclass
from pathlib import Path


SCHEMA = "p97.erased_pin_count_rows.v1"


@dataclass(frozen=True)
class Row:
    side: str
    m: int
    s: int
    l: int
    r: int

    @property
    def row_id(self) -> str:
        return f"ep_{self.side}_m{self.m}_s{self.s}_l{self.l}_r{self.r}"

    @property
    def support_needed(self) -> int:
        return max(0, self.s - 1) + max(0, self.l - 2) + max(0, self.r - 2)

    @property
    def family(self) -> str:
        if self.l >= 2 or self.r >= 2:
            return "adjacent-heavy"
        if self.m >= 2:
            return "moser-pair"
        if self.s >= 2:
            return "same-cap-heavy"
        return "terminal-1111"

    @property
    def route(self) -> str:
        if self.l > 0 and self.r > 0:
            return "left-right-subpacket"
        if self.side == "right" and (self.m, self.s, self.l, self.r) == (2, 1, 0, 1):
            return "one-sided-terminal"
        if self.side == "left" and (self.m, self.s, self.l, self.r) == (2, 1, 1, 0):
            return "one-sided-terminal"
        return "same-side-heavy"

    def validate(self) -> None:
        if self.side not in {"right", "left"}:
            raise ValueError(f"{self.row_id}: bad side")
        if self.m + self.s + self.l + self.r != 4:
            raise ValueError(f"{self.row_id}: row does not sum to 4")
        if self.m > 2:
            raise ValueError(f"{self.row_id}: m > 2")
        if self.s > 1:
            raise ValueError(f"{self.row_id}: s > 1")
        if self.side == "right" and self.r < 1:
            raise ValueError(f"{self.row_id}: right row lacks 1 <= r")
        if self.side == "left" and self.l < 1:
            raise ValueError(f"{self.row_id}: left row lacks 1 <= l")

    def to_json(self) -> dict[str, object]:
        out = asdict(self)
        out["id"] = self.row_id
        out["support_needed"] = self.support_needed
        out["family"] = self.family
        out["route"] = self.route
        return out


def rows_for_side(side: str) -> list[Row]:
    rows: list[Row] = []
    for m in range(3):
        for s in range(2):
            for l in range(5):
                for r in range(5):
                    row = Row(side=side, m=m, s=s, l=l, r=r)
                    try:
                        row.validate()
                    except ValueError:
                        continue
                    rows.append(row)
    if side == "right":
        rows.sort(key=lambda row: (row.m, row.s, -row.l, row.r))
    else:
        rows.sort(key=lambda row: (row.m, row.s, row.l, row.r))
    return rows


def all_rows() -> list[Row]:
    return rows_for_side("right") + rows_for_side("left")


def write_json(path: Path, rows: list[Row]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    route_counts = {
        route: sum(row.route == route for row in rows)
        for route in sorted({row.route for row in rows})
    }
    family_counts = {
        family: sum(row.family == family for row in rows)
        for family in sorted({row.family for row in rows})
    }
    payload = {
        "schema": SCHEMA,
        "description": (
            "Finite exact-count row target for erased-pin non-surplus "
            "interiors. This is a row-spec census, not a metric certificate."
        ),
        "right_count": sum(row.side == "right" for row in rows),
        "left_count": sum(row.side == "left" for row in rows),
        "total_count": len(rows),
        "family_counts": family_counts,
        "route_counts": route_counts,
        "rows": [row.to_json() for row in rows],
    }
    path.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")


def write_markdown(path: Path, rows: list[Row]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    lines = [
        "# Erased-pin exact-count row census",
        "",
        "This generated table records the finite row target for",
        "`IsM44NonSurplusContainmentErasedPinTripleCountRowsFactsStatement`.",
        "It is a census of row ids and count tuples, not a metric certificate.",
        "",
        "## Route summary",
        "",
        "| route | count | meaning |",
        "|---|---:|---|",
        "| `left-right-subpacket` | "
        f"{sum(row.route == 'left-right-subpacket' for row in rows)} | "
        "Both adjacent sides are hit; target for the four-point subpacket bridge. |",
        "| `same-side-heavy` | "
        f"{sum(row.route == 'same-side-heavy' for row in rows)} | "
        "Only the surplus-side adjacent bucket is hit, with extra adjacent mass. |",
        "| `one-sided-terminal` | "
        f"{sum(row.route == 'one-sided-terminal' for row in rows)} | "
        "The old one-sided terminal row handled by seeded-shadow payloads. |",
        "",
        "## Rows",
        "",
        "| id | side | m | s | l | r | supportNeeded | family | route |",
        "|---|---:|---:|---:|---:|---:|---:|---|---|",
    ]
    for row in rows:
        lines.append(
            f"| `{row.row_id}` | {row.side} | {row.m} | {row.s} | {row.l} |"
            f" {row.r} | {row.support_needed} | {row.family} | {row.route} |"
        )
    lines.append("")
    lines.append(f"Right rows: {sum(row.side == 'right' for row in rows)}")
    lines.append(f"Left rows: {sum(row.side == 'left' for row in rows)}")
    lines.append(f"Total rows: {len(rows)}")
    path.write_text("\n".join(lines) + "\n")


def lean_side(side: str) -> str:
    return ".right" if side == "right" else ".left"


def lean_row(row: Row) -> str:
    return (
        "{ id := "
        f'"{row.row_id}", side := {lean_side(row.side)}, '
        f"m := {row.m}, s := {row.s}, l := {row.l}, r := {row.r} }}"
    )


def write_lean(path: Path, rows: list[Row]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    right = [row for row in rows if row.side == "right"]
    left = [row for row in rows if row.side == "left"]
    lines = [
        "/-",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Authors: Adam McKenna",
        "-/",
        "",
        "/-!",
        "# Generated erased-pin exact-count row census",
        "",
        "This module is generated by `scripts/erased-pin-row-census.py`.",
        "It records the finite count rows for the erased-pin non-surplus",
        "interior residual.  It does not contain metric certificates.",
        "-/",
        "",
        "namespace Problem97",
        "namespace ErasedPinCountRows",
        "",
        "inductive Side where",
        "  | right",
        "  | left",
        "  deriving DecidableEq, BEq, Repr",
        "",
        "inductive Route where",
        "  | leftRightSubpacket",
        "  | sameSideHeavy",
        "  | oneSidedTerminal",
        "  deriving DecidableEq, BEq, Repr",
        "",
        "structure Row where",
        "  id : String",
        "  side : Side",
        "  m : Nat",
        "  s : Nat",
        "  l : Nat",
        "  r : Nat",
        "  deriving Repr",
        "",
        "def Row.supportNeeded (row : Row) : Nat :=",
        "  (row.s - 1) + (row.l - 2) + (row.r - 2)",
        "",
        "def Row.valid (row : Row) : Bool :=",
        "  decide (row.m + row.s + row.l + row.r = 4) &&",
        "    decide (row.m <= 2) &&",
        "    decide (row.s <= 1) &&",
        "    match row.side with",
        "    | .right => decide (1 <= row.r)",
        "    | .left => decide (1 <= row.l)",
        "",
        "def Row.route (row : Row) : Route :=",
        "  if 0 < row.l && 0 < row.r then",
        "    .leftRightSubpacket",
        "  else if row.side == .right && row.m == 2 && row.s == 1 &&",
        "      row.l == 0 && row.r == 1 then",
        "    .oneSidedTerminal",
        "  else if row.side == .left && row.m == 2 && row.s == 1 &&",
        "      row.l == 1 && row.r == 0 then",
        "    .oneSidedTerminal",
        "  else",
        "    .sameSideHeavy",
        "",
        "def routeCount (route : Route) (rows : List Row) : Nat :=",
        "  rows.foldl (fun acc row => if row.route == route then acc + 1 else acc) 0",
        "",
        "def rightRows : List Row :=",
        "  [",
    ]
    lines.extend("    " + lean_row(row) + ("," if i + 1 < len(right) else "")
                 for i, row in enumerate(right))
    lines.extend([
        "  ]",
        "",
        "def leftRows : List Row :=",
        "  [",
    ])
    lines.extend("    " + lean_row(row) + ("," if i + 1 < len(left) else "")
                 for i, row in enumerate(left))
    lines.extend([
        "  ]",
        "",
        "def rows : List Row := rightRows ++ leftRows",
        "",
        "theorem rightRows_length : rightRows.length = 15 := by",
        "  native_decide",
        "",
        "theorem leftRows_length : leftRows.length = 15 := by",
        "  native_decide",
        "",
        "theorem rows_length : rows.length = 30 := by",
        "  native_decide",
        "",
        "theorem rightRows_all_valid : rightRows.all Row.valid = true := by",
        "  native_decide",
        "",
        "theorem leftRows_all_valid : leftRows.all Row.valid = true := by",
        "  native_decide",
        "",
        "theorem rows_all_valid : rows.all Row.valid = true := by",
        "  native_decide",
        "",
        "theorem leftRightSubpacket_count :",
        "    routeCount .leftRightSubpacket rows = 18 := by",
        "  native_decide",
        "",
        "theorem sameSideHeavy_count :",
        "    routeCount .sameSideHeavy rows = 10 := by",
        "  native_decide",
        "",
        "theorem oneSidedTerminal_count :",
        "    routeCount .oneSidedTerminal rows = 2 := by",
        "  native_decide",
        "",
        "end ErasedPinCountRows",
        "end Problem97",
    ])
    path.write_text("\n".join(lines) + "\n")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--json",
        type=Path,
        default=Path("certificates/surplus/erased_pin_count_rows.json"),
    )
    parser.add_argument(
        "--markdown",
        type=Path,
        default=Path("certificates/surplus/reports/erased_pin_count_rows.md"),
    )
    parser.add_argument(
        "--lean",
        type=Path,
        default=Path("lean/Erdos9796Proof/P97/ErasedPinCountRows.lean"),
    )
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    rows = all_rows()
    for row in rows:
        row.validate()
    if len(rows_for_side("right")) != 15 or len(rows_for_side("left")) != 15:
        raise SystemExit("expected 15 rows per side")
    if args.check:
        return

    write_json(args.json, rows)
    write_markdown(args.markdown, rows)
    write_lean(args.lean, rows)


if __name__ == "__main__":
    main()
