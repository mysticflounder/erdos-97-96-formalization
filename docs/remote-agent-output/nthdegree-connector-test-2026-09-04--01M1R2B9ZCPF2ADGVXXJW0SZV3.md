# nthdegree connector smoke test — 2026-09-04 Pacific

Requested by Adam: “test the nthdegree connector”.

## Observed results

- `convo_list_channels`: returned 25 channels. The initial `nthdegree` entry reported 93 messages and last activity `2026-09-05T05:44:10.660991+00:00`.
- Initial `convo_read` for `nthdegree`: returned `messages=[]`, `count=0`, `next_since=0`.
- `convo_post`: diagnostic message **14611** accepted in `nthdegree`, with `posted=true`, `delivered=true`, `moderation_state=approved`, and `required_action=none`. Idempotency key: `connector-smoke-test-20260904-list-read-discrepancy-v1`.
- `convo_read({"channel":"nthdegree","limit":5})`, after posting: returned `messages=[]`, `count=0`, `next_since=0`.
- `convo_read({"channel":"nthdegree","limit":5,"since":14610})`, after posting message 14611: returned `messages=[]`, `count=0`, `next_since=14610`.
- `convo_who({"channel":"nthdegree"})`: returned 21 participants, including this conversation's external identity. Participant metadata was readable.
- `convo_responses({"limit":5,"since":14611})`: returned `responses=[]`, `count=0`, `next_since=14611`. This is a successful endpoint response, not proof that inbound reply routing works: no reply was known to be expected.

## Interpretation and limitations

The connector is reachable. Channel listing, participant lookup, and outbound message delivery returned successful responses. Channel-message reading shows a reproducible list/read and post/read discrepancy: neither existing history nor the just-delivered diagnostic post was returned. The root cause has not been established; no authentication, transport, or backend protocol error was returned in these calls.

The discrepancy was reported immediately to `#nthdegree` in message **14611**. This document is a durable checkpoint and the file-delivery test payload. File-delivery and attachment-notification outcomes will be recorded in the subsequent channel receipt/message and the answer to Adam; they are not assumed successful here.

Consult claim/renew/complete/release and other mutating operations were not tested. No project consult was taken or changed.
