(set-logic QF_NRA)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun v1y () Real)
(declare-fun oy () Real)
(declare-fun v1x () Real)
(declare-fun R2 () Real)
(declare-fun xy () Real)
(declare-fun xx () Real)
(declare-fun rho2 () Real)
(declare-fun b1y () Real)
(declare-fun b1x () Real)
(declare-fun b2y () Real)
(declare-fun b2x () Real)
(declare-fun b3y () Real)
(declare-fun b3x () Real)
(assert
 (let ((?x217 (* (- 1.0) v1x)))
 (let ((?x441 (* (- 1.0) R2)))
 (let ((?x218 (+ (+ (+ (+ (/ 1.0 4.0) (* oy oy)) (* v1x v1x)) (* v1y v1y)) ?x441)))
 (= (+ (+ ?x218 ?x217) (* (* (- 2.0) oy) v1y)) 0.0)))))
(assert
 (= (+ (+ (/ 1.0 4.0) (* oy oy)) (* (- 1.0) R2)) 0.0))
(assert
 (let ((?x354 (* (- 1.0) rho2)))
 (let ((?x305 (* xy xy)))
 (let ((?x198 (+ (+ (+ (+ (* v1x v1x) (* v1y v1y)) (* xx xx)) ?x305) ?x354)))
 (= (+ (+ ?x198 (* (* (- 2.0) v1x) xx)) (* (* (- 2.0) v1y) xy)) 0.0)))))
(assert
 (let ((?x354 (* (- 1.0) rho2)))
 (let ((?x305 (* xy xy)))
 (let ((?x357 (+ (+ (+ (+ (* b1x b1x) (* b1y b1y)) (* xx xx)) ?x305) ?x354)))
 (= (+ (+ ?x357 (* (* (- 2.0) b1x) xx)) (* (* (- 2.0) b1y) xy)) 0.0)))))
(assert
 (let ((?x354 (* (- 1.0) rho2)))
 (let ((?x305 (* xy xy)))
 (let ((?x160 (+ (+ (+ (+ (* b2x b2x) (* b2y b2y)) (* xx xx)) ?x305) ?x354)))
 (= (+ (+ ?x160 (* (* (- 2.0) b2x) xx)) (* (* (- 2.0) b2y) xy)) 0.0)))))
(assert
 (let ((?x354 (* (- 1.0) rho2)))
 (let ((?x305 (* xy xy)))
 (let ((?x322 (+ (+ (+ (+ (* b3x b3x) (* b3y b3y)) (* xx xx)) ?x305) ?x354)))
 (= (+ (+ ?x322 (* (* (- 2.0) b3x) xx)) (* (* (- 2.0) b3y) xy)) 0.0)))))
(assert
 (let ((?x302 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) xx) (* (- 1.0) (* oy oy))) (* (- 1.0) (* xx xx)))))
 (>= (+ (+ ?x302 (* (- 1.0) (* xy xy))) (* (* 2.0 oy) xy)) 0.0)))
(assert
 (let ((?x260 (* oy oy)))
 (let ((?x288 (* (- 1.0) ?x260)))
 (let ((?x139 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b1x) (* (- 1.0) (* b1x b1x))) (* (- 1.0) (* b1y b1y)))))
 (>= (+ (+ ?x139 ?x288) (* (* 2.0 b1y) oy)) 0.0)))))
(assert
 (let ((?x260 (* oy oy)))
 (let ((?x288 (* (- 1.0) ?x260)))
 (let ((?x247 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b2x) (* (- 1.0) (* b2x b2x))) (* (- 1.0) (* b2y b2y)))))
 (>= (+ (+ ?x247 ?x288) (* (* 2.0 b2y) oy)) 0.0)))))
(assert
 (let ((?x260 (* oy oy)))
 (let ((?x288 (* (- 1.0) ?x260)))
 (let ((?x349 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b3x) (* (- 1.0) (* b3x b3x))) (* (- 1.0) (* b3y b3y)))))
 (>= (+ (+ ?x349 ?x288) (* (* 2.0 b3y) oy)) 0.0)))))
(assert
 (>= (+ (+ (* v1x v1x) (* v1y v1y)) (* (- 1.0) v1x)) 0.0))
(assert
 (>= v1x 0.0))
(assert
 (>= (+ 1.0 (* (- 1.0) v1x)) 0.0))
(assert
 (> R2 0.0))
(assert
 (> rho2 0.0))
(assert
 (let ((?x148 (* (- 1.0) v1y)))
 (let ((?x459 (* ?x148 xy)))
 (> ?x459 0.0))))
(assert
 (let ((?x122 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) xy)) (* (* (- 1.0) xx) (* v1y v1y)))))
 (> (+ ?x122 (* (* v1x v1y) xy)) 0.0)))
(assert
 (> (+ (* xx (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) xy)) 0.0))
(assert
 (> (* b1y v1y) 0.0))
(assert
 (let ((?x102 (* b1y v1x)))
 (let ((?x355 (* ?x102 v1y)))
 (let ((?x1014 (+ (+ (* v1y v1y) (* (* (- 1.0) b1x) (* v1y v1y))) (* (* (- 1.0) b1y) v1y))))
 (> (+ ?x1014 ?x355) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b1x) (* v1y v1y)) (* (* b1y v1x) v1y)) 0.0))
(assert
 (> (* b2y v1y) 0.0))
(assert
 (let ((?x131 (* b2y v1x)))
 (let ((?x412 (* ?x131 v1y)))
 (let ((?x440 (+ (+ (* v1y v1y) (* (* (- 1.0) b2x) (* v1y v1y))) (* (* (- 1.0) b2y) v1y))))
 (> (+ ?x440 ?x412) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b2x) (* v1y v1y)) (* (* b2y v1x) v1y)) 0.0))
(assert
 (> (* b3y v1y) 0.0))
(assert
 (let ((?x446 (* b3y v1x)))
 (let ((?x170 (* ?x446 v1y)))
 (let ((?x40 (+ (+ (* v1y v1y) (* (* (- 1.0) b3x) (* v1y v1y))) (* (* (- 1.0) b3y) v1y))))
 (> (+ ?x40 ?x170) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b3x) (* v1y v1y)) (* (* b3y v1x) v1y)) 0.0))
(assert
 (let ((?x205 (* (- 1.0) xy)))
 (> ?x205 0.0)))
(assert
 (> (+ (* v1y xx) (* (* (- 1.0) v1x) xy)) 0.0))
(assert
 (> (+ (* b1y xx) (* (* (- 1.0) b1x) xy)) 0.0))
(assert
 (> (+ (* b2y xx) (* (* (- 1.0) b2x) xy)) 0.0))
(assert
 (> (+ (* b3y xx) (* (* (- 1.0) b3x) xy)) 0.0))
(assert
 (> v1y 0.0))
(assert
 (> b1y 0.0))
(assert
 (> b2y 0.0))
(assert
 (> b3y 0.0))
(assert
 (> (+ (* b1y v1x) (* (* (- 1.0) b1x) v1y)) 0.0))
(assert
 (> (+ (* b2y v1x) (* (* (- 1.0) b2x) v1y)) 0.0))
(assert
 (> (+ (* b3y v1x) (* (* (- 1.0) b3x) v1y)) 0.0))
(assert
 (> (+ (* b1x b2y) (* (* (- 1.0) b1y) b2x)) 0.0))
(assert
 (> (+ (* b1x b3y) (* (* (- 1.0) b1y) b3x)) 0.0))
(assert
 (> (+ (* b2x b3y) (* (* (- 1.0) b2y) b3x)) 0.0))
(assert
 (let ((?x92 (+ (+ (+ v1y (* (- 1.0) xy)) (* v1x xy)) (* (* (- 1.0) v1y) xx))))
 (> ?x92 0.0)))
(assert
 (let ((?x351 (* (- 1.0) b1y)))
 (let ((?x98 (* ?x351 xx)))
 (> (+ (+ (+ b1y (* (- 1.0) xy)) (* b1x xy)) ?x98) 0.0))))
(assert
 (let ((?x273 (* (- 1.0) b2y)))
 (let ((?x292 (* ?x273 xx)))
 (> (+ (+ (+ b2y (* (- 1.0) xy)) (* b2x xy)) ?x292) 0.0))))
(assert
 (let ((?x456 (* (- 1.0) b3y)))
 (let ((?x424 (* ?x456 xx)))
 (> (+ (+ (+ b3y (* (- 1.0) xy)) (* b3x xy)) ?x424) 0.0))))
(assert
 (let ((?x217 (* (- 1.0) v1x)))
 (let ((?x353 (* ?x217 xy)))
 (let ((?x351 (* (- 1.0) b1y)))
 (let ((?x98 (* ?x351 xx)))
 (let ((?x307 (* (- 1.0) b1x)))
 (let ((?x34 (* ?x307 v1y)))
 (let ((?x106 (+ (+ (+ (+ (* b1x xy) (* b1y v1x)) (* v1y xx)) ?x34) ?x98)))
 (> (+ ?x106 ?x353) 0.0)))))))))
(assert
 (let ((?x217 (* (- 1.0) v1x)))
 (let ((?x353 (* ?x217 xy)))
 (let ((?x273 (* (- 1.0) b2y)))
 (let ((?x292 (* ?x273 xx)))
 (let ((?x15 (* (- 1.0) b2x)))
 (let ((?x165 (* ?x15 v1y)))
 (let ((?x79 (+ (+ (+ (+ (* b2x xy) (* b2y v1x)) (* v1y xx)) ?x165) ?x292)))
 (> (+ ?x79 ?x353) 0.0)))))))))
(assert
 (let ((?x217 (* (- 1.0) v1x)))
 (let ((?x353 (* ?x217 xy)))
 (let ((?x456 (* (- 1.0) b3y)))
 (let ((?x424 (* ?x456 xx)))
 (let ((?x162 (* (- 1.0) b3x)))
 (let ((?x12 (* ?x162 v1y)))
 (let ((?x377 (+ (+ (+ (+ (* b3x xy) (* b3y v1x)) (* v1y xx)) ?x12) ?x424)))
 (> (+ ?x377 ?x353) 0.0)))))))))
(assert
 (let ((?x273 (* (- 1.0) b2y)))
 (let ((?x292 (* ?x273 xx)))
 (let ((?x351 (* (- 1.0) b1y)))
 (let ((?x134 (* ?x351 b2x)))
 (let ((?x307 (* (- 1.0) b1x)))
 (let ((?x202 (* ?x307 xy)))
 (let ((?x272 (+ (+ (+ (+ (* b1x b2y) (* b1y xx)) (* b2x xy)) ?x202) ?x134)))
 (> (+ ?x272 ?x292) 0.0)))))))))
(assert
 (let ((?x456 (* (- 1.0) b3y)))
 (let ((?x424 (* ?x456 xx)))
 (let ((?x351 (* (- 1.0) b1y)))
 (let ((?x169 (* ?x351 b3x)))
 (let ((?x307 (* (- 1.0) b1x)))
 (let ((?x202 (* ?x307 xy)))
 (let ((?x124 (+ (+ (+ (+ (* b1x b3y) (* b1y xx)) (* b3x xy)) ?x202) ?x169)))
 (> (+ ?x124 ?x424) 0.0)))))))))
(assert
 (let ((?x456 (* (- 1.0) b3y)))
 (let ((?x424 (* ?x456 xx)))
 (let ((?x273 (* (- 1.0) b2y)))
 (let ((?x485 (* ?x273 b3x)))
 (let ((?x15 (* (- 1.0) b2x)))
 (let ((?x449 (* ?x15 xy)))
 (let ((?x254 (+ (+ (+ (+ (* b2x b3y) (* b2y xx)) (* b3x xy)) ?x449) ?x485)))
 (> (+ ?x254 ?x424) 0.0)))))))))
(assert
 (let ((?x307 (* (- 1.0) b1x)))
 (let ((?x34 (* ?x307 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b1y)) (* b1y v1x)) ?x34) 0.0))))
(assert
 (let ((?x15 (* (- 1.0) b2x)))
 (let ((?x165 (* ?x15 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b2y)) (* b2y v1x)) ?x165) 0.0))))
(assert
 (let ((?x162 (* (- 1.0) b3x)))
 (let ((?x12 (* ?x162 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b3y)) (* b3y v1x)) ?x12) 0.0))))
(assert
 (let ((?x351 (* (- 1.0) b1y)))
 (let ((?x134 (* ?x351 b2x)))
 (> (+ (+ (+ b1y (* (- 1.0) b2y)) (* b1x b2y)) ?x134) 0.0))))
(assert
 (let ((?x351 (* (- 1.0) b1y)))
 (let ((?x169 (* ?x351 b3x)))
 (> (+ (+ (+ b1y (* (- 1.0) b3y)) (* b1x b3y)) ?x169) 0.0))))
(assert
 (let ((?x273 (* (- 1.0) b2y)))
 (let ((?x485 (* ?x273 b3x)))
 (> (+ (+ (+ b2y (* (- 1.0) b3y)) (* b2x b3y)) ?x485) 0.0))))
(assert
 (let ((?x351 (* (- 1.0) b1y)))
 (let ((?x134 (* ?x351 b2x)))
 (let ((?x307 (* (- 1.0) b1x)))
 (let ((?x34 (* ?x307 v1y)))
 (let ((?x398 (+ (+ (+ (+ (* b1x b2y) (* b1y v1x)) (* b2x v1y)) ?x34) ?x134)))
 (> (+ ?x398 (* (* (- 1.0) b2y) v1x)) 0.0)))))))
(assert
 (let ((?x456 (* (- 1.0) b3y)))
 (let ((?x443 (* ?x456 v1x)))
 (let ((?x351 (* (- 1.0) b1y)))
 (let ((?x169 (* ?x351 b3x)))
 (let ((?x307 (* (- 1.0) b1x)))
 (let ((?x34 (* ?x307 v1y)))
 (let ((?x420 (+ (+ (+ (+ (* b1x b3y) (* b1y v1x)) (* b3x v1y)) ?x34) ?x169)))
 (> (+ ?x420 ?x443) 0.0)))))))))
(assert
 (let ((?x456 (* (- 1.0) b3y)))
 (let ((?x443 (* ?x456 v1x)))
 (let ((?x273 (* (- 1.0) b2y)))
 (let ((?x485 (* ?x273 b3x)))
 (let ((?x15 (* (- 1.0) b2x)))
 (let ((?x165 (* ?x15 v1y)))
 (let ((?x27 (+ (+ (+ (+ (* b2x b3y) (* b2y v1x)) (* b3x v1y)) ?x165) ?x485)))
 (> (+ ?x27 ?x443) 0.0)))))))))
(assert
 (let ((?x273 (* (- 1.0) b2y)))
(let ((?x485 (* ?x273 b3x)))
(let ((?x351 (* (- 1.0) b1y)))
(let ((?x134 (* ?x351 b2x)))
(let ((?x262 (+ (+ (+ (* b1x b2y) (* b1y b3x)) (* b2x b3y)) (* (* (- 1.0) b1x) b3y))))
(> (+ (+ ?x262 ?x134) ?x485) 0.0)))))))
(check-sat)
