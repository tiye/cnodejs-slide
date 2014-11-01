doctype

html
  head
    title "About React"
    meta (:charset utf-8)
    link (:rel icon) (:href http://facebook.github.io/react/favicon.ico)
    script(:src build/vendor.min.js)
    @if (@ dev)
      @block
        link (:rel stylesheet) (:href source/main.css)
        script (:defer) (:src build/main.js)
      @block
        link (:rel stylesheet) (:href build/main.min.css)
        script (:defer) (:src build/main.min.js)
  body