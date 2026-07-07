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
(declare-fun a1y () Real)
(declare-fun a1x () Real)
(declare-fun b1y () Real)
(declare-fun b1x () Real)
(assert
 (let ((?x284 (* (- 1.0) v1x)))
 (let ((?x95 (* (- 1.0) R2)))
 (let ((?x474 (+ (+ (+ (+ (/ 1.0 4.0) (* oy oy)) (* v1x v1x)) (* v1y v1y)) ?x95)))
 (= (+ (+ ?x474 ?x284) (* (* (- 2.0) oy) v1y)) 0.0)))))
(assert
 (= (+ (+ (/ 1.0 4.0) (* oy oy)) (* (- 1.0) R2)) 0.0))
(assert
 (let ((?x131 (* (- 1.0) rho2)))
 (let ((?x161 (* xy xy)))
 (let ((?x43 (+ (+ (+ (+ (* v1x v1x) (* v1y v1y)) (* xx xx)) ?x161) ?x131)))
 (= (+ (+ ?x43 (* (* (- 2.0) v1x) xx)) (* (* (- 2.0) v1y) xy)) 0.0)))))
(assert
 (let ((?x131 (* (- 1.0) rho2)))
 (let ((?x170 (* y1y y1y)))
 (let ((?x300 (+ (+ (+ (+ (* xx xx) (* xy xy)) (* y1x y1x)) ?x170) ?x131)))
 (= (+ (+ ?x300 (* (* (- 2.0) xx) y1x)) (* (* (- 2.0) xy) y1y)) 0.0)))))
(assert
 (let ((?x131 (* (- 1.0) rho2)))
 (let ((?x161 (* xy xy)))
 (let ((?x458 (+ (+ (+ (+ (* a1x a1x) (* a1y a1y)) (* xx xx)) ?x161) ?x131)))
 (= (+ (+ ?x458 (* (* (- 2.0) a1x) xx)) (* (* (- 2.0) a1y) xy)) 0.0)))))
(assert
 (let ((?x131 (* (- 1.0) rho2)))
 (let ((?x161 (* xy xy)))
 (let ((?x357 (+ (+ (+ (+ (* b1x b1x) (* b1y b1y)) (* xx xx)) ?x161) ?x131)))
 (= (+ (+ ?x357 (* (* (- 2.0) b1x) xx)) (* (* (- 2.0) b1y) xy)) 0.0)))))
(assert
 (let ((?x275 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) xx) (* (- 1.0) (* oy oy))) (* (- 1.0) (* xx xx)))))
 (>= (+ (+ ?x275 (* (- 1.0) (* xy xy))) (* (* 2.0 oy) xy)) 0.0)))
(assert
 (let ((?x172 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) y1x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* y1x y1x)))))
 (>= (+ (+ ?x172 (* (- 1.0) (* y1y y1y))) (* (* 2.0 oy) y1y)) 0.0)))
(assert
 (let ((?x85 (* oy oy)))
 (let ((?x92 (* (- 1.0) ?x85)))
 (let ((?x525 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) a1x) (* (- 1.0) (* a1x a1x))) (* (- 1.0) (* a1y a1y)))))
 (>= (+ (+ ?x525 ?x92) (* (* 2.0 a1y) oy)) 0.0)))))
(assert
 (let ((?x85 (* oy oy)))
 (let ((?x92 (* (- 1.0) ?x85)))
 (let ((?x137 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b1x) (* (- 1.0) (* b1x b1x))) (* (- 1.0) (* b1y b1y)))))
 (>= (+ (+ ?x137 ?x92) (* (* 2.0 b1y) oy)) 0.0)))))
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
 (let ((?x109 (* (- 1.0) v1y)))
 (let ((?x213 (* ?x109 xy)))
 (> ?x213 0.0))))
(assert
 (let ((?x374 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) xy)) (* (* (- 1.0) xx) (* v1y v1y)))))
 (> (+ ?x374 (* (* v1x v1y) xy)) 0.0)))
(assert
 (> (+ (* xx (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) xy)) 0.0))
(assert
 (let ((?x109 (* (- 1.0) v1y)))
 (let ((?x265 (* ?x109 y1y)))
 (> ?x265 0.0))))
(assert
 (let ((?x31 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) y1y)) (* (* (- 1.0) y1x) (* v1y v1y)))))
 (> (+ ?x31 (* (* v1x v1y) y1y)) 0.0)))
(assert
 (> (+ (* y1x (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) y1y)) 0.0))
(assert
 (let ((?x130 (* a1y v1y)))
 (> ?x130 0.0)))
(assert
 (let ((?x268 (* (- 1.0) a1y)))
 (let ((?x324 (* ?x268 v1x)))
 (let ((?x46 (* ?x324 v1y)))
 (let ((?x130 (* a1y v1y)))
 (let ((?x269 (+ (+ (+ (* (- 1.0) (* v1y v1y)) (* a1x (* v1y v1y))) ?x130) ?x46)))
 (> ?x269 0.0)))))))
(assert
 (> (+ (* a1x (* v1y v1y)) (* (* (* (- 1.0) a1y) v1x) v1y)) 0.0))
(assert
 (> (* b1y v1y) 0.0))
(assert
 (let ((?x125 (* b1y v1x)))
 (let ((?x353 (* ?x125 v1y)))
 (let ((?x369 (+ (+ (* v1y v1y) (* (* (- 1.0) b1x) (* v1y v1y))) (* (* (- 1.0) b1y) v1y))))
 (> (+ ?x369 ?x353) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b1x) (* v1y v1y)) (* (* b1y v1x) v1y)) 0.0))
(assert
 (> (+ (* xx y1y) (* (* (- 1.0) xy) y1x)) 0.0))
(assert
 (let ((?x205 (* (- 1.0) xy)))
 (> ?x205 0.0)))
(assert
 (> (+ (* a1y xx) (* (* (- 1.0) a1x) xy)) 0.0))
(assert
 (> (+ (* v1y xx) (* (* (- 1.0) v1x) xy)) 0.0))
(assert
 (> (+ (* b1y xx) (* (* (- 1.0) b1x) xy)) 0.0))
(assert
 (let ((?x491 (* (- 1.0) y1y)))
 (> ?x491 0.0)))
(assert
 (> (+ (* a1y y1x) (* (* (- 1.0) a1x) y1y)) 0.0))
(assert
 (> (+ (* v1y y1x) (* (* (- 1.0) v1x) y1y)) 0.0))
(assert
 (> (+ (* b1y y1x) (* (* (- 1.0) b1x) y1y)) 0.0))
(assert
 (> a1y 0.0))
(assert
 (> v1y 0.0))
(assert
 (> b1y 0.0))
(assert
 (> (+ (* a1x v1y) (* (* (- 1.0) a1y) v1x)) 0.0))
(assert
 (> (+ (* a1x b1y) (* (* (- 1.0) a1y) b1x)) 0.0))
(assert
 (> (+ (* b1y v1x) (* (* (- 1.0) b1x) v1y)) 0.0))
(assert
 (let ((?x205 (* (- 1.0) xy)))
 (let ((?x437 (* ?x205 y1x)))
 (> (+ (+ (+ xy (* (- 1.0) y1y)) (* xx y1y)) ?x437) 0.0))))
(assert
 (let ((?x205 (* (- 1.0) xy)))
 (let ((?x437 (* ?x205 y1x)))
 (let ((?x268 (* (- 1.0) a1y)))
 (let ((?x185 (* ?x268 xx)))
 (let ((?x90 (* (- 1.0) a1x)))
 (let ((?x190 (* ?x90 y1y)))
 (let ((?x448 (+ (+ (+ (+ (* a1x xy) (* a1y y1x)) (* xx y1y)) ?x190) ?x185)))
 (> (+ ?x448 ?x437) 0.0)))))))))
(assert
 (let ((?x205 (* (- 1.0) xy)))
 (let ((?x437 (* ?x205 y1x)))
 (let ((?x109 (* (- 1.0) v1y)))
 (let ((?x195 (* ?x109 xx)))
 (let ((?x284 (* (- 1.0) v1x)))
 (let ((?x162 (* ?x284 y1y)))
 (let ((?x390 (+ (+ (+ (+ (* v1x xy) (* v1y y1x)) (* xx y1y)) ?x162) ?x195)))
 (> (+ ?x390 ?x437) 0.0)))))))))
(assert
 (let ((?x205 (* (- 1.0) xy)))
 (let ((?x437 (* ?x205 y1x)))
 (let ((?x154 (* (- 1.0) b1y)))
 (let ((?x343 (* ?x154 xx)))
 (let ((?x276 (* (- 1.0) b1x)))
 (let ((?x67 (* ?x276 y1y)))
 (let ((?x224 (+ (+ (+ (+ (* b1x xy) (* b1y y1x)) (* xx y1y)) ?x67) ?x343)))
 (> (+ ?x224 ?x437) 0.0)))))))))
(assert
 (let ((?x268 (* (- 1.0) a1y)))
 (let ((?x185 (* ?x268 xx)))
 (> (+ (+ (+ a1y (* (- 1.0) xy)) (* a1x xy)) ?x185) 0.0))))
(assert
 (let ((?x109 (* (- 1.0) v1y)))
 (let ((?x195 (* ?x109 xx)))
 (> (+ (+ (+ v1y (* (- 1.0) xy)) (* v1x xy)) ?x195) 0.0))))
(assert
 (let ((?x154 (* (- 1.0) b1y)))
 (let ((?x343 (* ?x154 xx)))
 (> (+ (+ (+ b1y (* (- 1.0) xy)) (* b1x xy)) ?x343) 0.0))))
(assert
 (let ((?x109 (* (- 1.0) v1y)))
 (let ((?x195 (* ?x109 xx)))
 (let ((?x268 (* (- 1.0) a1y)))
 (let ((?x324 (* ?x268 v1x)))
 (let ((?x90 (* (- 1.0) a1x)))
 (let ((?x112 (* ?x90 xy)))
 (let ((?x414 (+ (+ (+ (+ (* a1x v1y) (* a1y xx)) (* v1x xy)) ?x112) ?x324)))
 (> (+ ?x414 ?x195) 0.0)))))))))
(assert
 (let ((?x154 (* (- 1.0) b1y)))
 (let ((?x343 (* ?x154 xx)))
 (let ((?x268 (* (- 1.0) a1y)))
 (let ((?x124 (* ?x268 b1x)))
 (let ((?x90 (* (- 1.0) a1x)))
 (let ((?x112 (* ?x90 xy)))
 (let ((?x377 (+ (+ (+ (+ (* a1x b1y) (* a1y xx)) (* b1x xy)) ?x112) ?x124)))
 (> (+ ?x377 ?x343) 0.0)))))))))
(assert
 (let ((?x284 (* (- 1.0) v1x)))
 (let ((?x147 (* ?x284 xy)))
 (let ((?x154 (* (- 1.0) b1y)))
 (let ((?x343 (* ?x154 xx)))
 (let ((?x276 (* (- 1.0) b1x)))
 (let ((?x98 (* ?x276 v1y)))
 (let ((?x484 (+ (+ (+ (+ (* b1x xy) (* b1y v1x)) (* v1y xx)) ?x98) ?x343)))
 (> (+ ?x484 ?x147) 0.0)))))))))
(assert
 (let ((?x436 (+ (+ (+ a1y (* (- 1.0) y1y)) (* a1x y1y)) (* (* (- 1.0) a1y) y1x))))
 (> ?x436 0.0)))
(assert
 (let ((?x109 (* (- 1.0) v1y)))
 (let ((?x292 (* ?x109 y1x)))
 (> (+ (+ (+ v1y (* (- 1.0) y1y)) (* v1x y1y)) ?x292) 0.0))))
(assert
 (let ((?x154 (* (- 1.0) b1y)))
 (let ((?x449 (* ?x154 y1x)))
 (> (+ (+ (+ b1y (* (- 1.0) y1y)) (* b1x y1y)) ?x449) 0.0))))
(assert
 (let ((?x109 (* (- 1.0) v1y)))
 (let ((?x292 (* ?x109 y1x)))
 (let ((?x268 (* (- 1.0) a1y)))
 (let ((?x324 (* ?x268 v1x)))
 (let ((?x90 (* (- 1.0) a1x)))
 (let ((?x190 (* ?x90 y1y)))
 (let ((?x42 (+ (+ (+ (+ (* a1x v1y) (* a1y y1x)) (* v1x y1y)) ?x190) ?x324)))
 (> (+ ?x42 ?x292) 0.0)))))))))
(assert
 (let ((?x154 (* (- 1.0) b1y)))
 (let ((?x449 (* ?x154 y1x)))
 (let ((?x268 (* (- 1.0) a1y)))
 (let ((?x124 (* ?x268 b1x)))
 (let ((?x90 (* (- 1.0) a1x)))
 (let ((?x190 (* ?x90 y1y)))
 (let ((?x121 (+ (+ (+ (+ (* a1x b1y) (* a1y y1x)) (* b1x y1y)) ?x190) ?x124)))
 (> (+ ?x121 ?x449) 0.0)))))))))
(assert
 (let ((?x284 (* (- 1.0) v1x)))
 (let ((?x162 (* ?x284 y1y)))
 (let ((?x154 (* (- 1.0) b1y)))
 (let ((?x449 (* ?x154 y1x)))
 (let ((?x276 (* (- 1.0) b1x)))
 (let ((?x98 (* ?x276 v1y)))
 (let ((?x65 (+ (+ (+ (+ (* b1x y1y) (* b1y v1x)) (* v1y y1x)) ?x98) ?x449)))
 (> (+ ?x65 ?x162) 0.0)))))))))
(assert
 (let ((?x268 (* (- 1.0) a1y)))
 (let ((?x324 (* ?x268 v1x)))
 (> (+ (+ (+ a1y (* (- 1.0) v1y)) (* a1x v1y)) ?x324) 0.0))))
(assert
 (let ((?x268 (* (- 1.0) a1y)))
 (let ((?x124 (* ?x268 b1x)))
 (> (+ (+ (+ a1y (* (- 1.0) b1y)) (* a1x b1y)) ?x124) 0.0))))
(assert
 (let ((?x276 (* (- 1.0) b1x)))
 (let ((?x98 (* ?x276 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b1y)) (* b1y v1x)) ?x98) 0.0))))
(assert
 (let ((?x276 (* (- 1.0) b1x)))
(let ((?x98 (* ?x276 v1y)))
(let ((?x268 (* (- 1.0) a1y)))
(let ((?x324 (* ?x268 v1x)))
(let ((?x243 (+ (+ (+ (* a1x v1y) (* a1y b1x)) (* b1y v1x)) (* (* (- 1.0) a1x) b1y))))
(> (+ (+ ?x243 ?x324) ?x98) 0.0)))))))
(check-sat)
