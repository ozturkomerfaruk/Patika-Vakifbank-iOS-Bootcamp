//
//  NameControl.swift
//  BreakingBadApp
//
//  Created by Hasan Esat Tozlu on 23.11.2022.
//

import Foundation


// to resolve the mismatch between the names in the characters API and the names in the episodes API
enum NameControl {
    static func nameControl(name: String) -> String {
        if name == "Hank Schrader" { return "Henry Schrader"}
        else if name == "Krazy-8" { return "Domingo Molina"}
        else if name == "Gretchen Schwartz" { return "Gretchen Schwartz"}
        else if name == "Ken Wins" { return "Ken"}
        else if name == "Elliott Schwarts" { return "Elliot Schwartz"}
        else if name == "Gretchen Swartz" { return "Gretchen Schwartz"}
        else if name == "Badger" { return "Brandon Mayhew"}
        else if name == "Ted Beneke" { return "Theodore Beneke"}
        else if name == "Combo" { return "Christian Ortgea"}
        else if name == "The cousins" { return "Marco & Leonel Salamanca"}
        else if name == "White White Jr." { return "Walter White Jr."}
        else if name == "Steve Gomez" { return "Steven Gomez"}
        else if name == "Eliott Schwartz" { return "Elliot Schwartz"}
        else { return name }
    }
}
