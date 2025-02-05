(use-modules (haunt asset)
             (haunt builder blog)
             (haunt builder atom)
             (haunt builder assets)
             (haunt post)
             (haunt site)
             (html-prime)
             (theme)
             (utils))

(define %collections
  `(("Recent Posts" "index.html" ,posts/reverse-chronological)))

(define about-page
  (static-page
   "About Me"
   "about.html"
   `(div (@ (style "display:flex")) 
         (img (@ (src "images/cel7t-yui.png") 
                 (style "object-fit:contain; align-self:flex-start; 
                         width: 250px; padding-top: 20px; padding-bottom: 20px")))
         (div (@ (style "flex: 1 1 auto; padding-left: 30px"))
              (h2 "Hello 👋")
              (p "My name is Sarthak, and I like computers, mathematics, pixel art and music.")
              (p "I am currently conducting research in Cybersecurity and Deep Learning at the Department of Computer Science, University of Oxford.")
              (p "I previously worked on "
                 ,(anchor "Parameterized Packages" "https://summerofcode.withgoogle.com/programs/2023/projects/heQYLzrz")
                 " as a " 
                 ,(anchor "GSoC" "https://summerofcode.withgoogle.com") 
                 " intern at "
                 ,(anchor "GNU Guix" "https://guix.gnu.org")
                 ". I have also worked as an assistant HPC admin, and a Security Engineering Intern at Mercari, Inc.")
              (p "The sprite on the left is Hirasawa Yui from the manga series " (i"K-On!") ", made in a "(i "Yume Nikki") "-esque style.")))))

(site #:title "(blog . (coldboot . org))"
      #:domain "blog.coldboot.org"
      #:default-metadata
      '((author . "Sarthak Shah")
        (email  . "shahsarthakw@gmail.com"))
      #:readers (list html-reader-prime)
      #:builders (list (blog #:theme lispy-theme #:collections %collections)
                       (atom-feed)
                       (atom-feeds-by-tag)
                       about-page
                       (static-directory "css")
                       (static-directory "js")
                       (static-directory "fonts")
                       (static-directory "images")))
