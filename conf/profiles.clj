{:user {:plugins [[venantius/ultra "0.5.2"]
                  [lein-kibit "0.1.5"]
                  [jonase/eastwood "0.2.5"]
                  [lein-cljfmt "0.5.7"]]
        :dependencies [[alembic "0.3.2"]
                       [cljfmt "0.3.0"]]
        :signing {:gpg-key "3B7845E6"}
        :ultra {:color-scheme :solarized_dark}
        :repl-options {:prompt (fn [ns] (str "\u03BB|"ns">" ))}}}
