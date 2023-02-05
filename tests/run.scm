(define-library
  (epsilon tests)
  (import
    scheme
    r7rs
    test)
  (begin
    (test-group
      "example tests"
      (test "test equal: 2 (+ 1 1)" 2 (+ 1 1))
      (test-assert "assert true: (= 1 1)" (= 1 1)))
    (test-exit)))
