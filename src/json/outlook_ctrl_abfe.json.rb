#!/usr/bin/env ruby

# You can generate json by executing the following command on Terminal.
#
# $ ruby ./emacs_key_bindings.json.rb
#

require 'json'
require_relative '../lib/karabiner.rb'

def main
  if_ms_office = Karabiner.frontmost_application_if(["microsoft_office"])
  
  puts JSON.pretty_generate(
    "title" => "MS Office; Override C-a,b,f,e,p,n for cursor mover",
    "maintainers" => ["UsaDike"],

    "rules" => [
      "description" => "MS Office; Override C-a,b,f,e for cursor mover",
      "manipulators" => c_b(if_ms_office)
    ]
  )
end

def c_b(if_ms_office)
  [
    {
      "type" => "basic",
      "from" => {
        "key_code" => "a",
        "modifiers" => Karabiner.from_modifiers(["control"], ["caps_lock"]),
      },
      "to" => [
        {
          "key_code" => "home",
        },
      ],
      "conditions" => [if_ms_office],
    },
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
      "conditions" => [if_ms_office],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "f",
        "modifiers" => Karabiner.from_modifiers(["control"], ["caps_lock"]),
      },
      "to" => [
        {
          "key_code" => "right_arrow",
        },
      ],
      "conditions" => [if_ms_office],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "e",
        "modifiers" => Karabiner.from_modifiers(["control"], ["caps_lock"]),
      },
      "to" => [
        {
          "key_code" => "end",
        },
      ],
      "conditions" => [if_ms_office],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "p",
        "modifiers" => Karabiner.from_modifiers(["control"], ["caps_lock"]),
      },
      "to" => [
        {
          "key_code" => "up_arrow",
        },
      ],
      "conditions" => [if_ms_office],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "n",
        "modifiers" => Karabiner.from_modifiers(["control"], ["caps_lock"]),
      },
      "to" => [
        {
          "key_code" => "down_arrow",
        },
      ],
      "conditions" => [if_ms_office],
    },
  ]
end

main
