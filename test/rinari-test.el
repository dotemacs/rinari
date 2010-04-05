(ert-deftest partial-regex ()
  ;; Without noise
  (should-match-partial "render :partial => \"partial\"" "partial")
  (should-match-partial "render :partial => \"part/ial\"" "part/ial")
  (should-match-partial "render :partial => partial" "partial")
  (should-match-partial "render :partial => @partial" "partial")


  ;; Erb
  (should-match-partial "<%= render :partial => \"partial\" %>" "partial")
  (should-match-partial "<%= render :partial => \"part/ial\" %>" "part/ial")
  (should-match-partial "<%= render :partial => partial %>" "partial")
  (should-match-partial "<%= render :partial => @partial %>" "partial")


  ;; Haml
  (should-match-partial "= render :partial => \"partial\"" "partial")
  (should-match-partial "= render :partial => \"part/ial\"" "part/ial")
  (should-match-partial "= render :partial => partial" "partial")
  (should-match-partial "= render :partial => @partial" "partial")


  ;; Tags
  (should-match-partial "<div><%= render :partial => \"partial\" %></div>" "partial")
  (should-match-partial "<p class=\"wee\"><%= render :partial => \"partial\" %></p>" "partial")


  ;; With options
  (should-match-partial "render :partial => \"partial\", :locals => { :some => :variable }" "partial")
  (should-match-partial "render :partial => partial, :object => :weee" "partial")
  (should-match-partial "render :partial => @partial, :collection => :many" "partial")
  
  ;; Whitespace
  (should-match-partial "    render :partial => \"partial\"         " "partial")
  (should-match-partial "render    :partial => partial" "partial")
  (should-match-partial "render :partial    =>    @partial" "partial")
  )

(defun should-match-partial (line partial)
  "Asserts that LINE, which is a partial call matches
`rinari-partial-regex' and that there's only one grouping, which is
equal to PARTIAL."
  (should (string-match rinari-partial-regex line))
  (should (equal (match-string 1 line) partial))
  (should-not (match-string 2 line)))
