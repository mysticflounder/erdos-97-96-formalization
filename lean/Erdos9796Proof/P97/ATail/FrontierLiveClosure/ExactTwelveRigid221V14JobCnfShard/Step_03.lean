/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnfShard.Step03.SourceOne
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnfShard.Step03.SourceTwo
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnfShard.Step03.SourceThree
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnfShard.Step03.SourceFour

/-!
# Source-wise Sinz satisfaction for normalized-v14 jobs

This coordinator assembles the four nonzero source-block proofs.  Each proof
lives in a bounded helper module so Lean does not normalize all five concrete
auxiliary-variable layouts in one elaboration process.
-/
