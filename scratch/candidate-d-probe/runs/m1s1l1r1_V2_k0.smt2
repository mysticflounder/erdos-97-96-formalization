(set-logic QF_NRA)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun v1y () Real)
(declare-fun oy () Real)
(declare-fun v1x () Real)
(declare-fun R2 () Real)
(declare-fun rho2 () Real)
(declare-fun xy () Real)
(declare-fun xx () Real)
(declare-fun y1y () Real)
(declare-fun y1x () Real)
(declare-fun a1y () Real)
(declare-fun a1x () Real)
(declare-fun b1y () Real)
(declare-fun b1x () Real)
(assert
 (let ((?x200 (* (- 1.0) v1x)))
 (let ((?x320 (* (- 1.0) R2)))
 (let ((?x57 (+ (+ (+ (+ (/ 1.0 4.0) (* oy oy)) (* v1x v1x)) (* v1y v1y)) ?x320)))
 (= (+ (+ ?x57 ?x200) (* (* (- 2.0) oy) v1y)) 0.0)))))
(assert
 (= (+ (+ (/ 1.0 4.0) (* oy oy)) (* (- 1.0) R2)) 0.0))
(assert
 (= (+ (+ (* xx xx) (* xy xy)) (* (- 1.0) rho2)) 0.0))
(assert
 (let ((?x102 (* (- 1.0) rho2)))
 (let ((?x917 (* y1y y1y)))
 (let ((?x139 (+ (+ (+ (+ (* xx xx) (* xy xy)) (* y1x y1x)) ?x917) ?x102)))
 (= (+ (+ ?x139 (* (* (- 2.0) xx) y1x)) (* (* (- 2.0) xy) y1y)) 0.0)))))
(assert
 (let ((?x102 (* (- 1.0) rho2)))
 (let ((?x236 (* xy xy)))
 (let ((?x149 (+ (+ (+ (+ (* a1x a1x) (* a1y a1y)) (* xx xx)) ?x236) ?x102)))
 (= (+ (+ ?x149 (* (* (- 2.0) a1x) xx)) (* (* (- 2.0) a1y) xy)) 0.0)))))
(assert
 (let ((?x102 (* (- 1.0) rho2)))
 (let ((?x236 (* xy xy)))
 (let ((?x265 (+ (+ (+ (+ (* b1x b1x) (* b1y b1y)) (* xx xx)) ?x236) ?x102)))
 (= (+ (+ ?x265 (* (* (- 2.0) b1x) xx)) (* (* (- 2.0) b1y) xy)) 0.0)))))
(assert
 (let ((?x407 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) xx) (* (- 1.0) (* oy oy))) (* (- 1.0) (* xx xx)))))
 (>= (+ (+ ?x407 (* (- 1.0) (* xy xy))) (* (* 2.0 oy) xy)) 0.0)))
(assert
 (let ((?x352 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) y1x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* y1x y1x)))))
 (>= (+ (+ ?x352 (* (- 1.0) (* y1y y1y))) (* (* 2.0 oy) y1y)) 0.0)))
(assert
 (let ((?x571 (* oy oy)))
 (let ((?x393 (* (- 1.0) ?x571)))
 (let ((?x133 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) a1x) (* (- 1.0) (* a1x a1x))) (* (- 1.0) (* a1y a1y)))))
 (>= (+ (+ ?x133 ?x393) (* (* 2.0 a1y) oy)) 0.0)))))
(assert
 (let ((?x571 (* oy oy)))
 (let ((?x393 (* (- 1.0) ?x571)))
 (let ((?x489 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b1x) (* (- 1.0) (* b1x b1x))) (* (- 1.0) (* b1y b1y)))))
 (>= (+ (+ ?x489 ?x393) (* (* 2.0 b1y) oy)) 0.0)))))
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
 (let ((?x264 (* (- 1.0) v1y)))
 (let ((?x53 (* ?x264 xy)))
 (> ?x53 0.0))))
(assert
 (let ((?x329 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) xy)) (* (* (- 1.0) xx) (* v1y v1y)))))
 (> (+ ?x329 (* (* v1x v1y) xy)) 0.0)))
(assert
 (> (+ (* xx (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) xy)) 0.0))
(assert
 (let ((?x264 (* (- 1.0) v1y)))
 (let ((?x464 (* ?x264 y1y)))
 (> ?x464 0.0))))
(assert
 (let ((?x221 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) y1y)) (* (* (- 1.0) y1x) (* v1y v1y)))))
 (> (+ ?x221 (* (* v1x v1y) y1y)) 0.0)))
(assert
 (> (+ (* y1x (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) y1y)) 0.0))
(assert
 (let ((?x101 (* a1y v1y)))
 (> ?x101 0.0)))
(assert
 (let ((?x374 (* (- 1.0) a1y)))
 (let ((?x288 (* ?x374 v1x)))
 (let ((?x48 (* ?x288 v1y)))
 (let ((?x101 (* a1y v1y)))
 (let ((?x108 (+ (+ (+ (* (- 1.0) (* v1y v1y)) (* a1x (* v1y v1y))) ?x101) ?x48)))
 (> ?x108 0.0)))))))
(assert
 (> (+ (* a1x (* v1y v1y)) (* (* (* (- 1.0) a1y) v1x) v1y)) 0.0))
(assert
 (> (* b1y v1y) 0.0))
(assert
 (let ((?x23 (* b1y v1x)))
 (let ((?x440 (* ?x23 v1y)))
 (let ((?x130 (+ (+ (* v1y v1y) (* (* (- 1.0) b1x) (* v1y v1y))) (* (* (- 1.0) b1y) v1y))))
 (> (+ ?x130 ?x440) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b1x) (* v1y v1y)) (* (* b1y v1x) v1y)) 0.0))
(assert
 (> (+ (* xx y1y) (* (* (- 1.0) xy) y1x)) 0.0))
(assert
 (let ((?x28 (* (- 1.0) xy)))
 (> ?x28 0.0)))
(assert
 (> (+ (* a1y xx) (* (* (- 1.0) a1x) xy)) 0.0))
(assert
 (> (+ (* v1y xx) (* (* (- 1.0) v1x) xy)) 0.0))
(assert
 (> (+ (* b1y xx) (* (* (- 1.0) b1x) xy)) 0.0))
(assert
 (let ((?x60 (* (- 1.0) y1y)))
 (> ?x60 0.0)))
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
 (let ((?x28 (* (- 1.0) xy)))
 (let ((?x353 (* ?x28 y1x)))
 (> (+ (+ (+ xy (* (- 1.0) y1y)) (* xx y1y)) ?x353) 0.0))))
(assert
 (let ((?x28 (* (- 1.0) xy)))
 (let ((?x353 (* ?x28 y1x)))
 (let ((?x374 (* (- 1.0) a1y)))
 (let ((?x67 (* ?x374 xx)))
 (let ((?x355 (* (- 1.0) a1x)))
 (let ((?x463 (* ?x355 y1y)))
 (let ((?x270 (+ (+ (+ (+ (* a1x xy) (* a1y y1x)) (* xx y1y)) ?x463) ?x67)))
 (> (+ ?x270 ?x353) 0.0)))))))))
(assert
 (let ((?x28 (* (- 1.0) xy)))
 (let ((?x353 (* ?x28 y1x)))
 (let ((?x264 (* (- 1.0) v1y)))
 (let ((?x436 (* ?x264 xx)))
 (let ((?x200 (* (- 1.0) v1x)))
 (let ((?x316 (* ?x200 y1y)))
 (let ((?x475 (+ (+ (+ (+ (* v1x xy) (* v1y y1x)) (* xx y1y)) ?x316) ?x436)))
 (> (+ ?x475 ?x353) 0.0)))))))))
(assert
 (let ((?x28 (* (- 1.0) xy)))
 (let ((?x353 (* ?x28 y1x)))
 (let ((?x487 (* (- 1.0) b1y)))
 (let ((?x151 (* ?x487 xx)))
 (let ((?x311 (* (- 1.0) b1x)))
 (let ((?x201 (* ?x311 y1y)))
 (let ((?x75 (+ (+ (+ (+ (* b1x xy) (* b1y y1x)) (* xx y1y)) ?x201) ?x151)))
 (> (+ ?x75 ?x353) 0.0)))))))))
(assert
 (let ((?x374 (* (- 1.0) a1y)))
 (let ((?x67 (* ?x374 xx)))
 (> (+ (+ (+ a1y (* (- 1.0) xy)) (* a1x xy)) ?x67) 0.0))))
(assert
 (let ((?x264 (* (- 1.0) v1y)))
 (let ((?x436 (* ?x264 xx)))
 (> (+ (+ (+ v1y (* (- 1.0) xy)) (* v1x xy)) ?x436) 0.0))))
(assert
 (let ((?x487 (* (- 1.0) b1y)))
 (let ((?x151 (* ?x487 xx)))
 (> (+ (+ (+ b1y (* (- 1.0) xy)) (* b1x xy)) ?x151) 0.0))))
(assert
 (let ((?x264 (* (- 1.0) v1y)))
 (let ((?x436 (* ?x264 xx)))
 (let ((?x374 (* (- 1.0) a1y)))
 (let ((?x288 (* ?x374 v1x)))
 (let ((?x355 (* (- 1.0) a1x)))
 (let ((?x485 (* ?x355 xy)))
 (let ((?x40 (+ (+ (+ (+ (* a1x v1y) (* a1y xx)) (* v1x xy)) ?x485) ?x288)))
 (> (+ ?x40 ?x436) 0.0)))))))))
(assert
 (let ((?x487 (* (- 1.0) b1y)))
 (let ((?x151 (* ?x487 xx)))
 (let ((?x374 (* (- 1.0) a1y)))
 (let ((?x223 (* ?x374 b1x)))
 (let ((?x355 (* (- 1.0) a1x)))
 (let ((?x485 (* ?x355 xy)))
 (let ((?x389 (+ (+ (+ (+ (* a1x b1y) (* a1y xx)) (* b1x xy)) ?x485) ?x223)))
 (> (+ ?x389 ?x151) 0.0)))))))))
(assert
 (let ((?x200 (* (- 1.0) v1x)))
 (let ((?x86 (* ?x200 xy)))
 (let ((?x487 (* (- 1.0) b1y)))
 (let ((?x151 (* ?x487 xx)))
 (let ((?x311 (* (- 1.0) b1x)))
 (let ((?x390 (* ?x311 v1y)))
 (let ((?x473 (+ (+ (+ (+ (* b1x xy) (* b1y v1x)) (* v1y xx)) ?x390) ?x151)))
 (> (+ ?x473 ?x86) 0.0)))))))))
(assert
 (let ((?x373 (+ (+ (+ a1y (* (- 1.0) y1y)) (* a1x y1y)) (* (* (- 1.0) a1y) y1x))))
 (> ?x373 0.0)))
(assert
 (let ((?x264 (* (- 1.0) v1y)))
 (let ((?x383 (* ?x264 y1x)))
 (> (+ (+ (+ v1y (* (- 1.0) y1y)) (* v1x y1y)) ?x383) 0.0))))
(assert
 (let ((?x487 (* (- 1.0) b1y)))
 (let ((?x21 (* ?x487 y1x)))
 (> (+ (+ (+ b1y (* (- 1.0) y1y)) (* b1x y1y)) ?x21) 0.0))))
(assert
 (let ((?x264 (* (- 1.0) v1y)))
 (let ((?x383 (* ?x264 y1x)))
 (let ((?x374 (* (- 1.0) a1y)))
 (let ((?x288 (* ?x374 v1x)))
 (let ((?x355 (* (- 1.0) a1x)))
 (let ((?x463 (* ?x355 y1y)))
 (let ((?x333 (+ (+ (+ (+ (* a1x v1y) (* a1y y1x)) (* v1x y1y)) ?x463) ?x288)))
 (> (+ ?x333 ?x383) 0.0)))))))))
(assert
 (let ((?x487 (* (- 1.0) b1y)))
 (let ((?x21 (* ?x487 y1x)))
 (let ((?x374 (* (- 1.0) a1y)))
 (let ((?x223 (* ?x374 b1x)))
 (let ((?x355 (* (- 1.0) a1x)))
 (let ((?x463 (* ?x355 y1y)))
 (let ((?x439 (+ (+ (+ (+ (* a1x b1y) (* a1y y1x)) (* b1x y1y)) ?x463) ?x223)))
 (> (+ ?x439 ?x21) 0.0)))))))))
(assert
 (let ((?x200 (* (- 1.0) v1x)))
 (let ((?x316 (* ?x200 y1y)))
 (let ((?x487 (* (- 1.0) b1y)))
 (let ((?x21 (* ?x487 y1x)))
 (let ((?x311 (* (- 1.0) b1x)))
 (let ((?x390 (* ?x311 v1y)))
 (let ((?x63 (+ (+ (+ (+ (* b1x y1y) (* b1y v1x)) (* v1y y1x)) ?x390) ?x21)))
 (> (+ ?x63 ?x316) 0.0)))))))))
(assert
 (let ((?x374 (* (- 1.0) a1y)))
 (let ((?x288 (* ?x374 v1x)))
 (> (+ (+ (+ a1y (* (- 1.0) v1y)) (* a1x v1y)) ?x288) 0.0))))
(assert
 (let ((?x374 (* (- 1.0) a1y)))
 (let ((?x223 (* ?x374 b1x)))
 (> (+ (+ (+ a1y (* (- 1.0) b1y)) (* a1x b1y)) ?x223) 0.0))))
(assert
 (let ((?x311 (* (- 1.0) b1x)))
 (let ((?x390 (* ?x311 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b1y)) (* b1y v1x)) ?x390) 0.0))))
(assert
 (let ((?x311 (* (- 1.0) b1x)))
(let ((?x390 (* ?x311 v1y)))
(let ((?x374 (* (- 1.0) a1y)))
(let ((?x288 (* ?x374 v1x)))
(let ((?x324 (+ (+ (+ (* a1x v1y) (* a1y b1x)) (* b1y v1x)) (* (* (- 1.0) a1x) b1y))))
(> (+ (+ ?x324 ?x288) ?x390) 0.0)))))))
(check-sat)
