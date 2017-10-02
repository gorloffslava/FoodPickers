//
//  Crew.swift
//  FoodPickers
//
//  Created by Вячеслав Горлов on 01.10.17.
//  Copyright © 2017 Gorloff Foundation. All rights reserved.
//

import Foundation

class Crew {
    class Player {
        var name: String
        var lastname: String
        var rang: String
        init(name: String, lastname: String, rang: String) {
            self.name = name
            self.lastname = lastname
            self.rang = rang
        }
    }
    static var crew = [
        Player(name: "Кэтрин", lastname: "Дженвей", rang: "Капитан"),
        Player(name: "Чокотай", lastname: "", rang: "Командер"),
        Player(name: "Том", lastname: "Пэрис", rang: "Лейтенант"),
        Player(name: "Тувок", lastname: "", rang: "Лейтенант-командер"),
        Player(name: "Гари", lastname: "Ким", rang: "Энсин"),
        Player(name: "7-из-9", lastname: "третичное дополнение униматрицы 0-1", rang: "")
    ]
    
    static func isInCrew(player: Player) -> Bool {
        for crewer in self.crew { //Обходим массив членов экипажа
            if crewer.lastname == player.lastname && crewer.name == player.name {
                return true //Если найдено хоть одно совпадение, то возвращаем истину
            }
        }
        return false //Если мы не нашли совпадения на данном этапе, то уже не найдём
    }
    
    static var names: [String] {
        return self.crew.map{$0.name} //Создаём отображение из команды в массив только из их имён
    }
    
    static var lastnames: [String] {
        return self.crew.map{$0.lastname} //Создаём отображение из команды в массив только из их фамилий
    }
    
    static func findRangForName(_ name: String) -> String? {
        return self.crew.filter{$0.name == name}.first?.rang
    }
    
}
