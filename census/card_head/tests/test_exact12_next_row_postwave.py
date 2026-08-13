from __future__ import annotations

import os
from pathlib import Path

import pytest

from census.card_head.exact12_next_row_postwave import (
    Exact12NextRowPostwaveError,
    _assert_directory,
    _positive_assignment,
    _read_bytes,
)


def test_read_bytes_rejects_symlinked_file(tmp_path: Path) -> None:
    target = tmp_path / "target"
    target.write_bytes(b"payload")
    link = tmp_path / "artifact"
    link.symlink_to(target)

    with pytest.raises(Exact12NextRowPostwaveError, match="symlink"):
        _read_bytes(link)


def test_read_bytes_rejects_symlinked_ancestor(tmp_path: Path) -> None:
    real = tmp_path / "real"
    real.mkdir()
    (real / "artifact").write_bytes(b"payload")
    alias = tmp_path / "alias"
    alias.symlink_to(real, target_is_directory=True)

    with pytest.raises(Exact12NextRowPostwaveError, match="symlink"):
        _read_bytes(alias / "artifact")


def test_read_bytes_rejects_hardlink_and_group_mutable_file(tmp_path: Path) -> None:
    target = tmp_path / "target"
    target.write_bytes(b"payload")
    alias = tmp_path / "alias"
    os.link(target, alias)
    with pytest.raises(Exact12NextRowPostwaveError, match="hard-linked"):
        _read_bytes(alias)

    target.unlink()
    target.write_bytes(b"payload")
    os.chmod(target, 0o666)
    with pytest.raises(Exact12NextRowPostwaveError, match="mutable"):
        _read_bytes(target)


def test_assert_directory_requires_private_workdir_mode(tmp_path: Path) -> None:
    workdir = tmp_path / "wave"
    workdir.mkdir()
    os.chmod(workdir, 0o755)

    with pytest.raises(Exact12NextRowPostwaveError, match="0700"):
        _assert_directory(workdir, private=True)


@pytest.mark.parametrize("value", [True, [0], [1, 1], [1, "2"]])
def test_positive_assignment_rejects_noncanonical_values(value: object) -> None:
    with pytest.raises(Exact12NextRowPostwaveError, match="positive assignment"):
        _positive_assignment({"positive_variables": value})
