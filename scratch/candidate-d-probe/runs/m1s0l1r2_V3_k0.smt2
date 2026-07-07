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
(declare-fun a1y () Real)
(declare-fun a1x () Real)
(declare-fun b1y () Real)
(declare-fun b1x () Real)
(declare-fun b2y () Real)
(declare-fun b2x () Real)
(assert
 (let ((?x84 (* (- 1.0) v1x)))
 (let ((?x9 (* (- 1.0) R2)))
 (let ((?x57 (+ (+ (+ (+ (/ 1.0 4.0) (* oy oy)) (* v1x v1x)) (* v1y v1y)) ?x9)))
 (= (+ (+ ?x57 ?x84) (* (* (- 2.0) oy) v1y)) 0.0)))))
(assert
 (= (+ (+ (/ 1.0 4.0) (* oy oy)) (* (- 1.0) R2)) 0.0))
(assert
 (let ((?x243 (+ (+ (+ (+ 1.0 (* xx xx)) (* xy xy)) (* (- 1.0) rho2)) (* (- 2.0) xx))))
 (= ?x243 0.0)))
(assert
 (let ((?x195 (* (- 1.0) rho2)))
 (let ((?x25 (* xy xy)))
 (let ((?x250 (+ (+ (+ (+ (* a1x a1x) (* a1y a1y)) (* xx xx)) ?x25) ?x195)))
 (= (+ (+ ?x250 (* (* (- 2.0) a1x) xx)) (* (* (- 2.0) a1y) xy)) 0.0)))))
(assert
 (let ((?x195 (* (- 1.0) rho2)))
 (let ((?x25 (* xy xy)))
 (let ((?x203 (+ (+ (+ (+ (* b1x b1x) (* b1y b1y)) (* xx xx)) ?x25) ?x195)))
 (= (+ (+ ?x203 (* (* (- 2.0) b1x) xx)) (* (* (- 2.0) b1y) xy)) 0.0)))))
(assert
 (let ((?x195 (* (- 1.0) rho2)))
 (let ((?x25 (* xy xy)))
 (let ((?x155 (+ (+ (+ (+ (* b2x b2x) (* b2y b2y)) (* xx xx)) ?x25) ?x195)))
 (= (+ (+ ?x155 (* (* (- 2.0) b2x) xx)) (* (* (- 2.0) b2y) xy)) 0.0)))))
(assert
 (let ((?x152 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) xx) (* (- 1.0) (* oy oy))) (* (- 1.0) (* xx xx)))))
 (>= (+ (+ ?x152 (* (- 1.0) (* xy xy))) (* (* 2.0 oy) xy)) 0.0)))
(assert
 (let ((?x388 (* oy oy)))
 (let ((?x571 (* (- 1.0) ?x388)))
 (let ((?x390 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) a1x) (* (- 1.0) (* a1x a1x))) (* (- 1.0) (* a1y a1y)))))
 (>= (+ (+ ?x390 ?x571) (* (* 2.0 a1y) oy)) 0.0)))))
(assert
 (let ((?x388 (* oy oy)))
 (let ((?x571 (* (- 1.0) ?x388)))
 (let ((?x779 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b1x) (* (- 1.0) (* b1x b1x))) (* (- 1.0) (* b1y b1y)))))
 (>= (+ (+ ?x779 ?x571) (* (* 2.0 b1y) oy)) 0.0)))))
(assert
 (let ((?x388 (* oy oy)))
 (let ((?x571 (* (- 1.0) ?x388)))
 (let ((?x245 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b2x) (* (- 1.0) (* b2x b2x))) (* (- 1.0) (* b2y b2y)))))
 (>= (+ (+ ?x245 ?x571) (* (* 2.0 b2y) oy)) 0.0)))))
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
 (let ((?x272 (* (- 1.0) v1y)))
 (let ((?x193 (* ?x272 xy)))
 (> ?x193 0.0))))
(assert
 (let ((?x179 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) xy)) (* (* (- 1.0) xx) (* v1y v1y)))))
 (> (+ ?x179 (* (* v1x v1y) xy)) 0.0)))
(assert
 (> (+ (* xx (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) xy)) 0.0))
(assert
 (let ((?x95 (* a1y v1y)))
 (> ?x95 0.0)))
(assert
 (let ((?x248 (* (- 1.0) a1y)))
 (let ((?x445 (* ?x248 v1x)))
 (let ((?x59 (* ?x445 v1y)))
 (let ((?x95 (* a1y v1y)))
 (let ((?x377 (+ (+ (+ (* (- 1.0) (* v1y v1y)) (* a1x (* v1y v1y))) ?x95) ?x59)))
 (> ?x377 0.0)))))))
(assert
 (> (+ (* a1x (* v1y v1y)) (* (* (* (- 1.0) a1y) v1x) v1y)) 0.0))
(assert
 (> (* b1y v1y) 0.0))
(assert
 (let ((?x376 (* b1y v1x)))
 (let ((?x98 (* ?x376 v1y)))
 (let ((?x79 (+ (+ (* v1y v1y) (* (* (- 1.0) b1x) (* v1y v1y))) (* (* (- 1.0) b1y) v1y))))
 (> (+ ?x79 ?x98) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b1x) (* v1y v1y)) (* (* b1y v1x) v1y)) 0.0))
(assert
 (> (* b2y v1y) 0.0))
(assert
 (let ((?x221 (* b2y v1x)))
 (let ((?x438 (* ?x221 v1y)))
 (let ((?x90 (+ (+ (* v1y v1y) (* (* (- 1.0) b2x) (* v1y v1y))) (* (* (- 1.0) b2y) v1y))))
 (> (+ ?x90 ?x438) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b2x) (* v1y v1y)) (* (* b2y v1x) v1y)) 0.0))
(assert
 (let ((?x220 (* (- 1.0) xy)))
 (> ?x220 0.0)))
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
 (let ((?x441 (+ (+ (+ a1y (* (- 1.0) xy)) (* a1x xy)) (* (* (- 1.0) a1y) xx))))
 (> ?x441 0.0)))
(assert
 (let ((?x272 (* (- 1.0) v1y)))
 (let ((?x166 (* ?x272 xx)))
 (> (+ (+ (+ v1y (* (- 1.0) xy)) (* v1x xy)) ?x166) 0.0))))
(assert
 (let ((?x205 (* (- 1.0) b1y)))
 (let ((?x349 (* ?x205 xx)))
 (> (+ (+ (+ b1y (* (- 1.0) xy)) (* b1x xy)) ?x349) 0.0))))
(assert
 (let ((?x186 (* (- 1.0) b2y)))
 (let ((?x56 (* ?x186 xx)))
 (> (+ (+ (+ b2y (* (- 1.0) xy)) (* b2x xy)) ?x56) 0.0))))
(assert
 (let ((?x272 (* (- 1.0) v1y)))
 (let ((?x166 (* ?x272 xx)))
 (let ((?x248 (* (- 1.0) a1y)))
 (let ((?x445 (* ?x248 v1x)))
 (let ((?x351 (* (- 1.0) a1x)))
 (let ((?x339 (* ?x351 xy)))
 (let ((?x470 (+ (+ (+ (+ (* a1x v1y) (* a1y xx)) (* v1x xy)) ?x339) ?x445)))
 (> (+ ?x470 ?x166) 0.0)))))))))
(assert
 (let ((?x205 (* (- 1.0) b1y)))
 (let ((?x349 (* ?x205 xx)))
 (let ((?x248 (* (- 1.0) a1y)))
 (let ((?x307 (* ?x248 b1x)))
 (let ((?x351 (* (- 1.0) a1x)))
 (let ((?x339 (* ?x351 xy)))
 (let ((?x368 (+ (+ (+ (+ (* a1x b1y) (* a1y xx)) (* b1x xy)) ?x339) ?x307)))
 (> (+ ?x368 ?x349) 0.0)))))))))
(assert
 (let ((?x186 (* (- 1.0) b2y)))
 (let ((?x56 (* ?x186 xx)))
 (let ((?x248 (* (- 1.0) a1y)))
 (let ((?x240 (* ?x248 b2x)))
 (let ((?x351 (* (- 1.0) a1x)))
 (let ((?x339 (* ?x351 xy)))
 (let ((?x402 (+ (+ (+ (+ (* a1x b2y) (* a1y xx)) (* b2x xy)) ?x339) ?x240)))
 (> (+ ?x402 ?x56) 0.0)))))))))
(assert
 (let ((?x84 (* (- 1.0) v1x)))
 (let ((?x101 (* ?x84 xy)))
 (let ((?x205 (* (- 1.0) b1y)))
 (let ((?x349 (* ?x205 xx)))
 (let ((?x937 (* (- 1.0) b1x)))
 (let ((?x451 (* ?x937 v1y)))
 (let ((?x352 (+ (+ (+ (+ (* b1x xy) (* b1y v1x)) (* v1y xx)) ?x451) ?x349)))
 (> (+ ?x352 ?x101) 0.0)))))))))
(assert
 (let ((?x84 (* (- 1.0) v1x)))
 (let ((?x101 (* ?x84 xy)))
 (let ((?x186 (* (- 1.0) b2y)))
 (let ((?x56 (* ?x186 xx)))
 (let ((?x358 (* (- 1.0) b2x)))
 (let ((?x170 (* ?x358 v1y)))
 (let ((?x487 (+ (+ (+ (+ (* b2x xy) (* b2y v1x)) (* v1y xx)) ?x170) ?x56)))
 (> (+ ?x487 ?x101) 0.0)))))))))
(assert
 (let ((?x186 (* (- 1.0) b2y)))
 (let ((?x56 (* ?x186 xx)))
 (let ((?x205 (* (- 1.0) b1y)))
 (let ((?x188 (* ?x205 b2x)))
 (let ((?x937 (* (- 1.0) b1x)))
 (let ((?x275 (* ?x937 xy)))
 (let ((?x379 (+ (+ (+ (+ (* b1x b2y) (* b1y xx)) (* b2x xy)) ?x275) ?x188)))
 (> (+ ?x379 ?x56) 0.0)))))))))
(assert
 (let ((?x248 (* (- 1.0) a1y)))
 (let ((?x445 (* ?x248 v1x)))
 (> (+ (+ (+ a1y (* (- 1.0) v1y)) (* a1x v1y)) ?x445) 0.0))))
(assert
 (let ((?x248 (* (- 1.0) a1y)))
 (let ((?x307 (* ?x248 b1x)))
 (> (+ (+ (+ a1y (* (- 1.0) b1y)) (* a1x b1y)) ?x307) 0.0))))
(assert
 (let ((?x248 (* (- 1.0) a1y)))
 (let ((?x240 (* ?x248 b2x)))
 (> (+ (+ (+ a1y (* (- 1.0) b2y)) (* a1x b2y)) ?x240) 0.0))))
(assert
 (let ((?x937 (* (- 1.0) b1x)))
 (let ((?x451 (* ?x937 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b1y)) (* b1y v1x)) ?x451) 0.0))))
(assert
 (let ((?x358 (* (- 1.0) b2x)))
 (let ((?x170 (* ?x358 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b2y)) (* b2y v1x)) ?x170) 0.0))))
(assert
 (let ((?x205 (* (- 1.0) b1y)))
 (let ((?x188 (* ?x205 b2x)))
 (> (+ (+ (+ b1y (* (- 1.0) b2y)) (* b1x b2y)) ?x188) 0.0))))
(assert
 (let ((?x937 (* (- 1.0) b1x)))
 (let ((?x451 (* ?x937 v1y)))
 (let ((?x248 (* (- 1.0) a1y)))
 (let ((?x445 (* ?x248 v1x)))
 (let ((?x91 (+ (+ (+ (* a1x v1y) (* a1y b1x)) (* b1y v1x)) (* (* (- 1.0) a1x) b1y))))
 (> (+ (+ ?x91 ?x445) ?x451) 0.0)))))))
(assert
 (let ((?x358 (* (- 1.0) b2x)))
 (let ((?x170 (* ?x358 v1y)))
 (let ((?x248 (* (- 1.0) a1y)))
 (let ((?x445 (* ?x248 v1x)))
 (let ((?x351 (* (- 1.0) a1x)))
 (let ((?x288 (* ?x351 b2y)))
 (let ((?x208 (+ (+ (+ (+ (* a1x v1y) (* a1y b2x)) (* b2y v1x)) ?x288) ?x445)))
 (> (+ ?x208 ?x170) 0.0)))))))))
(assert
 (let ((?x205 (* (- 1.0) b1y)))
 (let ((?x188 (* ?x205 b2x)))
 (let ((?x248 (* (- 1.0) a1y)))
 (let ((?x307 (* ?x248 b1x)))
 (let ((?x351 (* (- 1.0) a1x)))
 (let ((?x288 (* ?x351 b2y)))
 (let ((?x454 (+ (+ (+ (+ (* a1x b1y) (* a1y b2x)) (* b1x b2y)) ?x288) ?x307)))
 (> (+ ?x454 ?x188) 0.0)))))))))
(assert
 (let ((?x205 (* (- 1.0) b1y)))
(let ((?x188 (* ?x205 b2x)))
(let ((?x937 (* (- 1.0) b1x)))
(let ((?x451 (* ?x937 v1y)))
(let ((?x782 (+ (+ (+ (+ (* b1x b2y) (* b1y v1x)) (* b2x v1y)) ?x451) ?x188)))
(> (+ ?x782 (* (* (- 1.0) b2y) v1x)) 0.0)))))))
(check-sat)
