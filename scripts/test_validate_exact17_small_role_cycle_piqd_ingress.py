"""Focused fail-closed tests for the small-role-cycle PIQD ingress."""

from __future__ import annotations

import os
from dataclasses import replace
from pathlib import Path
from types import SimpleNamespace

import pytest
import validate_exact17_small_role_cycle_piqd_ingress as subject


def test_production_ingress_replays_and_binds_every_published_identity() -> None:
    report = subject.validate_ingress()

    assert report["status"] == "PASS"
    assert subject.export_validator.CHILD_SHA256 == (
        "4c47a61712cd4c1d465ea7984189e938b5a2422553adc3e962b7209ee285430d"
    )
    assert report["dimacs"] == {
        "path": str(subject.PRODUCTION_INGRESS_PATHS.child.resolve()),
        "sha256": subject.export_validator.CHILD_SHA256,
        "bytes": 338_644_740,
        "variables": 308,
        "clauses": 7_198_388,
    }
    assert report["export_receipt"]["sha256"] == subject.RECEIPT_SHA256
    assert subject.RECEIPT_SHA256 == (
        "40fd89e9f15cd3785d6b4ba32e3ff34d71cb1d2d0f431e9ff8d6e0eacd154bea"
    )
    assert subject.COVERAGE_LEDGER_SHA256 == (
        "1680474cbf526d55f7d2a7e191450dd9db72c599dc0f08148034e917cc77cd91"
    )
    assert subject.AUDIT_REPORT_SHA256 == (
        "aa4dee01befb776f62ed76340050bf51c02bdb449718cd27cd425bee64fcde21"
    )
    assert subject.VALIDATOR_SOURCE_COMMIT == "fef0b6d8e62ff78466e18f93069fef102bb6efc1"
    assert subject.PUBLISHER_SOURCE_COMMIT == "b08ffa990154be39546350683eda2c38ec567706"
    assert subject.PACKAGE_INGRESS_SOURCE_COMMIT == (
        "068fb1ad48ba39e77da5484394e513dbc77b644f"
    )
    assert report["package_ingress"]["sha256"] == subject.PACKAGE_INGRESS_SHA256
    assert report["package_ingress"]["result"] == subject._expected_package_ingress(
        subject.PRODUCTION_INGRESS_PATHS, subject.PRODUCTION_INGRESS_SPEC
    )
    assert report["publisher"]["sha256"] == subject.PUBLISHER_SHA256
    assert report["validator"]["sha256"] == subject.VALIDATOR_SHA256
    assert report["lean"]["root"]["sha256"] == subject.export_validator.LEAN_ROOT_SHA256
    assert (
        report["lean"]["export"]["sha256"]
        == subject.export_validator.LEAN_EXPORT_SHA256
    )
    assert report["variable_map"]["sha256"] == subject.VARIABLE_MAP_SHA256
    assert report["piqd"]["timeout_s"] == 3_600
    assert report["piqd"]["requested_core_limit"] == 1
    assert report["piqd"]["maximum_requested_core_limit"] == 12
    assert report["piqd"]["unsat_certified_without_proof_replay"] is False


def test_explicit_receipt_pin_mismatch_fails_before_launch() -> None:
    with pytest.raises(
        subject.IngressValidationError, match="manifest pin arguments disagree"
    ):
        subject.validate_ingress(expected_manifest_sha256="0" * 64)


def test_any_production_identity_change_marks_spec_unprovisioned() -> None:
    changed_export = replace(subject.PRODUCTION_EXPORT_SPEC, child_bytes=1)
    changed_ingress = replace(subject.PRODUCTION_INGRESS_SPEC, export=changed_export)

    assert not changed_export.provisioned
    assert not changed_ingress.provisioned
    with pytest.raises(subject.IngressValidationError, match="unprovisioned"):
        subject.validate_ingress(spec=changed_ingress)


def test_receipt_must_itself_be_the_piqd_manifest(tmp_path: Path) -> None:
    paths = replace(
        subject.PRODUCTION_INGRESS_PATHS,
        manifest=tmp_path / "derived-manifest.json",
    )
    with pytest.raises(subject.IngressValidationError, match="receipt itself"):
        subject.validate_ingress(paths)


def test_wrong_package_ingress_result_fails_closed(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    wrong = subject._expected_package_ingress(
        subject.PRODUCTION_INGRESS_PATHS, subject.PRODUCTION_INGRESS_SPEC
    )
    wrong = {**wrong, "status": "FAIL"}
    monkeypatch.setattr(subject.package_ingress_gate, "validate_ingress", lambda: wrong)

    with pytest.raises(subject.IngressValidationError, match="exact authorized PASS"):
        subject.validate_ingress()


def test_strict_json_rejects_duplicate_keys_and_nonfinite_constants() -> None:
    with pytest.raises(subject.IngressValidationError, match="duplicate JSON key"):
        subject._strict_json(b'{"schema":1,"schema":2}', "fixture")
    with pytest.raises(subject.IngressValidationError, match="invalid constant"):
        subject._strict_json(b'{"value":NaN}', "fixture")


def test_nofollow_reader_rejects_symlinked_parent(tmp_path: Path) -> None:
    target = tmp_path / "target"
    target.mkdir()
    (target / "receipt.json").write_text("{}", encoding="utf-8")
    link = tmp_path / "link"
    link.symlink_to(target, target_is_directory=True)

    with pytest.raises(
        subject.IngressValidationError, match="not a directory component"
    ):
        subject._read_bound(
            link / "receipt.json",
            subject.FileBinding("0" * 64, 2),
            "fixture",
        )


def test_normal_ingress_artifact_rejects_hardlinks(tmp_path: Path) -> None:
    first = tmp_path / "first"
    second = tmp_path / "second"
    first.write_bytes(b"bound")
    second.hardlink_to(first)
    binding = subject.FileBinding(
        __import__("hashlib").sha256(b"bound").hexdigest(),
        5,
    )

    with pytest.raises(subject.IngressValidationError, match="link count drifted"):
        subject._attest(first, binding, "fixture")


def test_daemon_receipt_link_count_is_pinned_exactly(tmp_path: Path) -> None:
    first = tmp_path / "first"
    first.write_bytes(b"daemon receipt")
    (tmp_path / "second").hardlink_to(first)
    (tmp_path / "third").hardlink_to(first)

    assert subject.DAEMON_BUILD_RECEIPT_LINKS == 3
    stream, info = subject._open_regular_nofollow(first, expected_links=3)
    try:
        assert info.st_nlink == 3
        assert stream.read() == b"daemon receipt"
    finally:
        stream.close()
    with pytest.raises(subject.IngressValidationError, match="link count drifted"):
        subject._open_regular_nofollow(first, expected_links=2)


@pytest.mark.parametrize("flag", ("O_DIRECTORY", "O_NOFOLLOW", "O_CLOEXEC"))
def test_required_open_flag_absence_prevents_any_open(
    monkeypatch: pytest.MonkeyPatch, flag: str
) -> None:
    calls = 0

    def forbidden_open(*_args: object, **_kwargs: object) -> int:
        nonlocal calls
        calls += 1
        raise AssertionError("os.open must not run without every required flag")

    monkeypatch.delattr(subject.os, flag, raising=False)
    monkeypatch.setattr(subject.os, "open", forbidden_open)
    with pytest.raises(subject.IngressValidationError, match=flag):
        subject._open_regular_nofollow(Path("/flag-check/file"))
    assert calls == 0


@pytest.mark.parametrize("bad", (0, None, True, "flag"))
def test_required_open_flag_must_be_a_nonzero_builtin_int(bad: object) -> None:
    with pytest.MonkeyPatch.context() as monkeypatch:
        monkeypatch.setattr(subject.os, "O_NOFOLLOW", bad)
        with pytest.raises(subject.IngressValidationError, match="O_NOFOLLOW"):
            subject._required_open_flag("O_NOFOLLOW")


def test_zero_valued_o_rdonly_is_permitted(monkeypatch: pytest.MonkeyPatch) -> None:
    opened = 0

    def observed_open(*_args: object, **_kwargs: object) -> int:
        nonlocal opened
        opened += 1
        raise OSError("sentinel")

    monkeypatch.setattr(subject.os, "O_RDONLY", 0)
    monkeypatch.setattr(subject.os, "open", observed_open)
    with pytest.raises(subject.IngressValidationError, match="cannot open"):
        subject._open_regular_nofollow(Path("/flag-check/file"))
    assert opened == 1


def test_interchanged_directory_component_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    first = tmp_path / "first"
    second = tmp_path / "second"
    first.mkdir()
    second.mkdir()
    target = first / "payload"
    target.write_bytes(b"bound")
    original_stat = subject.os.stat

    def swapped_stat(path: object, *args: object, **kwargs: object) -> os.stat_result:
        if path == "first" and kwargs.get("dir_fd") is not None:
            return original_stat("second", *args, **kwargs)
        return original_stat(path, *args, **kwargs)

    monkeypatch.setattr(subject.os, "stat", swapped_stat)
    with pytest.raises(subject.IngressValidationError, match="component changed"):
        subject._open_regular_nofollow(target)


def test_post_stat_directory_swap_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    directory = tmp_path / "held-component"
    directory.mkdir()
    target = directory / "payload"
    target.write_bytes(b"bound")
    original_stat = subject.os.stat
    component_calls = 0

    def post_swap_stat(
        path: object, *args: object, **kwargs: object
    ) -> os.stat_result | SimpleNamespace:
        nonlocal component_calls
        result = original_stat(path, *args, **kwargs)
        if path == "held-component" and kwargs.get("dir_fd") is not None:
            component_calls += 1
            if component_calls == 2:
                return SimpleNamespace(
                    st_dev=result.st_dev,
                    st_ino=result.st_ino + 1,
                    st_mode=result.st_mode,
                    st_nlink=result.st_nlink,
                )
        return result

    monkeypatch.setattr(subject.os, "stat", post_swap_stat)
    with pytest.raises(subject.IngressValidationError, match="component changed"):
        subject._open_regular_nofollow(target)


def test_non_directory_component_and_non_regular_final_are_rejected(
    tmp_path: Path,
) -> None:
    component = tmp_path / "component"
    component.write_bytes(b"not a directory")
    with pytest.raises(subject.IngressValidationError, match="not a directory"):
        subject._open_regular_nofollow(component / "payload")

    final_directory = tmp_path / "final-directory"
    final_directory.mkdir()
    with pytest.raises(subject.IngressValidationError, match="not a regular file"):
        subject._open_regular_nofollow(final_directory)


def test_open_failure_after_all_descriptors_are_acquired_leaks_no_fds(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    directory = tmp_path / "nested"
    directory.mkdir()
    target = directory / "payload"
    target.write_bytes(b"bound")
    baseline = len(os.listdir("/dev/fd"))

    def fail_fdopen(*_args: object, **_kwargs: object) -> object:
        raise OSError("forced fdopen failure")

    monkeypatch.setattr(subject.os, "fdopen", fail_fdopen)
    for _ in range(8):
        with pytest.raises(subject.IngressValidationError, match="cannot open"):
            subject._open_regular_nofollow(target)
    assert len(os.listdir("/dev/fd")) == baseline


def test_cleanup_attempts_every_fd_and_preserves_active_error(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    closed: list[int] = []

    def failing_close(descriptor: int) -> None:
        closed.append(descriptor)
        if descriptor == 2:
            raise OSError("forced close failure")

    monkeypatch.setattr(subject.os, "close", failing_close)
    with pytest.raises(RuntimeError, match="original custody failure"):
        try:
            raise RuntimeError("original custody failure")
        finally:
            subject._close_fds_best_effort([1, 2, 3])
    assert closed == [1, 2, 3]
