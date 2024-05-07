//
//  NSMutableAttributed+Extension.swift
//  Lamy 
//
//  Created by Maxim Fedoseenko on 23.04.2024.
//

import Foundation
import UIKit


extension NSMutableAttributedString {
    
    // Этот метод ищет указанную подстроку в тексте и применяет к ней выбранный цвет. Если подстрока найдена, метод применяет цвет ко всей длине этой подстроки.
                               //Указывает подстроку в тексте
    func apply(color: UIColor, toSubstring : String) {

        if let range = self.string.range(of: toSubstring) { //проверяет для поиска подстроки внутри большей строки.
            //Проще говоря, строка let nsRange = NSRange(range, in: self.string) в Swift используется для преобразования диапазона, найденного в Swift-строке, в диапазон, который можно использовать в NSAttributedString. Это нужно потому, что NSAttributedString работает с диапазонами в формате NSRange, который основан на количестве UTF-16 единиц, в то время как стандартные диапазоны Swift основаны на символах Unicode, которые могут варьироваться по размеру. Этот код создаёт NSRange, точно соответствующий нужной части исходной строки.
            let nsRange = NSRange(range, in: self.string)
            /*
            Проще говоря, в вашем коде происходит преобразование типа диапазона из стандартного для Swift в тип, который используется в UIKit. Это необходимо, потому что:

            Swift String использует свой тип диапазонов, основанный на String.Index, который точно отражает позиции символов, включая те, что состоят из нескольких юнитов (например, некоторые эмодзи).
            UIKit и другие компоненты Apple используют NSRange, который работает на основе простых чисел, представляющих собой количество "шагов" от начала строки. Это связано с тем, что внутренне они рассчитаны на использование 16-битных юнитов (UTF-16).
            Ваш код находит определённый кусок текста в строке и затем преобразует его позицию в формат, с которым может работать NSMutableAttributedString для дальнейшего изменения или обработки этого текста.
             */
            self.addAttributes([NSAttributedString.Key.foregroundColor: color], range: nsRange)
            
            //Проще говоря, этот код меняет цвет определенной части текста в объекте NSMutableAttributedString. Если у вас есть, например, строка "Привет, мир", и вы хотите изменить цвет слова "мир" на красный, вы бы использовали этот метод, чтобы указать, что диапазон символов, соответствующих слову "мир", должен быть окрашен в красный цвет.
        }
    }
    
    func underLine(subString: String) {
       if let range = self.string.range(of: subString) {
         self.underLine(onRange: NSRange(range, in: self.string))
       }
     }
     
     // Underline string on given range
     func underLine(onRange: NSRange) {
       self.addAttributes([NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue],range: onRange)
     }
}
