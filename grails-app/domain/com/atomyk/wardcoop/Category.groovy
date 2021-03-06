package com.atomyk.wardcoop

class Category {
    
    String name
    int displayOrder
    
    static hasMany = [posts:Post, people: Person]
    static belongsTo = Person
    
    String toString() {
        name
    }
}
