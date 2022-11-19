//
//  UserSettingsManager.swift
//  david
//
//  Created by Heidi Albarazi on 19.11.22.
//

import Foundation


/**
 The userpreferences manager manages the user preferences. There you can save the preferences or add something to them.
 */
public class UserSettingsManager: ObservableObject {

    // STATICS
    private let firstName = "firstName"
    private let lastName = "lastName"
    private let categoryPreference = "categoryPreference"

    private var userSettings: UserSettings
    // Use this for saving settings
    static let userSettingsManager = UserSettingsManager()


    init() {
        let defaults = UserDefaults.standard
        self.userSettings = UserSettings(
            firstName: defaults.string(forKey: firstName) ?? "",
            lastName: defaults.string(forKey: lastName) ?? "",
            categoryPreference: Set(defaults.stringArray(forKey: categoryPreference) ?? [] )
        )
    }

    /// this function saves settings for the user preferences locally
    public func saveSettings() {
        let defaults = UserDefaults.standard
        defaults.set(userSettings.firstName, forKey: firstName)
        defaults.set(userSettings.firstName, forKey: lastName)
        defaults.set(userSettings.categoryPreference, forKey: categoryPreference)

    }
    
    /// A function to store a name of a user on the phone
    public func addFirstName(){
        let defaults = UserDefaults.standard
        defaults.set(userSettings.firstName, forKey: "firstName")
    }
    
    

    /// adds an category preference  to the list of category preferences
    public func addAllergy(category: String) {
        userSettings.categoryPreference.insert(String)
    }


    /// This is a basic Getter function. This function returns your settings
    public func getPreferences() -> UserSettings{
        return userSettings
    }
}
