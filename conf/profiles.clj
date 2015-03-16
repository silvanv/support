{:user {:plugins [[venantius/ultra "0.3.2"]
                  [lein-kibit "0.0.8"]]
        :dependencies [[alembic "0.3.2"]
                       [cljfmt "0.1.7"]
                       [jonase/eastwood "0.2.1" :exclusions [org.clojure/clojure]]]
        :ultra {:color-scheme :solarized_dark}
        :repl-options {:prompt (fn [ns] (str "\u03BB|"ns">" ))}}}
