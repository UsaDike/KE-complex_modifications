#!/usr/bin/env ruby

# You can generate json by executing the following command on Terminal.
#
# $ ruby ./emacs_key_bindings.json.rb
#

require 'json'
require_relative '../lib/karabiner.rb'

def main
  unless_emacs = Karabiner.frontmost_application_unless(["emacs_key_bindings_exception", "jetbrains_ide"])
  
  puts JSON.pretty_generate(
    "title" => "Emacs-like mark & region",
    "maintainers" => ["UsaDike"],

    "rules" => [
      "description" => "Emacs-like mark & region (v1)",
      "manipulators" => control_keys(unless_emacs) + option_keys(unless_emacs)
    ]
  )
end

def control_keys(unless_emacs)
  if_terminal = Karabiner.frontmost_application_if(["terminal"])
  unless_terminal = Karabiner.frontmost_application_unless(["terminal"])
    
  [
    {
      "type" => "basic",
      "from" => {
        "key_code" => "a",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [{ "key_code" => "left_arrow", "modifiers": ["shift", "command"] }],
      "conditions" => [Karabiner.variable_if("C-spacebar", 1)] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "b",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [
        { "key_code" => "left_arrow", "modifiers" => ["shift"] }
      ],
      "conditions" => [Karabiner.variable_if("C-spacebar", 1)] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "e",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [
        { "key_code" => "right_arrow", "modifiers" => ["shift", "command"] }
      ],
      "conditions" => [Karabiner.variable_if("C-spacebar", 1)] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "f",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [
        { "key_code" => "right_arrow", "modifiers" => ["shift"] }
      ],
      "conditions" => [Karabiner.variable_if("C-spacebar", 1)] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "n",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [
        { "key_code" => "down_arrow", "modifiers" => ["shift"] },
      ],
      "conditions" => [Karabiner.variable_if("C-spacebar", 1)] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "p",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [
        { "key_code" => "up_arrow", "modifiers" => ["shift"] },
      ],
      "conditions" => [Karabiner.variable_if("C-spacebar", 1)] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "v",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [{ "key_code" => "page_down", "modifiers" => "shift" }],
      "conditions" => [Karabiner.variable_if("C-spacebar", 1)] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "w",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [
        { "key_code" => "x", "modifiers" => ["command"] },
        Karabiner.set_variable("C-spacebar", 0)
      ],
      "conditions" => [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "y",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock]),
      },
      "to" => [{ "key_code" => "v", "modifiers" => "command" }],
      "conditions" => [unless_emacs],
    },
    { # Not mark region
      "type" => "basic",
      "from" => {
        "key_code" => "slash",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock]),
      },
      "to" => [{ "key_code" => "z", "modifiers" => "command" }],
      "conditions" => [unless_emacs],
    },                  
    {
      "type" => "basic",
      "from" => {
        "key_code" => "spacebar",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [
        Karabiner.set_variable("C-spacebar", 1)
      ],
      "conditions" =>  [Karabiner.variable_unless("C-spacebar", 1)] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "spacebar",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [
        Karabiner.set_variable("C-spacebar", 0)
      ],
      "conditions" => [Karabiner.variable_if("C-spacebar", 1)] + [unless_emacs],
    }
  ]
end

def option_keys(unless_emacs)
  if_jetbrains = Karabiner.frontmost_application_if(["jetbrains_ide"])
  unless_jetbrains = Karabiner.frontmost_application_unless(["jetbrains_ide"])
  if_browser = Karabiner.frontmost_application_if(["browser"])
  unless_browser = Karabiner.frontmost_application_unless(["browser"])
  
  [
    {
      "type" => "basic",
      "from" => {
        "key_code" => "w",
        "modifiers" => Karabiner.from_modifiers(["option"]),
      },
      "to" => [
        { "key_code" => "c", "modifiers" => ["command"] },
        Karabiner.set_variable("C-spacebar", 0)
      ],
      "conditions" => [unless_emacs],
    }
  ]
end

main
