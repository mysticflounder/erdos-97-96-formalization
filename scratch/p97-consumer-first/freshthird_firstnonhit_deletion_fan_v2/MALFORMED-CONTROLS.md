# Malformed controls (not executed)

The duplicate gate fires before a solver artifact is legal.  The following
controls are recorded so a future connected quotient cannot silently accept
the known bad relaxations; all are **NOT RUN** in v2.

| Control | Intended contradiction | Why it is malformed now |
|---|---|---|
| `detached_anchor_Q_identification` | Assert `p1= q0` or `p2=q1` and use the retained arm | No source theorem identifies a retained P-source with a Q-source |
| `invented_anchor_Q_overlap` | Assert a retained anchor shell shares three Q-shell points | No retained-fan clause mentions Q's selected shell |
| `unblocked_overlap_three` | Feed a three-point overlap directly to the blocked-deletions consumer | The consumer requires an explicit blocked subset and per-point deletion failures |
| `same-blocker-as-Q` | Assert a retained anchor's actual blocker equals Q's actual blocker | The fan pair only proves the two fan centers differ from each other |

None of these controls is a valid source-faithful UNSAT test.  Adding any of
them would turn the duplicate gate into an invented bridge.
