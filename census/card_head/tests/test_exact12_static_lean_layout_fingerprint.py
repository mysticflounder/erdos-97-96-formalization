# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Differential anchors shared by Python and the Lean static reconstruction."""

from census.card_head.candidate_surface import build_model
from census.card_head.exact12_next_row_static_convex import (
    install_static_convex_extension,
)
from census.card_head.exact12_next_row_valuation import cells, compile_cell
from census.card_head.source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SourceFaithfulCoverInstance,
)

MODULUS = 18_446_744_073_709_551_557
MULTIPLIER = 1_000_003
OFFSET = 1_469_598_103_934_665_603


def _fingerprint(clauses: tuple[tuple[int, ...], ...]) -> int:
    acc = OFFSET
    for clause in clauses:
        for literal in clause:
            code = 2 * abs(literal) + int(literal < 0)
            acc = (acc * MULTIPLIER + code + 1009) % MODULUS
        acc = (acc * MULTIPLIER + 997) % MODULUS
    return acc


def test_python_static_layout_matches_lean_full_stream_anchors() -> None:
    instance = SourceFaithfulCoverInstance(
        build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
    )
    compiled = compile_cell(instance, cells()[0])
    convex = install_static_convex_extension(instance, compiled)
    geometry = convex.geometry
    equality = geometry.equality

    assert equality.clause_delta_sha256 == (
        "bca24367d5601a5870432b568848717ea50a0dcb703be03b74cefcfcbc799b83"
    )
    assert geometry.geometry_clause_delta_sha256 == (
        "dc07e3eff4dc21b32d38e4ca8e1225e90210db62ce306e615b01f969fa4bbb9b"
    )
    assert convex.convex_clause_delta_sha256 == (
        "49e6e5d5b8b4c68f7bccb0356d5bf38ce9ee25b0397fe555a00f9cddb2fbafa2"
    )
    assert convex.final_cnf_sha256 == (
        "0d4ab5fa17a63ef862533615eb534b0fb4be5892052788e2a47477e7bd250ff9"
    )
    assert _fingerprint(equality.clause_delta) == 10_004_392_367_492_018_646
    assert _fingerprint(geometry.geometry_clause_delta) == 10_820_571_695_514_393_194
    assert _fingerprint(convex.convex_clause_delta) == 11_366_858_212_019_136_139
