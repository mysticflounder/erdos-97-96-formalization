from __future__ import annotations

from pathlib import Path

import pytest
import validate_exact17_thirty_fifth_model_refinements_export as boundary

OLD_RAW_LABEL_SUFFIX: tuple[boundary.Clause, ...] = (
    (-307, -114, -108, -198, -192, -193, -97, -96, -90),
    (-307, -227, -233, -90, -96, -97, -193, -192, -198),
    (-308, -114, -108, -198, -192, -193, -97, -96, -90),
    (-308, -227, -233, -90, -96, -97, -193, -192, -198),
)


def authenticated_assignment() -> dict[int, bool]:
    return boundary.authenticated_model(
        Path(boundary.MODEL_PATH), boundary.PRODUCTION_SPEC
    )


def test_corrected_suffix_rejects_exact_authenticated_child35_model() -> None:
    assert boundary.require_motivating_model_cut(
        boundary.SUFFIX, authenticated_assignment()
    ) == (3,)


def test_old_raw_label_suffix_was_ineffective() -> None:
    assert (
        boundary.suffix_cut_indices(OLD_RAW_LABEL_SUFFIX, authenticated_assignment())
        == ()
    )


def test_publication_gate_rejects_no_op_suffix() -> None:
    all_false = {variable: False for variable in range(1, boundary.VARIABLES + 1)}
    with pytest.raises(ValueError, match="does not reject"):
        boundary.require_motivating_model_cut(boundary.SUFFIX, all_false)


def test_production_spec_rejects_substituted_artifact_pin() -> None:
    drifted = boundary.ExportSpec(child_sha256="0" * 64)
    with pytest.raises(ValueError, match="artifact pin drifted"):
        boundary.validate_spec(drifted)


def test_production_spec_rejects_substituted_source_pin() -> None:
    drifted = boundary.ExportSpec(lean_root_sha256="0" * 64)
    with pytest.raises(ValueError, match="source pin drifted"):
        boundary.validate_spec(drifted)
