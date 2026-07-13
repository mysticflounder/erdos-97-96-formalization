"""CPU-budgeted subprocess execution for Census-554 certification.

This standalone worker copy must remain byte-identical in behavior to the
main Census-554 runtime.
"""

from __future__ import annotations

import math
import resource
import signal
import subprocess
import time
from dataclasses import dataclass


@dataclass(frozen=True)
class BudgetRunResult:
    completed: subprocess.CompletedProcess | None
    cpu_seconds: float
    wall_seconds: float
    reason: str


class CpuBudget:
    def __init__(self, limit_seconds: float, *, wall_multiplier: float = 12.0,
                 wall_floor_seconds: float = 120.0):
        if limit_seconds <= 0:
            raise ValueError("CPU budget must be positive")
        self.limit_seconds = float(limit_seconds)
        self.wall_multiplier = float(wall_multiplier)
        self.wall_floor_seconds = float(wall_floor_seconds)
        self._self_started = time.process_time()
        self._child_started = self._child_cpu()
        self._forced_exhausted = False
        self.wall_guard_tripped = False

    @staticmethod
    def _child_cpu() -> float:
        usage = resource.getrusage(resource.RUSAGE_CHILDREN)
        return float(usage.ru_utime + usage.ru_stime)

    @property
    def self_cpu_seconds(self) -> float:
        return max(0.0, time.process_time() - self._self_started)

    @property
    def child_cpu_seconds(self) -> float:
        return max(0.0, self._child_cpu() - self._child_started)

    @property
    def consumed_seconds(self) -> float:
        return self.self_cpu_seconds + self.child_cpu_seconds

    @property
    def remaining_seconds(self) -> float:
        return max(0.0, self.limit_seconds - self.consumed_seconds)

    @property
    def exhausted(self) -> bool:
        return self._forced_exhausted or self.remaining_seconds <= 0.0

    def snapshot(self) -> dict:
        return {"cpu_budget_seconds": self.limit_seconds,
                "cpu_seconds": self.consumed_seconds,
                "self_cpu_seconds": self.self_cpu_seconds,
                "child_cpu_seconds": self.child_cpu_seconds,
                "cpu_budget_exhausted": self.exhausted,
                "wall_guard_tripped": self.wall_guard_tripped}

    @staticmethod
    def _limit_child_cpu(seconds: float):
        soft = max(1, int(math.ceil(seconds)))
        hard = soft + 1

        def apply_limit():
            resource.setrlimit(resource.RLIMIT_CPU, (soft, hard))

        return apply_limit

    def run(self, args, *, cpu_slice_seconds: float | None = None,
            wall_timeout_seconds: float | None = None, **kwargs):
        remaining = self.remaining_seconds
        if remaining <= 0:
            self._forced_exhausted = True
            return BudgetRunResult(None, 0.0, 0.0, "budget-exhausted")
        child_limit = remaining
        if cpu_slice_seconds is not None:
            if cpu_slice_seconds <= 0:
                raise ValueError("CPU slice must be positive")
            child_limit = min(child_limit, float(cpu_slice_seconds))
        if wall_timeout_seconds is None:
            wall_timeout_seconds = max(self.wall_floor_seconds,
                                       child_limit * self.wall_multiplier)
        child_before = self._child_cpu()
        wall_started = time.monotonic()
        completed = None
        reason = "completed"
        try:
            completed = subprocess.run(
                args, timeout=wall_timeout_seconds,
                preexec_fn=self._limit_child_cpu(child_limit), **kwargs)
            if completed.returncode in (
                -getattr(signal, "SIGXCPU", signal.SIGKILL), -signal.SIGKILL
            ):
                reason = "cpu-limit"
        except subprocess.TimeoutExpired:
            self.wall_guard_tripped = True
            reason = "wall-guard"
        child_used = max(0.0, self._child_cpu() - child_before)
        wall_used = time.monotonic() - wall_started
        if reason == "cpu-limit" and child_limit >= remaining - 1e-9:
            self._forced_exhausted = True
            reason = "budget-exhausted"
        elif self.remaining_seconds <= 0:
            self._forced_exhausted = True
            reason = "budget-exhausted"
        return BudgetRunResult(completed, child_used, wall_used, reason)
