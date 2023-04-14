#!/usr/bin/env ruby

# You can generate json by executing the following command on Terminal.
#
# $ ruby ./emacs_key_bindings.json.rb
#

require 'json'
require_relative '../lib/karabiner.rb'

def main
  if_browser = Karabiner.frontmost_application_if(["browser"])
  
  puts JSON.pretty_generate(
    "title" => "Override C-b with left-arrow not to be overridden by Jira bold command",
    "maintainers" => ["UsaDike"],

    "rules" => [
      "description" => "Override C-b with left-arrow not to be overridden by Jira bold command",
      "manipulators" => c_b(if_browser)
    ]
  )
end

def c_b(if_browser)
  [
    {
      "type" => "basic",
      "from" => {
        "key_code" => "b",
        "modifiers" => Karabiner.from_modifiers(["control"], ["caps_lock"]),
      },
      "to" => [
        {
          "key_code" => "left_arrow",
        },
      ],
      "conditions" => [if_browser],
    },
  ]
end

main
