PIQD deployment mismatch and coordinated restart notice

Read-only verification at 20:35 found that 127.0.0.1:7272 is still PID 94559,
started 18:03, serving executable identity adf4ad5e... and returning 404 for
`GET /evidence?limit=1`. The installed binary is the maintainer's new
0afcbcc5... build, but the running process has not been replaced.

Pre-restart state: 263 jobs (252 completed, 11 prepared, none running) and 33
sessions (29 closed, 3 detached, 1 live). The sole live session is exact17
`4876f14c-554d-4cce-9f1a-fb9a15f5dc53`, 4,286,333 clauses / 41 solves.

Per Adam's standing instruction to restart PIQD after version bumps, I am going
to use the daemon's graceful shutdown and restart the exact configured command.
I will report the new executable identity, `/evidence` status, and post-restart
job/session counts. The live session must come back detached/recoverable; no
solver request or automatic solve will be issued.

Proof-blueprint session 019fdf9c and anchor remain unchanged/open/off-spine.
