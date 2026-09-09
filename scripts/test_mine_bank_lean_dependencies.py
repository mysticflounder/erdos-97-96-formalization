from __future__ import annotations

import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent))

import mine_bank_lean_dependencies as subject


def test_mine_uses_governed_probe(monkeypatch: pytest.MonkeyPatch, tmp_path: Path) -> None:
    seen: dict[str, object] = {}

    def fake_probe(**kwargs: object):
        seen.update(kwargs)
        return type(
            "Result",
            (),
            {
                "output": "ROOTDECLS 1\nDECLARATIONS 2\nMOD Erdos9796Proof.Fake\n",
                "probe_path": str(tmp_path / "Probe.lean"),
            },
        )()

    monkeypatch.setattr(subject, "run_probe", fake_probe)
    result = subject.mine(("Erdos9796Proof.Fake",), probe_run_root=tmp_path, timeout=17)
    assert result == ("Erdos9796Proof.Fake",)
    assert seen["run_root"] == tmp_path
    assert seen["timeout"] == 17
    assert "lake env lean" not in Path(subject.__file__).read_text(encoding="utf-8")


def test_mine_normalizes_positioned_lake_messages(monkeypatch: pytest.MonkeyPatch, tmp_path: Path) -> None:
    probe = tmp_path / "Probe.lean"
    output = (
        "info: Probe.lean:10:0: ROOTDECLS 1\n"
        "info: Probe.lean:11:0: DECLARATIONS 2\n"
        "info: Probe.lean:12:0: MOD Erdos9796Proof.Fake\n"
    )

    monkeypatch.setattr(
        subject,
        "run_probe",
        lambda **_kwargs: type("Result", (), {"output": output, "probe_path": str(probe)})(),
    )
    assert subject.mine(("Erdos9796Proof.Fake",), probe_run_root=tmp_path) == (
        "Erdos9796Proof.Fake",
    )
