# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Tests for the Card Eleven promotion manifest-scope inventory policy."""

from __future__ import annotations

import json
import sys
from collections import Counter
from dataclasses import replace
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent))

import promote_card_eleven_unique_four_certificate as promotion

EXPECTED_FILE = promotion.DEST_ROOT / "Generated/Manifested.lean"
EXPECTED_PATHS = {EXPECTED_FILE, promotion.MANIFEST_PATH}
ALLOWED_ROOT = promotion.MANIFEST_SCOPE_EXCLUDED_ROOTS[0]
ALLOWED_SUPPORT_ROOT = promotion.MANIFEST_SCOPE_EXCLUDED_ROOTS[1]
ALLOWED_ADAPTER = promotion.MANIFEST_SCOPE_EXCLUDED_ROOTS[2]
INTERIOR_BISECTOR = (
    promotion.DEST_ROOT
    / "Support/UniqueRowProducer/card_five_interior_bisector_localization.lean"
)


def expected_directories() -> set[Path]:
    return promotion.inventory_directories(EXPECTED_PATHS)


def test_manifest_scope_constant_names_only_the_later_exact_five_package() -> None:
    assert promotion.MANIFEST_SCOPE_EXCLUDED_ROOTS == (
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


def test_support_amendments_pin_full_source_commit_shas() -> None:
    commits = {
        amendment.source_commit
        for amendment in promotion.MANIFEST_SCOPE_SUPPORT_AMENDMENTS.values()
    }
    assert commits == {
        "a0f73bc1ed1e7e57ec5ccc36fe7ca934ce1adaf6",
        "25271543e8558ccde737b55197a45e0fd7b4ba8c",
    }
    assert all(len(commit) == 40 for commit in commits)


@pytest.mark.parametrize("mode", ["--check", "--check-manifest-scope"])
def test_direct_checks_reject_duplicate_manifest_keys_without_traceback(
    mode: str,
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    capsys: pytest.CaptureFixture[str],
) -> None:
    repository = tmp_path / "repository"
    destination_root = Path("lean/Certificate")
    manifest_path = destination_root / "promotion-manifest.json"
    full_manifest = repository / manifest_path
    full_manifest.parent.mkdir(parents=True)
    full_manifest.write_text(
        '{"schema":"first","schema":"second"}', encoding="utf-8"
    )
    monkeypatch.setattr(promotion, "REPO_ROOT", repository)
    monkeypatch.setattr(promotion, "DEST_ROOT", destination_root)
    monkeypatch.setattr(promotion, "MANIFEST_PATH", manifest_path)

    with pytest.raises(SystemExit) as raised:
        promotion.main([mode])

    assert raised.value.code == 2
    captured = capsys.readouterr()
    assert "promotion manifest JSON contains duplicate key: schema" in captured.err
    assert "Traceback" not in captured.err


def test_duplicate_key_hook_rejects_nested_manifest_objects() -> None:
    with pytest.raises(
        promotion.PromotionError,
        match="promotion manifest JSON contains duplicate key: destination",
    ):
        json.loads(
            '{"files":[{"destination":"first","destination":"second"}]}',
            object_pairs_hook=promotion.reject_duplicate_json_keys,
        )


def test_replay_include_escape_is_a_fail_closed_promotion_error(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repository = tmp_path / "repository"
    source = Path("scratch/Replay.lean")
    full_source = repository / source
    full_source.parent.mkdir(parents=True)
    full_source.write_text(
        'def escaped := include_str "../../outside.bin"\n', encoding="utf-8"
    )
    monkeypatch.setattr(promotion, "REPO_ROOT", repository)

    with pytest.raises(
        promotion.PromotionError,
        match=(
            r"replay include path escapes repository from scratch/Replay\.lean: "
            r"\.\./\.\./outside\.bin"
        ),
    ) as raised:
        promotion.validate_replay_asset_references(
            [source],
            {source: Path("Generated/Replay.lean")},
            [],
        )

    assert raised.value.__suppress_context__


def test_strict_inventory_rejects_an_extra_file() -> None:
    extra = promotion.DEST_ROOT / "Generated/extra.bin"
    drift = promotion.partition_inventory_drift(
        EXPECTED_PATHS,
        EXPECTED_PATHS | {extra},
        expected_directories(),
    )

    assert drift.failures == (f"unexpected {extra.as_posix()}",)
    assert drift.excluded_extra_files == ()
    assert drift.excluded_extra_directories == ()


def test_scoped_inventory_accepts_only_rooted_descendants() -> None:
    nested = ALLOWED_ROOT / "nested"
    extra_files = {ALLOWED_ROOT / "Root.lean", nested / "asset.bin"}
    extra_directories = {ALLOWED_ROOT, nested}
    drift = promotion.partition_inventory_drift(
        EXPECTED_PATHS,
        EXPECTED_PATHS | extra_files,
        expected_directories() | extra_directories,
        allowed_extra_roots=(ALLOWED_ROOT,),
    )

    assert drift.failures == ()
    assert set(drift.excluded_extra_files) == extra_files
    assert set(drift.excluded_extra_directories) == extra_directories


def test_scoped_inventory_accepts_the_exact_adapter_file() -> None:
    drift = promotion.partition_inventory_drift(
        EXPECTED_PATHS,
        EXPECTED_PATHS | {ALLOWED_ADAPTER},
        expected_directories(),
        allowed_extra_roots=promotion.MANIFEST_SCOPE_EXCLUDED_ROOTS,
    )

    assert drift.failures == ()
    assert drift.excluded_extra_files == (ALLOWED_ADAPTER,)


@pytest.mark.parametrize("suffix", ["Sibling", "-prefix-trick"])
def test_scoped_inventory_rejects_root_prefix_tricks(suffix: str) -> None:
    sibling = ALLOWED_ROOT.with_name(f"{ALLOWED_ROOT.name}{suffix}")
    extra = sibling / "payload.bin"
    drift = promotion.partition_inventory_drift(
        EXPECTED_PATHS,
        EXPECTED_PATHS | {extra},
        expected_directories() | {sibling},
        allowed_extra_roots=(ALLOWED_ROOT,),
    )

    assert f"unexpected {extra.as_posix()}" in drift.failures
    assert f"unexpected directory {sibling.as_posix()}" in drift.failures
    assert drift.excluded_extra_files == ()
    assert drift.excluded_extra_directories == ()


def test_scoped_inventory_never_excludes_a_missing_expected_path() -> None:
    extra = ALLOWED_ROOT / "payload.bin"
    drift = promotion.partition_inventory_drift(
        EXPECTED_PATHS,
        {promotion.MANIFEST_PATH, extra},
        expected_directories() | {ALLOWED_ROOT},
        allowed_extra_roots=(ALLOWED_ROOT,),
    )

    assert f"missing {EXPECTED_FILE.as_posix()}" in drift.failures
    assert drift.excluded_extra_files == (extra,)


def test_scoped_inventory_never_excludes_a_missing_expected_directory() -> None:
    generated = EXPECTED_FILE.parent
    drift = promotion.partition_inventory_drift(
        EXPECTED_PATHS,
        EXPECTED_PATHS,
        expected_directories() - {generated},
        allowed_extra_roots=promotion.MANIFEST_SCOPE_EXCLUDED_ROOTS,
    )

    assert f"missing directory {generated.as_posix()}" in drift.failures


@pytest.mark.parametrize(
    ("root", "message"),
    [
        (Path("/absolute/root"), "repository-relative"),
        (promotion.DEST_ROOT, "strict descendant"),
        (promotion.DEST_ROOT / "../outside", "repository-relative"),
        (Path("lean/Erdos9796Proof/P97/ATail/Elsewhere"), "outside"),
        (EXPECTED_FILE.parent, "overlaps expected manifest path"),
        (EXPECTED_FILE, "overlaps expected manifest path"),
        (EXPECTED_FILE / "nested", "overlaps expected manifest path"),
    ],
)
def test_invalid_outside_and_manifest_overlapping_roots_are_rejected(
    root: Path, message: str
) -> None:
    with pytest.raises(promotion.PromotionError, match=message):
        promotion.validate_allowed_extra_roots((root,), EXPECTED_PATHS)


def test_overlapping_allowed_roots_are_rejected() -> None:
    with pytest.raises(promotion.PromotionError, match="overlaps allowed extra root"):
        promotion.validate_allowed_extra_roots(
            (ALLOWED_ROOT, ALLOWED_ROOT / "nested"), EXPECTED_PATHS
        )


def interior_manifest_records() -> dict[Path, tuple[str, str, int, int]]:
    amendment = promotion.MANIFEST_SCOPE_SUPPORT_AMENDMENTS[INTERIOR_BISECTOR]
    return {
        INTERIOR_BISECTOR: (
            amendment.manifest_sha256,
            "Example.InteriorBisector",
            4,
            1,
        )
    }


def test_support_amendment_rejects_the_wrong_recorded_hash() -> None:
    amendment = promotion.MANIFEST_SCOPE_SUPPORT_AMENDMENTS[INTERIOR_BISECTOR]
    wrong = replace(amendment, manifest_sha256="0" * 64)
    with pytest.raises(promotion.PromotionError, match="does not match the manifest"):
        promotion.validate_manifest_scope_support_amendments(
            {INTERIOR_BISECTOR: wrong}, interior_manifest_records()
        )


def test_support_amendment_rejects_the_wrong_current_hash() -> None:
    amendment = promotion.MANIFEST_SCOPE_SUPPORT_AMENDMENTS[INTERIOR_BISECTOR]
    validated = promotion.validate_manifest_scope_support_amendments(
        {INTERIOR_BISECTOR: amendment}, interior_manifest_records()
    )
    with pytest.raises(promotion.PromotionError, match="current digest mismatch"):
        promotion.match_manifest_scope_support_amendment(
            INTERIOR_BISECTOR,
            amendment.manifest_sha256,
            "f" * 64,
            validated,
        )


def test_unlisted_digest_drift_is_rejected() -> None:
    amendment = promotion.MANIFEST_SCOPE_SUPPORT_AMENDMENTS[INTERIOR_BISECTOR]
    with pytest.raises(promotion.PromotionError, match="digest mismatch"):
        promotion.match_manifest_scope_support_amendment(
            INTERIOR_BISECTOR,
            amendment.manifest_sha256,
            amendment.current_sha256,
            {},
        )


def test_support_amendment_applies_exact_external_counter_adjustment() -> None:
    amendment = promotion.MANIFEST_SCOPE_SUPPORT_AMENDMENTS[INTERIOR_BISECTOR]
    records = interior_manifest_records()
    validated = promotion.validate_manifest_scope_support_amendments(
        {INTERIOR_BISECTOR: amendment}, records
    )
    resolution = Counter(
        {"preexisting-external": 35, "same-directory-internal": 4045}
    )
    external = Counter(
        {
            "Erdos9796Proof.P97.CapSelectedRowCounting": 2,
            "Example.OtherExternal": 33,
        }
    )

    adjusted_resolution, adjusted_external = (
        promotion.adjusted_manifest_scope_import_counters(
            resolution, external, records, validated
        )
    )

    assert adjusted_resolution == Counter(
        {"preexisting-external": 34, "same-directory-internal": 4045}
    )
    assert adjusted_external == Counter(
        {
            "Erdos9796Proof.P97.CapSelectedRowCounting": 1,
            "Example.OtherExternal": 33,
        }
    )
    assert sum(adjusted_resolution.values()) == sum(resolution.values()) - 1


def check_summary(*, scoped: bool) -> dict[str, object]:
    summary: dict[str, object] = {
        "promoted": 2061,
        "split": {"generated": 1},
        "imports": 7,
        "internal_rewrites": 5,
        "preexisting_external": 2,
        "assets": 1656,
        "asset_bytes": 1234,
    }
    if scoped:
        summary.update(
            {
                "excluded_extra_files": 700,
                "excluded_extra_directories": 76,
                "allowed_extra_roots": [ALLOWED_ROOT.as_posix()],
                "support_amendments": (
                    promotion.manifest_scope_support_amendment_summary(
                        promotion.MANIFEST_SCOPE_SUPPORT_AMENDMENTS
                    )
                ),
            }
        )
    return summary


def test_manifest_scope_cli_dispatches_only_the_declared_root(
    monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]
) -> None:
    calls: list[
        tuple[
            tuple[Path, ...],
            dict[Path, promotion.ManifestScopeSupportAmendment] | None,
        ]
    ] = []

    def fake_check(
        *,
        allowed_extra_roots: tuple[Path, ...] = (),
        support_amendments: (
            dict[Path, promotion.ManifestScopeSupportAmendment] | None
        ) = None,
    ) -> dict[str, object]:
        calls.append((allowed_extra_roots, support_amendments))
        return check_summary(scoped=True)

    monkeypatch.setattr(promotion, "check_installed_promotion", fake_check)
    promotion.main(["--check-manifest-scope"])

    assert calls == [
        (
            promotion.MANIFEST_SCOPE_EXCLUDED_ROOTS,
            promotion.MANIFEST_SCOPE_SUPPORT_AMENDMENTS,
        )
    ]
    output = capsys.readouterr().out
    assert "promoted=2061" in output
    assert "assets=1656" in output
    assert "asset_bytes=1234" in output
    assert "excluded_extra_files=700" in output
    assert "excluded_extra_directories=76" in output
    assert ALLOWED_ROOT.as_posix() in output
    assert (
        '"source_commit": "a0f73bc1ed1e7e57ec5ccc36fe7ca934ce1adaf6"'
        in output
    )
    assert (
        '"source_commit": "25271543e8558ccde737b55197a45e0fd7b4ba8c"'
        in output
    )


def test_strict_check_cli_keeps_the_unscoped_dispatch(
    monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]
) -> None:
    calls: list[
        tuple[
            tuple[Path, ...],
            dict[Path, promotion.ManifestScopeSupportAmendment] | None,
        ]
    ] = []

    def fake_check(
        *,
        allowed_extra_roots: tuple[Path, ...] = (),
        support_amendments: (
            dict[Path, promotion.ManifestScopeSupportAmendment] | None
        ) = None,
    ) -> dict[str, object]:
        calls.append((allowed_extra_roots, support_amendments))
        return check_summary(scoped=False)

    monkeypatch.setattr(promotion, "check_installed_promotion", fake_check)
    promotion.main(["--check"])

    assert calls == [((), None)]
    output = capsys.readouterr().out
    assert "excluded_extra_files" not in output
    assert "allowed_extra_roots" not in output
