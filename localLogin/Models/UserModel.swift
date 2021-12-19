//
//  UserModel.swift
//  localLogin
//
//  Created by BSergio on 19.12.2021.
//


//MARK: - Model
struct Model {
    let login: String
    let pasword: String
    let person: Person
    
    static func getUser() -> Model {
        
        let person = Person(
            name: "Sergey",
            surName: "Brovko",
            hobby: "Sport",
            scills: [
                Scill(title: "php", description: "Написание телеграм ботов на базе фреймворка Laravel"),
                Scill(title: "java", description: "Webview приложения с удаленной конфигурацией"),
                Scill(title: "distribution", description: "Публикация приложений в Google Play и App Store деликатных тематик, требующих усердного убеждения модерации"),
                Scill(title: "marketing", description: "Продвижение приложений pay и aso методами. Хорошее понимание sdk Appsflyer")
            ],
            avatar: "avatar")
        let user = Model(login: "student", pasword: "123456", person: person)
        
        return user
    }
}

// MARK: - Person
struct Person {
    let name: String
    let surName: String
    let hobby: String
    let scills: [Scill]
    let avatar: String
    
}

//MARK: - Scill
struct Scill {
    let title: String
    let description: String
}
