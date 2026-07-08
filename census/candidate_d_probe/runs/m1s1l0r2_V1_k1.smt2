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
(declare-fun y1y () Real)
(declare-fun y1x () Real)
(declare-fun b1y () Real)
(declare-fun b1x () Real)
(declare-fun b2y () Real)
(declare-fun b2x () Real)
(assert
 (let ((?x478 (* (- 1.0) v1x)))
 (let ((?x282 (* (- 1.0) R2)))
 (let ((?x328 (+ (+ (+ (+ (/ 1.0 4.0) (* oy oy)) (* v1x v1x)) (* v1y v1y)) ?x282)))
 (= (+ (+ ?x328 ?x478) (* (* (- 2.0) oy) v1y)) 0.0)))))
(assert
 (= (+ (+ (/ 1.0 4.0) (* oy oy)) (* (- 1.0) R2)) 0.0))
(assert
 (let ((?x263 (* (- 1.0) rho2)))
 (let ((?x296 (* xy xy)))
 (let ((?x132 (+ (+ (+ (+ (* v1x v1x) (* v1y v1y)) (* xx xx)) ?x296) ?x263)))
 (= (+ (+ ?x132 (* (* (- 2.0) v1x) xx)) (* (* (- 2.0) v1y) xy)) 0.0)))))
(assert
 (let ((?x263 (* (- 1.0) rho2)))
 (let ((?x224 (* y1y y1y)))
 (let ((?x432 (+ (+ (+ (+ (* xx xx) (* xy xy)) (* y1x y1x)) ?x224) ?x263)))
 (= (+ (+ ?x432 (* (* (- 2.0) xx) y1x)) (* (* (- 2.0) xy) y1y)) 0.0)))))
(assert
 (let ((?x263 (* (- 1.0) rho2)))
 (let ((?x296 (* xy xy)))
 (let ((?x27 (+ (+ (+ (+ (* b1x b1x) (* b1y b1y)) (* xx xx)) ?x296) ?x263)))
 (= (+ (+ ?x27 (* (* (- 2.0) b1x) xx)) (* (* (- 2.0) b1y) xy)) 0.0)))))
(assert
 (let ((?x263 (* (- 1.0) rho2)))
 (let ((?x296 (* xy xy)))
 (let ((?x359 (+ (+ (+ (+ (* b2x b2x) (* b2y b2y)) (* xx xx)) ?x296) ?x263)))
 (= (+ (+ ?x359 (* (* (- 2.0) b2x) xx)) (* (* (- 2.0) b2y) xy)) 0.0)))))
(assert
 (let ((?x202 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) xx) (* (- 1.0) (* oy oy))) (* (- 1.0) (* xx xx)))))
 (>= (+ (+ ?x202 (* (- 1.0) (* xy xy))) (* (* 2.0 oy) xy)) 0.0)))
(assert
 (let ((?x152 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) y1x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* y1x y1x)))))
 (>= (+ (+ ?x152 (* (- 1.0) (* y1y y1y))) (* (* 2.0 oy) y1y)) 0.0)))
(assert
 (let ((?x110 (* oy oy)))
 (let ((?x48 (* (- 1.0) ?x110)))
 (let ((?x340 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b1x) (* (- 1.0) (* b1x b1x))) (* (- 1.0) (* b1y b1y)))))
 (>= (+ (+ ?x340 ?x48) (* (* 2.0 b1y) oy)) 0.0)))))
(assert
 (let ((?x110 (* oy oy)))
 (let ((?x48 (* (- 1.0) ?x110)))
 (let ((?x254 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b2x) (* (- 1.0) (* b2x b2x))) (* (- 1.0) (* b2y b2y)))))
 (>= (+ (+ ?x254 ?x48) (* (* 2.0 b2y) oy)) 0.0)))))
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
 (let ((?x92 (* (- 1.0) v1y)))
 (let ((?x20 (* ?x92 xy)))
 (> ?x20 0.0))))
(assert
 (let ((?x111 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) xy)) (* (* (- 1.0) xx) (* v1y v1y)))))
 (> (+ ?x111 (* (* v1x v1y) xy)) 0.0)))
(assert
 (> (+ (* xx (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) xy)) 0.0))
(assert
 (let ((?x92 (* (- 1.0) v1y)))
 (let ((?x76 (* ?x92 y1y)))
 (> ?x76 0.0))))
(assert
 (let ((?x112 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) y1y)) (* (* (- 1.0) y1x) (* v1y v1y)))))
 (> (+ ?x112 (* (* v1x v1y) y1y)) 0.0)))
(assert
 (> (+ (* y1x (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) y1y)) 0.0))
(assert
 (> (* b1y v1y) 0.0))
(assert
 (let ((?x414 (* b1y v1x)))
 (let ((?x124 (* ?x414 v1y)))
 (let ((?x476 (+ (+ (* v1y v1y) (* (* (- 1.0) b1x) (* v1y v1y))) (* (* (- 1.0) b1y) v1y))))
 (> (+ ?x476 ?x124) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b1x) (* v1y v1y)) (* (* b1y v1x) v1y)) 0.0))
(assert
 (> (* b2y v1y) 0.0))
(assert
 (let ((?x407 (* b2y v1x)))
 (let ((?x415 (* ?x407 v1y)))
 (let ((?x185 (+ (+ (* v1y v1y) (* (* (- 1.0) b2x) (* v1y v1y))) (* (* (- 1.0) b2y) v1y))))
 (> (+ ?x185 ?x415) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b2x) (* v1y v1y)) (* (* b2y v1x) v1y)) 0.0))
(assert
 (> (+ (* xy y1x) (* (* (- 1.0) xx) y1y)) 0.0))
(assert
 (let ((?x168 (* (- 1.0) y1y)))
 (> ?x168 0.0)))
(assert
 (> (+ (* v1y y1x) (* (* (- 1.0) v1x) y1y)) 0.0))
(assert
 (> (+ (* b1y y1x) (* (* (- 1.0) b1x) y1y)) 0.0))
(assert
 (> (+ (* b2y y1x) (* (* (- 1.0) b2x) y1y)) 0.0))
(assert
 (let ((?x357 (* (- 1.0) xy)))
 (> ?x357 0.0)))
(assert
 (> (+ (* v1y xx) (* (* (- 1.0) v1x) xy)) 0.0))
(assert
 (> (+ (* b1y xx) (* (* (- 1.0) b1x) xy)) 0.0))
(assert
 (> (+ (* b2y xx) (* (* (- 1.0) b2x) xy)) 0.0))
(assert
 (> v1y 0.0))
(assert
 (> b1y 0.0))
(assert
 (> b2y 0.0))
(assert
 (> (+ (* b1y v1x) (* (* (- 1.0) b1x) v1y)) 0.0))
(assert
 (> (+ (* b2y v1x) (* (* (- 1.0) b2x) v1y)) 0.0))
(assert
 (> (+ (* b1x b2y) (* (* (- 1.0) b1y) b2x)) 0.0))
(assert
 (let ((?x232 (* (- 1.0) xx)))
 (let ((?x268 (* ?x232 y1y)))
 (> (+ (+ (+ y1y (* (- 1.0) xy)) (* xy y1x)) ?x268) 0.0))))
(assert
 (let ((?x232 (* (- 1.0) xx)))
 (let ((?x268 (* ?x232 y1y)))
 (let ((?x92 (* (- 1.0) v1y)))
 (let ((?x265 (* ?x92 y1x)))
 (let ((?x478 (* (- 1.0) v1x)))
 (let ((?x715 (* ?x478 xy)))
 (let ((?x241 (+ (+ (+ (+ (* v1x y1y) (* v1y xx)) (* xy y1x)) ?x715) ?x265)))
 (> (+ ?x241 ?x268) 0.0)))))))))
(assert
 (let ((?x232 (* (- 1.0) xx)))
 (let ((?x268 (* ?x232 y1y)))
 (let ((?x95 (* (- 1.0) b1y)))
 (let ((?x489 (* ?x95 y1x)))
 (let ((?x226 (* (- 1.0) b1x)))
 (let ((?x139 (* ?x226 xy)))
 (let ((?x339 (+ (+ (+ (+ (* b1x y1y) (* b1y xx)) (* xy y1x)) ?x139) ?x489)))
 (> (+ ?x339 ?x268) 0.0)))))))))
(assert
 (let ((?x232 (* (- 1.0) xx)))
 (let ((?x268 (* ?x232 y1y)))
 (let ((?x824 (* (- 1.0) b2y)))
 (let ((?x305 (* ?x824 y1x)))
 (let ((?x252 (* (- 1.0) b2x)))
 (let ((?x46 (* ?x252 xy)))
 (let ((?x128 (+ (+ (+ (+ (* b2x y1y) (* b2y xx)) (* xy y1x)) ?x46) ?x305)))
 (> (+ ?x128 ?x268) 0.0)))))))))
(assert
 (let ((?x92 (* (- 1.0) v1y)))
 (let ((?x265 (* ?x92 y1x)))
 (> (+ (+ (+ v1y (* (- 1.0) y1y)) (* v1x y1y)) ?x265) 0.0))))
(assert
 (let ((?x95 (* (- 1.0) b1y)))
 (let ((?x489 (* ?x95 y1x)))
 (> (+ (+ (+ b1y (* (- 1.0) y1y)) (* b1x y1y)) ?x489) 0.0))))
(assert
 (let ((?x824 (* (- 1.0) b2y)))
 (let ((?x305 (* ?x824 y1x)))
 (> (+ (+ (+ b2y (* (- 1.0) y1y)) (* b2x y1y)) ?x305) 0.0))))
(assert
 (let ((?x478 (* (- 1.0) v1x)))
 (let ((?x247 (* ?x478 y1y)))
 (let ((?x95 (* (- 1.0) b1y)))
 (let ((?x489 (* ?x95 y1x)))
 (let ((?x226 (* (- 1.0) b1x)))
 (let ((?x220 (* ?x226 v1y)))
 (let ((?x101 (+ (+ (+ (+ (* b1x y1y) (* b1y v1x)) (* v1y y1x)) ?x220) ?x489)))
 (> (+ ?x101 ?x247) 0.0)))))))))
(assert
 (let ((?x478 (* (- 1.0) v1x)))
 (let ((?x247 (* ?x478 y1y)))
 (let ((?x824 (* (- 1.0) b2y)))
 (let ((?x305 (* ?x824 y1x)))
 (let ((?x252 (* (- 1.0) b2x)))
 (let ((?x483 (* ?x252 v1y)))
 (let ((?x374 (+ (+ (+ (+ (* b2x y1y) (* b2y v1x)) (* v1y y1x)) ?x483) ?x305)))
 (> (+ ?x374 ?x247) 0.0)))))))))
(assert
 (let ((?x824 (* (- 1.0) b2y)))
 (let ((?x305 (* ?x824 y1x)))
 (let ((?x95 (* (- 1.0) b1y)))
 (let ((?x117 (* ?x95 b2x)))
 (let ((?x226 (* (- 1.0) b1x)))
 (let ((?x322 (* ?x226 y1y)))
 (let ((?x78 (+ (+ (+ (+ (* b1x b2y) (* b1y y1x)) (* b2x y1y)) ?x322) ?x117)))
 (> (+ ?x78 ?x305) 0.0)))))))))
(assert
 (let ((?x464 (+ (+ (+ v1y (* (- 1.0) xy)) (* v1x xy)) (* (* (- 1.0) v1y) xx))))
 (> ?x464 0.0)))
(assert
 (let ((?x95 (* (- 1.0) b1y)))
 (let ((?x460 (* ?x95 xx)))
 (> (+ (+ (+ b1y (* (- 1.0) xy)) (* b1x xy)) ?x460) 0.0))))
(assert
 (let ((?x824 (* (- 1.0) b2y)))
 (let ((?x213 (* ?x824 xx)))
 (> (+ (+ (+ b2y (* (- 1.0) xy)) (* b2x xy)) ?x213) 0.0))))
(assert
 (let ((?x478 (* (- 1.0) v1x)))
 (let ((?x715 (* ?x478 xy)))
 (let ((?x95 (* (- 1.0) b1y)))
 (let ((?x460 (* ?x95 xx)))
 (let ((?x226 (* (- 1.0) b1x)))
 (let ((?x220 (* ?x226 v1y)))
 (let ((?x133 (+ (+ (+ (+ (* b1x xy) (* b1y v1x)) (* v1y xx)) ?x220) ?x460)))
 (> (+ ?x133 ?x715) 0.0)))))))))
(assert
 (let ((?x478 (* (- 1.0) v1x)))
 (let ((?x715 (* ?x478 xy)))
 (let ((?x824 (* (- 1.0) b2y)))
 (let ((?x213 (* ?x824 xx)))
 (let ((?x252 (* (- 1.0) b2x)))
 (let ((?x483 (* ?x252 v1y)))
 (let ((?x208 (+ (+ (+ (+ (* b2x xy) (* b2y v1x)) (* v1y xx)) ?x483) ?x213)))
 (> (+ ?x208 ?x715) 0.0)))))))))
(assert
 (let ((?x824 (* (- 1.0) b2y)))
 (let ((?x213 (* ?x824 xx)))
 (let ((?x95 (* (- 1.0) b1y)))
 (let ((?x117 (* ?x95 b2x)))
 (let ((?x226 (* (- 1.0) b1x)))
 (let ((?x139 (* ?x226 xy)))
 (let ((?x454 (+ (+ (+ (+ (* b1x b2y) (* b1y xx)) (* b2x xy)) ?x139) ?x117)))
 (> (+ ?x454 ?x213) 0.0)))))))))
(assert
 (let ((?x226 (* (- 1.0) b1x)))
 (let ((?x220 (* ?x226 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b1y)) (* b1y v1x)) ?x220) 0.0))))
(assert
 (let ((?x252 (* (- 1.0) b2x)))
 (let ((?x483 (* ?x252 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b2y)) (* b2y v1x)) ?x483) 0.0))))
(assert
 (let ((?x95 (* (- 1.0) b1y)))
 (let ((?x117 (* ?x95 b2x)))
 (> (+ (+ (+ b1y (* (- 1.0) b2y)) (* b1x b2y)) ?x117) 0.0))))
(assert
 (let ((?x95 (* (- 1.0) b1y)))
(let ((?x117 (* ?x95 b2x)))
(let ((?x226 (* (- 1.0) b1x)))
(let ((?x220 (* ?x226 v1y)))
(let ((?x205 (+ (+ (+ (+ (* b1x b2y) (* b1y v1x)) (* b2x v1y)) ?x220) ?x117)))
(> (+ ?x205 (* (* (- 1.0) b2y) v1x)) 0.0)))))))
(check-sat)
