(define-library
  (tests)
  (import
    scheme
    r7rs
    test
    (epsilon core)
    (tests io))

  (begin
    (define (test-drive datum)
      (with-input-from-string
        (->string datum)
        (lambda ()
          (with-output-to-string compile))))

    (test-group
      "core"
      (test "42" (test-drive 42)))

    (test-exit)))
