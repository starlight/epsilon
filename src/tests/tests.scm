(define-library
  (tests)
  (import
    scheme
    r7rs
    (chicken format)
    (chicken port)
    test
    (epsilon core))

  (begin
    (define (test-drive datum)
      (with-input-from-string
        (sprintf "~S" datum)
        (lambda ()
          (with-output-to-string compile))))

    (test-group
      "core"
      (test "42" (test-drive 42)))

    (test-exit)))
