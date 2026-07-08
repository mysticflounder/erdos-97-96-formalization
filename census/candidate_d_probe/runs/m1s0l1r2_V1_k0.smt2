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
(declare-fun a1y () Real)
(declare-fun a1x () Real)
(declare-fun b1y () Real)
(declare-fun b1x () Real)
(declare-fun b2y () Real)
(declare-fun b2x () Real)
(assert
 (let ((?x115 (* (- 1.0) v1x)))
 (let ((?x257 (* (- 1.0) R2)))
 (let ((?x907 (+ (+ (+ (+ (/ 1.0 4.0) (* oy oy)) (* v1x v1x)) (* v1y v1y)) ?x257)))
 (= (+ (+ ?x907 ?x115) (* (* (- 2.0) oy) v1y)) 0.0)))))
(assert
 (= (+ (+ (/ 1.0 4.0) (* oy oy)) (* (- 1.0) R2)) 0.0))
(assert
 (let ((?x199 (* (- 1.0) rho2)))
 (let ((?x146 (* xy xy)))
 (let ((?x485 (+ (+ (+ (+ (* v1x v1x) (* v1y v1y)) (* xx xx)) ?x146) ?x199)))
 (= (+ (+ ?x485 (* (* (- 2.0) v1x) xx)) (* (* (- 2.0) v1y) xy)) 0.0)))))
(assert
 (let ((?x199 (* (- 1.0) rho2)))
 (let ((?x146 (* xy xy)))
 (let ((?x169 (+ (+ (+ (+ (* a1x a1x) (* a1y a1y)) (* xx xx)) ?x146) ?x199)))
 (= (+ (+ ?x169 (* (* (- 2.0) a1x) xx)) (* (* (- 2.0) a1y) xy)) 0.0)))))
(assert
 (let ((?x199 (* (- 1.0) rho2)))
 (let ((?x146 (* xy xy)))
 (let ((?x194 (+ (+ (+ (+ (* b1x b1x) (* b1y b1y)) (* xx xx)) ?x146) ?x199)))
 (= (+ (+ ?x194 (* (* (- 2.0) b1x) xx)) (* (* (- 2.0) b1y) xy)) 0.0)))))
(assert
 (let ((?x199 (* (- 1.0) rho2)))
 (let ((?x146 (* xy xy)))
 (let ((?x571 (+ (+ (+ (+ (* b2x b2x) (* b2y b2y)) (* xx xx)) ?x146) ?x199)))
 (= (+ (+ ?x571 (* (* (- 2.0) b2x) xx)) (* (* (- 2.0) b2y) xy)) 0.0)))))
(assert
 (let ((?x86 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) xx) (* (- 1.0) (* oy oy))) (* (- 1.0) (* xx xx)))))
 (>= (+ (+ ?x86 (* (- 1.0) (* xy xy))) (* (* 2.0 oy) xy)) 0.0)))
(assert
 (let ((?x973 (* oy oy)))
 (let ((?x446 (* (- 1.0) ?x973)))
 (let ((?x174 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) a1x) (* (- 1.0) (* a1x a1x))) (* (- 1.0) (* a1y a1y)))))
 (>= (+ (+ ?x174 ?x446) (* (* 2.0 a1y) oy)) 0.0)))))
(assert
 (let ((?x973 (* oy oy)))
 (let ((?x446 (* (- 1.0) ?x973)))
 (let ((?x45 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b1x) (* (- 1.0) (* b1x b1x))) (* (- 1.0) (* b1y b1y)))))
 (>= (+ (+ ?x45 ?x446) (* (* 2.0 b1y) oy)) 0.0)))))
(assert
 (let ((?x973 (* oy oy)))
 (let ((?x446 (* (- 1.0) ?x973)))
 (let ((?x60 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b2x) (* (- 1.0) (* b2x b2x))) (* (- 1.0) (* b2y b2y)))))
 (>= (+ (+ ?x60 ?x446) (* (* 2.0 b2y) oy)) 0.0)))))
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
 (let ((?x379 (* (- 1.0) v1y)))
 (let ((?x124 (* ?x379 xy)))
 (> ?x124 0.0))))
(assert
 (let ((?x163 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) xy)) (* (* (- 1.0) xx) (* v1y v1y)))))
 (> (+ ?x163 (* (* v1x v1y) xy)) 0.0)))
(assert
 (> (+ (* xx (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) xy)) 0.0))
(assert
 (let ((?x54 (* a1y v1y)))
 (> ?x54 0.0)))
(assert
 (let ((?x391 (* (- 1.0) a1y)))
 (let ((?x178 (* ?x391 v1x)))
 (let ((?x175 (* ?x178 v1y)))
 (let ((?x54 (* a1y v1y)))
 (let ((?x484 (+ (+ (+ (* (- 1.0) (* v1y v1y)) (* a1x (* v1y v1y))) ?x54) ?x175)))
 (> ?x484 0.0)))))))
(assert
 (> (+ (* a1x (* v1y v1y)) (* (* (* (- 1.0) a1y) v1x) v1y)) 0.0))
(assert
 (> (* b1y v1y) 0.0))
(assert
 (let ((?x83 (* b1y v1x)))
 (let ((?x186 (* ?x83 v1y)))
 (let ((?x24 (+ (+ (* v1y v1y) (* (* (- 1.0) b1x) (* v1y v1y))) (* (* (- 1.0) b1y) v1y))))
 (> (+ ?x24 ?x186) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b1x) (* v1y v1y)) (* (* b1y v1x) v1y)) 0.0))
(assert
 (> (* b2y v1y) 0.0))
(assert
 (let ((?x122 (* b2y v1x)))
 (let ((?x412 (* ?x122 v1y)))
 (let ((?x373 (+ (+ (* v1y v1y) (* (* (- 1.0) b2x) (* v1y v1y))) (* (* (- 1.0) b2y) v1y))))
 (> (+ ?x373 ?x412) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b2x) (* v1y v1y)) (* (* b2y v1x) v1y)) 0.0))
(assert
 (let ((?x170 (* (- 1.0) xy)))
 (> ?x170 0.0)))
(assert
 (> (+ (* a1y xx) (* (* (- 1.0) a1x) xy)) 0.0))
(assert
 (> (+ (* v1y xx) (* (* (- 1.0) v1x) xy)) 0.0))
(assert
 (> (+ (* b1y xx) (* (* (- 1.0) b1x) xy)) 0.0))
(assert
 (> (+ (* b2y xx) (* (* (- 1.0) b2x) xy)) 0.0))
(assert
 (> a1y 0.0))
(assert
 (> v1y 0.0))
(assert
 (> b1y 0.0))
(assert
 (> b2y 0.0))
(assert
 (> (+ (* a1x v1y) (* (* (- 1.0) a1y) v1x)) 0.0))
(assert
 (> (+ (* a1x b1y) (* (* (- 1.0) a1y) b1x)) 0.0))
(assert
 (> (+ (* a1x b2y) (* (* (- 1.0) a1y) b2x)) 0.0))
(assert
 (> (+ (* b1y v1x) (* (* (- 1.0) b1x) v1y)) 0.0))
(assert
 (> (+ (* b2y v1x) (* (* (- 1.0) b2x) v1y)) 0.0))
(assert
 (> (+ (* b1x b2y) (* (* (- 1.0) b1y) b2x)) 0.0))
(assert
 (let ((?x247 (+ (+ (+ a1y (* (- 1.0) xy)) (* a1x xy)) (* (* (- 1.0) a1y) xx))))
 (> ?x247 0.0)))
(assert
 (let ((?x379 (* (- 1.0) v1y)))
 (let ((?x23 (* ?x379 xx)))
 (> (+ (+ (+ v1y (* (- 1.0) xy)) (* v1x xy)) ?x23) 0.0))))
(assert
 (let ((?x47 (* (- 1.0) b1y)))
 (let ((?x237 (* ?x47 xx)))
 (> (+ (+ (+ b1y (* (- 1.0) xy)) (* b1x xy)) ?x237) 0.0))))
(assert
 (let ((?x366 (* (- 1.0) b2y)))
 (let ((?x241 (* ?x366 xx)))
 (> (+ (+ (+ b2y (* (- 1.0) xy)) (* b2x xy)) ?x241) 0.0))))
(assert
 (let ((?x379 (* (- 1.0) v1y)))
 (let ((?x23 (* ?x379 xx)))
 (let ((?x391 (* (- 1.0) a1y)))
 (let ((?x178 (* ?x391 v1x)))
 (let ((?x88 (* (- 1.0) a1x)))
 (let ((?x56 (* ?x88 xy)))
 (let ((?x480 (+ (+ (+ (+ (* a1x v1y) (* a1y xx)) (* v1x xy)) ?x56) ?x178)))
 (> (+ ?x480 ?x23) 0.0)))))))))
(assert
 (let ((?x47 (* (- 1.0) b1y)))
 (let ((?x237 (* ?x47 xx)))
 (let ((?x391 (* (- 1.0) a1y)))
 (let ((?x208 (* ?x391 b1x)))
 (let ((?x88 (* (- 1.0) a1x)))
 (let ((?x56 (* ?x88 xy)))
 (let ((?x437 (+ (+ (+ (+ (* a1x b1y) (* a1y xx)) (* b1x xy)) ?x56) ?x208)))
 (> (+ ?x437 ?x237) 0.0)))))))))
(assert
 (let ((?x366 (* (- 1.0) b2y)))
 (let ((?x241 (* ?x366 xx)))
 (let ((?x391 (* (- 1.0) a1y)))
 (let ((?x137 (* ?x391 b2x)))
 (let ((?x88 (* (- 1.0) a1x)))
 (let ((?x56 (* ?x88 xy)))
 (let ((?x990 (+ (+ (+ (+ (* a1x b2y) (* a1y xx)) (* b2x xy)) ?x56) ?x137)))
 (> (+ ?x990 ?x241) 0.0)))))))))
(assert
 (let ((?x115 (* (- 1.0) v1x)))
 (let ((?x368 (* ?x115 xy)))
 (let ((?x47 (* (- 1.0) b1y)))
 (let ((?x237 (* ?x47 xx)))
 (let ((?x190 (* (- 1.0) b1x)))
 (let ((?x297 (* ?x190 v1y)))
 (let ((?x136 (+ (+ (+ (+ (* b1x xy) (* b1y v1x)) (* v1y xx)) ?x297) ?x237)))
 (> (+ ?x136 ?x368) 0.0)))))))))
(assert
 (let ((?x115 (* (- 1.0) v1x)))
 (let ((?x368 (* ?x115 xy)))
 (let ((?x366 (* (- 1.0) b2y)))
 (let ((?x241 (* ?x366 xx)))
 (let ((?x128 (* (- 1.0) b2x)))
 (let ((?x288 (* ?x128 v1y)))
 (let ((?x316 (+ (+ (+ (+ (* b2x xy) (* b2y v1x)) (* v1y xx)) ?x288) ?x241)))
 (> (+ ?x316 ?x368) 0.0)))))))))
(assert
 (let ((?x366 (* (- 1.0) b2y)))
 (let ((?x241 (* ?x366 xx)))
 (let ((?x47 (* (- 1.0) b1y)))
 (let ((?x38 (* ?x47 b2x)))
 (let ((?x190 (* (- 1.0) b1x)))
 (let ((?x489 (* ?x190 xy)))
 (let ((?x352 (+ (+ (+ (+ (* b1x b2y) (* b1y xx)) (* b2x xy)) ?x489) ?x38)))
 (> (+ ?x352 ?x241) 0.0)))))))))
(assert
 (let ((?x391 (* (- 1.0) a1y)))
 (let ((?x178 (* ?x391 v1x)))
 (> (+ (+ (+ a1y (* (- 1.0) v1y)) (* a1x v1y)) ?x178) 0.0))))
(assert
 (let ((?x391 (* (- 1.0) a1y)))
 (let ((?x208 (* ?x391 b1x)))
 (> (+ (+ (+ a1y (* (- 1.0) b1y)) (* a1x b1y)) ?x208) 0.0))))
(assert
 (let ((?x391 (* (- 1.0) a1y)))
 (let ((?x137 (* ?x391 b2x)))
 (> (+ (+ (+ a1y (* (- 1.0) b2y)) (* a1x b2y)) ?x137) 0.0))))
(assert
 (let ((?x190 (* (- 1.0) b1x)))
 (let ((?x297 (* ?x190 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b1y)) (* b1y v1x)) ?x297) 0.0))))
(assert
 (let ((?x128 (* (- 1.0) b2x)))
 (let ((?x288 (* ?x128 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b2y)) (* b2y v1x)) ?x288) 0.0))))
(assert
 (let ((?x47 (* (- 1.0) b1y)))
 (let ((?x38 (* ?x47 b2x)))
 (> (+ (+ (+ b1y (* (- 1.0) b2y)) (* b1x b2y)) ?x38) 0.0))))
(assert
 (let ((?x190 (* (- 1.0) b1x)))
 (let ((?x297 (* ?x190 v1y)))
 (let ((?x391 (* (- 1.0) a1y)))
 (let ((?x178 (* ?x391 v1x)))
 (let ((?x176 (+ (+ (+ (* a1x v1y) (* a1y b1x)) (* b1y v1x)) (* (* (- 1.0) a1x) b1y))))
 (> (+ (+ ?x176 ?x178) ?x297) 0.0)))))))
(assert
 (let ((?x128 (* (- 1.0) b2x)))
 (let ((?x288 (* ?x128 v1y)))
 (let ((?x391 (* (- 1.0) a1y)))
 (let ((?x178 (* ?x391 v1x)))
 (let ((?x88 (* (- 1.0) a1x)))
 (let ((?x108 (* ?x88 b2y)))
 (let ((?x467 (+ (+ (+ (+ (* a1x v1y) (* a1y b2x)) (* b2y v1x)) ?x108) ?x178)))
 (> (+ ?x467 ?x288) 0.0)))))))))
(assert
 (let ((?x47 (* (- 1.0) b1y)))
 (let ((?x38 (* ?x47 b2x)))
 (let ((?x391 (* (- 1.0) a1y)))
 (let ((?x208 (* ?x391 b1x)))
 (let ((?x88 (* (- 1.0) a1x)))
 (let ((?x108 (* ?x88 b2y)))
 (let ((?x94 (+ (+ (+ (+ (* a1x b1y) (* a1y b2x)) (* b1x b2y)) ?x108) ?x208)))
 (> (+ ?x94 ?x38) 0.0)))))))))
(assert
 (let ((?x47 (* (- 1.0) b1y)))
(let ((?x38 (* ?x47 b2x)))
(let ((?x190 (* (- 1.0) b1x)))
(let ((?x297 (* ?x190 v1y)))
(let ((?x454 (+ (+ (+ (+ (* b1x b2y) (* b1y v1x)) (* b2x v1y)) ?x297) ?x38)))
(> (+ ?x454 (* (* (- 1.0) b2y) v1x)) 0.0)))))))
(check-sat)
