(set-logic QF_NRA)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun v1y () Real)
(declare-fun oy () Real)
(declare-fun v1x () Real)
(declare-fun R2 () Real)
(declare-fun xx () Real)
(declare-fun rho2 () Real)
(declare-fun xy () Real)
(declare-fun b1y () Real)
(declare-fun b1x () Real)
(declare-fun b2y () Real)
(declare-fun b2x () Real)
(declare-fun b3y () Real)
(declare-fun b3x () Real)
(assert
 (let ((?x152 (* (- 1.0) v1x)))
 (let ((?x10 (* (- 1.0) R2)))
 (let ((?x415 (+ (+ (+ (+ (/ 1.0 4.0) (* oy oy)) (* v1x v1x)) (* v1y v1y)) ?x10)))
 (= (+ (+ ?x415 ?x152) (* (* (- 2.0) oy) v1y)) 0.0)))))
(assert
 (= (+ (+ (/ 1.0 4.0) (* oy oy)) (* (- 1.0) R2)) 0.0))
(assert
 (let ((?x467 (+ (+ (+ (+ 1.0 (* xx xx)) (* xy xy)) (* (- 1.0) rho2)) (* (- 2.0) xx))))
 (= ?x467 0.0)))
(assert
 (let ((?x1014 (* (- 1.0) rho2)))
 (let ((?x316 (* xy xy)))
 (let ((?x204 (+ (+ (+ (+ (* b1x b1x) (* b1y b1y)) (* xx xx)) ?x316) ?x1014)))
 (= (+ (+ ?x204 (* (* (- 2.0) b1x) xx)) (* (* (- 2.0) b1y) xy)) 0.0)))))
(assert
 (let ((?x1014 (* (- 1.0) rho2)))
 (let ((?x316 (* xy xy)))
 (let ((?x265 (+ (+ (+ (+ (* b2x b2x) (* b2y b2y)) (* xx xx)) ?x316) ?x1014)))
 (= (+ (+ ?x265 (* (* (- 2.0) b2x) xx)) (* (* (- 2.0) b2y) xy)) 0.0)))))
(assert
 (let ((?x1014 (* (- 1.0) rho2)))
 (let ((?x316 (* xy xy)))
 (let ((?x380 (+ (+ (+ (+ (* b3x b3x) (* b3y b3y)) (* xx xx)) ?x316) ?x1014)))
 (= (+ (+ ?x380 (* (* (- 2.0) b3x) xx)) (* (* (- 2.0) b3y) xy)) 0.0)))))
(assert
 (let ((?x302 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) xx) (* (- 1.0) (* oy oy))) (* (- 1.0) (* xx xx)))))
 (>= (+ (+ ?x302 (* (- 1.0) (* xy xy))) (* (* 2.0 oy) xy)) 0.0)))
(assert
 (let ((?x240 (* oy oy)))
 (let ((?x322 (* (- 1.0) ?x240)))
 (let ((?x473 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b1x) (* (- 1.0) (* b1x b1x))) (* (- 1.0) (* b1y b1y)))))
 (>= (+ (+ ?x473 ?x322) (* (* 2.0 b1y) oy)) 0.0)))))
(assert
 (let ((?x240 (* oy oy)))
 (let ((?x322 (* (- 1.0) ?x240)))
 (let ((?x492 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b2x) (* (- 1.0) (* b2x b2x))) (* (- 1.0) (* b2y b2y)))))
 (>= (+ (+ ?x492 ?x322) (* (* 2.0 b2y) oy)) 0.0)))))
(assert
 (let ((?x240 (* oy oy)))
 (let ((?x322 (* (- 1.0) ?x240)))
 (let ((?x327 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b3x) (* (- 1.0) (* b3x b3x))) (* (- 1.0) (* b3y b3y)))))
 (>= (+ (+ ?x327 ?x322) (* (* 2.0 b3y) oy)) 0.0)))))
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
 (let ((?x244 (* (- 1.0) v1y)))
 (let ((?x137 (* ?x244 xy)))
 (> ?x137 0.0))))
(assert
 (let ((?x84 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) xy)) (* (* (- 1.0) xx) (* v1y v1y)))))
 (> (+ ?x84 (* (* v1x v1y) xy)) 0.0)))
(assert
 (> (+ (* xx (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) xy)) 0.0))
(assert
 (> (* b1y v1y) 0.0))
(assert
 (let ((?x407 (* b1y v1x)))
 (let ((?x246 (* ?x407 v1y)))
 (let ((?x268 (+ (+ (* v1y v1y) (* (* (- 1.0) b1x) (* v1y v1y))) (* (* (- 1.0) b1y) v1y))))
 (> (+ ?x268 ?x246) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b1x) (* v1y v1y)) (* (* b1y v1x) v1y)) 0.0))
(assert
 (> (* b2y v1y) 0.0))
(assert
 (let ((?x328 (* b2y v1x)))
 (let ((?x355 (* ?x328 v1y)))
 (let ((?x340 (+ (+ (* v1y v1y) (* (* (- 1.0) b2x) (* v1y v1y))) (* (* (- 1.0) b2y) v1y))))
 (> (+ ?x340 ?x355) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b2x) (* v1y v1y)) (* (* b2y v1x) v1y)) 0.0))
(assert
 (> (* b3y v1y) 0.0))
(assert
 (let ((?x463 (* b3y v1x)))
 (let ((?x399 (* ?x463 v1y)))
 (let ((?x438 (+ (+ (* v1y v1y) (* (* (- 1.0) b3x) (* v1y v1y))) (* (* (- 1.0) b3y) v1y))))
 (> (+ ?x438 ?x399) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b3x) (* v1y v1y)) (* (* b3y v1x) v1y)) 0.0))
(assert
 (let ((?x445 (* (- 1.0) xy)))
 (> ?x445 0.0)))
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
 (let ((?x391 (+ (+ (+ v1y (* (- 1.0) xy)) (* v1x xy)) (* (* (- 1.0) v1y) xx))))
 (> ?x391 0.0)))
(assert
 (let ((?x119 (* (- 1.0) b1y)))
 (let ((?x248 (* ?x119 xx)))
 (> (+ (+ (+ b1y (* (- 1.0) xy)) (* b1x xy)) ?x248) 0.0))))
(assert
 (let ((?x313 (* (- 1.0) b2y)))
 (let ((?x111 (* ?x313 xx)))
 (> (+ (+ (+ b2y (* (- 1.0) xy)) (* b2x xy)) ?x111) 0.0))))
(assert
 (let ((?x417 (* (- 1.0) b3y)))
 (let ((?x217 (* ?x417 xx)))
 (> (+ (+ (+ b3y (* (- 1.0) xy)) (* b3x xy)) ?x217) 0.0))))
(assert
 (let ((?x152 (* (- 1.0) v1x)))
 (let ((?x112 (* ?x152 xy)))
 (let ((?x119 (* (- 1.0) b1y)))
 (let ((?x248 (* ?x119 xx)))
 (let ((?x330 (* (- 1.0) b1x)))
 (let ((?x92 (* ?x330 v1y)))
 (let ((?x432 (+ (+ (+ (+ (* b1x xy) (* b1y v1x)) (* v1y xx)) ?x92) ?x248)))
 (> (+ ?x432 ?x112) 0.0)))))))))
(assert
 (let ((?x152 (* (- 1.0) v1x)))
 (let ((?x112 (* ?x152 xy)))
 (let ((?x313 (* (- 1.0) b2y)))
 (let ((?x111 (* ?x313 xx)))
 (let ((?x201 (* (- 1.0) b2x)))
 (let ((?x132 (* ?x201 v1y)))
 (let ((?x701 (+ (+ (+ (+ (* b2x xy) (* b2y v1x)) (* v1y xx)) ?x132) ?x111)))
 (> (+ ?x701 ?x112) 0.0)))))))))
(assert
 (let ((?x152 (* (- 1.0) v1x)))
 (let ((?x112 (* ?x152 xy)))
 (let ((?x417 (* (- 1.0) b3y)))
 (let ((?x217 (* ?x417 xx)))
 (let ((?x306 (* (- 1.0) b3x)))
 (let ((?x436 (* ?x306 v1y)))
 (let ((?x181 (+ (+ (+ (+ (* b3x xy) (* b3y v1x)) (* v1y xx)) ?x436) ?x217)))
 (> (+ ?x181 ?x112) 0.0)))))))))
(assert
 (let ((?x313 (* (- 1.0) b2y)))
 (let ((?x111 (* ?x313 xx)))
 (let ((?x119 (* (- 1.0) b1y)))
 (let ((?x423 (* ?x119 b2x)))
 (let ((?x330 (* (- 1.0) b1x)))
 (let ((?x491 (* ?x330 xy)))
 (let ((?x424 (+ (+ (+ (+ (* b1x b2y) (* b1y xx)) (* b2x xy)) ?x491) ?x423)))
 (> (+ ?x424 ?x111) 0.0)))))))))
(assert
 (let ((?x417 (* (- 1.0) b3y)))
 (let ((?x217 (* ?x417 xx)))
 (let ((?x119 (* (- 1.0) b1y)))
 (let ((?x144 (* ?x119 b3x)))
 (let ((?x330 (* (- 1.0) b1x)))
 (let ((?x491 (* ?x330 xy)))
 (let ((?x389 (+ (+ (+ (+ (* b1x b3y) (* b1y xx)) (* b3x xy)) ?x491) ?x144)))
 (> (+ ?x389 ?x217) 0.0)))))))))
(assert
 (let ((?x417 (* (- 1.0) b3y)))
 (let ((?x217 (* ?x417 xx)))
 (let ((?x313 (* (- 1.0) b2y)))
 (let ((?x341 (* ?x313 b3x)))
 (let ((?x201 (* (- 1.0) b2x)))
 (let ((?x405 (* ?x201 xy)))
 (let ((?x86 (+ (+ (+ (+ (* b2x b3y) (* b2y xx)) (* b3x xy)) ?x405) ?x341)))
 (> (+ ?x86 ?x217) 0.0)))))))))
(assert
 (let ((?x330 (* (- 1.0) b1x)))
 (let ((?x92 (* ?x330 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b1y)) (* b1y v1x)) ?x92) 0.0))))
(assert
 (let ((?x201 (* (- 1.0) b2x)))
 (let ((?x132 (* ?x201 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b2y)) (* b2y v1x)) ?x132) 0.0))))
(assert
 (let ((?x306 (* (- 1.0) b3x)))
 (let ((?x436 (* ?x306 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b3y)) (* b3y v1x)) ?x436) 0.0))))
(assert
 (let ((?x119 (* (- 1.0) b1y)))
 (let ((?x423 (* ?x119 b2x)))
 (> (+ (+ (+ b1y (* (- 1.0) b2y)) (* b1x b2y)) ?x423) 0.0))))
(assert
 (let ((?x119 (* (- 1.0) b1y)))
 (let ((?x144 (* ?x119 b3x)))
 (> (+ (+ (+ b1y (* (- 1.0) b3y)) (* b1x b3y)) ?x144) 0.0))))
(assert
 (let ((?x313 (* (- 1.0) b2y)))
 (let ((?x341 (* ?x313 b3x)))
 (> (+ (+ (+ b2y (* (- 1.0) b3y)) (* b2x b3y)) ?x341) 0.0))))
(assert
 (let ((?x119 (* (- 1.0) b1y)))
 (let ((?x423 (* ?x119 b2x)))
 (let ((?x330 (* (- 1.0) b1x)))
 (let ((?x92 (* ?x330 v1y)))
 (let ((?x224 (+ (+ (+ (+ (* b1x b2y) (* b1y v1x)) (* b2x v1y)) ?x92) ?x423)))
 (> (+ ?x224 (* (* (- 1.0) b2y) v1x)) 0.0)))))))
(assert
 (let ((?x417 (* (- 1.0) b3y)))
 (let ((?x250 (* ?x417 v1x)))
 (let ((?x119 (* (- 1.0) b1y)))
 (let ((?x144 (* ?x119 b3x)))
 (let ((?x330 (* (- 1.0) b1x)))
 (let ((?x92 (* ?x330 v1y)))
 (let ((?x456 (+ (+ (+ (+ (* b1x b3y) (* b1y v1x)) (* b3x v1y)) ?x92) ?x144)))
 (> (+ ?x456 ?x250) 0.0)))))))))
(assert
 (let ((?x417 (* (- 1.0) b3y)))
 (let ((?x250 (* ?x417 v1x)))
 (let ((?x313 (* (- 1.0) b2y)))
 (let ((?x341 (* ?x313 b3x)))
 (let ((?x201 (* (- 1.0) b2x)))
 (let ((?x132 (* ?x201 v1y)))
 (let ((?x296 (+ (+ (+ (+ (* b2x b3y) (* b2y v1x)) (* b3x v1y)) ?x132) ?x341)))
 (> (+ ?x296 ?x250) 0.0)))))))))
(assert
 (let ((?x313 (* (- 1.0) b2y)))
(let ((?x341 (* ?x313 b3x)))
(let ((?x119 (* (- 1.0) b1y)))
(let ((?x423 (* ?x119 b2x)))
(let ((?x131 (+ (+ (+ (* b1x b2y) (* b1y b3x)) (* b2x b3y)) (* (* (- 1.0) b1x) b3y))))
(> (+ (+ ?x131 ?x423) ?x341) 0.0)))))))
(check-sat)
